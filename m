Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B627FC61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEImrCI/kXGGUJLIMX0kD855YKMvbpgOQwIUEihf9gQ=; b=SH3xekxYRQYEw4i0/rOMhIySpV
	2EhpJR5TonHctbtztgb0bFwgi17SeDbOEW1jT75edUSCXr30y8e5Jpe+l/HZM3zE+Pi/6VinLowXx
	rILSD02Mtex/Egjdgc1nKiZ44KdGY83hzJIAtTZejjFMKlvFqJ9MxtJdEptyANCJi3ONNU5vPn/di
	kavYsla/29mnBFR6MaNDnt+jRQL29Ko6t3bZgjSpiY04EPZzzXSHxLtM657Ob1c06ysx237oPElBA
	8LydmhRa4csXgkZfly5dRh5G0u3C/H+9m4tWO2q7MhhZUx2SBZkRwUkoMb7gM1xom4OlqpPRxA+h7
	mXSdX7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PNa-00GdgP-1O;
	Tue, 21 Nov 2023 11:57:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PN1-00Gd8n-1l;
	Tue, 21 Nov 2023 11:56:52 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 73D99660731B;
	Tue, 21 Nov 2023 11:56:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700567806;
	bh=EEiAga7/PEKFwq5/KS3naIy5UuB1z5wjPE5byYQKsG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OpDnSoPGdSH1UzaeAKrP95OFmvISNmdjMD2sQMrcis1DwAE0iY57IcLuXpXMKNvG1
	 wgsn5gdgujm2irWdQuxHZk48L9cYQ5xahqFRwXRiRAiNQaobt+ahTQL8Y+XzUD2Dzo
	 KtfZX8b2pVFWiO25m7E0s8NonOIxatF6SyRaSEXb3l/3L+nYrQogcikjHDda1rOek0
	 x00Jc8svE91glrxLm8VmYo2le9ZC1wXKMtXbYNLWZFlOtn7FfFIhazsOBxRYPXkikS
	 ggSj/54pHRz8N7cMVU4Xg94djhV1anjwj9wf9p6UalW+scbGHy1zsQms5hAJixltE8
	 Vn1Smp6ABGFmw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v2 14/20] soc: mediatek: mtk-svs: Compress of_device_id entries
Date: Tue, 21 Nov 2023 12:56:18 +0100
Message-ID: <20231121115624.56855-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
References: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_035647_740685_A69FD36A 
X-CRM114-Status: GOOD (  10.44  )
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

Compress each entry to one line, as they fit in 84 columns, which
is acceptable.
While at it, also change the capital 'S' to 's' in 'sentinel'.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 5fd9884dd20f..ac36c2efcafa 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2731,24 +2731,12 @@ static const struct svs_platform_data svs_mt8183_platform_data = {
 };
 
 static const struct of_device_id svs_of_match[] = {
-	{
-		.compatible = "mediatek,mt8195-svs",
-		.data = &svs_mt8195_platform_data,
-	}, {
-		.compatible = "mediatek,mt8192-svs",
-		.data = &svs_mt8192_platform_data,
-	}, {
-		.compatible = "mediatek,mt8188-svs",
-		.data = &svs_mt8188_platform_data,
-	}, {
-		.compatible = "mediatek,mt8186-svs",
-		.data = &svs_mt8186_platform_data,
-	}, {
-		.compatible = "mediatek,mt8183-svs",
-		.data = &svs_mt8183_platform_data,
-	}, {
-		/* Sentinel */
-	},
+	{ .compatible = "mediatek,mt8195-svs", .data = &svs_mt8195_platform_data },
+	{ .compatible = "mediatek,mt8192-svs", .data = &svs_mt8192_platform_data },
+	{ .compatible = "mediatek,mt8188-svs", .data = &svs_mt8188_platform_data },
+	{ .compatible = "mediatek,mt8186-svs", .data = &svs_mt8186_platform_data },
+	{ .compatible = "mediatek,mt8183-svs", .data = &svs_mt8183_platform_data },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, svs_of_match);
 
-- 
2.42.0


