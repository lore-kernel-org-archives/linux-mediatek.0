From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] Mediatek DT 64 bit updates for v5.1
Date: Fri, 8 Feb 2019 21:00:07 +0100
Message-ID: <d55e396b-0cbc-62a2-7bfd-c988cda086ff@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Cc: Matthias Brugger <mbrugger@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>, Erin Lo <erin.lo@mediatek.com>, honghui.zhang@mediatek.com, YT Shen <yt.shen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd,
Hi Olof,

Please find below changes for 64 bit device tree for v5.1.

Please merge :)
Matthias

---
The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.0-next-dts64

for you to fetch changes up to 858a6c310f7761314164e3a49c05f25330595d92:

  dt-bindings: arm: mediatek: add support for MT7622 BPI-R64 and MT7629 RFB
(2019-02-07 17:51:51 +0100)

----------------------------------------------------------------
mt2712:
Add device nodes for usb3, iommu, smi, i2c, spi, pwm,
mmc, NAND flash and PCIe

mt6797:
add pinctrl node
enable uart pins on x20 board
enable uart pins on EVB

mt7622:
Add all CPUs to the cooling maps

mt7623a:
Remove unused binding description

mt7629:
Add binding description for the SoC and the BananaPi
based on this chip

mt8173:
Add all CPUs to the cooling maps

mt8183:
Add binding description for the SoC

----------------------------------------------------------------
Chunfeng Yun (1):
      arm64: dts: Add USB3 related nodes for MT2712

Erin Lo (1):
      dt-bindings: arm: Add bindings for Mediatek MT8183 SoC Platform

Honghui Zhang (1):
      arm64: dts: add pcie nodes for MT2712

Manivannan Sadhasivam (2):
      arm64: dts: mediatek: mt6797: Add pinctrl support
      arm64: dts: mediatek: x20: Add pinmux support for UART1

Matthias Brugger (1):
      arm64: dts: Add uart for mt6797 EVB

Ryder Lee (2):
      dt-bindings: arm: mediatek: remove unused "mediatek, mt7623a"
      dt-bindings: arm: mediatek: add support for MT7622 BPI-R64 and MT7629 RFB

Viresh Kumar (1):
      ARM64: dts: mediatek: Add all CPUs in cooling maps

YT Shen (6):
      arm64: dts: add iommu/smi nodes for MT2712
      arm64: dts: add i2c nodes for MT2712
      arm64: dts: add spi nodes for MT2712
      arm64: dts: add pwm nodes for MT2712
      arm64: dts: add mmc nodes for MT2712
      arm64: dts: add nand nodes for MT2712

 Documentation/devicetree/bindings/arm/mediatek.txt |  14 +-
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts        |  98 ++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi          | 555 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt6797-evb.dts        |   2 +
 arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts    |   2 +
 arch/arm64/boot/dts/mediatek/mt6797.dtsi           |  28 ++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           |   9 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   6 +-
 8 files changed, 707 insertions(+), 7 deletions(-)
