Return-Path: <SRS0=UOtS=CP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D06C433E2
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 18:10:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5291720639
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 18:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dqcglx/6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NEj8UwN8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5291720639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5Uv4KA+LE8ApEmK7bPgvWe7OKDhxXZ3Z0IkUQPzXEbA=; b=Dqcglx/6E4MNb20yytAT5K4Sn
	yV1je98frbMPeQup/Rts9JTohhU2dr3MEN6adsU2WdoOIugZ/jsUttaraZcUUMPFxP/cKPCMYIHki
	IOxb+e3XZ9J8W9Gs5kfgU0zBtBQMwqqE/gG60AZjPCMmRbHcYddCA0Q6WBcQrIEun6jtNbdFTvEYu
	2CBAwkm/lQqPcbhTN8daPmksNqSmdi+z8BJBkvY73q4Mujjx7oljAbiISMgNYJsUp5eF9kO2O3bxj
	8GpjzXPcm2Koi88ZbMA2VU4kSyerQPCm6NcseanFZcwiiPqWE0Sr2H+KNMg4V4JJRy7rGAIk82QrD
	V3YxcqNWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEz6y-0007ZZ-Ff; Sun, 06 Sep 2020 18:09:56 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEz6t-0007Y6-2f
 for linux-mediatek@lists.infradead.org; Sun, 06 Sep 2020 18:09:51 +0000
Received: by mail-wm1-x343.google.com with SMTP id o21so11479606wmc.0
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Sep 2020 11:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kumt6xPsCDUuNyx6USsuuQtWS1PyP3Rmwiip0oO6sZA=;
 b=NEj8UwN8yasyL4TZ1RQ6+S5zY6HtOe3KksHAaj1N4LVkekAMp2+cXNNujH7LCX4PhY
 olauxi2xPneYW/ZDDVpBuMw98JfGBx7sVYFtUBYTj2hmkiGRz308vh+sq0+AxdyaSy9U
 /CHl1bg25LdFRzU43OyCvAnHbes89mnUtpKzJv84Zi7g4TtRcu5dU0phMSLef/9lexMn
 hVMxfI6zYcDNWXZX1mpT8hxGMOvfBwQa5MwQu+WWra3jrGXHAWh6fIPMIyRUXfxpVduA
 ZaWtDtJyjRehtSqemZEbXwnA7ziVAQ4P09YgeiPkFrPfIWplDMG85yf4KGFfbgC/V0Mx
 vs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kumt6xPsCDUuNyx6USsuuQtWS1PyP3Rmwiip0oO6sZA=;
 b=gyfGT1lZRKDri0gZEOkRe9OscpaMlY8SUm6bl8ybZJsswVjOm91PS3Rvq1MbJeBKk2
 NfzKqV2mF0Umyt0gfFEKzSg5mZz/ptvsBFv4x4CiC31RtUb6f2h5KDjPw78C1c3tPO0V
 RAShA8BsY82BYYczqBV7NO6PLlA+49uzDwuVz5ouNMXzrNmI861//QR+p7s0Kz80z9++
 HI779pYg2K8Td6txXogZl7zabDszmFEcOWRNphCqfSLC2bwT3sFWJJLN0PMROsJv1FYA
 1g7FGQSuVk+FVsGDviYlCEHI2VXgL3adkQRTmF5eNGf5DOrhVTslHwqcktIwBWFKWcYW
 vcgg==
X-Gm-Message-State: AOAM531BSSrefBpyPe3YdsD6yiV0oOxEbRVkeF0f/07+jC6vf1np59cs
 wpv8d7oL/Q1Z+Y0GAAbr0s5W8FuiJBbtGQ==
X-Google-Smtp-Source: ABdhPJw+Umfe+hF29nj4Wke2ReLCF+37Go/9KRaICoq/knhxVIsJkqpp5l7hb+oG6GtpEn0t9Zal9A==
X-Received: by 2002:a1c:9c0b:: with SMTP id f11mr16769412wme.0.1599415789890; 
 Sun, 06 Sep 2020 11:09:49 -0700 (PDT)
Received: from localhost.localdomain (208.19.23.93.rev.sfr.net. [93.23.19.208])
 by smtp.gmail.com with ESMTPSA id s11sm24593937wrt.43.2020.09.06.11.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 11:09:49 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] memory: mtk-smi: add support for MT8167
Date: Sun,  6 Sep 2020 20:09:38 +0200
Message-Id: <20200906180938.1117526-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200906180938.1117526-1-fparent@baylibre.com>
References: <20200906180938.1117526-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_140951_129616_5A8BE9F6 
X-CRM114-Status: GOOD (  13.66  )
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
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 robh+dt@kernel.org, krzk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for the SMI IP on MT8167

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/memory/mtk-smi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index c21262502581..691e4c344cf8 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -19,6 +19,9 @@
 /* mt8173 */
 #define SMI_LARB_MMU_EN		0xf00
 
+/* mt8167 */
+#define MT8167_SMI_LARB_MMU_EN	0xfc0
+
 /* mt2701 */
 #define REG_SMI_SECUR_CON_BASE		0x5c0
 
@@ -179,6 +182,13 @@ static void mtk_smi_larb_config_port_mt8173(struct device *dev)
 	writel(*larb->mmu, larb->base + SMI_LARB_MMU_EN);
 }
 
+static void mtk_smi_larb_config_port_mt8167(struct device *dev)
+{
+	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
+
+	writel(*larb->mmu, larb->base + MT8167_SMI_LARB_MMU_EN);
+}
+
 static void mtk_smi_larb_config_port_gen1(struct device *dev)
 {
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
@@ -226,6 +236,11 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8173 = {
 	.config_port = mtk_smi_larb_config_port_mt8173,
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8167 = {
+	/* mt8167 do not need the port in larb */
+	.config_port = mtk_smi_larb_config_port_mt8167,
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt2701 = {
 	.port_in_larb = {
 		LARB0_PORT_OFFSET, LARB1_PORT_OFFSET,
@@ -254,6 +269,10 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
 };
 
 static const struct of_device_id mtk_smi_larb_of_ids[] = {
+	{
+		.compatible = "mediatek,mt8167-smi-larb",
+		.data = &mtk_smi_larb_mt8167
+	},
 	{
 		.compatible = "mediatek,mt8173-smi-larb",
 		.data = &mtk_smi_larb_mt8173
@@ -418,6 +437,10 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 		.compatible = "mediatek,mt8173-smi-common",
 		.data = &mtk_smi_common_gen2,
 	},
+	{
+		.compatible = "mediatek,mt8167-smi-common",
+		.data = &mtk_smi_common_gen2,
+	},
 	{
 		.compatible = "mediatek,mt2701-smi-common",
 		.data = &mtk_smi_common_gen1,
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
