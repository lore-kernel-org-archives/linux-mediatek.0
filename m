Return-Path: <SRS0=9LKV=57=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7A8C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 05:24:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FFD42063A
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 05:24:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UJ1Yc2mJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FFD42063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fiv4b3We5ZwkA9eaGx2g07rxMg3thHBjIsA6Ix+oaeo=; b=UJ1Yc2mJ733dPL
	xrmu3WUrNgeb51FjPxFWDVNbRFlqZFJbAEZq/N7u3RI3FAjSn2idBbSr1IHJvKtC3L4CUYzKzDnVG
	Vgn9Y7+HwPPQ+uCmFmrblPz55YUqJpBYqi7fqNQs2/09yJ7s9+IJ0n1zrs6aTuYIkN/yhNzk1k3OD
	LCnWTPzpmFuvbND1RyDlXosjBSENECKPDT2y60cSIFrWVFIvInhqxSTf8BfElSNLQyZbGpt3EOU9S
	5ZP2+nu70IaKGIpu8BZBZxWjQ0RcoQWq6btNGLalaKYbhPVIScAD/qw8El9BpYXmspYcRSGS3gaGU
	AcqyFQc5sFi/wcEyHsFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOaXL-0005OQ-9B; Wed, 15 Apr 2020 05:24:35 +0000
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOaXA-0005F2-AK; Wed, 15 Apr 2020 05:24:25 +0000
Received: by mail-lj1-f196.google.com with SMTP id u15so2295430ljd.3;
 Tue, 14 Apr 2020 22:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GPA/i1MeghluzvwK9kprDNBofjBWC5kulY4z+64/X/w=;
 b=J3d9fC8JjOEDJlUx69hsxEzrBDMrwhor1mBZXoubThXN0r8aBuH6+CQl13qArgnsgZ
 RQv+lQsHdH0RtXDLRAbjFGmJF0D8gGOSrdvReXr27oKiJEZoCk6buwTRDjOKASg4NStI
 z5eqPtGqb+p3ev2crjRe/mU4BDnyQhdCnmqe/wiEeaHPBzkxkvbsWsMsAvmqA2wywoxX
 PxLKaajbYXECXkBVTY1Hh7QT+H5Ycx5hyMd1qo5/Jhmg+MszyNby9CCHVJSGEyFH+Cx/
 fAKTqQ4FQ0K3yw/PfbO6yN7MvYfHDz0t3ITgauby9dSCOdmbnl7VzwOHMf5E4v2kqE2T
 vzsg==
X-Gm-Message-State: AGi0PuaYoCkSvkwkKzjH0GYmaXklB7QrLe/Hw1VX99kkJLdmpzzZ8EDE
 Byo7wOT8NNzRb+4cY0xf0aQ=
X-Google-Smtp-Source: APiQypLA31EOzlOHPxf1H/TUzrY5NG3O7VPp4LVyf1EzSxdMwl2/OQdmDNbjvIJ9c3eld69hMjQqiw==
X-Received: by 2002:a2e:9013:: with SMTP id h19mr2148903ljg.277.1586928262986; 
 Tue, 14 Apr 2020 22:24:22 -0700 (PDT)
Received: from localhost.localdomain
 (dc7t7ryyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e1:b700::3])
 by smtp.gmail.com with ESMTPSA id m12sm2722572ljc.81.2020.04.14.22.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 22:24:22 -0700 (PDT)
Date: Wed, 15 Apr 2020 08:24:14 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [PATCH v10 11/11] power: supply: KConfig cleanup default n
Message-ID: <b893d0449886a8ffed00bbcc1fcbe34d83b833d3.1586925868.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1586925868.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1586925868.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_222424_357049_69B0827C 
X-CRM114-Status: GOOD (  11.59  )
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

The "default n" is not needed. Clean the KConfig by removing
"default n".

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

This was pointed to me first by Randy Dunlap during v4 review.
I cleaned the BD99954 back then.

Also Andy Shevchenko mentioned this to me. So as I was
changing the file anyways... Please just drop this patch out
of the series if you're not Ok with this.

 drivers/power/supply/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index ec028e47c3c2..04821d8c9e43 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -660,7 +660,6 @@ config CHARGER_RT9455
 config CHARGER_CROS_USBPD
 	tristate "ChromeOS EC based USBPD charger"
 	depends on CROS_USBPD_NOTIFY
-	default n
 	help
 	  Say Y here to enable ChromeOS EC based USBPD charger
 	  driver. This driver gets various bits of information about
@@ -696,7 +695,6 @@ config CHARGER_BD70528
 	tristate "ROHM bd70528 charger driver"
 	depends on MFD_ROHM_BD70528
 	select LINEAR_RANGES
-	default n
 	help
 	  Say Y here to enable support for getting battery status
 	  information and altering charger configurations from charger
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
