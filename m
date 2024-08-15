Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CA0C52D7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Aug 2024 23:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=owfkJECpaU/TFCIUAu7JVj1qFv5CTRrdg2Hqzlw/ab8=; b=AjXPx9xxeAQu2Ekv7Q1jyo0gtY
	OBUGXFy4G1e9rdDLPx73KNE37RgJg+jNBn6KMl/Qi5NtaRhzttIqCQONSIKD8mBzTCFL05K3CX4Yy
	JKWRqyPY9dvsrSjqramyRbMzO0Dcd3U6ZZhUJs/N9sBChmQAWGv3muBZ3AZJLo+Q5WpHKVC2+iHX9
	8uZZt8y9D99VIT3CUPrdXmYKZGQ+5J34pSPeKYDed7ox4tmVskto3hha99e7m/G+620+TBI86rYgz
	Vp8yNEqVqWgLWFL2F1HYM0mADnh3RJcUhtmliaqKmgZN/RM6sirrlrE+MgRXbz5BunE3A83FAJ5qy
	6XjeyBGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sekAk-0000000BKI5-0JQi;
	Thu, 15 Aug 2024 23:46:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sekAh-0000000BKF7-0PiS
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Aug 2024 23:46:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37196681d3bso27708f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Aug 2024 16:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1723765580; x=1724370380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=owfkJECpaU/TFCIUAu7JVj1qFv5CTRrdg2Hqzlw/ab8=;
        b=kPvYO+KOQTdyFBvWba4eoHQ/qi+tpTLeCTKJkB7ceLvRDq0eaoCM4JVtR78gPhlbom
         625w3bfi0Ee6j6Dm/tZ5vtOV4ktlqCf2/Z5TLQUiHWVUtPIdCmYTjVELYWEg3X7ye6jT
         bNise66YuEQRC6GZp4xMoprLprxr5Y3upXiv3o3qMjvPxGku8HLrnCbStNWbjCVIxGS8
         KylpSya9FV2Snv0Th68FdTpQs+Ueebk6pRnDSGujCH+ES5iNVLFNYIc3gWvMFdx0KASP
         1+kWSkWpsQ1afLdIjaAr6NhJHr7fY7btd0ZKUK8LSeDsYaCSyJ8d25nT3IEfr8moh0wt
         UOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723765580; x=1724370380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owfkJECpaU/TFCIUAu7JVj1qFv5CTRrdg2Hqzlw/ab8=;
        b=FlWlFcRCjMhZa45dHnfelJGblvPcz1oL1Rax0c/n32IYx122hTPdO/vY8bxYdNxFYF
         tXTqKDL3bf0vMJZq6ca9XHhsHG+4JQijBTcXyO5k516p/KbUbmE1hy/0vwBSOKK2rqOL
         dexaLNHwW6JnJMUEfyMMXGhrldTUWjiA0yH0/o6r9LDPvnYZixpTZ4MxvSvZL8NJF8pP
         7GNC3J25TzxsrWx2+p8Y9Z05sAY0j0pmQvK4fuDIqdjrCotEl1pFTZrQTgs0ne1srGxL
         dFXjMinZ6XuYJ47YLKEcFeXNiooOAc9XF7dDQFF7lAB6NwBYGovLIRYM2Lw9A6Qy3ZSK
         ebQw==
X-Forwarded-Encrypted: i=1; AJvYcCUkD0ZvwmA65cFBcxJDTl8F84uiEk0j1IRk3SdJO0l3DHISVAlequOJk+xrvJpPAXbanMfLlkNXLbRE0QsTq6MRRTPAKYhGmKLS09HlvxOxhpja
X-Gm-Message-State: AOJu0YyUfy+uRrbq7Xe9OBzhToBuicl51lCoMKl3QpZNewD5gUtVkOOQ
	q9oBGjWu24+KIZ09f8+8wc5Zwmu0Q9hZDflkVXsv8Cfm5nSVv3IcIOpq9iiOj6I=
X-Google-Smtp-Source: AGHT+IGDOw20u2BycUtGW9QSZG1vTwRyRmCNITyrrhP1+I6Jo05H/XiNgtOc7qVePSMPxECpCzgS9Q==
X-Received: by 2002:a5d:604f:0:b0:368:5858:826e with SMTP id ffacd0b85a97d-371946c6a66mr635372f8f.59.1723765579991;
        Thu, 15 Aug 2024 16:46:19 -0700 (PDT)
Received: from debian.fritz.box. (aftr-62-216-208-163.dynamic.mnet-online.de. [62.216.208.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded180dcsm60907175e9.4.2024.08.15.16.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 16:46:19 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] mmc: mtk-sd: Improve data type in msdc_timeout_cal()
Date: Fri, 16 Aug 2024 01:46:02 +0200
Message-Id: <20240815234602.59684-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_164623_237522_46DA3BCA 
X-CRM114-Status: GOOD (  12.92  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The local variable clk_ns uses at most 32 bits and can be a u32.

Since do_div() casts the divisor to u32 anyway, changing the data type
of clk_ns to u32 also removes the following Coccinelle/coccicheck
warning reported by do_div.cocci:

  WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead

Use max_t(u32,,) to simplify the code and improve its readability.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/mmc/host/mtk-sd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index a94835b8ab93..329d7b3616b6 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -795,13 +795,13 @@ static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
 static u64 msdc_timeout_cal(struct msdc_host *host, u64 ns, u64 clks)
 {
 	struct mmc_host *mmc = mmc_from_priv(host);
-	u64 timeout, clk_ns;
-	u32 mode = 0;
+	u64 timeout;
+	u32 clk_ns, mode = 0;
 
 	if (mmc->actual_clock == 0) {
 		timeout = 0;
 	} else {
-		clk_ns  = 1000000000ULL;
+		clk_ns  = 1000000000U;
 		do_div(clk_ns, mmc->actual_clock);
 		timeout = ns + clk_ns - 1;
 		do_div(timeout, clk_ns);
@@ -831,7 +831,7 @@ static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
 
 	timeout = msdc_timeout_cal(host, ns, clks);
 	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC,
-		      (u32)(timeout > 255 ? 255 : timeout));
+		      max_t(u32, timeout, 255));
 }
 
 static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
@@ -840,7 +840,7 @@ static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
 
 	timeout = msdc_timeout_cal(host, ns, clks);
 	sdr_set_field(host->base + SDC_CFG, SDC_CFG_WRDTOC,
-		      (u32)(timeout > 8191 ? 8191 : timeout));
+		      max_t(u32, timeout, 8191));
 }
 
 static void msdc_gate_clock(struct msdc_host *host)
-- 
2.39.2


