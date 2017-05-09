From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] dts changes for v4.11-next
Date: Tue, 9 May 2017 19:07:20 +0200
Message-ID: <c45eb019-56ac-7482-5d75-8271f3890ef8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

Really late, so please have a look if you are willing to take these ones.
For the mt7623 most of the HW block are basically found already on 
mt2701 or mt1835.
New HW blocks are PWM, crypto engine, remote controller and the random 
generator.

For mt8173, we have two dts patches touching the usb phy ports.

Please let me know, if you are willing to take these as an exception.
If not I'll queue them up for the next merge window.

Thanks a lot and once again sorry for being so late,
Matthias

---

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

   https://github.com/mbgg/linux-mediatek.git tags/v4.11-next-dts

for you to fetch changes up to ecc658b64b4cd84a50102f50a498fd86ab1e3aa4:

   arm64: dts: mt8173: move clock from phy node into port nodes 
(2017-05-09 18:36:44 +0200)

----------------------------------------------------------------
Add the following devices to mt7623:
- clock controller and it's subsystems hifsys and ethsys
- power domain controller
- pinctrl
- pmic_wrapper
- i2c, spi controller
- nand and ecc
- mmc
- usb controller and it's phys
- pulse width modulation
- ethernet
- crypto engine
- ir controller
- audio
- HW random engine
- ADC auxadc
- efuse
- thermal nodes

For mt2701:
- cirq interrupt controller

For mt8173:
- split the usb phy node with the correct size
- Move the usb phy clocks into each port, as they are different 
depending on the port

----------------------------------------------------------------
John Crispin (9):
       arm: dts: mt7623: add clock controller device nodes
       arm: dts: mt7623: add subsystem clock controller device nodes
       arm: dts: mt7623: add power domain controller device node
       arm: dts: mt7623: add pinctrl nodes to the mt7623 dtsi file
       arm: dts: mt7623: add pmic wrapper nodes to the mt7623 dtsi file
       arm: dts: mt7623: add i2c nodes to the mt7623.dtsi file
       arm: dts: mt7623: add nand nodes to the mt7623.dtsi file
       arm: dts: mt7623: add mmc nodes to the mt7623.dtsi file
       arm: dts: mt7623: add usb nodes to the mt7623.dtsi file

Sean Wang (11):
       arm: dts: mt7623: add spi nodes to the mt7623.dtsi file
       arm: dts: mt7623: add pwm nodes to the mt7623.dtsi file
       arm: dts: mt7623: add ethernet nodes to the mt7623.dtsi file
       arm: dts: mt7623: add crypto engine nodes to the mt7623.dtsi file
       arm: dts: mt7623: add ir nodes to the mt7623.dtsi file
       arm: dts: mt7623: add afe nodes to the mt7623.dtsi file
       arm: dts: mt7623: add rng nodes to the mt7623.dtsi file
       arm: dts: mt7623: add auxadc nodes to the mt7623.dtsi file
       arm: dts: mt7623: add efuse nodes to the mt7623.dtsi file
       arm: dts: mt7623: add thermal nodes to the mt7623.dtsi file
       arm: dts: mt7623: add Sean as one of authors for mt7623.dtsi files

Youlin Pei (1):
       ARM: dts: mt2701: Add mtk-cirq node for mt2701

chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org (2):
       arm64: dts: mt8173: split usb SuperSpeed port into two ports
       arm64: dts: mt8173: move clock from phy node into port nodes

  arch/arm/boot/dts/mt2701.dtsi            |  12 +-
  arch/arm/boot/dts/mt7623.dtsi            | 546 
++++++++++++++++++++++++++++++-
  arch/arm64/boot/dts/mediatek/mt8173.dtsi |  27 +-
  3 files changed, 566 insertions(+), 19 deletions(-)
