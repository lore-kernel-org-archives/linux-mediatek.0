Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27BCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 09:37:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C19CF60F44
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 09:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C19CF60F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1YXDxGUbES2eheWiMWuH+eYXcl+kjn3MKgt7PwHCwA=; b=JXdWEOHRnTZBcp
	EVdvYGynmZKw/hYUgZg5zlYqfQpHRYjU5IBZFq3HhfPpOydmsveUj6RY4kVhV5+j2XTClfJ7mXTkT
	2N7s7uj4IFX4+txbmLxyjcqPVTGQPrLLJBobuwCZZFx6GFxuG54dDcEU/AJLlCl+/mw27mxWF/v68
	qt7oRSTbvjM2NgQXpp2kqK+vlQhHcIQpvdGxz8PYeOh4BsCHKEyciGiH7UUJyW8OzibTZ0z4uLn5N
	qg4s0Rq098fkELpC5lBlJIdFS1HmszkbqvZTnuu9hA4V8fgiCX0fN3IrofrsmCDR1X0kidCSqPRSm
	OXXLrig0nOtjKUPHt18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mclYe-000gUe-EE; Tue, 19 Oct 2021 09:37:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mclXr-000gBh-8V
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 09:36:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso1994685wmc.3
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Oct 2021 02:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iBt5PaBb/SQkmIAGIPWPkHg9L+YHvcMfnSpD3LPoVg=;
 b=RK+5r5PwEA/nuA6SQzYqBleLenuGSzS9bmVPSgmr30nYakGL83fg5O29IqmUhqTMSz
 7Gcz6od5O0ScvHxpYw0qK/0TwGLi3UWhkIfrTfMGbSwCLg5oaQx9td5xU7dA+1t42YNS
 u5hERCsAx9QENchxYFqV61KzePoxXK+NZXQ+e9kBphHBFw/qeQ0V6w5NeIVUthLNaA5e
 xHwd3UTYdP3K4iZYTZcCrBuz2qpb/+kToloaGtsFIYqF1Tr9+OavLKXW99ZOKyJFtmg9
 buEnZ1+oqdBqcvf30QXT0uh+is2HrMukQHi68HyrBp6FuwEVzhWH0SaghAHfuqtjPo6Z
 Faew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iBt5PaBb/SQkmIAGIPWPkHg9L+YHvcMfnSpD3LPoVg=;
 b=Ip9wgFd87rFtMc/OVjlOf2AcH8fRO1YclPBzcoh0fUIhSng50SPtckgHfcjH8nOytj
 U8V1wuoM7ROcRGYmF5SGlRxt+e6X6mPIkRnUNm+3SCRXK50I0eVfg0Kkqd7qGmfJ+FPB
 rEKULAk934RWNLV0F+Ytt60orK9M70qoa7dq1W656fKNZeFnIqziG3o46Q4/ueliCxhg
 OoY4e5V3mTLkhegcL9xo1jJyj3yUOLMylr0hrXFK7bD9L8Dts317/MSuGvz6eh1oCijP
 4rV0jzQ1Epb/uWhvpovEbrVbw/nDpKTHmnaRnJXrlDVqj4D0JSYADQT02tWnX5tl0L64
 ou/Q==
X-Gm-Message-State: AOAM533KzTHLP9BSdTiFyYInyob0dMr6hYjkrZ4HWXFuDjAsf+VkFigL
 PHpE77MHuiUyu4/DGk0HhCjDiA==
X-Google-Smtp-Source: ABdhPJyWlQB++OW76/yEH4NmsYV5AtI/qYWUDcxm+rP4W3MU5xU76g2eBRuPCVnJT3D8VtWE+sU+Ow==
X-Received: by 2002:a1c:4b08:: with SMTP id y8mr5016066wma.98.1634636189302;
 Tue, 19 Oct 2021 02:36:29 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id o23sm1765765wms.18.2021.10.19.02.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:36:28 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fparent@baylibre.com, khilman@baylibre.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 3/4] thermal: mediatek: Remove data void casts
Date: Tue, 19 Oct 2021 11:34:03 +0200
Message-Id: <20211019093404.1913357-4-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019093404.1913357-1-msp@baylibre.com>
References: <20211019093404.1913357-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_023631_311973_FA8BF899 
X-CRM114-Status: GOOD (  11.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It is not necessary to cast struct mtk_thermal_data to (void*).

This patch removes these casts.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/thermal/mtk_thermal.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 93ee043d70da..af6cd11eb221 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -941,23 +941,23 @@ static int mtk_thermal_get_calibration_data(struct device *dev,
 static const struct of_device_id mtk_thermal_of_match[] = {
 	{
 		.compatible = "mediatek,mt8173-thermal",
-		.data = (void *)&mt8173_thermal_data,
+		.data = &mt8173_thermal_data,
 	},
 	{
 		.compatible = "mediatek,mt2701-thermal",
-		.data = (void *)&mt2701_thermal_data,
+		.data = &mt2701_thermal_data,
 	},
 	{
 		.compatible = "mediatek,mt2712-thermal",
-		.data = (void *)&mt2712_thermal_data,
+		.data = &mt2712_thermal_data,
 	},
 	{
 		.compatible = "mediatek,mt7622-thermal",
-		.data = (void *)&mt7622_thermal_data,
+		.data = &mt7622_thermal_data,
 	},
 	{
 		.compatible = "mediatek,mt8183-thermal",
-		.data = (void *)&mt8183_thermal_data,
+		.data = &mt8183_thermal_data,
 	}, {
 	},
 };
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
