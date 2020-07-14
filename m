Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6914AC433EA
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:01:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363BB21927
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1jDx0c2h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rJ8uNTvE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 363BB21927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U+a8SwVi9k6ql/OdhYYN8+jf52HuMbE8Wam9C96ORJw=; b=1jDx0c2hz6P767M9ywrHC5F71
	Fa2S3G0BnKjBJbbEZmNe7m4JLH3Bm1u608Td1OXfyEzV7ppsq+yaXltf3oIgFMZhAqPFFgE95yz24
	WFweyzvbn7vuezou96H8wejv2Fq8TeJQLwoBbHde5cOcEisxSt9SdGmb/P31Hxj8oFQ03THAUv2Em
	dX/h9WZR3C866IgnwfeGa/DVlGi0YVawwSK083EI+su0N95qFknF5Ftvu/iIK+dFQKnIRD8hsgxfL
	0vQ5FbrkAjdizaIu4XbXKs2G7ZuTfj0cCCCF7XPNrDHFPAKg5kIq2pcaYR8/HOSAjpP6NMdIVMjnB
	XWL3B6vew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvGoG-0000Gs-U8; Tue, 14 Jul 2020 09:01:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvGnu-0008Uo-Bm; Tue, 14 Jul 2020 09:00:47 +0000
X-UUID: 7cc272bd58a54901a4e7a9a795cf61e1-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5YIqALVMFuugFeMVZxDIGwn9ZO0g/zjUVYWtoDp2XUU=; 
 b=rJ8uNTvEb2FVJfMOclrNIpmz8mtc5vPy3xQREbea1Zgr5I5aAo6N0lfVAsNyAj/UTWiMx1pcXO/KUfmW0LdqWSff7h1yy0icdP8esj9cylR06BcWH/0z0YDv4KJeK+w6psTLg94xMOfjXY0bPyjaDfNanj8/u4zXQBJ4MZguGg8=;
X-UUID: 7cc272bd58a54901a4e7a9a795cf61e1-20200714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 591988911; Tue, 14 Jul 2020 01:00:42 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 01:50:38 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 16:50:33 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 16:50:32 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/9] usb: gadget: bdc: fix warning of embedded function name
Date: Tue, 14 Jul 2020 16:48:47 +0800
Message-ID: <1594716535-24699-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B8BC00DA040CFB3893839AA7B26C0A0BCC92D12777F3A9402E5ACB1AB69B73CE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_050046_601287_F56EF956 
X-CRM114-Status: GOOD (  11.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use '"%s...", __func__' to replace embedded function name

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/gadget/udc/bdc/bdc_dbg.c | 2 +-
 drivers/usb/gadget/udc/bdc/bdc_ep.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_dbg.c b/drivers/usb/gadget/udc/bdc/bdc_dbg.c
index 7ba7448..9c03e13 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_dbg.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_dbg.c
@@ -68,7 +68,7 @@ void bdc_dbg_srr(struct bdc *bdc, u32 srr_num)
 
 	sr = bdc->srr.sr_bds;
 	addr = bdc->srr.dma_addr;
-	dev_vdbg(bdc->dev, "bdc_dbg_srr sr:%p dqp_index:%d\n",
+	dev_vdbg(bdc->dev, "%s sr:%p dqp_index:%d\n", __func__,
 						sr, bdc->srr.dqp_index);
 	for (i = 0; i < NUM_SR_ENTRIES; i++) {
 		sr = &bdc->srr.sr_bds[i];
diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index c573e9e..0c44002 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -756,7 +756,7 @@ static int ep_dequeue(struct bdc_ep *ep, struct bdc_req *req)
 
 	dev_dbg(bdc->dev, "%s ep:%s start:%d end:%d\n",
 					__func__, ep->name, start_bdi, end_bdi);
-	dev_dbg(bdc->dev, "ep_dequeue ep=%p ep->desc=%p\n",
+	dev_dbg(bdc->dev, "%s ep=%p ep->desc=%p\n", __func__,
 						ep, (void *)ep->usb_ep.desc);
 	/* Stop the ep to see where the HW is ? */
 	ret = bdc_stop_ep(bdc, ep->ep_num);
@@ -1853,12 +1853,12 @@ static int bdc_gadget_ep_enable(struct usb_ep *_ep,
 	int ret;
 
 	if (!_ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT) {
-		pr_debug("bdc_gadget_ep_enable invalid parameters\n");
+		pr_debug("%s invalid parameters\n", __func__);
 		return -EINVAL;
 	}
 
 	if (!desc->wMaxPacketSize) {
-		pr_debug("bdc_gadget_ep_enable missing wMaxPacketSize\n");
+		pr_debug("%s missing wMaxPacketSize\n", __func__);
 		return -EINVAL;
 	}
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
