Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AC0C4332B
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:53:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0343765155
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0343765155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ycc9kuKdxfgONsFkXEtwSCkQR1jYEUfG1gqHlOXuBmQ=; b=awW24kuM1OFyTFGPX4sCZ0A5e
	Gqz9pcCu21qiyr4FAZTen1BeqfLvkm/0+4JLmL8L3RhfTC5SGExhN0vAcmvxzLoQPHLBKiCm25oIU
	S/0gqs3Cg3QteRdc1PgT9dFhydgxyq0q/CquRudXkEGdFFUVE0ITIDjZ3mCayUYPO9IUTnFOOP1ts
	6Y5M9Ori1pBDFLr/gIUx8E3g+rIESGWRvs0i3CbH92ofqfdGe2sW9c6jLyaSRv9D7KGn95CD5hIg0
	7nPS5P/hDoMeGFRi54/Y8lJrTRIhM3L+4yVUndD3yG722Lg83z0EIhbZrt1wHqn5VPnEs6wGLIU+A
	vjhxqki8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ61J-00EdTT-CU; Mon, 08 Mar 2021 02:53:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ60n-00Ed9c-Pv; Mon, 08 Mar 2021 02:52:52 +0000
X-UUID: 58de9419755647d9a3b52d416a72b88f-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Tbr/HSU+V19hAp8rYJPpWRvU/5IrRu6cDacMSq740ho=; 
 b=cTBsbxPjzIRawJlwqUl+motBIzmuLpIA5NOgfnDPaVGLp9jSdBC9W2AHJIdOjnyDG14bObr8C7DaLIpOBH7VQXwosGPcmEbcK5kBbvcrHpBef9+C4lELkrp+vvZU329iSXKZZip76gIGIUkdmeEajdaO8Uxn9Iw+gVymJVbqayY=;
X-UUID: 58de9419755647d9a3b52d416a72b88f-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1333345770; Sun, 07 Mar 2021 18:52:35 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:52:25 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 10:52:24 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:52:23 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 12/18] usb: xhci-mtk: rebuild the way to get bandwidth
 domain
Date: Mon, 8 Mar 2021 10:52:01 +0800
Message-ID: <de618970301702c57bd352bf87df48bc17c699dd.1615170625.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_025250_590023_D0CCE0A0 
X-CRM114-Status: GOOD (  14.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rebuild the function get_bw_index(), get the bandwidth domain
directly instead its index of domain array.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/host/xhci-mtk-sch.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index bad99580fb68..9e77bbd8e7f7 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -57,7 +57,7 @@ static u32 get_bw_boundary(enum usb_device_speed speed)
 }
 
 /*
-* get the index of bandwidth domains array which @ep belongs to.
+* get the bandwidth domain which @ep belongs to.
 *
 * the bandwidth domain array is saved to @sch_array of struct xhci_hcd_mtk,
 * each HS root port is treated as a single bandwidth domain,
@@ -68,9 +68,11 @@ static u32 get_bw_boundary(enum usb_device_speed speed)
 * so the bandwidth domain array is organized as follow for simplification:
 * SSport0-OUT, SSport0-IN, ..., SSportX-OUT, SSportX-IN, HSport0, ..., HSportY
 */
-static int get_bw_index(struct xhci_hcd *xhci, struct usb_device *udev,
-	struct usb_host_endpoint *ep)
+static struct mu3h_sch_bw_info *
+get_bw_info(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
+	    struct usb_host_endpoint *ep)
 {
+	struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
 	struct xhci_virt_device *virt_dev;
 	int bw_index;
 
@@ -86,7 +88,7 @@ static int get_bw_index(struct xhci_hcd *xhci, struct usb_device *udev,
 		bw_index = virt_dev->real_port + xhci->usb3_rhub.num_ports - 1;
 	}
 
-	return bw_index;
+	return &mtk->sch_array[bw_index];
 }
 
 static u32 get_esit(struct xhci_ep_ctx *ep_ctx)
@@ -722,14 +724,11 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
 	struct xhci_hcd *xhci;
 	struct xhci_virt_device *virt_dev;
-	struct mu3h_sch_bw_info *sch_array;
 	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep, *tmp;
-	int bw_index;
 
 	xhci = hcd_to_xhci(hcd);
 	virt_dev = xhci->devs[udev->slot_id];
-	sch_array = mtk->sch_array;
 
 	xhci_dbg(xhci, "%s() type:%d, speed:%d, mpks:%d, dir:%d, ep:%p\n",
 		__func__, usb_endpoint_type(&ep->desc), udev->speed,
@@ -739,8 +738,7 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	if (!need_bw_sch(ep, udev->speed, !!virt_dev->tt_info))
 		return;
 
-	bw_index = get_bw_index(xhci, udev, ep);
-	sch_bw = &sch_array[bw_index];
+	sch_bw = get_bw_info(mtk, udev, ep);
 
 	list_for_each_entry_safe(sch_ep, tmp, &sch_bw->bw_ep_list, endpoint) {
 		if (sch_ep->ep == ep) {
@@ -758,13 +756,12 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 	struct xhci_virt_device *virt_dev = xhci->devs[udev->slot_id];
 	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep, *tmp;
-	int bw_index, ret;
+	int ret;
 
 	xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
 
 	list_for_each_entry(sch_ep, &mtk->bw_ep_chk_list, endpoint) {
-		bw_index = get_bw_index(xhci, udev, sch_ep->ep);
-		sch_bw = &mtk->sch_array[bw_index];
+		sch_bw = get_bw_info(mtk, udev, sch_ep->ep);
 
 		ret = check_sch_bw(sch_bw, sch_ep);
 		if (ret) {
@@ -778,9 +775,7 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 		struct usb_host_endpoint *ep = sch_ep->ep;
 		unsigned int ep_index = xhci_get_endpoint_index(&ep->desc);
 
-		bw_index = get_bw_index(xhci, udev, ep);
-		sch_bw = &mtk->sch_array[bw_index];
-
+		sch_bw = get_bw_info(mtk, udev, ep);
 		list_move_tail(&sch_ep->endpoint, &sch_bw->bw_ep_list);
 
 		ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
@@ -805,13 +800,11 @@ void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct mu3h_sch_bw_info *sch_bw;
 	struct mu3h_sch_ep_info *sch_ep, *tmp;
-	int bw_index;
 
 	xhci_dbg(xhci, "%s() udev %s\n", __func__, dev_name(&udev->dev));
 
 	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_chk_list, endpoint) {
-		bw_index = get_bw_index(xhci, udev, sch_ep->ep);
-		sch_bw = &mtk->sch_array[bw_index];
+		sch_bw = get_bw_info(mtk, udev, sch_ep->ep);
 		destroy_sch_ep(udev, sch_bw, sch_ep);
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
