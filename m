Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38026C46CCD
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 10:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nc2v4XK4GgMWiKrx1TmkatyK/XnMtUXXUmJveqsh50=; b=psQ65cxH6wl4ISjsmU+U3cF2vB
	0YpdFFPHYHsUHojVWFi0+MzxgB75yw8QhJTXrHnU7QsYCLCf4ku792Q+1o3VLPusrZ+JXQKg+UZgw
	39h3AddysJ+pnYhmxyko8WnNpPsI5fwP3w8j/nkyqRq6UY2kY2E1CSRHmtPFOV5UozihQJWHSdsGN
	y5lliYFoCB78ENYeCD5306mdPynkVebr208OjzMmQZHZ3A3MceWPUqKbu034bZXsB7yyEHCsWq/t+
	cW2fPAi80O33l23a3kOCgsgd1yYLFNsoxMccIcarFpzkhUdOzytpirzaV8OMkpU59VEBKhWhWUZYN
	DuECokrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtzD-00GxDR-08;
	Wed, 20 Dec 2023 10:39:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtz8-00GxB7-0M;
	Wed, 20 Dec 2023 10:39:31 +0000
X-UUID: 0c5f0e649f2411ee958cff29c719f35b-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6nc2v4XK4GgMWiKrx1TmkatyK/XnMtUXXUmJveqsh50=;
	b=tHif4mT0gJNrd9ufcrKnjj6SMik67nKPPEDRg1HHAuz7lY9ZorFaUNKP5L4ftznugP/LGZ9DipNlyOv8bQ0kuhH1xB9Wgvdl9oPmqwy7xPpsx6nFUMiqpMN6Jf2CGVy4OgXOe5eNaLAdZVCENoQCyigrxryNSfYoVnszGCziGLQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:9ab7501e-9310-487c-b582-e01640bf562c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:59b6fa81-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0c5f0e649f2411ee958cff29c719f35b-20231220
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <william-tw.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2059016506; Wed, 20 Dec 2023 03:39:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 18:39:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 18:39:24 +0800
From: William-tw Lin <william-tw.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH v3 3/3] nvmem: mtk-efuse: Modify driver for getting chip information
Date: Wed, 20 Dec 2023 18:39:01 +0800
Message-ID: <20231220103901.22180-4-william-tw.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231220103901.22180-1-william-tw.lin@mediatek.com>
References: <20231220103901.22180-1-william-tw.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.994400-8.000000
X-TMASE-MatchedRID: 4UDH+/Xdc14QoD+Lr/yRKcnUT+eskUQPCt59Uh3p/NVcU0dNErOD+vlY
	oV6p/cSxYZon4ysgRFrD3fsd5FfxU5zDsl2JUMqfjFUG+PWNtyOWHGENdT+VP5soi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNRqXnrxrKCOXjBIzy2yVj36aFhDRX/XeG+7AwkxltPESpGOM5kASXvdoTE
	NRNo092nMWWXdH8XCFPKAPShj3y9+iL7s3pM/O5VsfT8+GQE6MF0aD5ljt43pMcHZD6gqu7wxMj
	fifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.994400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DF501D5E8CD1E5A7AAF290735A49D2F4108BF1F346C084B579BE8F49EED3493E2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_023930_175566_2A373E82 
X-CRM114-Status: GOOD (  14.48  )
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

Retrieval of soc info is needed. This patch includes the following:
1. Register socinfo device in mtk-efuse.c

Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
---
 drivers/nvmem/mtk-efuse.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 84f05b40a411..3914e039e288 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -68,6 +68,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	struct nvmem_config econfig = {};
 	struct mtk_efuse_priv *priv;
 	const struct mtk_efuse_pdata *pdata;
+	struct platform_device *socinfo;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -85,11 +86,19 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	econfig.size = resource_size(res);
 	econfig.priv = priv;
 	econfig.dev = dev;
+	econfig.name = "mtk-efuse";
 	if (pdata->uses_post_processing)
 		econfig.fixup_dt_cell_info = &mtk_efuse_fixup_dt_cell_info;
 	nvmem = devm_nvmem_register(dev, &econfig);
+	if (IS_ERR(nvmem))
+		return PTR_ERR(nvmem);
 
-	return PTR_ERR_OR_ZERO(nvmem);
+	socinfo = platform_device_register_data(&pdev->dev, "mtk-socinfo",
+						PLATFORM_DEVID_AUTO, NULL, 0);
+	if (IS_ERR(socinfo))
+		dev_info(dev, "MediaTek SoC Information will be unavailable\n");
+
+	return 0;
 }
 
 static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
-- 
2.18.0


