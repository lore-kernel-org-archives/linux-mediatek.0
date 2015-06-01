From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek: Fix for v4.1
Date: Mon, 1 Jun 2015 12:17:40 +0200
Message-ID: <CABuKBeKkvikUSvZCZNn5_RSHs-ENX9gqDCwhS5h2Py9EQwdYpg@mail.gmail.com>
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
Cc: Yingjoe Chen <Yingjoe.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

please pull the following fix.

Thanks,
Matthias

---

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v4.1-next-arm64-fixes

for you to fetch changes up to 692ef3ee36833b6098a352c079d3cea8fc6ed3ef:

  arm64: dts: mt8173-evb: fix model name (2015-06-01 11:29:15 +0200)

----------------------------------------------------------------
- dts: mt8173: fix compatible string

----------------------------------------------------------------
Yingjoe Chen (1):
      arm64: dts: mt8173-evb: fix model name

 arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
