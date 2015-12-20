From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek: arm64 updates for v4.4
Date: Sun, 20 Dec 2015 22:17:50 +0100
Message-ID: <CABuKBeJGS0a5tLFbH=hJtsZ-Uma=7p+M67NuLtBpzhN7d--11A@mail.gmail.com>
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
Cc: YH Huang <yh.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

Please pull the following patches.

Thanks,
Matthias

---

The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v4.4-next-arm64

for you to fetch changes up to 05bdabe7ebc780e3cd9275f0f5795d337fa5acca:

  arm64: dts: mediatek: mt8173 PSCI-1.0 support (2015-11-20 13:42:29 +0100)

----------------------------------------------------------------
Update psci support to the arm,psci-1.0 to mt8173

Add display PWM driver to mt8173

Add mediatek general porpose timer to mt8173

----------------------------------------------------------------
Daniel Kurtz (1):
      arm64: dts: mt8173: add timer node

Fan Chen (1):
      arm64: dts: mediatek: mt8173 PSCI-1.0 support

YH Huang (1):
      arm64: dts: mt8173: add MT8173 display PWM driver support node

 arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 13 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi    | 33 ++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)
