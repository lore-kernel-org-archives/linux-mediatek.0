Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54A4C77B77
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 02:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ejR+XuzhyQVgZP+TJeLCfwXAB17U9qlUN9dfvgvCkck=; b=FI2LiqDzSpdEn4A8uUy3CzU2ou
	97ZzAam9QrEeB6icE6OrZwYdOSjiTsmaYXD9ZQurZK4lqtmwGwGjRu54iO/q9UW0CHydFHacH5tX8
	SIHx1nDmpXJXiV1bc6BfYT3CEbyIu2U5ho4shsrIZcsn4FozWfmT4efliZejVjQjnJNXfBRFtKXRi
	eEI3afDoLmApu1ftVEhh8aep2bRJ4wluYsoY0NZ06xM7DwLxltJ7K6Hue+SWuBILrpVoxmGi+y75O
	SmmYA+85wCjo/aP2X+wcW4xu9kcVRNOpduhMQtU1ViiWbVm+joniH3aLL+tNMgY6bZDVzzIIo0S+l
	ZqAlrmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poEyW-00EiUH-1o;
	Mon, 17 Apr 2023 02:52:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poEyT-00EiSf-12;
	Mon, 17 Apr 2023 02:52:14 +0000
X-UUID: d8093656dcca11ed8687db9d93187ff1-20230416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ejR+XuzhyQVgZP+TJeLCfwXAB17U9qlUN9dfvgvCkck=;
	b=CiWs7+3iWV4KsaTwoGgxYf+BSUTOO6lryBUFYloulVcG5QbkmggCTPA0Wzzos+nivP2Bl0twgbn3A1NZWUbzQvF8WraIrZI6KxrtrMjYGNNv1WVz3sq52E0pYORXDAXvdn4orBNLMq2Rgf7XUduG4fEKw5tubKCUx81J5pFONgk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:d2ff2d0b-0213-481a-9aa8-8237b57670f8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:a26386a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: d8093656dcca11ed8687db9d93187ff1-20230416
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1170913214; Sun, 16 Apr 2023 19:52:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 17 Apr 2023 10:52:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 17 Apr 2023 10:52:05 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tianping Fang
	<tianping.fang@mediatek.com>
Subject: [PATCH v3 1/7] usb: mtu3: give back request when rx error happens
Date: Mon, 17 Apr 2023 10:51:57 +0800
Message-ID: <20230417025203.18097-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_195213_363025_0616709E 
X-CRM114-Status: GOOD (  13.08  )
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

When the Rx enconnter errors, currently, only print error logs, that
may cause class driver's RX halt, shall give back the request with
error status meanwhile.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: no changes
v2: remove @req suggested by AngeloGioacchino
---
 drivers/usb/mtu3/mtu3_qmu.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
index a2fdab8b63b2..a4da1af0b2c0 100644
--- a/drivers/usb/mtu3/mtu3_qmu.c
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -466,6 +466,37 @@ static void qmu_tx_zlp_error_handler(struct mtu3 *mtu, u8 epnum)
 	mtu3_qmu_resume(mep);
 }
 
+/*
+ * when rx error happens (except zlperr), QMU will stop, and RQCPR saves
+ * the GPD encountered error, Done irq will arise after resuming QMU again.
+ */
+static void qmu_error_rx(struct mtu3 *mtu, u8 epnum)
+{
+	struct mtu3_ep *mep = mtu->out_eps + epnum;
+	struct mtu3_gpd_ring *ring = &mep->gpd_ring;
+	struct qmu_gpd *gpd_current = NULL;
+	struct mtu3_request *mreq;
+	dma_addr_t cur_gpd_dma;
+
+	cur_gpd_dma = read_rxq_cur_addr(mtu->mac_base, epnum);
+	gpd_current = gpd_dma_to_virt(ring, cur_gpd_dma);
+
+	mreq = next_request(mep);
+	if (!mreq || mreq->gpd != gpd_current) {
+		dev_err(mtu->dev, "no correct RX req is found\n");
+		return;
+	}
+
+	mreq->request.status = -EAGAIN;
+
+	/* by pass the current GDP */
+	gpd_current->dw0_info |= cpu_to_le32(GPD_FLAGS_BPS | GPD_FLAGS_HWO);
+	mtu3_qmu_resume(mep);
+
+	dev_dbg(mtu->dev, "%s EP%d, current=%p, req=%p\n",
+		__func__, epnum, gpd_current, mreq);
+}
+
 /*
  * NOTE: request list maybe is already empty as following case:
  * queue_tx --> qmu_interrupt(clear interrupt pending, schedule tasklet)-->
@@ -571,14 +602,18 @@ static void qmu_exception_isr(struct mtu3 *mtu, u32 qmu_status)
 
 	if ((qmu_status & RXQ_CSERR_INT) || (qmu_status & RXQ_LENERR_INT)) {
 		errval = mtu3_readl(mbase, U3D_RQERRIR0);
+		mtu3_writel(mbase, U3D_RQERRIR0, errval);
+
 		for (i = 1; i < mtu->num_eps; i++) {
 			if (errval & QMU_RX_CS_ERR(i))
 				dev_err(mtu->dev, "Rx %d CS error!\n", i);
 
 			if (errval & QMU_RX_LEN_ERR(i))
 				dev_err(mtu->dev, "RX %d Length error\n", i);
+
+			if (errval & (QMU_RX_CS_ERR(i) | QMU_RX_LEN_ERR(i)))
+				qmu_error_rx(mtu, i);
 		}
-		mtu3_writel(mbase, U3D_RQERRIR0, errval);
 	}
 
 	if (qmu_status & RXQ_ZLPERR_INT) {
-- 
2.18.0


