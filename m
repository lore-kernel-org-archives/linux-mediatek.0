Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3F5C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 04:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJFf4UqkEPOcLYt3DLx8HtQsPAkilJL1hZbjwl0w82s=; b=daniORZ63hNJ502Fc66r33asZ7
	rUkn7TusCnAJNnQMHmAg8LF354odKpkXh/heub9+7Uc12WDJ9ak4fSPZ4P7Esdhh9omiemnNsSmvT
	Ef7sMCoRWrC9pocxRD6C5WhcRj4b6mBflXNfbCXx58oeTYES7g+a0o0pOSYYGCNFEdjfoXZGX0bEW
	mLUbJvwy3fD2yTXObr49RxroU7HGAvHGfh7DZZraFAY1KXM1hfqkP26ICjG5FNe6NyRnWsIMk9fZC
	T8AKmUNLCsPa05zscryDVbIIIFhg0cQTI/TAaqO51oBaWR0Ig76jWDt2kdu8YCo47J1ufK8DKk2+s
	mNWUYSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz8tB-0087uk-1i;
	Wed, 17 May 2023 04:35:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz8t6-0087r6-0e;
	Wed, 17 May 2023 04:35:47 +0000
X-UUID: 44db5f30f46c11ed83ed1395ce914268-20230516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mJFf4UqkEPOcLYt3DLx8HtQsPAkilJL1hZbjwl0w82s=;
	b=WVLqJtF9cFoqmVcfsKUW3GptQbTKLqRNY93R2adOulu39PWz9hn2K6H9kLOFvIYFWR0mZFgZ1THLPcnHTOMp8Ykk/fLAW6k6EXQXRxAmvUUPQZt0X2RLHoiM+suUjQE5vj5GD8Dz9K02daILW8ncBOod35zBXLxzftu262hIReU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:144bf745-8fb2-414d-a44a-6bb620c931c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:ce5a6c3b-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 44db5f30f46c11ed83ed1395ce914268-20230516
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 767841378; Tue, 16 May 2023 21:35:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 12:35:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 12:35:34 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Tinghan Shen" <tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v12 07/11] remoteproc: mediatek: Control SCP core 1 by rproc subdevice
Date: Wed, 17 May 2023 12:34:45 +0800
Message-ID: <20230517043449.26352-8-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517043449.26352-1-tinghan.shen@mediatek.com>
References: <20230517043449.26352-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_213544_269933_60232D29 
X-CRM114-Status: GOOD (  18.18  )
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
 drivers/remoteproc/mtk_common.h |  9 ++++
 drivers/remoteproc/mtk_scp.c    | 88 +++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 56395e8664cb..85afed2e6928 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -100,6 +100,13 @@ struct mtk_scp_of_data {
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
@@ -130,6 +137,8 @@ struct mtk_scp {
 	struct rproc_subdev *rpmsg_subdev;
 
 	struct list_head elem;
+	struct list_head *cluster;
+	struct mtk_scp_core_subdev *core_subdev;
 };
 
 /**
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d644e232dfec..18534b1179b5 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -863,6 +863,60 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
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
 static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 				      struct mtk_scp_of_cluster *scp_cluster,
 				      const struct mtk_scp_of_data *of_data)
@@ -957,6 +1011,7 @@ static void scp_free(struct mtk_scp *scp)
 {
 	int i;
 
+	scp_core_subdev_unregister(scp);
 	scp_remove_rpmsg_subdev(scp);
 	scp_ipi_unregister(scp, SCP_IPI_INIT);
 	scp_unmap_memory_region(scp);
@@ -989,6 +1044,15 @@ static int scp_add_single_core(struct platform_device *pdev)
 	return 0;
 }
 
+static void scp_rproc_boot_callback(const struct firmware *fw, void *context)
+{
+	struct rproc *rproc = context;
+
+	rproc_boot(rproc);
+
+	release_firmware(fw);
+}
+
 static int scp_add_multi_core(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1029,6 +1093,20 @@ static int scp_add_multi_core(struct platform_device *pdev)
 			goto init_fail;
 		}
 
+		scp->cluster = cluster;
+		if (!list_empty(cluster)) {
+			ret = scp_core_subdev_register(scp);
+			if (ret) {
+				dev_err(dev, "Failed to register core %d as subdev\n", core_id);
+				of_node_put(child);
+				scp_free(scp);
+				goto init_fail;
+			}
+		}
+
+		/* boot after all cores finished rproc_add() */
+		scp->rproc->auto_boot = false;
+
 		ret = rproc_add(scp->rproc);
 		if (ret) {
 			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
@@ -1041,6 +1119,16 @@ static int scp_add_multi_core(struct platform_device *pdev)
 		core_id++;
 	}
 
+	/* boot core 0, and other cores are booted following core 0 as subdevices */
+	scp = list_first_entry(cluster, struct mtk_scp, elem);
+	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
+				      scp->rproc->firmware, &scp->rproc->dev, GFP_KERNEL,
+				      scp->rproc, scp_rproc_boot_callback);
+	if (ret < 0) {
+		dev_err(dev, "request_firmware_nowait err: %d\n", ret);
+		goto init_fail;
+	}
+
 	return 0;
 
 init_fail:
-- 
2.18.0


