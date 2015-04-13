From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek: soc fixes for v4.1
Date: Mon, 13 Apr 2015 10:51:42 +0200
Message-ID: <CABuKBeKGjaySn=X-M-9aG22Kr1y=voA8e7ndjuXBGekmO3Rzvw@mail.gmail.com>
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
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

Please pull the following fix for v4.1.

Thanks,
Matthias

---

The following changes since commit 1f022d84bd193ec88b01c6d2cb5b6647cb20a02f:

  soc: mediatek: Add PMIC wrapper for MT8135 and MT8173 SoCs
(2015-03-30 12:25:40 +0200)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v4.0-next-soc-fix

for you to fetch changes up to 7a4261d5d35362d1c9ec4f80ba01ad417ca467b7:

  soc/mediatek: Remove unused variables (2015-04-13 10:35:53 +0200)

----------------------------------------------------------------
- fix unused variable warning for pmic-wrapper

----------------------------------------------------------------
Thierry Reding (1):
      soc/mediatek: Remove unused variables

 drivers/soc/mediatek/mtk-pmic-wrap.c | 2 --
 1 file changed, 2 deletions(-)
