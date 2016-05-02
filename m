From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek: dts64 updates for v4.7
Date: Mon, 2 May 2016 16:38:40 +0200
Message-ID: <CABuKBe+2KnF_WFvhZ9ROz3mqJm1jv_+WteHvubfJQhNfS7vuUA@mail.gmail.com>
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
Cc: =?UTF-8?B?RGF3ZWkgQ2hpZW4gKOmMouWkp+ihmyk=?= <Dawei.Chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi all,

Please feel free to pull the following patches.

Thanks a lot,
Matthias

---
The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v4.6-next-dts64

for you to fetch changes up to 962f5143b30568bf67be97365d0616b0050ddaa5:

  arm64: dts: mt8173: Add thermal zone node. (2016-04-21 15:55:11 +0200)

----------------------------------------------------------------
- add thermal and auxadc device nodes to mt8173
- add thermal zone nodes to mt8173

----------------------------------------------------------------
Sascha Hauer (1):
      ARM64: dts: mt8173: Add thermal/auxadc device nodes

dawei.chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org (1):
      arm64: dts: mt8173: Add thermal zone node.

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
