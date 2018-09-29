From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: soc driver updates for v4.20
Date: Sat, 29 Sep 2018 17:22:34 +0200
Message-ID: <fa4576fd-e8a5-8cfb-381f-e2343bb97786@gmail.com>
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
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Argus Lin <argus.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Gustavo A. R. Silva" <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Olof and Arnd,

Please have a look on the following soc driver commits.

Thanks a lot,
Matthias

---

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v4.19-next-soc

for you to fetch changes up to 3013b410a8f50cf251e09da00b8241fd43bb41fa:

  soc: mediatek: pwrap: add mt6357 driver for mt6765 SoCs (2018-09-25 17:36:38
+0200)

----------------------------------------------------------------
PMIC wrapper:
- sort SoCs and PMICs ascending
- add capabilities
- add support for mt8183 SoC + mt6358 PMIC
- return false instead of 0
- add support for mt6765 SoC + mt6357 PMIC

----------------------------------------------------------------
Argus Lin (3):
      dt-bindings: pwrap: mediatek: add pwrap support for MT6765
      soc: mediatek: pwrap: add pwrap driver for mt6765 SoCs
      soc: mediatek: pwrap: add mt6357 driver for mt6765 SoCs

Gustavo A. R. Silva (1):
      soc: mediatek: pwrap: use true and false for boolean values

Hsin-Hsiung Wang (3):
      dt-bindings: mediatek: add compatible for mt8183 pwrap
      soc: mediatek: pwrap: use group of bits for pwrap capability
      soc: mediatek: add mt8183 pwrap support

Matthias Brugger (1):
      soc: mediatek: pwrap: order SoCs and PMICs ascending

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   2 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 519 ++++++++++++++++-----
 2 files changed, 399 insertions(+), 122 deletions(-)
