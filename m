Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BF6C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:03:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D2A64F45
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0D2A64F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yA1xQQ0w2UHfIAE+BhWv3dB8HY6Xws6R2UuQkMF7uzg=; b=Yxwq+t8WdMJWqovYyRp5KODayQ
	EhnfsNF6Qx9JBJzh3yBIHibhu6vmZwYnx1Oq/thMhhUl2dhIvcgPZbFVYXf4lBT5QhNHdTOCEMQEg
	0qMh10w7bUpdcKYsLUYHVGjQDH9aLhrJrRtxCHHBUtYfaUhet3+31a75/Mps5v7xSmznPKTDDL7TY
	A0NYAtNR9BMrtEi5YWIqxyg4OZsbHbcY5d2zYcAMAah5AobIyEWRdgm4FZZijjcQo0SLLQCS2RIuI
	OJyTq4nYUx3G675jZOIPppc98l7SO57tbwg4yNtzx/7Faa2o+YTI+u2HpXdESD5cpM++Ahkej+sYu
	AzL5HjIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6Mv-00E8T4-Tu; Fri, 05 Mar 2021 09:03:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6Mn-00E8QS-Sl; Fri, 05 Mar 2021 09:03:29 +0000
X-UUID: 76f1aeb89a174827ba1835b644fb3958-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/ocTw8TVIJplpXL3rvuCp+UfGwNF4InTPIn00RwEsbI=; 
 b=dMJ57gw/MfFDrFt2vi97vC7fX6v9Ipi4es7Lj+mMlJnQkFBQFGK3bCCYdotMAmLp4b2OG71EgvllFOnL256j4+Q5ZFndg7YPmktT0nDZuEP9InoTO7Ij/LTj1u3J6recDH1BDWXr4SospNLR1CYCSrBTdGGKgBfvsxwnsq7AEAI=;
X-UUID: 76f1aeb89a174827ba1835b644fb3958-20210305
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1601918145; Fri, 05 Mar 2021 01:03:17 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 01:03:15 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:14 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:13 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>, stable <stable@vger.kernel.org>
Subject: [PATCH 01/17] usb: xhci-mtk: remove or operator for setting schedule
 parameters
Date: Fri, 5 Mar 2021 17:02:39 +0800
Message-ID: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_090326_526713_8B83E514 
X-CRM114-Status: GOOD (  11.21  )
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

Side effect may happen if use or operator to set schedule parameters
when the parameters are already set before. Set them directly due to
other bits are reserved.

Fixes: 54f6a8af3722 ("usb: xhci-mtk: skip dropping bandwidth of unchecked endpoints")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index b45e5bf08997..5891f56c64da 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -643,7 +643,7 @@ int xhci_mtk_add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 		 */
 		if (usb_endpoint_xfer_int(&ep->desc)
 			|| usb_endpoint_xfer_isoc(&ep->desc))
-			ep_ctx->reserved[0] |= cpu_to_le32(EP_BPKTS(1));
+			ep_ctx->reserved[0] = cpu_to_le32(EP_BPKTS(1));
 
 		return 0;
 	}
@@ -730,10 +730,10 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 		list_move_tail(&sch_ep->endpoint, &sch_bw->bw_ep_list);
 
 		ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
-		ep_ctx->reserved[0] |= cpu_to_le32(EP_BPKTS(sch_ep->pkts)
+		ep_ctx->reserved[0] = cpu_to_le32(EP_BPKTS(sch_ep->pkts)
 			| EP_BCSCOUNT(sch_ep->cs_count)
 			| EP_BBM(sch_ep->burst_mode));
-		ep_ctx->reserved[1] |= cpu_to_le32(EP_BOFFSET(sch_ep->offset)
+		ep_ctx->reserved[1] = cpu_to_le32(EP_BOFFSET(sch_ep->offset)
 			| EP_BREPEAT(sch_ep->repeat));
 
 		xhci_dbg(xhci, " PKTS:%x, CSCOUNT:%x, BM:%x, OFFSET:%x, REPEAT:%x\n",
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
