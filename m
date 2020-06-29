Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC4CC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:48:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A4D23D22
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:48:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fVq3xAtT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g/qvooMn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1A4D23D22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+sFmdlb9WgNdNi6hxIIl4/gqpzEpsPqDUEECMgeykZA=; b=fVq3xAtT6CVqts2X+EZaD6pd5
	o8rFDV00rIe1H2PCl7xSoSuVOuXNitZmUnuurR/RxnoC1MdT8bVjfgWSgG+hpXTxV+vFQb55mR6wg
	7MwZlz/uSOATBxAwmlQ58Bw8nO1CGVy661bDS7GJyxQKLcpjdudaCduMC48Z3YHl9uOYyxZ2r0RWs
	h6LHZ81RCd6o3UHbc//SpflrmRSCyZ7AAZ5tJJGJJH39/eVsGYtvG9GjHEUiW0ggESlAp9Vw7DZ2B
	1ybAvGlRgFfG52l/IW4IbuFgpmE+Jais3OQC9ka5/vjZW6Eu8nK6pUnxRVKtNsVmxDaczGi3a6eX8
	pAaIpXYKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jptCm-0001lw-Nw; Mon, 29 Jun 2020 12:48:12 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jptCZ-0001hX-Iz
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 12:48:00 +0000
Received: by mail-wr1-x444.google.com with SMTP id s10so16374009wrw.12
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NEV6hYDCbFsvfJQmVY8SdLZWAEKAYJLZhNHaqOLyTQ0=;
 b=g/qvooMn7EGa6fcqc2kWnU2ojwrJqK2KiizeQeRVmrzZNiW+BuWl/MFpjCt7ykkfQi
 /WtES5WG4855eTikHYrDxPwhnzNevMFtUE0Uw1T+XtYmxeAV8nlDXMIZbpC8slMDFM9b
 l9bvKnHs6tD4Q+fAd/GrCSLSCZP6CxvRyfcX6949iBxHUkpeHaZwBbPTNuRkN2DUXVrk
 mP9eGbJLxI2Rw5zbVk4RDUM6LbadMulN+A0LYyqtETOkhIAfq01WPOQj+rNpoGAZlBtH
 lMLvIy6r1baqcRuN0MQg0hhdEQriJtNufm8KwQDDs6uM4b1C2n1dXb2jm04IZyUV4x5S
 7m+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NEV6hYDCbFsvfJQmVY8SdLZWAEKAYJLZhNHaqOLyTQ0=;
 b=tMgzJFcaWNtWRoAzg1pyZA9RhI/GuERZqwXqfahLMxoqdQnKBZ6f1P90FntN7cHgyD
 9sG2Z2aMsJO/eT0peVoGVCeq1DoJ2kVmIIvsXlVyGopD12hqgbODydJN/+wdmIR2Q0p+
 vwnisHW/hpV43KJZWrQuxFWnKF99fA230mw+Xr4P3qGifMoHw7SursU8nM6MpO6D8Lyi
 fEdFns7Rud6XOkC5DSGFUW0PWUOEfcbbVxNbhWhvqd37GNGE5N5z6nk7U31zpCDpip7u
 920eZ3xPkq7CuGSepddclZvWvNi7zMjcDbrCKXqupW+Cw96O6lUW5wyfu9np0geYmROT
 /7yA==
X-Gm-Message-State: AOAM532YVwoPUrdkUpIRBeQj9RKgy+nLoPAMr5nz/11ZFr9oPVbGtQne
 H3dOQ3PHDS3lzu2BGB6Q5AoXbw==
X-Google-Smtp-Source: ABdhPJydHemsKTs48wiPVgEp/Hc461CvZjxrU2X87Xf1dlr2h8v+7RF5f+XgVLw3AkYxwWDmRNEYFw==
X-Received: by 2002:adf:edc6:: with SMTP id v6mr16990851wro.413.1593434878504; 
 Mon, 29 Jun 2020 05:47:58 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id e17sm12995924wrr.88.2020.06.29.05.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 05:47:57 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 linux-pwm@vger.kernel.org
Subject: [PATCH 3/4] pwm: mediatek: Provide missing kerneldoc description for
 'soc' arg
Date: Mon, 29 Jun 2020 13:47:51 +0100
Message-Id: <20200629124752.1018358-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200629124752.1018358-1-lee.jones@linaro.org>
References: <20200629124752.1018358-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Zhi Mao <zhi.mao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 John Crispin <blogic@openwrt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Kerneldoc syntax is used, but not complete.

Descriptions are required for all arguments.

Fixes the following W=1 build warning:

 drivers/pwm/pwm-mediatek.c:57: warning: Function parameter or member 'soc' not described in 'pwm_mediatek_chip'

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: John Crispin <blogic@openwrt.org>
Cc: Zhi Mao <zhi.mao@mediatek.com>
Cc: linux-pwm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pwm/pwm-mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index b94e0d09c300f..ab001ce55178e 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -46,6 +46,7 @@ struct pwm_mediatek_of_data {
  * @clk_main: the clock used by PWM core
  * @clk_pwms: the clock used by each PWM channel
  * @clk_freq: the fix clock frequency of legacy MIPS SoC
+ * @soc: pointer to chip's platform data
  */
 struct pwm_mediatek_chip {
 	struct pwm_chip chip;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
