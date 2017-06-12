From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: mediatek: armv8 DTS for v4.13
Date: Mon, 12 Jun 2017 12:34:58 +0200
Message-ID: <a6d19346-24a8-b130-607c-9116c34b673b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm-soc <arm@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Jun Gao <jun.gao@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Mars Cheng <mars.cheng@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Olof and Arnd,

Please find below the relevant branch with updates for arm64 device tree 
files and device tree bindings for v4.13.

Thanks a lot,
Matthias

---

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

   https://github.com/mbgg/linux-mediatek.git tags/v4.12-next-dts64

for you to fetch changes up to 5f0047466e3c653ffc95fe72e1ea19b1f9927e48:

   dt-bindings: mediatek: add bindings for MediaTek MT7622 SoC 
(2017-06-08 15:27:16 +0200)

----------------------------------------------------------------
Add device tree nodes for
mt8173:
- split USB SuperSpeed port in HighSpeed and SuperSpeed ports.
- move USB phy clocks up in hierarchy to met new bindings description
- move MDP nodes up in hierarchy to met new bindings description

mt6797:
- add basic SoC support
- add clock driver
- add power domain

dt-bindings:
- clean-up i2c binding description
- add binding for mt2701 i2c node
- add fallback compatible to scpsys binding description
- add bindings description for mt7622 and mt6796

----------------------------------------------------------------
Daniel Kurtz (1):
       arm64: dts: mt8173: Fix mdp device tree

Jun Gao (1):
       dt-bindings: i2c: Add Mediatek MT2701 i2c binding

Mars Cheng (4):
       dt-bindings: mediatek: Add bindings for mediatek MT6797 Platform
       arm64: dts: mediatek: add mt6797 support
       dt-bindings: mediatek: add MT6797 power dt-bindings
       arm64: dts: mediatek: add clk and scp nodes for MT6797

Matthias Brugger (4):
       dt-bindings: mtk-sysirq: Correct bindings for supported SoCs
       dt-bindings: i2c-mt6577: Rename file to reflect bindings
       dt-bindings: i2c-mtk: Delete bindings
       dt-bindings: i2c-mtk: Add mt7623 binding

Sean Wang (1):
       dt-bindings: mediatek: add bindings for MediaTek MT7622 SoC

chunfeng.yun@mediatek.com (2):
       arm64: dts: mt8173: split usb SuperSpeed port into two ports
       arm64: dts: mt8173: move clock from phy node into port nodes

  Documentation/devicetree/bindings/arm/mediatek.txt |   8 +
  .../bindings/i2c/{i2c-mt6577.txt => i2c-mtk.txt}   |  10 +-
  .../interrupt-controller/mediatek,sysirq.txt       |  28 +--
  .../devicetree/bindings/serial/mtk-uart.txt        |   2 +
  .../devicetree/bindings/soc/mediatek/scpsys.txt    |   6 +-
  arch/arm64/boot/dts/mediatek/Makefile              |   1 +
  arch/arm64/boot/dts/mediatek/mt6797-evb.dts        |  36 +++
  arch/arm64/boot/dts/mediatek/mt6797.dtsi           | 245 
+++++++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 153 ++++++-------
  9 files changed, 396 insertions(+), 93 deletions(-)
  rename Documentation/devicetree/bindings/i2c/{i2c-mt6577.txt => 
i2c-mtk.txt} (77%)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6797-evb.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6797.dtsi
