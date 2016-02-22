From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek: soc updates for v4.5
Date: Mon, 22 Feb 2016 13:40:51 +0100
Message-ID: <CABuKBeLEf+jyE5gzWEVzfRZ7DwRgnLrdWLREwqqfYGBb2g+exQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Cc: Louis Yu <louis.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, HenryC Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

Please pull the following patches.
As you can see from the description, this pull request includes some
fixes. Only a few developer have access to a Mediatek HW at the
moment. Therefor I didn't send the fixes to stable.

If you want me to send the fixes for older kernel versions, please let me know.

Thanks,
Matthias

---

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

https://github.com/mbgg/linux-mediatek.git tags/v4.5-next-soc

for you to fetch changes up to cc8ed76938b5cf6a54ab3d60edabaf808dc960d1:

soc: mediatek: SCPSYS: Fix double enabling of regulators (2016-02-01
11:28:07 +0100)

----------------------------------------------------------------
Fix state machine implemenation of PMIC wrapper.
Add SMP support for mt7623.
Disable watchdog of STAUPD in PMIC wrapper for mt8173.
Add SMP support for mt2701.
Use builtin_platform_driver for scpsys. Driver can't be build as module.
Fix regulator enablement in scpsys.

----------------------------------------------------------------
Henry Chen (2):
soc: mediatek: PMIC wrap: Clear the vldclr if state machine stay on
FSM_VLDCLR state.
soc: mediatek: PMIC wrap: clear the STAUPD_TRIG bit of WDT_SRC_EN

John Crispin (1):
ARM: mediatek: add MT7623 smp bringup code

Louis Yu (1):
ARM: mediatek: add mt2701 smp bringup code

Matthias Brugger (1):
soc: mediatek: SCPSYS: use builtin_platform_driver

Sascha Hauer (1):
soc: mediatek: SCPSYS: Fix double enabling of regulators

arch/arm/mach-mediatek/platsmp.c | 8 +++++
drivers/soc/mediatek/mtk-pmic-wrap.c | 41 +++++++++++++++++++++---
drivers/soc/mediatek/mtk-scpsys.c | 60 ++++++++++++++++--------------------
3 files changed, 71 insertions(+), 38 deletions(-)
