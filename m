From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: mediatek: updates for soc drivers for v4.16-next
Date: Mon, 19 Mar 2018 11:21:53 +0100
Message-ID: <8e4c1ec7-4e07-f1a6-0307-56accf2941e9@gmail.com>
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd,
Hi Olof,

Please take the following commits.

Thanks,
Matthias

---

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v4.16-next-soc

for you to fetch changes up to 9f9971266110add19b512f7b10a6d922e741368e:

  soc: mediatek: update power domain data of MT2712 (2018-03-19 02:29:05 +0100)

----------------------------------------------------------------
scpsy:
- mt2712: update power domains to reflect design changes in the SoC
- fix initialisation of power subdomains
- add support for mt7623a SoC
- use defines for mt2701 bus protection mask

----------------------------------------------------------------
Sean Wang (5):
      dt-bindings: soc: add SCPSYS binding for MT7623 and MT7623A SoC
      dt-bindings: soc: add header files required for MT7623A SCPSYS dt-binding
      soc: mediatek: avoid hardcoded value with bus_prot_mask
      soc: mediatek: add SCPSYS power domain driver for MediaTek MT7623A SoC
      soc: mediatek: fix the mistaken pointer accessed when subdomains are added

weiyi.lu@mediatek.com (2):
      dt-bindings: soc: update MT2712 power dt-bindings
      soc: mediatek: update power domain data of MT2712

 .../devicetree/bindings/soc/mediatek/scpsys.txt    |   5 +-
 drivers/soc/mediatek/mtk-scpsys.c                  | 104 ++++++++++++++++++++-
 include/dt-bindings/power/mt2712-power.h           |   3 +
 include/dt-bindings/power/mt7623a-power.h          |  10 ++
 include/linux/soc/mediatek/infracfg.h              |   4 +
 5 files changed, 120 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/power/mt7623a-power.h
