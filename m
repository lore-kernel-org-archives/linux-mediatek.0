Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416DBC2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 08:07:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138372072D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 08:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tz+5F6QZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 138372072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5s3Moe2mFGzXV5IJa9GFzX8ln+8MVrcvD1kPqt+2hA=; b=Tz+5F6QZR0p96s
	FXRld/jL9VpUkoIooGCYaTUW424maRujY0Zr0mjHbWTSC8vjkwkVUHsj0mYc7dQx6AdEVry3iY9cl
	wE6CVbGQkEKBekLJoU/6r5aHAUJH7s5KeANVjhhnjG7ulHBFdIy2zUjyJvMSil9wWpZu/WpBahV+H
	Y/nSTJ5QDoKRkrHrSYtQLNjvHsN29+RUFEU/RRv/JGsVk8it1FqQi0LgMBFJENYwWwCwMPV9doCH1
	kb7yhbL4qAnUP9+tmdJ16Gsnm6r+aEOO7zCJfLU7168wT9YCXkABJ9HZ32x9knVggPlVoUAZQnBNd
	OB32Qss1TZwNoL2q7TwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOGbn-0001io-Jr; Tue, 14 Apr 2020 08:07:51 +0000
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOGbC-00014Q-3r; Tue, 14 Apr 2020 08:07:16 +0000
Received: by mail-lj1-f194.google.com with SMTP id v9so4842336ljk.12;
 Tue, 14 Apr 2020 01:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wb0sza6Q5ty4d/qdwvzNDwl9p6b2ZoB5gGx5QbNev/c=;
 b=O5SNAAqMBoFbi73WKtUynQ0sfSm8SOKbJhZnxl7GxSZW1CDYfXyQdE/CsEVnN0TBFV
 RTv+HCh0qLHy09pn56tcV/WuH/mlZCvVi5qsYHxSYJEmGakoAu9V8eHEz+OOa2ElRZAm
 JcyG7j4TIYj1EiJMOJT6vDExE7JAACfFzzkxE22kdUge97rM+2/C9d34bL1rsraz7DFZ
 6qsbyBktVAo/p3oK5xtlxJgWnrOYWZQ+bOM/kQNU4qVYjXVa5eMs0MpHOC3aO4YPlkMs
 IVUHWM9dJUP0zRycv8z81VXurK8q5mPVnt953c59uRW+J9LWdUloCUseRWQwcvqvHHW9
 tACA==
X-Gm-Message-State: AGi0PuYRjgHgPGZ62Xl1snVCjf8DNc9H3IsvKogSrDRj+YbUQE5NXauv
 ADPtCXtSBjSQ0+l62jUGBDk=
X-Google-Smtp-Source: APiQypIRzmpTgQCOgOkjyFOgh+lfjXKp6L3/Q+98/UR8F4mUGLsDM/5FCaCx7nYXmp/6oZXiEv6WtQ==
X-Received: by 2002:a2e:140d:: with SMTP id u13mr4164104ljd.152.1586851631828; 
 Tue, 14 Apr 2020 01:07:11 -0700 (PDT)
Received: from localhost.localdomain
 (dc7t7ryyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e1:b700::3])
 by smtp.gmail.com with ESMTPSA id x67sm9788458lfa.76.2020.04.14.01.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 01:07:11 -0700 (PDT)
Date: Tue, 14 Apr 2020 11:06:57 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [PATCH v9 10/10] power: supply: Fix Kconfig help text indentiation
Message-ID: <b14e8887ece1bf1fafb600321c9410fe0791d57d.1586849281.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1586849281.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1586849281.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_010714_323911_0FB57BFD 
X-CRM114-Status: GOOD (  12.18  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Andrei Stefanescu <andrei.stefanescu@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Sebastian Reichel <sre@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
 "Angelo G. Del Regno" <kholk11@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-samsung-soc@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Axel Lin <axel.lin@ingics.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Markus Reichl <m.reichl@fivetechno.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, markus.laine@fi.rohmeurope.com,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, devicetree@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-omap@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Baolin Wang <baolin.wang@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 mikko.mutanen@fi.rohmeurope.com, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Indent the help text as explained in
Documentation/process/coding-style.rst

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---

Changes since v8 - rebased and reordered series.

I just learned the help text in Kconfigs should be indented by two
spaces. I fixed this for BD99954 as suggested by Randy and decided
that I could do this for few other entries as well while I was at
it anyways.

 drivers/power/supply/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 436680ee8523..ec028e47c3c2 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -415,7 +415,7 @@ config CHARGER_PCF50633
 	tristate "NXP PCF50633 MBC"
 	depends on MFD_PCF50633
 	help
-	 Say Y to include support for NXP PCF50633 Main Battery Charger.
+	  Say Y to include support for NXP PCF50633 Main Battery Charger.
 
 config BATTERY_RX51
 	tristate "Nokia RX-51 (N900) battery driver"
@@ -609,15 +609,15 @@ config CHARGER_TPS65090
 	tristate "TPS65090 battery charger driver"
 	depends on MFD_TPS65090
 	help
-	 Say Y here to enable support for battery charging with TPS65090
-	 PMIC chips.
+	  Say Y here to enable support for battery charging with TPS65090
+	  PMIC chips.
 
 config CHARGER_TPS65217
 	tristate "TPS65217 battery charger driver"
 	depends on MFD_TPS65217
 	help
-	 Say Y here to enable support for battery charging with TPS65217
-	 PMIC chips.
+	  Say Y here to enable support for battery charging with TPS65217
+	  PMIC chips.
 
 config BATTERY_GAUGE_LTC2941
 	tristate "LTC2941/LTC2943 Battery Gauge Driver"
@@ -671,16 +671,16 @@ config CHARGER_SC2731
 	tristate "Spreadtrum SC2731 charger driver"
 	depends on MFD_SC27XX_PMIC || COMPILE_TEST
 	help
-	 Say Y here to enable support for battery charging with SC2731
-	 PMIC chips.
+	  Say Y here to enable support for battery charging with SC2731
+	  PMIC chips.
 
 config FUEL_GAUGE_SC27XX
 	tristate "Spreadtrum SC27XX fuel gauge driver"
 	depends on MFD_SC27XX_PMIC || COMPILE_TEST
 	depends on IIO
 	help
-	 Say Y here to enable support for fuel gauge with SC27XX
-	 PMIC chips.
+	  Say Y here to enable support for fuel gauge with SC27XX
+	  PMIC chips.
 
 config CHARGER_UCS1002
 	tristate "Microchip UCS1002 USB Port Power Controller"
@@ -698,9 +698,9 @@ config CHARGER_BD70528
 	select LINEAR_RANGES
 	default n
 	help
-	 Say Y here to enable support for getting battery status
-	 information and altering charger configurations from charger
-	 block of the ROHM BD70528 Power Management IC.
+	  Say Y here to enable support for getting battery status
+	  information and altering charger configurations from charger
+	  block of the ROHM BD70528 Power Management IC.
 
 config CHARGER_BD99954
 	tristate "ROHM bd99954 charger driver"
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
