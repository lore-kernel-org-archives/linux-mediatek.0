Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78780C3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ua2gX7Bz6Q1u0d1UN8se5+xwDhkqKZ4z9Veh2f7/sCs=; b=zuAA+vAlaepKed6ub3qaHvdbdk
	b4tqLBWyUBDsw+Fu9WfDJWNiQ9aNpacEsdfs75xfhEMH/vUrTS8FMl/EJlFTuteg5RI75rJRtx8x0
	YzdH65SOMpMXT7D5Xn2AZvAuYHBF8imnknHhQxfiuH/9QLpNbchAzboN7HN0FtP3NkJVr/sIGySq0
	lKFY2pU7ZU4JtS/NKUglS4LbHDHQc4flWvIrl5yoOWJoNgFbl7ISvTo9ZWTLsFCzDhiLiIk0s3M2Q
	yVul6ijUgp1u0LR0i/oBAB/xrX7pYv4CakSS2X3dGXU4iUFJDFESkFNJEtvKfxgb4bXvESBpgCXv2
	jJaplwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8eM-000000018En-3emR;
	Wed, 31 Jul 2024 12:41:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8af-00000001794-2E4E;
	Wed, 31 Jul 2024 12:38:27 +0000
X-UUID: b74557004f3911efa6c87f6b4542ff6b-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ua2gX7Bz6Q1u0d1UN8se5+xwDhkqKZ4z9Veh2f7/sCs=;
	b=erMtruKDvKf8pz5ZdNRY91Stz/fXBMvca4CqyNqDnws17WlOJ/g3j9QyQd+GyUkUryWB59JRq/jAdIL3icp4TBtViKhZWA/3hiHfC7JW49PiqGRb1HrBjpBs0vYCxr5SmCOiafRXFn/sduwqOaGLS6PJxBEyOjLZ/JyVbc2lKSU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:325b3d9b-bf84-47da-840f-445bed750d37,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:a250fcd5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b74557004f3911efa6c87f6b4542ff6b-20240731
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 885396206; Wed, 31 Jul 2024 05:37:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 05:17:54 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 20:17:54 +0800
From: Shun-yi Wang <shun-yi.wang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Conor Dooley
	<conor+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, shun-yi.wang <shun-yi.wang@mediatek.com>
Subject: [PATCH v2 2/2] remoteproc: mediatek: Support multiple reserved memory regions
Date: Wed, 31 Jul 2024 20:17:30 +0800
Message-ID: <20240731121730.1196-3-shun-yi.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240731121730.1196-1-shun-yi.wang@mediatek.com>
References: <20240731121730.1196-1-shun-yi.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_053801_582547_3047C2E7 
X-CRM114-Status: GOOD (  16.00  )
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

From: "shun-yi.wang" <shun-yi.wang@mediatek.com>

SCP supports multiple reserved memory regions, intended for
specific hardwards.

Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 857a61760b27..0e799d0bf73d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1006,20 +1006,29 @@ EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
 
 static int scp_map_memory_region(struct mtk_scp *scp)
 {
-	int ret;
 	const struct mtk_scp_sizes_data *scp_sizes;
+	struct device_node *node = scp->dev->of_node;
+	struct of_phandle_iterator it;
+	int ret, err;
+	int i = 0;
 
-	ret = of_reserved_mem_device_init(scp->dev);
+	of_for_each_phandle(&it, err, node, "memory-region", NULL, 0) {
+		ret = of_reserved_mem_device_init_by_idx(scp->dev, node, i);
 
-	/* reserved memory is optional. */
-	if (ret == -ENODEV) {
-		dev_info(scp->dev, "skipping reserved memory initialization.");
-		return 0;
+		if (ret) {
+			dev_err(scp->dev, "failed to assign memory-region: %s\n",
+				it.node->name);
+			of_node_put(it.node);
+			return -ENOMEM;
+		}
+
+		i++;
 	}
 
-	if (ret) {
-		dev_err(scp->dev, "failed to assign memory-region: %d\n", ret);
-		return -ENOMEM;
+	/* reserved memory is optional. */
+	if (i == 0) {
+		dev_dbg(scp->dev, "skipping reserved memory initialization.");
+		return 0;
 	}
 
 	/* Reserved SCP code size */
-- 
2.18.0


