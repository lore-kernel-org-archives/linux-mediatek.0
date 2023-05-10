Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F1BC7EE24
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 06:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2HwQXP5gcxmFdmc9DZ5hDZ3MeFnNJZxYWYbN2vHeWc=; b=Ik6XK8samd7Z/IZoQpWQGMGEOi
	6UyJc+cWHJlpxU1FeX9EbthTchw84L6TUhBeXlIdaKDCakgH8spmQQKo++q9N74P6aDg22+uW/c1e
	TO5z6jVtdq3I2Fj4f+kp3HQomTB41HBUOAtuYYAxwKKYeB7VVoopSSkw0z4EGDOdoBoevyzvYU493
	1RvPet5N+tbhwk6ukF3qui8eIDZDWQPecEB1IweEMSvoPujdoUpa4r37Wwg+NesQWNoAJgjFYYFcs
	X449EOAXC0KG3UCPTE0iLNDLqiAbiNbKD8irvXOT7UTUHXPznPAvvGNqzgHeWOqVnfRb4eHq4n1N5
	83jy66sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdTK-005Gdx-1M;
	Wed, 10 May 2023 06:38:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdTF-005GYl-0T;
	Wed, 10 May 2023 06:38:43 +0000
X-UUID: 4894a74aeefd11ed912e1518a6540028-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/2HwQXP5gcxmFdmc9DZ5hDZ3MeFnNJZxYWYbN2vHeWc=;
	b=TXNAWZoNmGE8M0hRlYhqIVWg/6Mp59EuzX/6fmLzn6t3h6IR0dEQujS2q55n/XrQ4CD7+wzyhEsXH6tygcSDpPek9nHLxcQiaWkRKY330f/RqwlsVHwv6R7zdJfqEsIDloh1iqYW0OTWB48mTlMhGtY7jUDD83aZ3WsR1Ta+XSc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:83f89b0e-8d3b-4c76-ac92-b999c15c3b46,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:178d4d4,CLOUDID:c7215dc0-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 4894a74aeefd11ed912e1518a6540028-20230509
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1698982518; Tue, 09 May 2023 23:38:33 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.194) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 14:37:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 14:37:58 +0800
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
Subject: [PATCH v11 07/11] remoteproc: mediatek: Control SCP core 1 by rproc subdevice
Date: Wed, 10 May 2023 14:37:45 +0800
Message-ID: <20230510063749.5127-8-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230510063749.5127-1-tinghan.shen@mediatek.com>
References: <20230510063749.5127-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_233841_186542_CE4D6896 
X-CRM114-Status: GOOD (  17.42  )
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
 drivers/remoteproc/mtk_scp.c    | 68 +++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

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
index 87215a0e145e..a88fdd46f614 100644
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
@@ -957,6 +1011,7 @@ static void scp_rproc_free(struct mtk_scp *scp)
 {
 	int i;
 
+	scp_core_subdev_unregister(scp);
 	scp_remove_rpmsg_subdev(scp);
 	scp_ipi_unregister(scp, SCP_IPI_INIT);
 	scp_unmap_memory_region(scp);
@@ -1009,6 +1064,7 @@ static int scp_cluster_init(struct platform_device *pdev)
 			return PTR_ERR(scp);
 
 		list_add_tail(&scp->elem, cluster);
+		scp->cluster = cluster;
 	} else {
 		dev_dbg(dev, "multi-core scp\n");
 
@@ -1038,6 +1094,7 @@ static int scp_cluster_init(struct platform_device *pdev)
 				goto init_fail;
 			}
 			list_add_tail(&scp->elem, cluster);
+			scp->cluster = cluster;
 			put_device(&cpdev->dev);
 
 			core_id++;
@@ -1045,6 +1102,17 @@ static int scp_cluster_init(struct platform_device *pdev)
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


