Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17186C5AE5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 09:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQLIJg24znIa486HfA91r6jHZp1ttD5Q9cgFHZ3g7XU=; b=2Q/SsFDGkA0itFa7LqizkW6+uI
	lEI9jat7Ebtg2xtI0gJ0b3GvRoJFYT+AcLPCGJ5qYmSEVQ2jBGKSHhguwEeogxYl7EfrynWV/kJQ9
	Cnc93bIsiVCOhTwRFxCgum1w/RTzbnvmRbwjXZQl2xcWD7JIeCkl/31uv3uRcJvo2B8p31mLVfgKQ
	9B4bO1XF+T3J6SN11IkCb/RFreP0/VRl/kGnX8bsoWksBFY/NfZXrl+4dTw30dc3BLltYFXbZ3AFS
	4yI7rSbTAvz2u5GATWIqAaQxSV3oGRH9iPM/vgDLaasF0uSt4qUig93fEFE7RLe+Z02Q/G3G6lKQQ
	zYrwBNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vNk-0067V2-2l;
	Fri, 17 Nov 2023 09:43:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vNA-0066yF-0G;
	Fri, 17 Nov 2023 09:42:49 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 177AD660738E;
	Fri, 17 Nov 2023 09:42:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700214166;
	bh=zNfya3IwOleE3gv7u+f222r6Eh2oBHfy4LgRig9Wjl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NcfSZVjPvbDH0V17L4oTyWt9EEHqzCLWSfiJeUDxVEJor48SmNLP2VnYRyS5OCYiQ
	 jnVdbQkL711tsjT3U0fQ/4zfdmKP18YqbQoGv9r/f9W+MOqlG/q1VULlNlLTThTpPr
	 4zNXeDnimqSfeUoo8dqkopL4Fc9ljIiTGd1CMYHBk9gJkvDStFWv4GL06G6sbDiE4g
	 ZUlHhigq9ohM08Cw/DzKw0U/QBZFkf/9heu1+FA4vNKjZM4tNGVvJzv7wQURiUdLnm
	 ixm9xL7C6dmVRl6meYojS23sXtZeQMg5jSNFcJEQVGhe1FrcBxNEoMI8xF0L4hbV2k
	 sXNAsDgEiM0Ww==
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
Subject: [PATCH v1 12/20] soc: mediatek: mtk-svs: Commonize MT8192 probe function for MT8186
Date: Fri, 17 Nov 2023 10:42:20 +0100
Message-ID: <20231117094228.40013-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117094228.40013-1-angelogioacchino.delregno@collabora.com>
References: <20231117094228.40013-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_014248_280914_67DCB3B0 
X-CRM114-Status: GOOD (  12.80  )
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

Include the additions of svs_mt8186_platform_probe() in the common
svs_mt8192_platform_probe() function, remove the former, and use the
latter as .probe() callback for MT8186.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 44 ++++++----------------------------
 1 file changed, 7 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index e7df3a577b4c..cd5064683506 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2119,7 +2119,6 @@ static struct device *svs_add_device_link(struct svs_platform *svsp,
 static int svs_mt8192_platform_probe(struct svs_platform *svsp)
 {
 	struct device *dev;
-	struct svs_bank *svsb;
 	u32 idx;
 
 	svsp->rst = devm_reset_control_get_optional(svsp->dev, "svs_rst");
@@ -2133,40 +2132,7 @@ static int svs_mt8192_platform_probe(struct svs_platform *svsp)
 				     "failed to get lvts device\n");
 
 	for (idx = 0; idx < svsp->bank_max; idx++) {
-		svsb = &svsp->banks[idx];
-
-		if (svsb->type == SVSB_TYPE_HIGH)
-			svsb->opp_dev = svs_add_device_link(svsp, "gpu");
-		else if (svsb->type == SVSB_TYPE_LOW)
-			svsb->opp_dev = svs_get_subsys_device(svsp, "gpu");
-
-		if (IS_ERR(svsb->opp_dev))
-			return dev_err_probe(svsp->dev, PTR_ERR(svsb->opp_dev),
-					     "failed to get OPP device for bank %d\n",
-					     idx);
-	}
-
-	return 0;
-}
-
-static int svs_mt8186_platform_probe(struct svs_platform *svsp)
-{
-	struct device *dev;
-	struct svs_bank *svsb;
-	u32 idx;
-
-	svsp->rst = devm_reset_control_get_optional(svsp->dev, "svs_rst");
-	if (IS_ERR(svsp->rst))
-		return dev_err_probe(svsp->dev, PTR_ERR(svsp->rst),
-				     "cannot get svs reset control\n");
-
-	dev = svs_add_device_link(svsp, "thermal-sensor");
-	if (IS_ERR(dev))
-		return dev_err_probe(svsp->dev, PTR_ERR(dev),
-				     "failed to get lvts device\n");
-
-	for (idx = 0; idx < svsp->bank_max; idx++) {
-		svsb = &svsp->banks[idx];
+		struct svs_bank *svsb = &svsp->banks[idx];
 
 		switch (svsb->sw_id) {
 		case SVSB_SWID_CPU_LITTLE:
@@ -2177,7 +2143,11 @@ static int svs_mt8186_platform_probe(struct svs_platform *svsp)
 			svsb->opp_dev = svs_add_device_link(svsp, "cci");
 			break;
 		case SVSB_SWID_GPU:
-			svsb->opp_dev = svs_add_device_link(svsp, "gpu");
+			if (svsb->type == SVSB_TYPE_LOW)
+				svsb->opp_dev = svs_get_subsys_device(svsp, "gpu");
+			else
+				svsb->opp_dev = svs_add_device_link(svsp, "gpu");
+			break;
 			break;
 		default:
 			dev_err(svsb->dev, "unknown sw_id: %u\n", svsb->sw_id);
@@ -2739,7 +2709,7 @@ static const struct svs_platform_data svs_mt8186_platform_data = {
 	.name = "mt8186-svs",
 	.banks = svs_mt8186_banks,
 	.efuse_parsing = svs_common_parse_efuse,
-	.probe = svs_mt8186_platform_probe,
+	.probe = svs_mt8192_platform_probe,
 	.regs = svs_regs_v2,
 	.bank_max = ARRAY_SIZE(svs_mt8186_banks),
 	.ts_coeff = SVSB_TS_COEFF_MT8186,
-- 
2.42.0


