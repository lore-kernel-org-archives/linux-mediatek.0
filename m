Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01195C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:10:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C78720735
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:10:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zt3LUNr6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BicWgc2s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C78720735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHKeaDWks8MBcTth5IDGD7cJvFMo30p5CDf31QPdDp0=; b=zt3LUNr6n3DPIevGyhMbAYDIqC
	nLn2rxJNReeIxtDyNtLX/omJdnBgP9SbGHYpn/FsCXPyUdG1EjpX6u1fh9p328vcP/7Q/Fi7UAGNc
	XTnK6Y5uk3VOqZXshr2fexTFvGlFh9hIOb1nmKVojvbSCPOGs3zB09HKDIN0DBPBKE6kSqeTQu5jC
	edKb8bM4+r5vnMByLHMcIZEbrQkYQBpsAVlJJSk+WegW6GFhpMVu9pcW1JJNxMGsw+HuzIFPkm3se
	pIFFVzEe2tilBzwEBdAPN3aiu8KGdsNvB/Z+2UrmmKSm7rzeJB93ZMZ0e03LbtIUaHvy3o8dMFI5s
	mOAXZxFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kayxb-00015b-Ap; Fri, 06 Nov 2020 10:27:11 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaywe-0000Sn-VI; Fri, 06 Nov 2020 10:26:14 +0000
Received: by mail-pg1-x532.google.com with SMTP id t14so615391pgg.1;
 Fri, 06 Nov 2020 02:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sie6Ok4mlr9HWDpV1MC03OrgT3qnjwcXYjtFoY6fZME=;
 b=BicWgc2skITP6pCnRp+XYsBk/xqMSnzp7eK/v1Lu8Ftv82GrJTw3f8yEN0u/AdQw3C
 M37EzjjnJL425kb1Qhdmh5+ToMRA+C6EeOzRUd1hBN3JwJptJMyWHkYzE9Ushr50TLPB
 i41g7xbhZBlOFKiUFoqTmkdydxxHJ7+1+R+4SbBtR5boQnr00JdwCMulxASZC2xjdxGH
 wSMhJdWgQnEBJeJuAjrRDQH0faPd+NiOUMNSWIEeK0t0GKiLINpdvxGgXGLa/ZB3RxO5
 lnyMHgp+9uR8YT4LWCbXkpyexMezOm+VbbqiQjtllMNvkDXhbHClP7Pd53K2gS2zJzSM
 wPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sie6Ok4mlr9HWDpV1MC03OrgT3qnjwcXYjtFoY6fZME=;
 b=YCpIYzq2BZtq1W2M+UwZSNsihUJe5SosVNa4qhHsa+bg3gyQ+vBdTwL1yzt48rdeLY
 l7V7ZfHG1iE69rTYytd57R0pd9OnNIVDkaodDNRd6a1VOqmuVkmqRVPjf53kOp8P2Rnp
 fw0q9mglTkzZnLRzN14IfmYKckJwp9Vcrnay6Q6t9Gt/IQq4oR0co4J5Y+99ijeuXFZ1
 zopLeiyOMsos6q4i6jc0qD3UeEy5jMwyEqAUgG17qw9CswjSLLbDfTInw2s6n4uQI6Wm
 oSKj7KO+3P1w1wAqFVkf9vRgOl0GFYhjLR35zDayoyPThxzJqjrz9h+PhwdIVHqPKGfj
 5F0g==
X-Gm-Message-State: AOAM532b8zm+01wktLq+clUGw0DGtVW8zlbnnj9Rne69MKlx3uC+ZJnq
 lxgABFR4+KqQr6OeN0FzFqQ=
X-Google-Smtp-Source: ABdhPJxPb7Om9zddm/hHGndM/SdO0Qc71uSJYj8yWOvW/RYvx4INQsCpmbc3l5/cR5K5ejAGsNNyzA==
X-Received: by 2002:a17:90a:fa93:: with SMTP id
 cu19mr1854974pjb.117.1604658370559; 
 Fri, 06 Nov 2020 02:26:10 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:6823:8ab3:4b5d:4c53:f39b])
 by smtp.gmail.com with ESMTPSA id g3sm1260633pgl.55.2020.11.06.02.26.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 02:26:10 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v6 07/11] mfd: mt6360: Remove handle_post_irq callback function
Date: Fri,  6 Nov 2020 17:53:48 +0800
Message-Id: <1604656432-10215-8-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_052613_115080_CEC14853 
X-CRM114-Status: GOOD (  17.44  )
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

Remove handle_post_irq which is used to retrigger IRQ.
Set IRQ level low trigger in dtsi to keep IRQ always be handled.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c  | 17 ++++-------------
 include/linux/mfd/mt6360.h |  2 +-
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index f75122b..2356d99 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -208,15 +208,8 @@ static const struct regmap_irq mt6360_irqs[] =  {
 	REGMAP_IRQ_REG_LINE(MT6360_LDO7_PGB_EVT, 8),
 };
 
-static int mt6360_pmu_handle_post_irq(void *irq_drv_data)
-{
-	struct mt6360_ddata *ddata = irq_drv_data;
-
-	return regmap_update_bits(ddata->regmap,
-		MT6360_PMU_IRQ_SET, MT6360_IRQ_RETRIG, MT6360_IRQ_RETRIG);
-}
-
-static struct regmap_irq_chip mt6360_irq_chip = {
+static const struct regmap_irq_chip mt6360_irq_chip = {
+	.name = "mt6360_irqs",
 	.irqs = mt6360_irqs,
 	.num_irqs = ARRAY_SIZE(mt6360_irqs),
 	.num_regs = MT6360_PMU_IRQ_REGNUM,
@@ -225,7 +218,6 @@ static struct regmap_irq_chip mt6360_irq_chip = {
 	.ack_base = MT6360_PMU_CHG_IRQ1,
 	.init_ack_masked = true,
 	.use_ack = true,
-	.handle_post_irq = mt6360_pmu_handle_post_irq,
 };
 
 static const struct regmap_config mt6360_pmu_regmap_config = {
@@ -339,10 +331,9 @@ static int mt6360_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	mt6360_irq_chip.irq_drv_data = ddata;
 	ret = devm_regmap_add_irq_chip(&client->dev, ddata->regmap, client->irq,
-				       IRQF_TRIGGER_FALLING, 0,
-				       &mt6360_irq_chip, &ddata->irq_data);
+				       0, 0, &mt6360_irq_chip,
+				       &ddata->irq_data);
 	if (ret) {
 		dev_err(&client->dev, "Failed to add Regmap IRQ Chip\n");
 		return ret;
diff --git a/include/linux/mfd/mt6360.h b/include/linux/mfd/mt6360.h
index 81bca7c..ef8257d 100644
--- a/include/linux/mfd/mt6360.h
+++ b/include/linux/mfd/mt6360.h
@@ -230,7 +230,7 @@ struct mt6360_ddata {
 #define MT6360_PMU_MAXREG			MT6360_PMU_LDO_MASK2
 
 /* MT6360_PMU_IRQ_SET */
-#define MT6360_PMU_IRQ_REGNUM	(MT6360_PMU_LDO_IRQ2 - MT6360_PMU_CHG_IRQ1 + 1)
+#define MT6360_PMU_IRQ_REGNUM	16
 #define MT6360_IRQ_RETRIG	BIT(2)
 
 #define CHIP_VEN_MASK				0xF0
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
