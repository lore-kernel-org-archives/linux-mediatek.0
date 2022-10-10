Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D2BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZ4L3eGmqKYAclKSwyEel3UxVWUej6QJpYaCconox5E=; b=PWxd8P3L3AGBdSauMRRhCZsUEe
	D0H0ZmpKhxuLMoCaoR4UHl3HSCAQ0Oa4+iKvttSmBfwUErTt3VAqr4KzYRm/suWFHXnXTZC1+fc45
	impeZtzxgQDiBHqopQPoevWy39J9ZHjnvymaXPQjlDMdl06RCdlX8mXSqsGKU+btD+rpnBOE9B70I
	uDkkemq/xJRhz+Tq4t2hTc9gBvqPFIqs29pQmqGQEIdpElL3UUse2d217IOaVPbncOagn9K7IwxOu
	3KnF9CFaF/IQeZ/qJArB+pRV77uZ+ZJGukzMLaAmSa/vTCZ6D5ke8OYEbqb8jR6IxvJ81hFe6nxkC
	cPWuqQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsJ8-000trp-Lm; Mon, 10 Oct 2022 12:54:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsIX-000tZ8-Qx
	for linux-mediatek@lists.infradead.org; Mon, 10 Oct 2022 12:54:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id b4so16925674wrs.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Oct 2022 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZ4L3eGmqKYAclKSwyEel3UxVWUej6QJpYaCconox5E=;
        b=rgdAIwlkpvnub0RaiX4fefvk5wCulG8vp0BP+WcJrCUzbBspaWp2GtmBMF2ij7UeLB
         Vp5SkCMp1ZSqvsLBcT4POcX4auHkHhOq7FB0ywft1Pa/l7hKPZ+xAzRMLY6gPjWTVmA8
         xg6qQ+G78hQntai3/+GlX8xjMlTDLggQNzZLhq/MikBC1eNglLYCGniTx9YWcfTmpEMI
         BnWGwWk0ysejp7Jm80d3IzfhR6Sa65sJSw+Ed18KeOvxIf+WX0CQS4j0RsvYxNFruZXH
         IrLWWQz5qw+moFKHLqvUzIyQ636wdqjcZ/l4qvx0+BS5yg6A1E/UbL96D6wQaMYh7aSC
         CN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZ4L3eGmqKYAclKSwyEel3UxVWUej6QJpYaCconox5E=;
        b=QGrFH0Gyq8qPaFQJZZMOpUhXGs/55aixQW1BUOXg9jlPs9FV4ci6i+tj6QPYCpr8Sm
         lMY1I2iwssfHMDQueMUIC/XdACNY3WZSmJvdmA0PQWg6G3SC0VeBbEgCCtkmWliup5RY
         nhDTcKU+3fC4/47BfXB3fBc/HjHoP5s9McB5ePf7cClRwVGtIPbo7zNKVf54OyDxz3P+
         N8Cz3p6gHZ5mp4wF/woITJblon7f6MbOcu86tNchvQU/xYQRtXfnW66MCJ1CH/kAMJYC
         GVN6Dpp1yeLUyzFriOPlXEliE++fyBwRuEcVOtpXOIeS/+H1W4KPx7r4c1MrDPtcvW2T
         Ydaw==
X-Gm-Message-State: ACrzQf3PP/8qf/Rcek/GNwhObrhvdC7fZDf0eYhZv4Kvir67lGbUhNPd
	SOBaR7soRK1j7mFZpM95o+b9AA==
X-Google-Smtp-Source: AMsMyM6jeFIQqxlWum39mAdlhTnkevmmnxlbs7XGdKPUqz8uSEIoAoVBL7h0xE0OUAXWWR6OqM8iUQ==
X-Received: by 2002:a5d:674f:0:b0:22e:3d59:cf0f with SMTP id l15-20020a5d674f000000b0022e3d59cf0fmr11451686wrw.304.1665406459794;
        Mon, 10 Oct 2022 05:54:19 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id v24-20020a1cf718000000b003a6125562e1sm9767020wmh.46.2022.10.10.05.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 05:54:19 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 10 Oct 2022 14:54:09 +0200
