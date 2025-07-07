#!/bin/bash

# Photo optimization script
# This will resize photos to max 1200px width/height and compress them

echo "Starting photo optimization..."

# Process all JPG files
for file in public/photos/*.JPG public/photos/*.jpg; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        output_file="public/photos/optimized/$filename"
        
        echo "Processing: $filename"
        
        # Resize to max 1200px (maintains aspect ratio) and compress
        sips -Z 1200 -s format jpeg -s formatOptions 80 "$file" --out "$output_file"
        
        # Get file sizes for comparison
        original_size=$(ls -lh "$file" | awk '{print $5}')
        optimized_size=$(ls -lh "$output_file" | awk '{print $5}')
        
        echo "  Original: $original_size -> Optimized: $optimized_size"
    fi
done

echo "Optimization complete! Optimized photos are in public/photos/optimized/" 