Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2CAC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:41:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46BAB20674
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:41:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="opnFSFUL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czMr9crA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46BAB20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgNKfCh0P/w92GnUOabKezTq9zB31tOHgvqc5WVt5Mo=; b=opnFSFULvYC/HaBLUw62UzJ24z
	RevGj+da85qyuh7CZ1VG/NL5AzhgEcbqda/HPG1h7lqmGoJUJhrvUWTna6F/B7s7HuOIjSu1AIhGo
	P/j8kROR0OQwHcWnpoZfOZTvHyIi3ery4hQbp/sbIo1HqYDx2y8+6blxBf+eQEp08Uge4OV7DsHP1
	WBnZvV1DVpvla57mIdTBJrWEpx9CK4kxYifExrXTkcSmRMiW1gZOb93GhJfcRDTGhzq3UIDmoI+r7
	YQ8g7V5TODaeqDNLn2/lsCmnBWeA77yDYExqpwF/vYhDqCi7RInPA8WnQozOgOkhOeFCMcSYddky4
	Kc4wk0CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdA2N-0004n7-KK; Thu, 12 Nov 2020 10:41:07 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdA1a-0004Rt-3v; Thu, 12 Nov 2020 10:40:20 +0000
Received: by mail-pl1-x643.google.com with SMTP id j5so2566585plk.7;
 Thu, 12 Nov 2020 02:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Joo9G8dpZiV+ukJjlPwDuzRh/fKHk3sZ/ezTEfq1J4w=;
 b=czMr9crAC8WMcP2/QbgsRI+K4Ts4D3inkQI5zWQNVM/JK1i7wEy6hXYfg0Wz2Ml3S5
 ldH+6yEjqD50Cb10R8EAc2IpU72fzEyMJyRWEfFZ3GG/KueZ/Wln3t578DdoSY2a8XfB
 qjggAiEffdKX8w/msTfORYXhndxrUSYlHvDbq+3TJIO8x3WAdhq7tZfY/kCSgw+IuomT
 RqGLHhlM8GKCtGAMzka+PCORAAOMhomQ8FV/ZdokA9FuhWxGfxaF+2EP6W2V/BDEpx6i
 Vp1juQRPo1OzoCXUdg+HdhfjjeeGHbgT0GAfn4GcilneuTvhCEX8CeWuske+jdqQBU5a
 uwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Joo9G8dpZiV+ukJjlPwDuzRh/fKHk3sZ/ezTEfq1J4w=;
 b=HnaX3b6WFELhpiwgNV9wx9pNEtj9qEusMNgOJJOvjWBAiPFHtLF06YJWNIznRd0eUK
 R3dgJ2ZOH0ZMyUYvOqr2n2pA3G8vKU5PBph5JdtfZ5DT375MO4p+eJ63RU7Gy/4m/WT0
 j+RVvidovw/dlQNSrcGayWEk5Zu7xa/06zxetVsjnI19IkL5sfzmbzchwkmOlBstzVGj
 NG0cDMXouzFOmHzGqlthr9ZIKI+lDxumERbGc4TNoL2gw3SenI+MdjKc+bPNWJ5Ni96i
 c/UQDjqZBORLwGFloguNFSxDploJONvyOu8w1CAKaPL2t0BxCKneVOmaCccZSLuF6C/w
 XeEg==
X-Gm-Message-State: AOAM533vcz8z3RP7ro2xiBTN/tQdG0fv/zlQteQIuPKBBa1r6/jQ9Qwi
 svFNoTWyI6O5365INEAaR5o=
X-Google-Smtp-Source: ABdhPJyXWp7+YEx8zS4eMR0ZOG+1ERxpsJYGed4QYsgO5CG7iquGGk9Mr+y2+wPghWzKIRq9hmd4dg==
X-Received: by 2002:a17:902:c254:b029:d6:ac10:6d50 with SMTP id
 20-20020a170902c254b02900d6ac106d50mr26694127plg.48.1605177615949; 
 Thu, 12 Nov 2020 02:40:15 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:47a:a27:cf8e:7817:51df:a883])
 by smtp.gmail.com with ESMTPSA id
 mp16sm6414094pjb.13.2020.11.12.02.40.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 02:40:15 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v7 03/11] mfd: mt6360: Indicate sub-dev compatible name by
 using "-"
Date: Thu, 12 Nov 2020 18:39:50 +0800
Message-Id: <1605177598-23501-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_054018_286242_A5E96D4E 
X-CRM114-Status: GOOD (  12.48  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Indicate sub-dev compatible name by using "-".

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index befee70..692e47b 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -292,18 +292,18 @@ static const struct resource mt6360_ldo_resources[] = {
 };
 
 static const struct mfd_cell mt6360_devs[] = {
-	OF_MFD_CELL("mt6360_adc", mt6360_adc_resources,
-		    NULL, 0, 0, "mediatek,mt6360_adc"),
-	OF_MFD_CELL("mt6360_chg", mt6360_chg_resources,
-		    NULL, 0, 0, "mediatek,mt6360_chg"),
-	OF_MFD_CELL("mt6360_led", mt6360_led_resources,
-		    NULL, 0, 0, "mediatek,mt6360_led"),
-	OF_MFD_CELL("mt6360_pmic", mt6360_pmic_resources,
-		    NULL, 0, 0, "mediatek,mt6360_pmic"),
-	OF_MFD_CELL("mt6360_ldo", mt6360_ldo_resources,
-		    NULL, 0, 0, "mediatek,mt6360_ldo"),
-	OF_MFD_CELL("mt6360_tcpc", NULL,
-		    NULL, 0, 0, "mediatek,mt6360_tcpc"),
+	OF_MFD_CELL("mt6360-adc", mt6360_adc_resources,
+		    NULL, 0, 0, "mediatek,mt6360-adc"),
+	OF_MFD_CELL("mt6360-chg", mt6360_chg_resources,
+		    NULL, 0, 0, "mediatek,mt6360-chg"),
+	OF_MFD_CELL("mt6360-led", mt6360_led_resources,
+		    NULL, 0, 0, "mediatek,mt6360-led"),
+	OF_MFD_CELL("mt6360-pmic", mt6360_pmic_resources,
+		    NULL, 0, 0, "mediatek,mt6360-pmic"),
+	OF_MFD_CELL("mt6360-ldo", mt6360_ldo_resources,
+		    NULL, 0, 0, "mediatek,mt6360-ldo"),
+	OF_MFD_CELL("mt6360-tcpc", NULL,
+		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
 
 static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
