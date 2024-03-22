Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978A7C54E71
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 09:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxfoSJRgtLM7Y9Q8+5O2pEW6twqTFjA7H0y0agURdlM=; b=euPN2LZdiXByEDCi8qx5QjUVtx
	ZIoQLH8G7x3tsJYLE7v/j9miLnHAuy3TFGuQyKA4BiYByDlAhO8A6mw/Iuem9uXGm8MYBwvNjIiJY
	En6tE6Kgk6rpm98TYFp/Jzppww8vdTsLbMpy7GMLvWFQvbdaiUbpAHWKjVn77YY4rwzdc12DScl7k
	mRSZFwvTFxVhLLxDpoqIyIEpSF4LqzZ6e+A6JgZm5JFUiIyAit0fAgIcXdloXFSVSu4i/5z0ZY+jN
	G6AFEZjyXTD56jRBCFqDUHU4MlFvPkW3rHt75b0Xrp+lXiV6OSmxzrE11B3/DPzxOAXzUYyTqM0qX
	ZuNzrxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnayh-00000006VrW-0sQQ;
	Fri, 22 Mar 2024 09:14:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnay6-00000006VXq-1A7A;
	Fri, 22 Mar 2024 09:13:44 +0000
X-UUID: 7798c886e82c11ee9aa9374d6d45775a-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IxfoSJRgtLM7Y9Q8+5O2pEW6twqTFjA7H0y0agURdlM=;
	b=PTbt29aAjclZnqm2MvdSf0ACTqLT2U2zJ/dKAuQKDFsSEO/batrRzX3PScEs3c/jUBstBHAl4yj/uS6/ys6w9TsH/lS40af2OSiQablSghYj0qwh/IXsE2HL6PyGI3QzM0dvrS1kdliMD+O9JM8xWOaEf8yWisgkQPTmYbZa5ns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:c180c70d-6857-4fc2-b19e-a0e76e3ee1c0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:f01dcf81-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 7798c886e82c11ee9aa9374d6d45775a-20240322
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 672718854; Fri, 22 Mar 2024 02:13:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 17:12:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 17:12:34 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v5 05/14] drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
Date: Fri, 22 Mar 2024 17:12:23 +0800
Message-ID: <20240322091232.26387-6-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322091232.26387-1-shawn.sung@mediatek.com>
References: <20240322091232.26387-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_021342_407041_5E77F2ED 
X-CRM114-Status: GOOD (  14.00  )
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename all "mtk_drm_hdmi" to "mtk_hdmi":
- To align the naming rule
- To reduce the code size

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 86133bf16326b..d2876da1b43a7 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1687,7 +1687,7 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 	return 0;
 }
 
-static int mtk_drm_hdmi_probe(struct platform_device *pdev)
+static int mtk_hdmi_probe(struct platform_device *pdev)
 {
 	struct mtk_hdmi *hdmi;
 	struct device *dev = &pdev->dev;
@@ -1746,7 +1746,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void mtk_drm_hdmi_remove(struct platform_device *pdev)
+static void mtk_hdmi_remove(struct platform_device *pdev)
 {
 	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
 
@@ -1790,7 +1790,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
 	.cea_modes_only = true,
 };
 
-static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
+static const struct of_device_id mtk_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-hdmi",
 	  .data = &mtk_hdmi_conf_mt2701,
 	},
@@ -1801,14 +1801,14 @@ static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
 	},
 	{}
 };
-MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_of_ids);
+MODULE_DEVICE_TABLE(of, mtk_hdmi_of_ids);
 
 static struct platform_driver mtk_hdmi_driver = {
-	.probe = mtk_drm_hdmi_probe,
-	.remove_new = mtk_drm_hdmi_remove,
+	.probe = mtk_hdmi_probe,
+	.remove_new = mtk_hdmi_remove,
 	.driver = {
 		.name = "mediatek-drm-hdmi",
-		.of_match_table = mtk_drm_hdmi_of_ids,
+		.of_match_table = mtk_hdmi_of_ids,
 		.pm = &mtk_hdmi_pm_ops,
 	},
 };
-- 
2.18.0


