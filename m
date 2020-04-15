Return-Path: <SRS0=9LKV=57=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2039EC2BA2B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 05:22:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E73F32076A
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 05:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CgApZMbJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E73F32076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nXKQ1s5ZC2BL3WWReZDLzdSGoFg430QPk5InfSUqxdk=; b=CgApZMbJY/YgvI
	TicigXF3SesUuSbOt2g/SD0Hr0F1wywdYLVu2iMlCQM1pRSOU4yT6g4pPhh75Q3RwtEcwrDJIwvgD
	9MpE0MJFcrvrEkv95rUF1mT1IZI4gin4vVhPEejLjQPsOvkzLt3vqLpngUPdNwSpNbHgsFX4/1Sgm
	XYPeoLXlwjn7ZZlkcZGP/F1i6mjuijNhaFysSXEjtFqL5toZsTnlNirwfszK2ddqIT1ka4cbWioGJ
	xMbsVim9s5nWBNLEDkctANTdCLdn2EUoQ6mRnhR1rxnFuX2wXqcS1kyS/Z4V5PedOCEjPM/wkiWjd
	/OvD2mT08R749IgxJCRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOaVF-0003Yc-P8; Wed, 15 Apr 2020 05:22:25 +0000
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOaV7-0003RI-C5; Wed, 15 Apr 2020 05:22:18 +0000
Received: by mail-lj1-f193.google.com with SMTP id u6so667074ljl.6;
 Tue, 14 Apr 2020 22:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r85BWktV4eKffhP5bEUSsTAbCcixIe97gDFSAa6NS3Q=;
 b=T5WUgnE5kZMZiO/kSez0SB7784zPNF9QFirNdcYadc1LscmlMtScBuggQE9Zr+WTJo
 GGEma8bpGFQwPGZNFpa/K2e+PSWqAcuWMHBqasfBSIxow6hiAPCa++FVoru5V3hXLC9B
 ayAVkoCPz7RA/8PuIAH+A3l7kIzN9+YUmDf/ZHfRzj67+pie2cP8QZXbBAFtBPVdXxEZ
 zlsSuFTJPq7mvuV/eBTfrUz7fyqC/9a/Z54EuhErpnBp+N9+L+qAkZKFP76ImXw5SgqU
 +E4YABbX4h89Q0jVJuVfL3Ak7pRf0Pck+ozlGmkkpJPv1Y/CCCwyA9A8sh+KYdzmgJEz
 /asg==
X-Gm-Message-State: AGi0Pua6FMiLDD67+EYAR518CaYKYnzvwZ31TPWDWYxaZrURoC1fmkpS
 qq5vPuR+vFbppRp6970PZSA=
X-Google-Smtp-Source: APiQypKLGtnC6sXbIcekesasMG2PKzE1C4u2dv/qj9faCixgDOnfOEMgA9XHww/hBoXsQ1ehqUrO8A==
X-Received: by 2002:a2e:b6cf:: with SMTP id m15mr2046996ljo.168.1586928135743; 
 Tue, 14 Apr 2020 22:22:15 -0700 (PDT)
Received: from localhost.localdomain
 (dc7t7ryyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e1:b700::3])
 by smtp.gmail.com with ESMTPSA id 6sm3272691ljq.36.2020.04.14.22.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 22:22:15 -0700 (PDT)
Date: Wed, 15 Apr 2020 08:22:06 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [PATCH v10 07/11] power: supply: add battery parameters
Message-ID: <9b59e3674ad89fddf83aa6396c8699e71836be0c.1586925868.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1586925868.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1586925868.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_222217_406948_1AB08FEF 
X-CRM114-Status: GOOD (  11.69  )
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

Add parsing of new device-tree battery bindings.

     - trickle-charge-current-microamp
     - precharge-upper-limit-microvolt
     - re-charge-voltage-microvolt
     - over-voltage-threshold-microvolt

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---

No changes since v9

 drivers/power/supply/power_supply_core.c | 8 ++++++++
 include/linux/power_supply.h             | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index 1a9a9fae73d3..02b37fe6061c 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -620,10 +620,18 @@ int power_supply_get_battery_info(struct power_supply *psy,
 			     &info->voltage_min_design_uv);
 	of_property_read_u32(battery_np, "voltage-max-design-microvolt",
 			     &info->voltage_max_design_uv);
+	of_property_read_u32(battery_np, "trickle-charge-current-microamp",
+			     &info->tricklecharge_current_ua);
 	of_property_read_u32(battery_np, "precharge-current-microamp",
 			     &info->precharge_current_ua);
+	of_property_read_u32(battery_np, "precharge-upper-limit-microvolt",
+			     &info->precharge_voltage_max_uv);
 	of_property_read_u32(battery_np, "charge-term-current-microamp",
 			     &info->charge_term_current_ua);
+	of_property_read_u32(battery_np, "re-charge-voltage-microvolt",
+			     &info->charge_restart_voltage_uv);
+	of_property_read_u32(battery_np, "over-voltage-threshold-microvolt",
+			     &info->overvoltage_limit_uv);
 	of_property_read_u32(battery_np, "constant-charge-current-max-microamp",
 			     &info->constant_charge_current_max_ua);
 	of_property_read_u32(battery_np, "constant-charge-voltage-max-microvolt",
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index dcd5a71e6c67..d01322d1ab52 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -346,8 +346,12 @@ struct power_supply_battery_info {
 	int charge_full_design_uah;	    /* microAmp-hours */
 	int voltage_min_design_uv;	    /* microVolts */
 	int voltage_max_design_uv;	    /* microVolts */
+	int tricklecharge_current_ua;	    /* microAmps */
 	int precharge_current_ua;	    /* microAmps */
+	int precharge_voltage_max_uv;	    /* microVolts */
 	int charge_term_current_ua;	    /* microAmps */
+	int charge_restart_voltage_uv;	    /* microVolts */
+	int overvoltage_limit_uv;	    /* microVolts */
 	int constant_charge_current_max_ua; /* microAmps */
 	int constant_charge_voltage_max_uv; /* microVolts */
 	int factory_internal_resistance_uohm;   /* microOhms */
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
