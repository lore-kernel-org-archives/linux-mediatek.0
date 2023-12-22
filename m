Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FEEC46CD4
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Dec 2023 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvaT9Y5lkKN52GxhXJsTpJ0Q2R7n8u/pL6jJJhzDuVQ=; b=V85aOQuzdDAJWvQmuI2MONEqyu
	T1OjneeQZ5SAwoWV92/o12oeGSqoD4rarsBhsaSA582UOLf1PMb3+rCV/BiWffKvbjF1MolGCCAsM
	Li79zTWo0E9dRHdAAFGH5mPDRw75VBA6TM3gwJ+XDz0f/e2adwpjd4uixrGuETdWGZfXLwBYld1na
	P2Wm73Hod3eZRyfJnJhADkG/fvTRg9IsjunN/1I7dECyPhJtIoP+riz46QpLoDpigQG7GoDyaE7kn
	YejlhOk9D9asu2nv69WSerVeozt3Hc1HeR/2OP/Z0vHPvXQ39eNKog/bjhrqmhwa4C8OGynHreQ98
	luB4PsCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaaU-005GZX-1t;
	Fri, 22 Dec 2023 08:08:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaaR-005GY3-2E;
	Fri, 22 Dec 2023 08:08:52 +0000
X-UUID: 55043b0ca0a111ee958cff29c719f35b-20231222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OvaT9Y5lkKN52GxhXJsTpJ0Q2R7n8u/pL6jJJhzDuVQ=;
	b=ZDQfXIafrQsClNm4wZcYFDd4TJA5lSN9D5hXz3fU/oVWD2iB9rzoRLevqWBt88Jtvaw6Y2bsgSy7HxdPwAohl19Xqq6QFHBvLWLYOaqR3eoEqzv+uXRESiTc6k+nVZkW43xOtepDdIssZNGG297uTtgjc8MBB24h+wp0yuoCQMQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:f48ebf77-cb2c-452e-9543-5c978be957c4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:4333602e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 55043b0ca0a111ee958cff29c719f35b-20231222
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <william-tw.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 129721139; Fri, 22 Dec 2023 01:08:47 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Dec 2023 16:07:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Dec 2023 16:07:44 +0800
From: William-tw Lin <william-tw.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH v4 3/3] nvmem: mtk-efuse: Register MediaTek socinfo driver from efuse
Date: Fri, 22 Dec 2023 16:07:39 +0800
Message-ID: <20231222080739.21706-4-william-tw.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231222080739.21706-1-william-tw.lin@mediatek.com>
References: <20231222080739.21706-1-william-tw.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_000851_731161_981056B0 
X-CRM114-Status: GOOD (  15.75  )
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

The socinfo driver reads chip information from eFuses and does not need
any devicetree node. Register it from mtk-efuse.

While at it, also add the name for this driver's nvmem_config.

Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
---
 drivers/nvmem/mtk-efuse.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 84f05b40a411..f5bebcecf9bd 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -68,6 +68,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	struct nvmem_config econfig = {};
 	struct mtk_efuse_priv *priv;
 	const struct mtk_efuse_pdata *pdata;
+	struct platform_device *socinfo;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -85,11 +86,20 @@ static int mtk_efuse_probe(struct platform_device *pdev)
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
+	platform_set_drvdata(pdev, socinfo);
+	return 0;
 }
 
 static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
@@ -108,8 +118,17 @@ static const struct of_device_id mtk_efuse_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_efuse_of_match);
 
+static void mtk_efuse_remove(struct platform_device *pdev)
+{
+	struct platform_device *socinfo = platform_get_drvdata(pdev);
+
+	if (!IS_ERR_OR_NULL(socinfo))
+		platform_device_unregister(socinfo);
+}
+
 static struct platform_driver mtk_efuse_driver = {
 	.probe = mtk_efuse_probe,
+	.remove_new = mtk_efuse_remove,
 	.driver = {
 		.name = "mediatek,efuse",
 		.of_match_table = mtk_efuse_of_match,
-- 
2.18.0


