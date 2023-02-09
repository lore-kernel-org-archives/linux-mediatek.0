Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BE6C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 07:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6Mq9pK7uzND1xJ/3DSsEG33Y6Jr24ocdvtiHLbAez4=; b=Tik1Zh4Jnfo8GFkv0Fg/cswpzy
	sCjESyS11b0TpjLCney3qWIRrIhMOtDpyXzkpJbmPTrjaX1xtqutcIhNzqBNzM4RtTn6vwZ/9jeCT
	JpryJvR1FiudUSitONflKQOScxYM2qWLaKcN/X6R99Mh65JiudR1ufl+b2DumBnjpQIRVuHPjDbmx
	xe7IJmW/MpJgqAKYCieoGfUfUYNC5prbdZ5b80M3Np/wYc0hcIMaj3m3pv/RkUVJlhKBepCfCIFF9
	VqD1DB9akYg435DaqfHILT7GHomPTPy6XM7JJebEso73780TsNjZ3nQgcAHwIwCpyjrJ0sqedu5AQ
	urK0s+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ1Zd-000PTa-Nt; Thu, 09 Feb 2023 07:42:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ1Yf-000Oo1-Sr; Thu, 09 Feb 2023 07:41:31 +0000
X-UUID: 2850c24ea84d11eda08d4d6090ec5a5c-20230209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=S6Mq9pK7uzND1xJ/3DSsEG33Y6Jr24ocdvtiHLbAez4=;
	b=EpSHpAaM0QRH26Wnk04HqOSyJHhIah9bjxBaCBmV7UoyhQg2zYbMUbWFuQXa2U/Chcco05o9zTJu4forvWUIN3hMwqGL1H6ZXVic8Kb+HmbFO9UD7EZNJWiiVYiOfBaZ52IZ4K2UUa1Sae5Vmig/rVCz8pZwYNQlb0ctd2J3xws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:eb86c5bd-361b-4cf3-925e-d82107618d54,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:7e5ac556-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 2850c24ea84d11eda08d4d6090ec5a5c-20230209
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1852476657; Thu, 09 Feb 2023 00:41:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 9 Feb 2023 15:40:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 9 Feb 2023 15:40:50 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 11/12] remoteproc: mediatek: Refine ipi handler error message
Date: Thu, 9 Feb 2023 15:40:20 +0800
Message-ID: <20230209074021.13936-12-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230209074021.13936-1-tinghan.shen@mediatek.com>
References: <20230209074021.13936-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_234129_988784_D533F0CC 
X-CRM114-Status: GOOD (  12.76  )
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

The error message doesn't accurately reflect the cause of
the error. The error is due to a handler not being found,
not an invalid IPI ID.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9fbbc4751433..16b5de589d07 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -106,7 +106,7 @@ static void scp_ipi_handler(struct mtk_scp *scp)
 	scp_ipi_lock(scp, id);
 	handler = ipi_desc[id].handler;
 	if (!handler) {
-		dev_err(scp->dev, "No such ipi id = %d\n", id);
+		dev_err(scp->dev, "No handler for ipi id = %d\n", id);
 		scp_ipi_unlock(scp, id);
 		return;
 	}
-- 
2.18.0


