From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: mediatek: dts64 updates for v5.4
Date: Fri, 23 Aug 2019 18:42:19 +0200
Message-ID: <def8fb77-fce4-097d-7ae2-8c4670bc09c1@gmail.com>
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
To: arm-soc <arm@kernel.org>, soc@kernel.org
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Mars Cheng <mars.cheng@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Olof and Arnd,

Please take the following patches into account.

Thanks!
Matthias

---
The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.3-next-dts64

for you to fetch changes up to 7b07a7a4e169180c7da5078bdf5254515e69c152:

  dt-bindings: irq: mtk, sysirq: add support for mt6779 (2019-08-23 17:50:07 +0200)

----------------------------------------------------------------
mt8183:
- fix pwrap interrupt number
- add i2c notes

dt-bindings:
- add compatible for mt6779
- add mt6779 uart and sysirq compatible

----------------------------------------------------------------
Hsin-Hsiung Wang (1):
      arm64: dts: mt8183: fix pwrap gic number

Mars Cheng (3):
      dt-bindings: mediatek: add support for mt6779 reference board
      dt-bindings: mtk-uart: add mt6779 uart bindings
      dt-bindings: irq: mtk, sysirq: add support for mt6779

Qii Wang (1):
      arm64: dts: mt8183: add I2C nodes

 .../devicetree/bindings/arm/mediatek.yaml          |   4 +
 .../interrupt-controller/mediatek,sysirq.txt       |   1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |   1 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |  96 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 191 ++++++++++++++++++++-
 5 files changed, 292 insertions(+), 1 deletion(-)
