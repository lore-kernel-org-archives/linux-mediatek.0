Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7091C64ED8
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 04:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eu8elOHJoMSpyfIFgkpVLbq2Zh/DAsT6JWZxs5+FvSM=; b=QZ6oFrZJ0jHWQqljsnnQRqTTZI
	P8C8NnFqXRVpChaFLF5GWLMYZDrvALZdmgfBqFYt+BxT8Fx6n4ZrdIAlr7FVmZaoB8W4GBZAaiewn
	3TDnq6CwxOeyrrICVf1xrPO/0bIhHEpxExYig/CUayXHMemNwi8KGWU3pl6LgqHrECccoNs6nLAC6
	W8Wt5cu2O32qHeW9t/LlG4BoNm79ljzrDWbFSBEOEnSm1ICO0L70k/w3/GGi5wLe9NKUMbMKD9l8J
	aOQIaAPxwIuessGCa8u5oQxsQQAnNuQI9+SMbOS0clM+4puMayKMS63UjN7+8R9UYhBMOJXOFkgX2
	crSWXAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS9AR-004aSo-6b; Wed, 15 Feb 2023 04:13:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS9AK-004aOv-VJ; Wed, 15 Feb 2023 04:13:12 +0000
X-UUID: 0a05b440ace711edbbe3f76fe852e059-20230214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eu8elOHJoMSpyfIFgkpVLbq2Zh/DAsT6JWZxs5+FvSM=;
	b=T32EgXHX46kneK0R4tzpCofM23CIwsCOPb9ktfed/N1YW4icBJuyvuQyZaPbM5VQDqGtoU97DD03/uk0h+Y/DEtNLi+bf3KjYvZl5qG9PRrzaPkKjkvsO1XFuABiG69R8Nv20MDlwIsQqccfT3QR/MtgiAIqynoomELssmo3q9w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:ee70a0d7-2409-40a6-8aa8-a18f52fc26f7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:031a7cb0-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 0a05b440ace711edbbe3f76fe852e059-20230214
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2058298235; Tue, 14 Feb 2023 21:13:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 15 Feb 2023 12:12:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 15 Feb 2023 12:12:59 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 08/12] remoteproc: mediatek: Control SCP core 1 by rproc subdevice
Date: Wed, 15 Feb 2023 12:12:53 +0800
Message-ID: <20230215041257.14548-9-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230215041257.14548-1-tinghan.shen@mediatek.com>
References: <20230215041257.14548-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_201309_638960_2FD4CDE3 
X-CRM114-Status: GOOD (  15.69  )
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

Register SCP core 1 as a subdevice of core 0 for the boot sequence
and watchdog timeout handling. The core 1 has to boot after core 0
because the SCP clock and SRAM power is controlled by SCP core 0.
As for watchdog timeout handling, the remoteproc framework helps to
stop/start subdevices automatically when SCP driver receives watchdog
timeout event.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_common.h |  9 +++++
 drivers/remoteproc/mtk_scp.c    | 66 +++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 7821cb15d6fd..d333cefc29da 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -112,6 +112,13 @@ struct mtk_scp_of_data {
 	size_t ipi_buf_offset;
 };
 
+struct mtk_scp_core_subdev {
+	struct rproc_subdev subdev;
+	struct mtk_scp *scp;
+};
+
+#define to_core_subdev(d) container_of(d, struct mtk_scp_core_subdev, subdev)
+
 struct mtk_scp {
 	struct device *dev;
 	struct rproc *rproc;
@@ -144,6 +151,8 @@ struct mtk_scp {
 	struct list_head elem;
 	struct list_head cluster_cores;
 	struct list_head *cluster;
+
+	struct mtk_scp_core_subdev *core_subdev;
 };
 
 /**
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 6588e5acb159..be995c88d333 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -861,6 +861,60 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 	}
 }
 
+static int scp_core_subdev_start(struct rproc_subdev *subdev)
+{
+	struct mtk_scp_core_subdev *core_subdev = to_core_subdev(subdev);
+	struct mtk_scp *scp = core_subdev->scp;
+
+	rproc_boot(scp->rproc);
+
+	return 0;
+}
+
+static void scp_core_subdev_stop(struct rproc_subdev *subdev, bool crashed)
+{
+	struct mtk_scp_core_subdev *core_subdev = to_core_subdev(subdev);
+	struct mtk_scp *scp = core_subdev->scp;
+
+	rproc_shutdown(scp->rproc);
+}
+
+static int scp_core_subdev_register(struct mtk_scp *scp)
+{
+	struct device *dev = scp->dev;
+	struct mtk_scp_core_subdev *core_subdev;
+	struct mtk_scp *scp_c0;
+
+	scp_c0 = list_first_entry(scp->cluster, struct mtk_scp, elem);
+	if (!scp_c0)
+		return -ENODATA;
+
+	core_subdev = devm_kzalloc(dev, sizeof(*core_subdev), GFP_KERNEL);
+	if (!core_subdev)
+		return -ENOMEM;
+
+	core_subdev->scp = scp;
+	core_subdev->subdev.start = scp_core_subdev_start;
+	core_subdev->subdev.stop = scp_core_subdev_stop;
+
+	scp->core_subdev = core_subdev;
+	rproc_add_subdev(scp_c0->rproc, &scp->core_subdev->subdev);
+
+	return 0;
+}
+
+static void scp_core_subdev_unregister(struct mtk_scp *scp)
+{
+	struct mtk_scp *scp_c0;
+
+	if (scp->core_subdev) {
+		scp_c0 = list_first_entry(scp->cluster, struct mtk_scp, elem);
+		rproc_remove_subdev(scp_c0->rproc, &scp->core_subdev->subdev);
+		devm_kfree(scp->dev, scp->core_subdev);
+		scp->core_subdev = NULL;
+	}
+}
+
 static int scp_rproc_init(struct platform_device *pdev,
 			  struct mtk_scp_of_regs *of_regs,
 			  const struct mtk_scp_of_data *of_data,
@@ -958,6 +1012,7 @@ static void scp_rproc_free(struct mtk_scp *scp)
 {
 	int i;
 
+	scp_core_subdev_unregister(scp);
 	scp_remove_rpmsg_subdev(scp);
 	scp_ipi_unregister(scp, SCP_IPI_INIT);
 	scp_unmap_memory_region(scp);
@@ -1034,6 +1089,17 @@ static int scp_cluster_init(struct platform_device *pdev,
 	}
 
 	list_for_each_entry_safe_reverse(scp, temp, cluster, elem) {
+		if (!list_is_first(&scp->elem, cluster)) {
+			ret = scp_core_subdev_register(scp);
+			if (ret) {
+				dev_err_probe(scp->dev, ret, "Failed to register as subdev\n");
+				goto add_fail;
+			}
+
+			/* sub cores are booted as subdevices of core 0 */
+			scp->rproc->auto_boot = false;
+		}
+
 		ret = rproc_add(scp->rproc);
 		if (ret)
 			goto add_fail;
-- 
2.18.0


