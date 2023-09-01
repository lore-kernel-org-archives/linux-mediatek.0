Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4F0CA0FE6
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 08:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pZFqE2y9D9PRaM6rQ4fkTK3Ruxj+t8ui38IWeqFk8Y=; b=nuDj1z5TyPjO/Bcmq5Qw/i2U66
	jnymuwSW9gU9r616swShi26a++R7m0i0YJstq4HTQuzevCdgzqkfpUq5naGlok4styIKumSnfYt/p
	o2T9n5ZS1LTf8pXdIAf/RowXJTzXgE+xofqnnyolry2Ir+rrS9g/95QYjBFcSYY91/yeLdb7ayOOr
	htUy1mtzb89LBAPkX7XOOWDYbXsxzwI3VdFpvG1/1k443/Jl3mTrdICy+FDaOY6BVo0s7Q2jRuvGm
	urPGz4RtCROwp6oIxtla6sY6JHdOTJlEV042U4phCSYUBLfG/rWWMnrzQOvsF3PcT77NNeUJutmcY
	RBV/Y7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbzEA-00GeVm-26;
	Fri, 01 Sep 2023 08:10:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbzE7-00GeTB-1K;
	Fri, 01 Sep 2023 08:10:00 +0000
X-UUID: eedaac6c489e11ee9b7791016c24628a-20230901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3pZFqE2y9D9PRaM6rQ4fkTK3Ruxj+t8ui38IWeqFk8Y=;
	b=rGetyoU3vp3adHwgJ+y50HOwCwQI4VGF7H1bk8LalWKeAJniKi3sWRd7mq4nUsx+8dHWgqvFYJCBMTqEcKtApN2MEJ5AuRbQqQB8n5rIzr5zUhfHJjU6FDBckXyBzE3MLg/zlhxCX7+trfjDeObnLymYe7u9FcKoSyux83kVidY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:24889b01-51e8-4555-a1bc-ab39a9ae363a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:12f90020-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: eedaac6c489e11ee9b7791016c24628a-20230901
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 327242362; Fri, 01 Sep 2023 01:09:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Sep 2023 16:09:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Sep 2023 16:09:52 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tinghan
 Shen <tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v17 06/14] remoteproc: mediatek: Revise SCP rproc initialization flow for multi-core SCP
Date: Fri, 1 Sep 2023 16:09:27 +0800
Message-ID: <20230901080935.14571-7-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230901080935.14571-1-tinghan.shen@mediatek.com>
References: <20230901080935.14571-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_010959_494560_7F6F5A85 
X-CRM114-Status: GOOD (  18.04  )
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

This is the 2nd preliminary step for probing multi-core SCP.
Initialization of configuration and L1TCM registers is extracted
to only performed once on multi-core SCP. The rest of remoteproc
initialization procedure is similar for both single and multi-core
SCP and is applied to each core.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 63 ++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index f88e60e4bc21..7a2ba1e1e95a 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -854,21 +854,17 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 	}
 }
 
-static int scp_probe(struct platform_device *pdev)
+static int scp_rproc_init(struct platform_device *pdev,
+			  struct mtk_scp_of_cluster *scp_cluster)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct mtk_scp *scp;
-	struct mtk_scp_of_cluster *scp_cluster;
 	struct rproc *rproc;
 	struct resource *res;
 	const char *fw_name = "scp.img";
 	int ret, i;
 
-	scp_cluster = devm_kzalloc(dev, sizeof(*scp_cluster), GFP_KERNEL);
-	if (!scp_cluster)
-		return -ENOMEM;
-
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
 	if (ret < 0 && ret != -EINVAL)
 		return ret;
@@ -893,24 +889,6 @@ static int scp_probe(struct platform_device *pdev)
 	scp->sram_size = resource_size(res);
 	scp->sram_phys = res->start;
 
-	/* l1tcm is an optional memory region */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
-	scp->cluster->l1tcm_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(scp->cluster->l1tcm_base)) {
-		ret = PTR_ERR(scp->cluster->l1tcm_base);
-		if (ret != -EINVAL) {
-			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
-		}
-	} else {
-		scp->cluster->l1tcm_size = resource_size(res);
-		scp->cluster->l1tcm_phys = res->start;
-	}
-
-	scp->cluster->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
-	if (IS_ERR(scp->cluster->reg_base))
-		return dev_err_probe(dev, PTR_ERR(scp->cluster->reg_base),
-				     "Failed to parse and map cfg memory\n");
-
 	ret = scp->data->scp_clk_get(scp);
 	if (ret)
 		return ret;
@@ -962,6 +940,43 @@ static int scp_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int scp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_scp_of_cluster *scp_cluster;
+	struct resource *res;
+	int ret;
+
+	scp_cluster = devm_kzalloc(dev, sizeof(*scp_cluster), GFP_KERNEL);
+	if (!scp_cluster)
+		return -ENOMEM;
+
+	scp_cluster->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(scp_cluster->reg_base))
+		return dev_err_probe(dev, PTR_ERR(scp_cluster->reg_base),
+				     "Failed to parse and map cfg memory\n");
+
+	/* l1tcm is an optional memory region */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
+	scp_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(scp_cluster->l1tcm_base)) {
+		ret = PTR_ERR(scp_cluster->l1tcm_base);
+		if (ret != -EINVAL)
+			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
+
+		scp_cluster->l1tcm_base = NULL;
+	} else {
+		scp_cluster->l1tcm_size = resource_size(res);
+		scp_cluster->l1tcm_phys = res->start;
+	}
+
+	ret = scp_rproc_init(pdev, scp_cluster);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static void scp_remove(struct platform_device *pdev)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
-- 
2.18.0