Subject: [PATCH v3 3/3] iommu/mediatek: add support for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221001-iommu-support-v3-3-c7b3059b0d16@baylibre.com>
References: <20221001-iommu-support-v3-0-c7b3059b0d16@baylibre.com>
In-Reply-To: <20221001-iommu-support-v3-0-c7b3059b0d16@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: iommu@lists.linux.dev, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Fabien Parent <fparent@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1965; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=cCyHI5RY2bhm2xuqZZiDh/1knZLz2wwqAtcDhxPnQwM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjRBX2YK800J3vnj2EsuGIXwS9BVe1DVrvkohAErig
 dhZktjuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY0QV9gAKCRArRkmdfjHURe/sEA
 CqnQVlGZAtTO0mYLapEecmZMAnuNd/teKEJA8sNJsOZRnbBG0YUkf6TAt8LhIl+iuHeAM2CKth1FHx
 CJ1Zq4fdOAHjzYHc4z2qtkH0lhTGqqFv5xqz6NLWf8w8/MzplFOiyTlSAPJY7Ombcs6ZCoZiF4fSOh
 7NfKlgQbESF62kYa1+JVBHZCnFljcMVtJpDL+BrtJd+ec9G+tU0sg1O/ojEyr1NgmJI3c41HVBIm06
 MG6HmMXV0m2uCkj+bxbbhN4qrAaX/ZkmC5YKk349IxlG9/Rp2F4jpl0FD3HRC7WUCH2lhvFSKNLROj
 7uVkGx5NeZv2/xjKLaoJzUfy4ylMkNxaJDSXI5TLFwl0R/DbY6JAyluQ+/SAp88dLQpnTLVcv2CL1S
 ov1LgNIq5KsSfhhSj9CknfVJ1PS5X5xNtwtEvPc0E8LvvUDmOuY5I/q6TMOYEi/kA4j6cBJ5eYbRNX
 6JowXJLr7o9SRuqEgWmMacKQnsNwpE40pJqfNLJFhYESCIrvQwZ9TwCLXLgkSFJqW7YFYqiwXyael9
 FZ9jPNXcb090aJKlNKujeQw2Y0jBzRRMcBjLpuq4NzAVJCHnY14IJ/EGK2O1drZr2k7KavWCBOC2VQ
 s4I8rbJJE4AmsYYN8WMAOJKWU+x7cSujgWPZs0VBausgpWGQrlaoQkCjRawg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_055421_930883_BBC73FFD 
X-CRM114-Status: GOOD (  11.42  )
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

From: Fabien Parent <fparent@baylibre.com>

Add IOMMU support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/iommu/mtk_iommu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 35e9731c3441..50ee1f833c2b 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -170,6 +170,7 @@ enum mtk_iommu_plat {
 	M4U_MT8186,
 	M4U_MT8192,
 	M4U_MT8195,
+	M4U_MT8365,
 };
 
 struct mtk_iommu_iova_region {
@@ -1528,6 +1529,17 @@ static const struct mtk_iommu_plat_data mt8195_data_vpp = {
 			   {4, MTK_INVALID_LARBID, MTK_INVALID_LARBID, MTK_INVALID_LARBID, 6}},
 };
 
+static const struct mtk_iommu_plat_data mt8365_data = {
+	.m4u_plat	= M4U_MT8365,
+	.flags		= RESET_AXI | HAS_INT_ID_PORT_WIDTH_6,
+	.inv_sel_reg	= REG_MMU_INV_SEL_GEN1,
+	.banks_num	= 1,
+	.banks_enable	= {true},
+	.iova_region	= single_domain,
+	.iova_region_nr	= ARRAY_SIZE(single_domain),
+	.larbid_remap	= {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
+};
+
 static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
 	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
@@ -1540,6 +1552,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8195-iommu-infra", .data = &mt8195_data_infra},
 	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data = &mt8195_data_vdo},
 	{ .compatible = "mediatek,mt8195-iommu-vpp",   .data = &mt8195_data_vpp},
+	{ .compatible = "mediatek,mt8365-m4u", .data = &mt8365_data},
 	{}
 };
 

-- 
b4 0.10.1

