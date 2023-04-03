Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B912C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 02:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJGkgTRFlWvbPOn9hkUBqrXn/21qw2rzlQf9iREA0ho=; b=jo6elmCc4VM4pVv/uXfV/iAYa2
	+WQaIVGhusSYc71Oyq31JOQoNXOybrNLVxm2N5FuUOHBo/jufpHRlPjkyaMvrOKNNYcGGjyVSqOE7
	IWZlRVLQ5tU+7s4X6kdj74+No9kV5/vGGb2ycO1rgAq67kJY63eaCTksYZdGbI1Y/pSRkIfdOi7Hi
	MpNqfL+38yE1pN5RExXpxVXNlyMUSpHutkZSFOOerviq1+6qzcPUB7PNC4cJFm3a2bbgHTHxdnc2t
	tjI1dfd8AW7IOWQxZH18TnqLp+2n2zvF/hd05WNvOLpDePfvhTTej+87nm5gcJC03pwEESjxjlfgN
	3ljnpB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjAMd-00DzK9-2B;
	Mon, 03 Apr 2023 02:56:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjAMa-00DzIy-1y;
	Mon, 03 Apr 2023 02:56:09 +0000
X-UUID: 962d54e8d1ca11edb7d8d11f642b8e78-20230402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XJGkgTRFlWvbPOn9hkUBqrXn/21qw2rzlQf9iREA0ho=;
	b=V6EcRFEjapQncSMp+omsVjPUOvhZsXFPeHVryOLqwtPXw+UNLvlJTMjQWgORgUzseK9KEb38bxAxXNz08pOGssZfUBMy5sK3RPXoDNEgrvKwOC5G95vrYya5G5mf8RIDSw5iF1rU3OhUUAQab/aiUazA7LrY4rQgpfJkflGrVak=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:20e8fd9b-a12b-4456-8973-43df44b64e0e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:120426c,CLOUDID:b84eabf7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 962d54e8d1ca11edb7d8d11f642b8e78-20230402
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1348700176; Sun, 02 Apr 2023 19:52:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 3 Apr 2023 10:52:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 3 Apr 2023 10:52:33 +0800
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
Subject: [PATCH 3/7] usb: mtu3: fix KE at qmu transfer done irq handler
Date: Mon, 3 Apr 2023 10:52:26 +0800
Message-ID: <20230403025230.25035-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_195608_656306_D6A8F2C2 
X-CRM114-Status: GOOD (  12.62  )
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

When handle qmu transfer irq, it will unlock @mtu->lock before give back
request, if another thread hanlde disconnect event at the same time, and
try to disable ep, it may lock @mtu->lock and free qmu ring, then qmu
irq hanlder may get a NULL gpd, avoid the KE by checking gpd's value before
handling it.

e.g.
qmu done irq on cpu0                 thread running on cpu1

qmu_done_tx()
  handle gpd [0]
    mtu3_requ_complete()        mtu3_gadget_ep_disable()
      unlock @mtu->lock
        give back request         lock @mtu->lock
                                    mtu3_ep_disable()
                                      mtu3_gpd_ring_free()
                                   unlock @mtu->lock
      lock @mtu->lock
    get next gpd [1]

[1]: goto [0] to handle next gpd, and next gpd may be NULL.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_qmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
index 66639f602a9d..3146a112141f 100644
--- a/drivers/usb/mtu3/mtu3_qmu.c
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -210,6 +210,7 @@ static struct qmu_gpd *advance_enq_gpd(struct mtu3_gpd_ring *ring)
 	return ring->enqueue;
 }
 
+/* @dequeue may be NULL if ring is unallocated or freed */
 static struct qmu_gpd *advance_deq_gpd(struct mtu3_gpd_ring *ring)
 {
 	if (ring->dequeue < ring->end)
@@ -524,7 +525,7 @@ static void qmu_done_tx(struct mtu3 *mtu, u8 epnum)
 	dev_dbg(mtu->dev, "%s EP%d, last=%p, current=%p, enq=%p\n",
 		__func__, epnum, gpd, gpd_current, ring->enqueue);
 
-	while (gpd != gpd_current && !GET_GPD_HWO(gpd)) {
+	while (gpd && gpd != gpd_current && !GET_GPD_HWO(gpd)) {
 
 		mreq = next_request(mep);
 
@@ -563,7 +564,7 @@ static void qmu_done_rx(struct mtu3 *mtu, u8 epnum)
 	dev_dbg(mtu->dev, "%s EP%d, last=%p, current=%p, enq=%p\n",
 		__func__, epnum, gpd, gpd_current, ring->enqueue);
 
-	while (gpd != gpd_current && !GET_GPD_HWO(gpd)) {
+	while (gpd && gpd != gpd_current && !GET_GPD_HWO(gpd)) {
 
 		mreq = next_request(mep);
 
-- 
2.18.0


