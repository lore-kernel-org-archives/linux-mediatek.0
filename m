Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2A7C5DF62
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 13:29:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DD621929
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 13:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O2KwkzhD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmREb2gA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67DD621929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QeOOrBIfLVRXL3M9eC1Av1MAmymRtlXYNkqAxQG6gWA=; b=O2KwkzhDLHIIwcahqUO2QFmC4P
	tA6swmP6NDeZRJQH4eSmK4e41lmKNxjpl/hrfWA2tFQt/OFdbVdSaalcbUw8fWh/ZSEmUw0TDv7yP
	VHHGjSzBW+/XoKGJZUIHkC70A7PnMWxKn+1igRiMUWXYDUwXJIyRpp+o5dgWqU4o0tYW1VZOowK8J
	XB7CsRAdzQsn9Y6cvLOAUIjtTwrKwPYICQFHJWs+/CNv6hZpoVND2cuBcq4AtLnqM/abaA3drrGW/
	mR7i3ZJrbyjVkdae5n0pdO56YbXMYMiOV8Xpcn9jqNsHj8vWtmcKPgYSzqKx6rafpXJSH8Zoe8lMq
	gFGkzvog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSLNB-0003vH-IO; Wed, 06 Nov 2019 13:29:21 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSLMq-0003Zw-Ig
 for linux-mediatek@lists.infradead.org; Wed, 06 Nov 2019 13:29:02 +0000
Received: by mail-pg1-x541.google.com with SMTP id 15so17145337pgt.7
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2019 05:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=2JC2BSAON2aTYfWnY286zBqdcBgF1dUkhFpgqH52P8A=;
 b=GmREb2gAFzVBw1JzE2epBfRKDBD9/8BHb4WsdWVr5lOtzpidmIw5GF3ZoJMBmiR2Lc
 hkiJAEHW0blLAPRX292U+12+AsV/FjNwUbuecXH9XavsxZR5ZGdmfy8qUOiga8JBaCHQ
 rCdQcLyLGFupMzXBlQpqtMxOpCb8qylIQELk0s8wrkVmGkfF79umn2K6WDk4xLVOpiLI
 5RJyH9RUJzoadMkubpIwpy0T4PfwtaRawxNZF/W2TAMXRAOFzifYXQJu6tRRIoAW2IM2
 ZhYtAHd6FSX09lWSsG6PADFFgZ4VKpmYAIPfmwW7hzVEJ1wgNQYi8uk7j2YsIzi3VNI/
 dNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=2JC2BSAON2aTYfWnY286zBqdcBgF1dUkhFpgqH52P8A=;
 b=OJNUqwBpHw36N7KEf/TyHpHqjcRceJQWzxlRdiXbQb1krVaY+mqfsCY/u17mVjtv3O
 MHbTId+QV/gB77qRiBhXdyfrh5NL3ReXQPKIZMRlYzDEPg2YCgCcdsjCxo4y3ZaHyGhf
 5xdxpPEgTBMM3XiStq3f7uOgWIOb/HerqEzk+qRMIZdKXgX05GoSK14n6WynatmWI+Ld
 TN4JqRjIYVChlhgIIy9RI/OgACwofF8ACltUQGiZu9Q9qIjK4rvI+Ml83TL6jI2W/ges
 V4YzaMbTKFDPi+8yxRFRWbR68Vyjig9G9iFd7SJ/g2LD4w4sImEMoGsg0xwPBAR7rt7g
 F9XA==
X-Gm-Message-State: APjAAAU8b32GfJF/otil2DCw6YfgzwL4qmRQ/4CaWXp24yPV8hNdirCL
 /qiggj7xWn+Gx0hDCpJASG1YHQ==
X-Google-Smtp-Source: APXvYqzT7yY171Uj3lkOCncUrwz2j9jISfZ79+XTPrykw/o8bUa0kJNh8nso8pz12NOQBzd7gSDYaw==
X-Received: by 2002:aa7:9192:: with SMTP id x18mr3340660pfa.229.1573046939554; 
 Wed, 06 Nov 2019 05:28:59 -0800 (PST)
Received: from localhost ([49.248.202.230])
 by smtp.gmail.com with ESMTPSA id q8sm20785909pgg.15.2019.11.06.05.28.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Nov 2019 05:28:59 -0800 (PST)
