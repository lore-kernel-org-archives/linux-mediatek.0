From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek: soc driver updates for v4.18
Date: Mon, 14 May 2018 13:32:49 +0200
Message-ID: <bd033549-4998-e376-eb92-16111ec71a07@gmail.com>
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
Cc: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

Below the commits for mediatek soc drivers.
Please beware that we need the regmap-ktime-fix [1] from Mark Browns static tag.
I merged that into my branch, but I wanted to let you know, so that you don't
hit any breakage when pulling in my branch.

Regards,
Matthias

[1] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
tags/regmap-ktime-fix

---

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v4.17-next-soc

for you to fetch changes up to 0afd32c6bb59e41b6692dec4473efaffffcad67b:

  Merge commit 'f15cd6d99198e9c15229aefec639a34a6e8174c6' into
v.4.17-next/soc-test (2018-05-14 12:22:03 +0200)

----------------------------------------------------------------
- use timeout helpers for scpsys and infracfg drivers
- use of_device_get_match_data in pmic wrapper and scpsys

----------------------------------------------------------------
Matthias Brugger (1):
      Merge commit 'f15cd6d99198e9c15229aefec639a34a6e8174c6' into
v.4.17-next/soc-test

Ryder Lee (1):
      soc: mediatek: use of_device_get_match_data()

Sean Wang (6):
      soc: mediatek: reuse read[l,x]_poll_timeout helpers
      regmap: include <linux/ktime.h> from include/linux/regmap.h
      soc: mediatek: reuse regmap_read_poll_timeout helpers
      soc: mediatek: introduce a CAPS flag for scp_domain_data
      soc: mediatek: add a fixed wait for SRAM stable
      soc: mediatek: remove unneeded semicolon

 drivers/soc/mediatek/mtk-infracfg.c  |  46 +++-------
 drivers/soc/mediatek/mtk-pmic-wrap.c |  13 +--
 drivers/soc/mediatek/mtk-scpsys.c    | 167 ++++++++++++++---------------------
 include/linux/regmap.h               |   1 +
 4 files changed, 83 insertions(+), 144 deletions(-)
