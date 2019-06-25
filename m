From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] arm64: dts: mediatek: updates for v5.2-next
Date: Tue, 25 Jun 2019 15:35:27 +0200
Message-ID: <aa4de43a-0871-dfb0-0ad1-46f11b254a67@gmail.com>
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
Cc: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ben Ho <Ben.Ho-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

This time we have only some DTS patches for MediaTek. Mostly it is about the new
SoC mt8183. Several drivers where added already but the device tree was still
missing.

Please have a look and pull :)

Regards,
Matthias

---
The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.2-next-dts64

for you to fetch changes up to de1033881e936382d67ae47073a7092554729d74:

  arm64: dts: mt8183: add efuse and Mediatek Chip id node to read (2019-06-21
17:50:12 +0200)

----------------------------------------------------------------
- convert arm boads to json-schema

mt8183:
- add base SoC and evaluation board
- add cpacity-dmips-mhz
- add pinctrl, auxadc, spi, and efuse nodes

----------------------------------------------------------------
Ben Ho (1):
      arm64: dts: Add Mediatek SoC MT8183 and evaluation board dts and Makefile

Erin Lo (1):
      arm64: dts: mt8183: add spi node

Hsin-Yi, Wang (1):
      arm64: dts: mt8183: add capacity-dmips-mhz

Michael Mei (1):
      arm64: dts: mt8183: add efuse and Mediatek Chip id node to read

Rob Herring (1):
      dt-bindings: arm: Convert MediaTek board/soc bindings to json-schema

Zhiyong Tao (2):
      arm64: dts: mt8183: add pinctrl device node
      arm64: dts: mt8183: Add auxadc device node

 Documentation/devicetree/bindings/arm/mediatek.txt |  89 ----
 .../devicetree/bindings/arm/mediatek.yaml          |  91 +++++
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        | 140 +++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 447 +++++++++++++++++++++
 5 files changed, 679 insertions(+), 89 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183.dtsi