From: Amit Kucheria <amit.kucheria@linaro.org>
To: linux-kernel@vger.kernel.org, edubezval@gmail.com,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Javi Merino <javi.merino@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jun Nie <jun.nie@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 06/11] thermal: mediatek: Appease the kernel-doc deity
Date: Wed,  6 Nov 2019 18:58:22 +0530
Message-Id: <2961e4ac4b32ea7db8b5f6916751a5c02ee85960.1573046440.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1573046440.git.amit.kucheria@linaro.org>
References: <cover.1573046440.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1573046440.git.amit.kucheria@linaro.org>
References: <cover.1573046440.git.amit.kucheria@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_052900_656016_5ABFE61E 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace a comment starting with /** by simply /* to avoid having it
interpreted as a kernel-doc comment. Describe missing function
parameters where needed.

Fixes up the following warnings when compiled with make W=1:

linux.git/drivers/thermal/mtk_thermal.c:374: warning: cannot understand
function prototype: 'const struct mtk_thermal_data mt8173_thermal_data =
'
linux.git/drivers/thermal/mtk_thermal.c:413: warning: cannot understand
function prototype: 'const struct mtk_thermal_data mt2701_thermal_data =
'
linux.git/drivers/thermal/mtk_thermal.c:443: warning: cannot understand
function prototype: 'const struct mtk_thermal_data mt2712_thermal_data =
'
linux.git/drivers/thermal/mtk_thermal.c:499: warning: cannot understand
function prototype: 'const struct mtk_thermal_data mt8183_thermal_data =
'
linux.git/drivers/thermal/mtk_thermal.c:529: warning: Function parameter
or member 'sensno' not described in 'raw_to_mcelsius'

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/mtk_thermal.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index acf4854cbb8b8..76e30603d4d58 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -358,7 +358,7 @@ static const int mt7622_mux_values[MT7622_NUM_SENSORS] = { 0, };
 static const int mt7622_vts_index[MT7622_NUM_SENSORS] = { VTS1 };
 static const int mt7622_tc_offset[MT7622_NUM_CONTROLLER] = { 0x0, };
 
-/**
+/*
  * The MT8173 thermal controller has four banks. Each bank can read up to
  * four temperature sensors simultaneously. The MT8173 has a total of 5
  * temperature sensors. We use each bank to measure a certain area of the
@@ -400,7 +400,7 @@ static const struct mtk_thermal_data mt8173_thermal_data = {
 	.sensor_mux_values = mt8173_mux_values,
 };
 
-/**
+/*
  * The MT2701 thermal controller has one bank, which can read up to
  * three temperature sensors simultaneously. The MT2701 has a total of 3
  * temperature sensors.
@@ -430,7 +430,7 @@ static const struct mtk_thermal_data mt2701_thermal_data = {
 	.sensor_mux_values = mt2701_mux_values,
 };
 
-/**
+/*
  * The MT2712 thermal controller has one bank, which can read up to
  * four temperature sensors simultaneously. The MT2712 has a total of 4
  * temperature sensors.
@@ -484,7 +484,7 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
 	.sensor_mux_values = mt7622_mux_values,
 };
 
-/**
+/*
  * The MT8183 thermal controller has one bank for the current SW framework.
  * The MT8183 has a total of 6 temperature sensors.
  * There are two thermal controller to control the six sensor.
@@ -495,7 +495,6 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
  * data, and this indeed needs the temperatures of the individual banks
  * for making better decisions.
  */
-
 static const struct mtk_thermal_data mt8183_thermal_data = {
 	.auxadc_channel = MT8183_TEMP_AUXADC_CHANNEL,
 	.num_banks = MT8183_NUM_SENSORS_PER_ZONE,
@@ -519,7 +518,8 @@ static const struct mtk_thermal_data mt8183_thermal_data = {
 
 /**
  * raw_to_mcelsius - convert a raw ADC value to mcelsius
- * @mt:		The thermal controller
+ * @mt:	The thermal controller
+ * @sensno:	sensor number
  * @raw:	raw ADC value
  *
  * This converts the raw ADC value to mcelsius using the SoC specific
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
