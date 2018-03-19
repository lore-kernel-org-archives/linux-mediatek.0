From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PUL] ARM: mediatek: dts64 updates for v4.16-next
Date: Mon, 19 Mar 2018 11:20:22 +0100
Message-ID: <e006b345-5711-3c1b-cd06-d75d87beefef@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

Please pull the following commits.

Thanks a lot,
Matthias

---

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v4.16-next-dts64

for you to fetch changes up to 5f59955299a13196233bbc0fb72f8dd5b5ba22a1:

  arm64: dts: mt2712: Add auxadc device node. (2018-03-19 02:49:59 +0100)

----------------------------------------------------------------
- mt2712e add auxadc devcie

mt7622:
- fix clock bindings description
- add nodes for mmc, usb, SATA, PCI, ethernet, cpufreq, PMIC mt6380,
pinctrl, scpsys and clock devices

----------------------------------------------------------------
Chunfeng Yun (1):
      arm64: dts: mt7622: add usb device nodes

Ryder Lee (2):
      arm64: dts: mt7622: add PCIe device nodes
      arm64: dts: mt7622: add SATA device nodes

Sean Wang (11):
      arm64: dts: mt7622: add clock controller device nodes
      arm64: dts: mt7622: add power domain controller device nodes
      arm64: dts: mt7622: add pinctrl related device nodes
      arm64: dts: mt7622: add PMIC MT6380 related nodes
      arm64: dts: mt7622: add cpufreq related device nodes
      arm64: dts: mt7622: turn uart0 clock to real ones
      arm64: dts: mt7622: add SoC and peripheral related device nodes
      arm64: dts: mt7622: add flash related device nodes
      arm64: dts: mt7622: add ethernet device nodes
      arm64: dts: mt7622: add mmc related device nodes
      dt-bindings: clock: mediatek: add missing required #reset-cells

Zhiyong Tao (1):
      arm64: dts: mt2712: Add auxadc device node.

 .../bindings/arm/mediatek/mediatek,ethsys.txt      |   1 +
 .../bindings/arm/mediatek/mediatek,pciesys.txt     |   2 +
 .../bindings/arm/mediatek/mediatek,ssusbsys.txt    |   2 +
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts        |   4 +
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |   9 +
 arch/arm64/boot/dts/mediatek/mt6380.dtsi           |  86 +++
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       | 469 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           | 675 ++++++++++++++++++++-
 8 files changed, 1243 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6380.dtsi
