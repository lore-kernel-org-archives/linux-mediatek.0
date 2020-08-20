Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77556C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:32:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4467C207BB
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:32:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XR0w3Cjv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Tc/fI4EM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4467C207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U/6acfs1z7TT1ubxsfsTO/udwvH7/6X+Y9Dssx60L8I=; b=XR0w3CjvvR/4UhPonQoWHNh/3
	DqEi0DTGVdtEYOOzI3Lm7FEwx9SLpkJGeKhzhay66bXr1OMZIhZRcJ2VMXSQPDtySGBRP62HUOQDH
	obIKLakGBF7QRVO6OqJFAzwpih8dXEBh0k8bPfktZ24kclbd6nXiQ1LVCi4rg+xJewY4Z/qAnMLRF
	n44EHFIRhDXuL9zV0lXLSXWBf0h3aaKsXfW9MDk2lOFH41MJU19gRqY98wLZPUxYBBZCaWdKHovQ3
	dDFj+aFxAkGiPIiaguFWRe4RaRfvVrSrZDCUJubgrQAChG0s5WWG482vywp314+kRfIsng2uuDUV+
	KNvSuNkyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8ioA-0004bB-C9; Thu, 20 Aug 2020 11:32:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8io7-0004aA-St; Thu, 20 Aug 2020 11:32:37 +0000
X-UUID: 49bbfeb43fe8490885f32515135b19d5-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nqIW9nkZa6YaLLhjqZ7kmnfueTv+c8ATeMbx5VhqlUE=; 
 b=Tc/fI4EMfmLjy9zxEJbWmDDY75ukJE2Z7a+frAH0rONccXWGgcYg/1Di7gnfYz6+831/IxecAqWkotK9W7Btlr/WrMmeEojTpfK+hHFZPRI4sgLdpnU5u8QBTngBrOnbjbFwKCO//DcxHwWYi4W1v4aWvWwd58BWbflsaKzARa4=;
X-UUID: 49bbfeb43fe8490885f32515135b19d5-20200820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 711926127; Thu, 20 Aug 2020 03:32:30 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 04:32:29 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 19:32:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 19:32:23 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 04/11] usb: gadget: bdc: fix warning of embedded function
 name
Date: Thu, 20 Aug 2020 19:30:39 +0800
Message-ID: <1597923046-12535-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6383ADABD7F212A8A9044CDB2A9F22B99617E7E34FD6E99648EA7A911117483D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_073236_150371_46850148 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: Peter Chen <peter.chen@nxp.com>, Sasi Kumar <sasi.kumar@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-usb@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, Nathan
 Chancellor <natechancellor@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use '"%s...", __func__' to replace embedded function name

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add Cc Florian
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
index 76463de..44f3a12 100644
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
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
