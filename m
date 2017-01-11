From: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] clk: mediatek: Fix MT2701 dependencies
Date: Wed, 11 Jan 2017 13:41:46 +0100
Message-ID: <20170111134146.36878e01@endymion>
References: <20170109113621.31d384c9@endymion>
 <c3da261a-eb85-9b30-d5e2-05863d2efad2@suse.de>
 <20170110130300.167d215b@endymion>
 <1484099788.26901.8.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1484099788.26901.8.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi James,

On Wed, 11 Jan 2017 09:56:28 +0800, James Liao wrote:
> On Tue, 2017-01-10 at 13:03 +0100, Jean Delvare wrote:
> > What about MT8135 and MT8173, are they 32-bit SoCs as well?
> 
> MT8135 is a 32-bit SoC and MT8173 is a 64-bit SoC.

OK, so would the following change make sense?

---
 drivers/clk/mediatek/Kconfig |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-4.10-rc2.orig/drivers/clk/mediatek/Kconfig	2017-01-09 11:17:37.542344083 +0100
+++ linux-4.10-rc2/drivers/clk/mediatek/Kconfig	2017-01-11 13:40:21.965890913 +0100
@@ -52,16 +52,16 @@ config COMMON_CLK_MT2701_BDPSYS
 
 config COMMON_CLK_MT8135
 	bool "Clock driver for Mediatek MT8135"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on (ARCH_MEDIATEK && !ARM64) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
-	default ARCH_MEDIATEK
+	default y
 	---help---
 	  This driver supports Mediatek MT8135 clocks.
 
 config COMMON_CLK_MT8173
 	bool "Clock driver for Mediatek MT8173"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
-	default ARCH_MEDIATEK
+	default y
 	---help---
 	  This driver supports Mediatek MT8173 clocks.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
