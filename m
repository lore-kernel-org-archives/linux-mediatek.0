Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD2CC76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 02:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ALgZrn1BexLA8a2KpVf+yoJ+e6iJZj9wJZnsbHFyjZg=; b=ppmd3TsrSq+FM92ryFIHKeItlD
	5u10y/WwJ76HbvlJNUq4fkCb1g1Myu+IuYu4f/YQKTH8QEiMUzwqC1Cd/U8IuEG+6Yo6zpAwZc/8W
	EgohudS2le+idGTfD1pf/mmrFcGV3fjZ/LFqtdKgp9Xc4fsi4O2iU5s6CnT53M1z+L3h/eW6MMC0E
	B+PpLP294SYpFoQ+xmPzSm6Pt+b2xCtC/fqBBANC0BpQAgdtCrWFL3FUDQzGyZX27cyppihi6t0dS
	QasPjxtZIujpQiy1m9oV8zGA5j0k0oEX6hRlVNG75DRS8fpf3H04LHkTgUhd3Tyzrf+AzkpAbH2X7
	4YsHNCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjAMf-00DzKj-0D;
	Mon, 03 Apr 2023 02:56:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjAMb-00DzJT-1Q;
	Mon, 03 Apr 2023 02:56:10 +0000
X-UUID: 95caa6b8d1ca11edb7d8d11f642b8e78-20230402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ALgZrn1BexLA8a2KpVf+yoJ+e6iJZj9wJZnsbHFyjZg=;
	b=lwgNW+v9gxULRQ6Wgc+twwdm0GwEG/KpQ9vM9CAkCiOj3iAzq8hMA/L8voQi2Nhj64EXSBjh7Y5ejMIUBfpL+FmvEa5GgfDpO/pVAQ9WPbG/E+yqvk1WMLGu4KinXWtAK2Fxs0atUwiA1DDRXZ7OZN3h1Q7++430cewzwShQopg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:0acbd39b-b7cf-4bae-a347-d6240e7272b2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:c38f1db5-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 95caa6b8d1ca11edb7d8d11f642b8e78-20230402
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1389306290; Sun, 02 Apr 2023 19:52:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 3 Apr 2023 10:52:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 3 Apr 2023 10:52:31 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, Tianping Fang <tianping.fang@mediatek.com>
Subject: [PATCH 1/7] usb: mtu3: give back request when rx error happens
Date: Mon, 3 Apr 2023 10:52:24 +0800
Message-ID: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_195609_480447_D7531988 
X-CRM114-Status: GOOD (  12.48  )
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
 drivers/usb/mtu3/mtu3_qmu.c | 39 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
index a2fdab8b63b2..7be4e4be1a6a 100644
--- a/drivers/usb/mtu3/mtu3_qmu.c
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -466,6 +466,39 @@ static void qmu_tx_zlp_error_handler(struct mtu3 *mtu, u8 epnum)
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
+	struct usb_request *req = NULL;
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
+	req = &mreq->request;
+	req->status = -EAGAIN;
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
@@ -571,14 +604,18 @@ static void qmu_exception_isr(struct mtu3 *mtu, u32 qmu_status)
 
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


