Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E579C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 10:32:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E4E8206B6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 10:32:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j63c3Ro/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="El9To4oT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E4E8206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxUxac1RPl6u1JBM6FfVNlmFdLVgJ+i/W55XIj3B0Ok=; b=j63c3Ro/W8uHfxjxUKmy3fIZS0
	0jgPrZ1aLxFBHNf5dYWIi0uIvw60jeSZ5vRV50pzztQzDsMKUMAVItc52OLZCjRScVrqraRDKPJvn
	ZYNUP0qRrnnxHTh1llUKzKbp9GB2gqwobZNB4HmfAvMy8APjAGKBSK4fgOjJ6zUIdiYNzcDX81zSK
	LNPkc77GaiIfEmfiZsAmEwz6RVWX2J506x7QPxg3CmJ4eLg35Ka21SPEBSeYFqXMiPG8+XxFsDWwV
	Nl7EhxPx0SL/g0uVp5QWbMZPz+T5T9A/CPE/y9XxTE/ywvvtuTJ1AZc1DYsBbQioGsZ7rnBspJKCZ
	injrGRTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsktH-0003Q0-FP; Tue, 07 Jul 2020 10:31:55 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsksv-0003G5-Jl; Tue, 07 Jul 2020 10:31:35 +0000
Received: by mail-pl1-x643.google.com with SMTP id x11so16579553plo.7;
 Tue, 07 Jul 2020 03:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pxv+3HGXjyEd1PWFcHfkuckp8xQI63ps2NNvxzmKA3Y=;
 b=El9To4oTyvG9A2WMjAE6sJhWDuOjrE6Mnm+wiLdbJPwhysQdeiW+uZjoxNCtO7GlzC
 NyVYdVanVNbOIF9921gHq5ZFDBkDT/HsTnhYQpSL/ZjgUoG1lMF89TUkQqqk/zDVxtEB
 sjPLnEVihUJPq2g/nN/3lnIZQCuBZZxmNDuFAq5W8L59H8JcU92pawMCGk+DUP4bZkEA
 LOqzU3AVe4+wdCa/EUOTEVhLrYyGTaMXxUyJeSePytGwTr1BYEZGG1t0U7AiczJBZlXW
 ZGy91Kf86KWw2KlHa98Yw4zG00+vNGJsT/sWPS/S3ahhsGoifEV8Y4S30YyHq/QAFLbA
 3TWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pxv+3HGXjyEd1PWFcHfkuckp8xQI63ps2NNvxzmKA3Y=;
 b=S3o7XaSSv6zpoMqW1Y0d+fYbxldVXY8ndgIaNTXk8F34L5dgchiBy3q9JySCSvhksv
 Yeg1+bpv8VHouMQoipZWjm0HCOAvq01umq5tJuHkW5P4rGHT41JpCI7OZZLtgvgGCFau
 BAFH8N6sEljsHGG48yWcYbiLd4VmOe+9fYfDNPNw0mtmRt1UcL0F4vx2DLCx+1jYsx2P
 x4dqcn1/HcY1bprNq+PolGaOvXnj8fRqJP2Nroydc5ExqjM+1zXLaNPExM6nfV5TRsmC
 IxSQo9RU4s9Q+EeltF6S3U5KLmGrS62URkqNr29cb0BR+iwJMgw7l/bDEyU/ak+3XeWE
 lTJQ==
X-Gm-Message-State: AOAM531ooI23l7lQhVcXRyiJo9OsXi5EqmgyXjCUPQvAT0rENW1lerWz
 QAeitEtGBlpl90dDn66NXhA=
X-Google-Smtp-Source: ABdhPJz0QpDL9bmryLcPNuvptoOiEywLclN6HSp8WKJzfOQzCVRPaQ8T62aScsd21yV6M7kkDmivLw==
X-Received: by 2002:a17:90a:cc0f:: with SMTP id
 b15mr3640923pju.83.1594117890879; 
 Tue, 07 Jul 2020 03:31:30 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:549:1a30:cc80:8285:be58:d37a])
 by smtp.gmail.com with ESMTPSA id io3sm2159014pjb.22.2020.07.07.03.31.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Jul 2020 03:31:30 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH 3/4] mfd: mt6360: Fix flow which is used to check ic exist
Date: Tue,  7 Jul 2020 18:30:55 +0800
Message-Id: <1594117856-14343-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594117856-14343-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1594117856-14343-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_063133_781871_E56E1609 
X-CRM114-Status: GOOD (  16.54  )
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

Fix flow which is used to check ic exist

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c  | 28 +++++++++++++++++++---------
 include/linux/mfd/mt6360.h |  8 ++++----
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 2dd5918..4bb2949 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -293,6 +293,23 @@ static const struct mfd_cell mt6360_devs[] = {
 		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
 
+static int mt6360_check_vendor_info(struct mt6360_data *data)
+{
+	u32 info;
+	int ret;
+
+	ret = regmap_read(data->regmap, MT6360_REG_PMU_DEVINFO, &info);
+	if (ret < 0)
+		return ret;
+
+	if ((info & MT6360_CHIPVEN_MASK) != MT6360_CHIPVEN_VAL)
+		return -ENODEV;
+
+	data->chip_rev = info & MT6360_CHIPREV_MASK;
+
+	return 0;
+}
+
 static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
 	MT6360_PMU_SLAVEID,
 	MT6360_PMIC_SLAVEID,
@@ -303,7 +320,6 @@ static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
 static int mt6360_probe(struct i2c_client *client)
 {
 	struct mt6360_data *data;
-	unsigned int reg_data;
 	int i, ret;
 
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
@@ -319,16 +335,10 @@ static int mt6360_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 	}
 
-	ret = regmap_read(data->regmap, MT6360_PMU_DEV_INFO, &reg_data);
+	ret = mt6360_check_vendor_info(data);
 	if (ret) {
-		dev_err(&client->dev, "Device not found\n");
-		return ret;
-	}
-
-	data->chip_rev = reg_data & CHIP_REV_MASK;
-	if (data->chip_rev != CHIP_VEN_MT6360) {
 		dev_err(&client->dev, "Device not supported\n");
-		return -ENODEV;
+		return ret;
 	}
 
 	ret = devm_regmap_add_irq_chip(&client->dev, data->regmap, client->irq,
diff --git a/include/linux/mfd/mt6360.h b/include/linux/mfd/mt6360.h
index 9fc6718..5ec0f5d 100644
--- a/include/linux/mfd/mt6360.h
+++ b/include/linux/mfd/mt6360.h
@@ -30,7 +30,7 @@ struct mt6360_data {
 };
 
 /* PMU register defininition */
-#define MT6360_PMU_DEV_INFO			(0x00)
+#define MT6360_REG_PMU_DEVINFO			(0x00)
 #define MT6360_PMU_CORE_CTRL1			(0x01)
 #define MT6360_PMU_RST1				(0x02)
 #define MT6360_PMU_CRCEN			(0x03)
@@ -233,8 +233,8 @@ struct mt6360_data {
 #define MT6360_IRQ_REGNUM	16
 #define MT6360_IRQ_RETRIG	BIT(2)
 
-#define CHIP_VEN_MASK				(0xF0)
-#define CHIP_VEN_MT6360				(0x50)
-#define CHIP_REV_MASK				(0x0F)
+#define MT6360_CHIPVEN_MASK			(0xF0)
+#define MT6360_CHIPVEN_VAL			(0x50)
+#define MT6360_CHIPREV_MASK			(0x0F)
 
 #endif /* __MT6360_H__ */
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
