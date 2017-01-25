From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] arm: mediatek: dts changes for v4.11
Date: Wed, 25 Jan 2017 14:46:56 +0100
Message-ID: <82e017a8-ade7-b16f-740c-6c106f2f8049@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
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
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Leilk Liu <leilk.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Dawei Chien <dawei.chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, xiaolei li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd, hi Olof,

Please merge the following changes for 32-bit dts files.

Thanks,
Matthias

---

The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

   Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

   https://github.com/mbgg/linux-mediatek.git tags/v4.10-next-dts32

for you to fetch changes up to e348dc74f798c2df31c685bf0c814396f4f3b735:

   arm: dts: mt2701: Add thermal device node. (2017-01-24 11:24:35 +0100)

----------------------------------------------------------------
Lots of updates for mt2701:
Rearrange the dt nodes and fix unit address for pincontroler
Add nodes for:
- clock controller subsystems
- scpsys controller
- iommu and smi
- spi
- nand
- auxadc
- thermal controller and zones

Email address updated for mt7623 devicetree files.

----------------------------------------------------------------
Dawei Chien (1):
       arm: dts: mt2701: Add thermal device node.

Honghui Zhang (1):
       ARM: dts: mt2701: add iommu/smi dtsi node for mt2701

James Liao (3):
       arm: dts: mt2701: Sort DT nodes by register address
       arm: dts: mt2701: Add subsystem clock controller device nodes
       arm: dts: mt2701: Add power domain controller device node

John Crispin (1):
       ARM: dts: mediatek: update my email address

Leilk Liu (1):
       arm: dts: mt2701: Add spi device node

Xiaolei Li (1):
       arm: dts: mt2701: Add nand device node

Zhiyong Tao (1):
       arm: dts: mt2701: Add auxadc device node.

  arch/arm/boot/dts/mt2701-evb.dts |  54 +++++++++
  arch/arm/boot/dts/mt2701.dtsi    | 247 
++++++++++++++++++++++++++++++++++++---
  arch/arm/boot/dts/mt7623-evb.dts |   2 +-
  arch/arm/boot/dts/mt7623.dtsi    |   2 +-
  4 files changed, 285 insertions(+), 20 deletions(-)
