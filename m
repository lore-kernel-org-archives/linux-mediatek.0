Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F60FC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 02:52:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D872311F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 02:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9D872311F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=upmobAs5RdiPfdMeZgCrEJbMSMvO5J1IZaJzQrhnuIc=; b=SvChOlqMVsEmDaXZ1rMUF3FGR
	fobIoB5evbTbJQn8IOiqLlwMTQg+TAw72MU0sC8C4TCKb8tLxwyeOhBOIexkBhVa/ugyZrD6vPSqN
	Prz/Z1zeb7vXCsLKhLJDK5NzxqcKQnOYWNS5Ctis7SAvHP2jQVFmZF1A0dAoDB6ldFQN2CzsrDbx3
	HMfr8jG8PZZVHFI6gouvRyUN5ipnnyi2NP01+qodm7iKYTM4unAYlnL7BJMEQ7jerXMExczKW2o33
	JjEpHMDAjBRe6gKYeYxE5zMjnhrFbZka/UdRZmQNfpHx9keRWTgOWofGgzvOrbHPBXq+LTfsfV8gt
	krepUAbVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzWGc-00085u-J2; Wed, 13 Jan 2021 02:52:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzWGV-00081s-QM; Wed, 13 Jan 2021 02:52:09 +0000
X-UUID: 2138b89761724dbd8630464959087241-20210112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SkO3GXCnftN8I1xD6Q81tdM7crNmUSmBzxdZiDvCvXw=; 
 b=SR8NlfIdKwW0T+NHz3tO8ACHHQL8zckTSTW5vsQ49l7OISKO7dJRbFdfyF9m/d0LtCGtMltO7Ea7w/qhbWJE1oWQmdCZ2J9SMRuEh5E/iTFo83hf6XPBy6zYsxWVYQZoIssuJhxOpcsIqBibs3eQeHjFdftEadZ/MVjW4AiT68M=;
X-UUID: 2138b89761724dbd8630464959087241-20210112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1770822750; Tue, 12 Jan 2021 18:52:00 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Jan 2021 18:42:51 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 10:42:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Jan 2021 10:42:46 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH RESEND v4 04/11] usb: gadget: bdc: fix warning of embedded
 function name
Date: Wed, 13 Jan 2021 10:42:21 +0800
Message-ID: <1610505748-30616-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5E9C83FEE143F88193865B2179E6816FEDB32C7BF385A469B417806DE17535112000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_215208_032844_F2BF0852 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use '"%s...", __func__' to replace embedded function name

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
v4 resend: base on kernel 5.11-rc1
v4: no changes, but rebase on kernel 5.10-rc1
v3: add acked-by Florian
v2: add Cc Florian
---
 drivers/usb/gadget/udc/bdc/bdc_dbg.c | 2 +-
 drivers/usb/gadget/udc/bdc/bdc_ep.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_dbg.c b/drivers/usb/gadget/udc/bdc/bdc_dbg.c
index 7ba7448ad743..9c03e13308ca 100644
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
index 76463de75595..44f3a122546d 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -756,7 +756,7 @@ static int ep_dequeue(struct bdc_ep *ep, struct bdc_req *req)
 
 	dev_dbg(bdc->dev, "%s ep:%s start:%d end:%d\n",
 					__func__, ep->name, start_bdi, end_bdi);
-	dev_dbg(bdc->dev, "ep_dequeue ep=%p ep->desc=%p\n",
+	dev_dbg(bdc->dev, "%s ep=%p ep->desc=%p\n", __func__,
 						ep, (void *)ep->usb_ep.desc);
 	/* if still connected, stop the ep to see where the HW is ? */
 	if (!(bdc_readl(bdc->regs, BDC_USPC) & BDC_PST_MASK)) {
@@ -1858,12 +1858,12 @@ static int bdc_gadget_ep_enable(struct usb_ep *_ep,
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
