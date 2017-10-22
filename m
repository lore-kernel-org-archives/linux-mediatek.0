From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] Mediatek: soc driver updates for v4.15
Date: Mon, 23 Oct 2017 00:12:33 +0200
Message-ID: <73c28655-6ba7-682b-3b84-b058055ab539@gmail.com>
References: <1ebc2f2d-033e-e8d6-86c8-32a67ebd55b7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1ebc2f2d-033e-e8d6-86c8-32a67ebd55b7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

I forgot to add the mailing list in CC for the pull request below.

Matthias

-------- Forwarded Message --------
Subject: [GIT PULL] Mediatek: soc driver updates for v4.15
Date: Mon, 23 Oct 2017 00:10:44 +0200
From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
CC: chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Sean Wang
<sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>

Hi Arnd and Olof,

Please pull the following patches.

Thanks a lot,
Matthias

---
The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v4.14-next-soc

for you to fetch changes up to f32fbbadaf4470e8bac27f6d87bd27441df7167f:

  soc: mediatek: pwrap: fix fatal compiler error (2017-10-21 10:23:28 +0200)

----------------------------------------------------------------
- add 32 bit read/write support to pwrap
- add mt7622 support to pwrap
- test build all mediatek soc drivers
- fix compiler issues
- clean up Kconfig description

----------------------------------------------------------------
Chenglin Xu (1):
      soc: mediatek: pwrap: add support for MT7622 SoC

Jean Delvare (1):
      soc: Allow test-building of MediaTek drivers

Matthias Brugger (2):
      soc: mediatek: pwrap: fix compiler errors
      soc: mediatek: pwrap: fix fatal compiler error

Sean Wang (9):
      soc: mediatek: pwrap: fixup warnings from coding style
      dt-bindings: arm: mediatek: add MT7622 string to the PMIC wrapper doc
      soc: mediatek: pwrap: add pwrap_read32 for reading in 32-bit mode
      soc: mediatek: pwrap: add pwrap_write32 for writing in 32-bit mode
      soc: mediatek: pwrap: refactor pwrap_init for the various PMIC types
      soc: mediatek: pwrap: add MediaTek MT6380 as one slave of pwrap
      soc: mediatek: pwrap: add common way for setup CS timing extenstion
      soc: mediatek: place Kconfig for all SoC drivers under menu
      arm64: mediatek: cleanup message for platform selection

Thomas Meyer (1):
      ARM: mediatek: Cocci spatch "of_table"

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   6 +-
 arch/arm/mach-mediatek/platsmp.c                   |   2 +
 arch/arm64/Kconfig.platforms                       |   5 +-
 drivers/soc/Makefile                               |   2 +-
 drivers/soc/mediatek/Kconfig                       |   8 +-
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 511 +++++++++++++++++----
 6 files changed, 447 insertions(+), 87 deletions(-)
