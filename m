Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F4BC7EE29
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlE584fy39I0qBsOEWRrSmdIkj6DrWt65e882reYtWQ=; b=xsciyfjxPwiV8P2+70EB+MI66w
	aaTq0RDsFm13WPLOEUVDiLfuuZDEsUIAWL4K26CHBjz7+YjB5GZ9igQ8SNRyb7yOKkL0UE/VOisyw
	GXIucGgoBOmMT4wXKqTZxvgOIQtfY9+Gujrmto6qpsB/88My7wqJG5d6xXboB/yVSOIrJUCk1NiNk
	bK1VvrlpkqlVFFUAXq8eecKBY435owIQpba850AHvMj8nQHKur/GwdMYKAlW0s6uCuS4Y36wMgCBv
	ZEbvRDfSDkbu8EHDdbqmINt8AguXi05W1PpxUjwUUv/RgJanproiLfiMpXKADfy06pkIew+clCCgv
	SbNHC1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nWB-004iSQ-08;
	Wed, 07 Jun 2023 07:23:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nW6-004iNX-0j;
	Wed, 07 Jun 2023 07:23:39 +0000
X-UUID: 32b4f368050411ee912e1518a6540028-20230607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xlE584fy39I0qBsOEWRrSmdIkj6DrWt65e882reYtWQ=;
	b=CEw0mrQpu9ipGGZvXs3lZDAsR5NP2SisPyV/tDxk/i+DwTDrgc2uqYFHkuuCPoZstkIF1qZs93JvImSP5gb/GT/DF0yDkXvnTaupnEPFviD0DUO2tDkO/W+knvK+rWI8sZxTCOEnwLGeMzIj2eSC7Xv5I+boGbiAvKrpgPALqBc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:9767f7f2-be05-4902-a7b8-9615112225a0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:3368d63d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 32b4f368050411ee912e1518a6540028-20230607
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1891435062; Wed, 07 Jun 2023 00:23:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Jun 2023 15:22:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Jun 2023 15:22:24 +0800
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
Subject: [PATCH v13 07/11] remoteproc: mediatek: Add scp_boot_peers and scp_shutdown_peers operations
Date: Wed, 7 Jun 2023 15:22:18 +0800
Message-ID: <20230607072222.8628-8-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230607072222.8628-1-tinghan.shen@mediatek.com>
References: <20230607072222.8628-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_002338_280177_41F1B75E 
X-CRM114-Status: GOOD (  18.77  )
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

Due to that SCP core 0 controls the SCP clock and SRAM power, add two
new mtk_scp_of_data operations, scp_boot_peers and scp_shutdown_peers,
to manage the boot sequence and watchdog timeout handling of SCP core 1.
It ensures that core 1 boots after or shuts down before core 0 for
maintaining the proper control flow over SCP core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h |  3 ++
 drivers/remoteproc/mtk_scp.c    | 55 +++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 56395e8664cb..0bfd242c41cc 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -93,6 +93,8 @@ struct mtk_scp_of_data {
 	void (*scp_reset_deassert)(struct mtk_scp *scp);
 	void (*scp_stop)(struct mtk_scp *scp);
 	void *(*scp_da_to_va)(struct mtk_scp *scp, u64 da, size_t len);
+	void (*scp_boot_peers)(struct mtk_scp *scp);
+	void (*scp_shutdown_peers)(struct mtk_scp *scp);
 
 	u32 host_to_scp_reg;
 	u32 host_to_scp_int_bit;
@@ -130,6 +132,7 @@ struct mtk_scp {
 	struct rproc_subdev *rpmsg_subdev;
 
 	struct list_head elem;
+	struct list_head *cluster;
 };
 
 /**
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d644e232dfec..edbf71f4c21e 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -74,8 +74,21 @@ void scp_put(struct mtk_scp *scp)
 }
 EXPORT_SYMBOL_GPL(scp_put);
 
+static void mt8195_scp_shutdown_peers(struct mtk_scp *scp)
+{
+	struct mtk_scp *next_scp;
+
+	next_scp = list_next_entry(scp, elem);
+	list_for_each_entry_from(next_scp, scp->cluster, elem) {
+		rproc_shutdown(next_scp->rproc);
+	}
+}
+
 static void scp_wdt_handler(struct mtk_scp *scp, u32 scp_to_host)
 {
+	if (scp->data->scp_shutdown_peers)
+		scp->data->scp_shutdown_peers(scp);
+
 	dev_err(scp->dev, "SCP watchdog timeout! 0x%x", scp_to_host);
 	rproc_report_crash(scp->rproc, RPROC_WATCHDOG);
 }
@@ -539,6 +552,18 @@ static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static void mt8195_scp_boot_peers(struct mtk_scp *scp)
+{
+	struct mtk_scp *next_scp;
+
+	if (scp->cluster && !list_empty(scp->cluster)) {
+		next_scp = list_next_entry(scp, elem);
+		list_for_each_entry_from(next_scp, scp->cluster, elem) {
+			rproc_boot(next_scp->rproc);
+		}
+	}
+}
+
 static int scp_start(struct rproc *rproc)
 {
 	struct mtk_scp *scp = rproc->priv;
@@ -574,6 +599,9 @@ static int scp_start(struct rproc *rproc)
 	clk_disable_unprepare(scp->clk);
 	dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
 
+	if (scp->data->scp_boot_peers)
+		scp->data->scp_boot_peers(scp);
+
 	return 0;
 
 stop:
@@ -977,6 +1005,8 @@ static int scp_add_single_core(struct platform_device *pdev)
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
+	scp->cluster = cluster;
+
 	ret = rproc_add(scp->rproc);
 	if (ret) {
 		dev_err(dev, "Failed to add rproc\n");
@@ -989,6 +1019,15 @@ static int scp_add_single_core(struct platform_device *pdev)
 	return 0;
 }
 
+static void scp_rproc_boot_core0(const struct firmware *fw, void *context)
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
@@ -1029,6 +1068,10 @@ static int scp_add_multi_core(struct platform_device *pdev)
 			goto init_fail;
 		}
 
+		/* boot after all cores are discovered */
+		scp->rproc->auto_boot = false;
+		scp->cluster = cluster;
+
 		ret = rproc_add(scp->rproc);
 		if (ret) {
 			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
@@ -1041,6 +1084,16 @@ static int scp_add_multi_core(struct platform_device *pdev)
 		core_id++;
 	}
 
+	/* boot core 0, and other cores are booted following core 0 */
+	scp = list_first_entry(cluster, struct mtk_scp, elem);
+	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
+				      scp->rproc->firmware, &scp->rproc->dev, GFP_KERNEL,
+				      scp->rproc, scp_rproc_boot_core0);
+	if (ret < 0) {
+		dev_err(dev, "request_firmware_nowait err: %d\n", ret);
+		goto init_fail;
+	}
+
 	return 0;
 
 init_fail:
@@ -1198,6 +1251,8 @@ static const struct mtk_scp_of_data mt8195_of_data = {
 	.scp_reset_deassert = mt8192_scp_reset_deassert,
 	.scp_stop = mt8195_scp_stop,
 	.scp_da_to_va = mt8192_scp_da_to_va,
+	.scp_boot_peers = mt8195_scp_boot_peers,
+	.scp_shutdown_peers = mt8195_scp_shutdown_peers,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
-- 
2.18.0


