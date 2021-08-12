Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943B8C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 13:19:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398C260F11
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 13:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 398C260F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IE5X6iTaIQVM5N8gulSqf1rCy/bI0+d8QZ1C9s9jOtI=; b=lLzD/pZz5nxyMc
	KQjfFLe355SR1hanfZTKj0UTV7M22zWnrZYd8Q+huY5HjHxIVkFpWmvKv02cieb6yWuoQpl+OHLaP
	g57BP1cvuU0RW0WMep6sCtCoVB7iuuSumjCEevI2gB4hDdtZycPNhoENg4gr4frvtHSdHpNSMMj0o
	alrFZRHrA1mSNFTooCAthVoqIkHu+Qjsdl0fJrbL/csMD+NOQDsgATM8DYuB/iaY9/udB1U4bCAkI
	VWg/uJz7BstyTlH18xuZUkYlCR7JAmQK6TuenZShZauepHoRwPHJQmQhPHqgwX4sH67H/O5tCOv2a
	KgKJNgO17YNfC9C9xQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEAc0-00A9Il-Sq; Thu, 12 Aug 2021 13:19:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEAbb-00A9DU-BX; Thu, 12 Aug 2021 13:18:47 +0000
X-UUID: b481892a3fcc4aa19febf313a4b67de9-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0MGhCGevIZdfc8ILkcD3M8l6HJk6lrSN1N1LQM3EGUk=; 
 b=nq5PIKXWMCi28PrVdNS9miKOueTJSZZU/+eIwnwtNDya4UONqOtvydN8ObJ+DwKoMp9wt4c0ccEZ2KBWeuUNTKk71Zt8/S383PbSxZTe7hjMRnDgQAEkECv43n59iFWv7dPWCZ/WiCTjFcOJXFVucK2/nyFHma8DsCAfyiOtPh8=;
X-UUID: b481892a3fcc4aa19febf313a4b67de9-20210812
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 978456447; Thu, 12 Aug 2021 06:18:42 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 06:18:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 21:18:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Aug 2021 21:18:38 +0800
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
Subject: [PATCH v2 3/7] usb: mtu3: fix the wrong HS mult value
Date: Thu, 12 Aug 2021 21:17:59 +0800
Message-ID: <1628774283-475-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_061843_441753_586E3669 
X-CRM114-Status: GOOD (  11.76  )
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

usb_endpoint_maxp() returns actual max packet size, @mult will
always be zero, fix it by using usb_endpoint_maxp_mult() instead
to get mult.

Fixes: 4d79e042ed8b ("usb: mtu3: add support for usb3.1 IP")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: split two patch [v2 2/7],[v2 3/7] suggested by Felipe
---
 drivers/usb/mtu3/mtu3_gadget.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 635ad277cb13..a399fd84c71f 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -64,14 +64,12 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
 	u32 interval = 0;
 	u32 mult = 0;
 	u32 burst = 0;
-	int max_packet;
 	int ret;
 
 	desc = mep->desc;
 	comp_desc = mep->comp_desc;
 	mep->type = usb_endpoint_type(desc);
-	max_packet = usb_endpoint_maxp(desc);
-	mep->maxp = max_packet & GENMASK(10, 0);
+	mep->maxp = usb_endpoint_maxp(desc);
 
 	switch (mtu->g.speed) {
 	case USB_SPEED_SUPER:
@@ -92,7 +90,7 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
 				usb_endpoint_xfer_int(desc)) {
 			interval = desc->bInterval;
 			interval = clamp_val(interval, 1, 16) - 1;
-			mult = (max_packet & GENMASK(12, 11)) >> 11;
+			mult = usb_endpoint_maxp_mult(desc) - 1;
 		}
 		break;
 	default:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
