Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23011C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:49:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD70520758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dCiNdV8M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HO7InCj5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD70520758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5VMse8tCiGPFBsoXhy95/VAdu2/VPcFqpldHQw1vW0=; b=dCiNdV8MZFWH26K/0WgKeAVLLu
	rEZErb9pFTF+H0/GPSiLxtMOX+O8m8OqSO6HG3ojmTr+obPJzLRspkf21T6t17okqTqib3tXd3CQl
	aP5kVG0FPawvu8p5nBEXvLx5pPSPQqE7/LmQQzeS66k3/3qPf1q9cxzkfYIQVpb2kZY2KdvCzhhwI
	HobQFrvarHls9WMlEi49Rer/E6KS3tkE5tA3lNcNrOaHDTWuQ6WeBKoQpzyDgxIBbZuzctWqDAXdf
	0qexKf+xl5JBb1ek5yPpltBE8cpZPWakY7akx7yd7lUznUIJ+9KlgQ5sAU5CXlvXDjBUyo3Bd9I00
	kOMDubAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7chm-0001yL-5g; Mon, 17 Aug 2020 10:49:30 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7chB-0001bf-SN; Mon, 17 Aug 2020 10:48:54 +0000
Received: by mail-pf1-x444.google.com with SMTP id u20so8045934pfn.0;
 Mon, 17 Aug 2020 03:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t5bxP7SBsyG/FaxnJHfQjTjpWsNLjhkZMYmiwNpRv5E=;
 b=HO7InCj5DyHxtQgmb+1KB7+pIlkzUgKfEmsbL0H0SYyo5af3rPrGCpvNyoqeBQ5r8I
 HybpsHuOOJjfzI2HxXoypVGpBcIeuO7SsnhNX1mLlDhCHIlCPMca2sBS7kfJ1+5lkWTL
 GZ5klR6KBdfbj+LkssigwXNmTTUo8ny+UTvblxIeKQwwBn9pmoJc8IBmb8VPROIuJHw+
 KR4ssvdt15UtIuQsP+CU6LWmYAVtLD19UU/ZUrtMXoE0yrDX/Vy4lfSGSRrVKKddt90N
 YlHRv//ef4GBmYcqVAwhetNxRuOly5BWordloaAq2FLxTfrdQZH4viOp/FRzJM6Jr38T
 ntsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t5bxP7SBsyG/FaxnJHfQjTjpWsNLjhkZMYmiwNpRv5E=;
 b=K+1gNOu6PaUkYclmfm38qPr96vVTvrE7vKRCYrlPgPzZL5rpJuiM71aPYvj8Xth7Jl
 SQ9L4o5WRY9g29WS+ZaZcn/oqp7BRCIAu4VFj9qZutVriTGlRtm1zjhsupThdYHayGKP
 KDbENAd5GNdso5ebNcFNBZ8e9WQkrbL16d5Rr2b8ZAo1+QVmeTqg5txuI/EY/1Smhf00
 Wf8WK4u0SP7CmOfxpNiPTCRIKcKO+2HM8I3FSz8PFCe8WSnbYqa6eU+/Bfhw2RES4bGI
 00VI4mw+N2KM5S8+1kO5ppLphSwOj23vnEj97C/X9IGkAIxb30jdgawHJ6r2a69KaV7w
 P/hA==
X-Gm-Message-State: AOAM532uBru1Wx8e5bXvVLCLtXKSyoEhpr12ppJa1Nw8QidDidCc081s
 6chmCdRSF4ya7naFnYnht9M=
X-Google-Smtp-Source: ABdhPJxvjPog/zcs2IZsuzELFP8q8eDDcmQE5AoBcs21M2OG72EoIcTBtviVCIpusOnygDIeHNgGFw==
X-Received: by 2002:a63:4450:: with SMTP id t16mr9468564pgk.3.1597661332106;
 Mon, 17 Aug 2020 03:48:52 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:577:c217:67e6:a40c:a3bf:1945])
 by smtp.gmail.com with ESMTPSA id k12sm16976528pjp.38.2020.08.17.03.48.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Aug 2020 03:48:51 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v4 4/9] mfd: mt6360: Combine mt6360 pmic/ldo resources into
 mt6360 regulator resources
Date: Mon, 17 Aug 2020 18:47:52 +0800
Message-Id: <1597661277-27862-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_064854_040835_5B3FC784 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Combine mt6360 pmic/ldo resources into mt6360 regulator resources
to simplify the similar resources object.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 692e47b..5119e51 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -265,7 +265,7 @@ static const struct resource mt6360_led_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_FLED1_STRB_TO_EVT, "fled1_strb_to_evt"),
 };
 
-static const struct resource mt6360_pmic_resources[] = {
+static const struct resource mt6360_regulator_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_PGB_EVT, "buck1_pgb_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_OC_EVT, "buck1_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_OV_EVT, "buck1_ov_evt"),
@@ -278,9 +278,6 @@ static const struct resource mt6360_pmic_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_OC_EVT, "ldo7_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO6_PGB_EVT, "ldo6_pgb_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_PGB_EVT, "ldo7_pgb_evt"),
-};
-
-static const struct resource mt6360_ldo_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO1_OC_EVT, "ldo1_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO2_OC_EVT, "ldo2_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO3_OC_EVT, "ldo3_oc_evt"),
@@ -298,10 +295,8 @@ static const struct mfd_cell mt6360_devs[] = {
 		    NULL, 0, 0, "mediatek,mt6360-chg"),
 	OF_MFD_CELL("mt6360-led", mt6360_led_resources,
 		    NULL, 0, 0, "mediatek,mt6360-led"),
-	OF_MFD_CELL("mt6360-pmic", mt6360_pmic_resources,
-		    NULL, 0, 0, "mediatek,mt6360-pmic"),
-	OF_MFD_CELL("mt6360-ldo", mt6360_ldo_resources,
-		    NULL, 0, 0, "mediatek,mt6360-ldo"),
+	OF_MFD_CELL("mt6360-regulator", mt6360_regulator_resources,
+		    NULL, 0, 0, "mediatek,mt6360-regulator"),
 	OF_MFD_CELL("mt6360-tcpc", NULL,
 		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
