Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDA8C32771
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 03:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57HiwZHwI8xdSXKdKLB2V8JxOaDVDwgTdPhCY4HBtBw=; b=O5HEquQH1Unok1Xw7AxBkoIYgb
	VUsl7IdeM0KSC4kuLYez/LsmBhhVyTAwCCxNY53IkL0q/vjyUGh0FxFIpVUKAg/6rFIvgyz/UWzqX
	OQkn4U9lMLxUmKNq+lRToVy9C2G4DH7Az7/kTyub4Q7gNkriKGBXXi7pk9OVfmdDcmTJQr7UqAxdY
	2pvqWmRfSbVERGMOjN3p1vFeM9ZuRFoq9BUE+gf2N17ho2nBzdOyGKzHR7xVZndgsfV5nSqc4KFTx
	xSaP8n+C8c2pcpa14orXvjQ4Y7VZ1OX48fZNtDRrV22pBgIJ38x+ASpQMV3sNZ+oAc1wZsKbNlZ+f
	Sv6kXtcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0pA-0080Bp-JU; Tue, 27 Sep 2022 02:59:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0oO-007zrz-CZ; Tue, 27 Sep 2022 02:59:13 +0000
X-UUID: f37e750346e84f4099f742ad19cb1506-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=57HiwZHwI8xdSXKdKLB2V8JxOaDVDwgTdPhCY4HBtBw=;
	b=qdl/dpVnHrSfB2tOjyj69/ccBCJOs20TMBK22635a+eOM0XqgFUuogZAVeisbHbIF+mm9u3QQ0MJDYvuIb30EZ+3kfj5YBFSgjkm0Zl6v5GifbZdt/c5Tq7BrNJ+KHT3CsDpzPkprFPAwk0sswnKVePDo1YEByHDiv5WtqLeMdY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:bca258b0-3475-4d91-aac1-fe739a4dedec,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.11,REQID:bca258b0-3475-4d91-aac1-fe739a4dedec,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:39a5ff1,CLOUDID:c04051e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:2209271056309CTTLI63,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: f37e750346e84f4099f742ad19cb1506-20220926
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1069057496; Mon, 26 Sep 2022 19:59:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 27 Sep 2022 10:56:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Sep 2022 10:56:26 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, "Andrew-CT
 Chen" <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 08/11] remoteproc: mediatek: Control SCP core 1 boot by rproc subdevice
Date: Tue, 27 Sep 2022 10:56:03 +0800
Message-ID: <20220927025606.26673-9-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220927025606.26673-1-tinghan.shen@mediatek.com>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_195912_065638_C3BD6DDC 
X-CRM114-Status: GOOD (  17.40  )
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

Register SCP core 1 as a subdevice of core 0 to control the boot sequence
and watchdog handling. The core 1 has to boot after core 0 because the
SCP clock and SRAM power is controlled by SCP core 0.
When SCP core 0 reports a watchdog timeout event, the SRAM is emptied
before rebooting the SCP core 0, forcing the reload of the SCP core 1 image.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h |  8 ++++
 drivers/remoteproc/mtk_scp.c    | 71 +++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 54265c515315..dcde25f8bbf9 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -95,6 +95,13 @@ struct scp_ipi_desc {
 	void *priv;
 };
 
+struct scp_subdev_core {
+	struct rproc_subdev subdev;
+	struct mtk_scp *scp;
+};
+
+#define to_subdev_core(d) container_of(d, struct scp_subdev_core, subdev)
+
 struct mtk_scp;
 
 struct mtk_scp_of_data {
@@ -142,6 +149,7 @@ struct mtk_scp {
 	struct rproc_subdev *rpmsg_subdev;
 
 	struct mtk_scp *main_scp;
+	struct rproc_subdev *core_subdev;
 };
 
 /**
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index f7b738743ba9..2d43338b96da 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -871,6 +871,54 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 	}
 }
 
+static int scp_core_subdev_start(struct rproc_subdev *subdev)
+{
+	struct scp_subdev_core *subdev_core = to_subdev_core(subdev);
+	struct mtk_scp *scp = subdev_core->scp;
+
+	rproc_boot(scp->rproc);
+
+	return 0;
+}
+
+static void scp_core_subdev_stop(struct rproc_subdev *subdev, bool crashed)
+{
+	struct scp_subdev_core *subdev_core = to_subdev_core(subdev);
+	struct mtk_scp *scp = subdev_core->scp;
+
+	rproc_shutdown(scp->rproc);
+}
+
+static int scp_core_subdev_register(struct mtk_scp *scp)
+{
+	struct device *dev = scp->dev;
+	struct scp_subdev_core *subdev_core;
+
+	subdev_core = devm_kzalloc(dev, sizeof(*subdev_core), GFP_KERNEL);
+	if (!subdev_core) {
+		scp->core_subdev = NULL;
+		return -ENOMEM;
+	}
+
+	subdev_core->scp = scp;
+	subdev_core->subdev.start = scp_core_subdev_start;
+	subdev_core->subdev.stop = scp_core_subdev_stop;
+
+	scp->core_subdev = &subdev_core->subdev;
+	rproc_add_subdev(scp->main_scp->rproc, scp->core_subdev);
+
+	return 0;
+}
+
+static void scp_core_subdev_unregister(struct mtk_scp *scp)
+{
+	if (scp->core_subdev) {
+		rproc_remove_subdev(scp->main_scp->rproc, scp->core_subdev);
+		devm_kfree(scp->dev, to_subdev_core(scp->core_subdev));
+		scp->core_subdev = NULL;
+	}
+}
+
 static int scp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -974,6 +1022,23 @@ static int scp_probe(struct platform_device *pdev)
 		goto remove_subdev;
 	}
 
+	if (of_device_is_compatible(np, "mediatek,mt8195-scp-core")) {
+		ret = scp_core_subdev_register(scp);
+		if (ret) {
+			dev_err_probe(dev, ret, "Failed to register subdev\n");
+			goto remove_subdev;
+		}
+
+		/* sub cores are booted as subdevices of main core. */
+		rproc->auto_boot = false;
+	} else {
+		ret = devm_of_platform_populate(dev);
+		if (ret) {
+			dev_err_probe(dev, ret, "Failed to probe sub cores\n");
+			goto remove_subdev;
+		}
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_subdev;
@@ -981,6 +1046,7 @@ static int scp_probe(struct platform_device *pdev)
 	return 0;
 
 remove_subdev:
+	scp_core_subdev_unregister(scp);
 	scp_remove_rpmsg_subdev(scp);
 	scp_ipi_unregister(scp, SCP_IPI_INIT);
 release_dev_mem:
@@ -997,6 +1063,11 @@ static int scp_remove(struct platform_device *pdev)
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
 	int i;
 
+	if (of_device_is_compatible(scp->dev->of_node, "mediatek,mt8195-scp-core"))
+		scp_core_subdev_unregister(scp);
+	else
+		devm_of_platform_depopulate(scp->dev);
+
 	rproc_del(scp->rproc);
 	scp_remove_rpmsg_subdev(scp);
 	scp_ipi_unregister(scp, SCP_IPI_INIT);
-- 
2.18.0


