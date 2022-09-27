Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E74C07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 03:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blmqKbkOqJ3bm+VIPRnf3ApIWn+jpGpeWx+PBPZNgSI=; b=nJq1IDg37MEm+cN+QHkANJ4BlU
	ioli6f68K5wJuq3LtiUVUUhW/kOUnTwnHMFP3k/pWFgdKvLayYI174mDsaN2UdwEcxEwOMCXUGAnp
	B3KjjxiyWCLvzVJwp7n9oijndKWxvCPxsib9/AHg5h5bCnVH08Se0y8tm7AbGXA/QfqZvgToi8K0r
	2TwNLYJPZo2zCDJuOBdlnTFXWFJVPBfEdVX1/7vsg788ChVa8TUrKA9QnF6ix7o2BfdQMjBSUVj9n
	FY9ZCr3JzsqsgxGNaVEmk2Ax11xFs1qizNtGVKlR0h1nPY3NU+Gs85HB+t7PToarhzCXvvdDe222v
	bHvg/jrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od1F5-0084vg-3J; Tue, 27 Sep 2022 03:26:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od1F0-0084v1-ST; Tue, 27 Sep 2022 03:26:41 +0000
X-UUID: e19c231800764331ad2e6ce0e457f046-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=blmqKbkOqJ3bm+VIPRnf3ApIWn+jpGpeWx+PBPZNgSI=;
	b=OWe1+NjgTH7mgsHIJLASh4VKtrSZx5hcd4grVZdVSLjkEsmB2bw/qaz4XN9uXB7GrgRcZc4nBF/tnL+w4BW8/TeBFNiZojyzIGgqJtLkOn0EudtNZVbNW2on1hbFloUJffOSksbkYMMCOKcsNdp+FLoBiRrcMT1EIGWzgzpeusQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:a04c44ac-63cf-43ca-a90f-aa71ebb76885,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:b7d92ba3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e19c231800764331ad2e6ce0e457f046-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 520008507; Mon, 26 Sep 2022 20:26:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 10:56:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Sep 2022 10:56:26 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT
 Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 07/11] remoteproc: mediatek: Probe MT8195 SCP core 1
Date: Tue, 27 Sep 2022 10:56:02 +0800
Message-ID: <20220927025606.26673-8-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220927025606.26673-1-tinghan.shen@mediatek.com>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_202640_174316_EFF8BEDF 
X-CRM114-Status: GOOD (  14.64  )
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

The MT8195 SCP configuration registers for core 0 and core 1 is the same.
Let SCP core 1 to reuse the mapped address requested by SCP core 0.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h |  2 ++
 drivers/remoteproc/mtk_scp.c    | 27 +++++++++++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 3778894c96f3..54265c515315 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -140,6 +140,8 @@ struct mtk_scp {
 	size_t dram_size;
 
 	struct rproc_subdev *rpmsg_subdev;
+
+	struct mtk_scp *main_scp;
 };
 
 /**
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 1d17d77b8a14..f7b738743ba9 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -917,10 +917,29 @@ static int scp_probe(struct platform_device *pdev)
 		scp->l1tcm_phys = res->start;
 	}
 
-	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
-	if (IS_ERR(scp->reg_base))
-		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
-				     "Failed to parse and map cfg memory\n");
+	if (of_device_is_compatible(np, "mediatek,mt8195-scp-core")) {
+		struct device_node *pnp;
+		struct platform_device *scp_pdev;
+
+		pnp = of_get_parent(np);
+		if (!pnp)
+			return dev_err_probe(dev, -ENODEV, "Failed to get parent core 0\n");
+
+		scp_pdev = of_find_device_by_node(pnp);
+		of_node_put(pnp);
+		if (!scp_pdev)
+			return dev_err_probe(dev, -ENODEV, "Failed to get scp core 0 pdev\n");
+
+		scp->main_scp = platform_get_drvdata(scp_pdev);
+		scp->reg_base = scp->main_scp->reg_base;
+	} else {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
+		scp->reg_base = devm_ioremap_resource(dev, res);
+
+		if (IS_ERR(scp->reg_base))
+			return dev_err_probe(dev, PTR_ERR(scp->reg_base),
+					     "Failed to parse and map cfg memory\n");
+	}
 
 	ret = scp->data->scp_clk_get(scp);
 	if (ret)
-- 
2.18.0


