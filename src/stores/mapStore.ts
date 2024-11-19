// stores/mapStore.ts
import { defineStore } from "pinia";

export const useMapStore = defineStore("mapStore", {
  state: () => ({
    isDrawing: false,
    popupVisible: false,
    popupPosition: { x: 0, y: 0 },
    clickedFeatureCoordinates: [] as number[],
  }),
  actions: {
    toggleDrawing() {
      this.isDrawing = !this.isDrawing;
    },
    setPopupVisible(visible: boolean) {
      this.popupVisible = visible;
    },
    setPopupPosition(x: number, y: number) {
      this.popupPosition = { x, y };
    },
    setClickedCoordinates(coords: number[]) {
      this.clickedFeatureCoordinates = coords;
    },
  },
});
