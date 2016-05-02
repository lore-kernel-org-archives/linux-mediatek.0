From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek soc updates for v4.7
Date: Mon, 2 May 2016 16:34:11 +0200
Message-ID: <CABuKBeJV6bA=2Sx_apRp2HMfuyymFCV67zxaoJzBeRbRMzv0AQ@mail.gmail.com>
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
Cc: "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi all,

Please take the following patches for v4.7.

Thanks,
Matthias

---

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v4.6-next-soc

for you to fetch changes up to 601bac7638fa693204dc70035d2651474704967c:

  ARM: mediatek: enable gpt6 on boot up to make arch timer work on
mt7623 (2016-04-20 13:58:45 +0200)

----------------------------------------------------------------
- re-organize pmic wrapper code for easier and cleaner addiont of new
SoCs and pmic wrappers
- add support for pmic wrapper mt6323
- add support for SoC mt2701
- enable gpt6 arch timer on mt7623

----------------------------------------------------------------
John Crispin (11):
      soc: mediatek: PMIC wrap: don't duplicate the wrapper data
      soc: mediatek: PMIC wrap: add wrapper callbacks for init_reg_clock
      soc: mediatek: PMIC wrap: split SoC specific init into callback
      soc: mediatek: PMIC wrap: WRAP_INT_EN needs a different bitmask
for MT2701/7623
      soc: mediatek: PMIC wrap: SPI_WRITE needs a different bitmask
for MT2701/7623
      soc: mediatek: PMIC wrap: move wdt_src into the pmic_wrapper_type struct
      soc: mediatek: PMIC wrap: remove pwrap_is_mt8135() and pwrap_is_mt8173()
      soc: mediatek: PMIC wrap: add a slave specific struct
      soc: mediatek: PMIC wrap: add mt6323 slave support
      soc: mediatek: PMIC wrap: add MT2701/7623 support
      ARM: mediatek: enable gpt6 on boot up to make arch timer work on mt7623

 arch/arm/mach-mediatek/mediatek.c    |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c | 544 ++++++++++++++++++++++++++---------
 2 files changed, 414 insertions(+), 131 deletions(-)
