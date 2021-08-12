Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB258C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 13:29:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60C4E604D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 13:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60C4E604D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=332dtujXvgbOXTt6ijfmOXdrJxS8wJylZNXj1ZM+6NA=; b=KrUJb82oBe1r4C
	ZqGCA/BvV7A+2NuYHSkKRDXNJtzspNKUT9SVIHSZl7SlUhca6X2xjTImfzBAyOZI24Do+J+UjexsB
	0p2CSqGtY9nRvN+Qp7dnHdtmYZA9g4Fj7uO34mnFA/oAEzNLW8aOkVMCQnyvS0TgQ8vL8Mu7seaGt
	SPE7rWGz956nu5fK4DReK6Q0lk42aP0J6dcFuD8wNAHAa+Xqk6C2evjwQ4+ddCgVGCF6dospzaPBK
	sIMJHdfWaRl4dditkl/Skd9cYasY56dzugpUVy07PCw6xvHUBm6g3h7f/s5y3FwCCG+NEcoE/m7hf
	XUNJ9moNHqaS9aGk+uwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEAm6-00ADzr-Pz; Thu, 12 Aug 2021 13:29:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEAlR-00ADi2-Ac; Thu, 12 Aug 2021 13:28:57 +0000
X-UUID: db0762503b6546db9ba7276cec000be4-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RgL5t1qCvVRg400xtDH0H7w9psyO2DQgcNJfO4TNs0k=; 
 b=IP3ev+xwhz8bpjfXs/ZhEX6+LPMWVI9WUvHjWidjMtCp9K0PWxHrspgnJ00cALh8ubNoQmozOsmXI07HcM28ve1MvO8jYnqG/ARdnHbv/WvW/VQoVtKuYp06kA0yWBVVPaRAaEfjYs662iaFT57TpL/6yftf7+WqOhXYmE+cveY=;
X-UUID: db0762503b6546db9ba7276cec000be4-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1730697378; Thu, 12 Aug 2021 06:28:51 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 06:18:49 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 21:18:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Aug 2021 21:18:40 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
CC: Pawel Laszczak <pawell@cadence.com>, Al Cooper <alcooperx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Yang Yingliang <yangyingliang@huawei.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
 <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Eddie Hung <eddie.hung@mediatek.com>,
 stable <stable@vger.kernel.org>
Subject: [PATCH v2 5/7] usb: gadget: tegra-xudc: fix the wrong mult value for
 HS isoc or intr
Date: Thu, 12 Aug 2021 21:18:01 +0800
Message-ID: <1628774283-475-5-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_062853_417849_7A366EE6 
X-CRM114-Status: GOOD (  13.64  )
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

usb_endpoint_maxp() only returns the bit[10:0] of wMaxPacketSize
of endpoint descriptor, not includes bit[12:11] anymore, so use
usb_endpoint_maxp_mult() instead.
Meanwhile no need AND 0x7ff when get maxp, remove it.

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Cc: stable <stable@vger.kernel.org>
Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2:
  add fixes, cc;
  add acked-by felipe;
---
 drivers/usb/gadget/udc/tegra-xudc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index a54d1cef17db..40a7417e7ae4 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -1610,7 +1610,7 @@ static void tegra_xudc_ep_context_setup(struct tegra_xudc_ep *ep)
 	u16 maxpacket, maxburst = 0, esit = 0;
 	u32 val;
 
-	maxpacket = usb_endpoint_maxp(desc) & 0x7ff;
+	maxpacket = usb_endpoint_maxp(desc);
 	if (xudc->gadget.speed == USB_SPEED_SUPER) {
 		if (!usb_endpoint_xfer_control(desc))
 			maxburst = comp_desc->bMaxBurst;
@@ -1621,7 +1621,7 @@ static void tegra_xudc_ep_context_setup(struct tegra_xudc_ep *ep)
 		   (usb_endpoint_xfer_int(desc) ||
 		    usb_endpoint_xfer_isoc(desc))) {
 		if (xudc->gadget.speed == USB_SPEED_HIGH) {
-			maxburst = (usb_endpoint_maxp(desc) >> 11) & 0x3;
+			maxburst = usb_endpoint_maxp_mult(desc) - 1;
 			if (maxburst == 0x3) {
 				dev_warn(xudc->dev,
 					 "invalid endpoint maxburst\n");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
