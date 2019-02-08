From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] Mediatek SoC updates for v5.1
Date: Fri, 8 Feb 2019 20:59:56 +0100
Message-ID: <7c3dc195-68eb-e78d-3f7d-806546608d2c@gmail.com>
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Weiyi Lu <weiyi.lu@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd,
Hi Olof,

Please find below changes for v5.1 SoC support

Please merge :)
Matthias

---

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.0-next-soc

for you to fetch changes up to a43379dddf1ba14b6a9d50d95175117bbdf52ed2:

  arm: mediatek: add MT7629 smp bring up code (2019-02-07 17:59:16 +0100)

----------------------------------------------------------------
mt8173: minor typo in scpsys header file
mt7629: add smp bringup code
mt7623a: delete unused smp bringup code

----------------------------------------------------------------
Ryder Lee (2):
      Revert "ARM: mediatek: add MT7623a smp bringup code"
      arm: mediatek: add MT7629 smp bring up code

Weiyi Lu (1):
      dt-bindings: soc: fix typo of MT8173 power dt-bindings

 arch/arm/mach-mediatek/Kconfig           | 4 ++++
 arch/arm/mach-mediatek/mediatek.c        | 3 +--
 arch/arm/mach-mediatek/platsmp.c         | 2 +-
 include/dt-bindings/power/mt8173-power.h | 6 +++---
 4 files changed, 9 insertions(+), 6 deletions(-)
