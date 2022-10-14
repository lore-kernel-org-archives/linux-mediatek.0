Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1EFC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jK/ZA8ZpYldXBDNDXbE1og7C8Juwo1v3zOCfZOVwjtQ=; b=MmCv/lSC8fAL/oiXCPVQeqXglb
	6Eo69CFZ2D2AiXK3TAZPq51jDiLFMivF8yagQ44gQ63k6Fa4T+FXMwunLoDhJGk+j/8rklzNOzc0t
	lxxUYcbw/w1oGFQHR+MzllaxiQNyZ3e2DE1Kmpixb0crd6wpyCSkTJ5l54DjOpsxxjvp9oc7Htjk7
	78l5QIkomjtubR9l/rOrDFSOtASVf+I7F3NE//KW0Dtj/5kEHtSufDdkqDksMgJ3xxx6AkhSYPuNh
	cmhXzT7VwSwDXHLJcGF2D+Xe8UUt0ywdio19cYmSgHvTpDR0UrXxHP780x8JgO857P/w7wD5l/Dsh
	T13SxuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojGKg-00E8Jw-7J; Fri, 14 Oct 2022 08:46:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojGK2-00E85d-AG
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 08:45:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id n9so2675492wms.1
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Oct 2022 01:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jK/ZA8ZpYldXBDNDXbE1og7C8Juwo1v3zOCfZOVwjtQ=;
        b=c4HGrOTb5Yo0phJrq0cHskbgHHArrHgXZ1xnh0/OZqKYreIP28X7bhGqOeyhEhwoFI
         20IALVhmrLvJtd+xc7ri7/D5drW9Sm5cIsIuy0DB/N5ORN6dCBkAhDpFuYBb9aFhog3f
         WYzeL/XA2drhy44dzShrcAEn93Bb3uy4W/XjW7IlCBeI5YuoCFXf95Nh7xrBvx16hI3f
         HSpFGWCNeAAnVSCsq5AN32lfS/e19CqCoPNLjvpW7moVC0vsYia9cgmWLdAEp6TVTvAp
         luAqwjQ/U0Zwgcul4d/WzXknivB+2HnvGV3BHVaYHjYZn5sfX7NdvTD7hlqIeW/kJs2K
         rbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jK/ZA8ZpYldXBDNDXbE1og7C8Juwo1v3zOCfZOVwjtQ=;
        b=SfkLhzam/eU9o3xEeMt2tLhiMxhfdKBciMvWj8QsLUxu+te7DTpFyvEQY50E0tFbJk
         ahyDI9Lt7IM006DJ3KnkTSH/1fwMu5hknZYbC1C83UM7nn9DnMnOZ7M9yNYEwbtlgHJp
         HI6yONZi6EzioMimtNAEBDU85eZ9OokZKobLfHcARL7YX9MjlogRxECyScNV6bAWjkc4
         TNT3/A7AToLxuD/HA1AVSIN2SioyqRdjTKcxzpUG97eedTFvTaR/pyiw5Lj3n+gNlyr9
         9N2lVQayJ4+Rk36u9bc63KIsIa9XiOrJo241cixwDRezYJVzmVyZm4fbz0ZzMxpwgDZi
         +wuQ==
X-Gm-Message-State: ACrzQf1mpyLTY3k1a61Jtlr8dRwsZYxvOFYY+Zrnib7mOgBb/WqfcwLS
	vuDl9q7L5hhpdRXy3mBfojAu9Q==
X-Google-Smtp-Source: AMsMyM5ohMLvbcNIBjc+8GqTi8oCQoemygDDVgtEUDuLY0s/kkI5P2wJbG6B8qGRU2FQQ3UpJ64iXg==
X-Received: by 2002:a05:600c:4611:b0:3c5:e3a3:942a with SMTP id m17-20020a05600c461100b003c5e3a3942amr9635205wmo.82.1665737136527;
        Fri, 14 Oct 2022 01:45:36 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m6-20020a1c2606000000b003c452678025sm6684633wmm.4.2022.10.14.01.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 01:45:36 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Oct 2022 10:45:31 +0200
Subject: [PATCH v4 3/3] iommu/mediatek: add support for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221001-iommu-support-v4-3-f1e13438dfd2@baylibre.com>
References: <20221001-iommu-support-v4-0-f1e13438dfd2@baylibre.com>
In-Reply-To: <20221001-iommu-support-v4-0-f1e13438dfd2@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, iommu@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1965; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=5Lr2zHqNQGwcj6em1b7xul4Vf/YWO9kNyKL5oDTlads=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjSSGr7BsQTUiLKrxehh8tOo4ZIC5hyHUIZIW9sOAi
 nwgII0GJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY0khqwAKCRArRkmdfjHURbuxD/
 0WqvLoBQgSimQKQGAD+x70DIZxlDlnXKz5qAuK2/l59EWQCZbsyJuG/Kbtq/FmKj5opM1RHnmmtuz0
 orFwKeYMWtBygxpnBL/fzDvVOcJ3SvVrZnh+5p40r4BdQdGxJK54gl+DUBaIQN+DdVUyLCWHCcvbJ3
 X6LREa4Ig5pGEeepwk1leJCpb9sP3dOQtQG0nndXpwZJ6Agrkg3Jzk7/5Wl40T19J/0FxVS8qdECXH
 gt68v1ZksaWQLSjm+oDFUKlEfS3VMI6fVb/PXAkjbRmKXm9S0pTzFH6kcnGEgx6bro7KuFDSO2nUQS
 oDZlxIqiOpJWeiO1f01Qy/AWTwuFEeLyqSRGYvR3F9jpVJbsoxxZftZHfKhaZJtVQcqt+TDpUPhsJ/
 mRFZvxDiR6s+Yx7aU8Ido4J0plgJ5XFRPhZUuO92mWFHi+PF0CNuG4QFmRXacf8mxeYJJCQOLnMENh
 4kQxc78OF+1LLCcpFmeZgF/VGY1I1WkYoPLp7Vh1tFgW/nsPO5kfydYRULda1bwOev5LyZFBLi0DVV
 SCR22/3TDT4A1PPtOIXIDWiWTD4J5/rmz7nYhhmGbZu4RYVqCXn9lMU76iDugKeqlZXNveAnqLa4T5
 UX3eefNZecasDMcNzqNQVDhP2uuYFrTreO+3KlO64P7AZIYGQiwYZ1dS3ZiQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_014538_360682_42A36249 
X-CRM114-Status: GOOD (  10.74  )
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
index 50195a900611..051ed5234538 100644
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

