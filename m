Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3163C433F1
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:20:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C28032070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:20:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QyXjLaLk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NfzW4mAD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C28032070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ThNY+FqT0PUFMFUuv7SZCMhCn8994WW9TwsdYhEVkWQ=; b=QyXjLaLkxhBgWwpOqaQdf3LwR
	YLOOPLRelWsdWDrS1HpkiFwa25j8CNT5OfqtjJOxHF8Y4y58gFcYYOvAjEz82iYLA5M/JoNSRk3Ak
	q1taC8WTp6cNgNDSDhWACd7pxE/PT3YqGbGO3GT/p/aWHcEPloZwrfyKrnHZ8pknzADlwzZj6tHsY
	j8fmCZQHE5Adsrgy9+uRUe3hPLHBur/bc3UUXSDGTH24j7SHWeAHdjbgnzdb3pgEnd/o8jkv7BVK3
	86Xa9N2IqTDTANSo9ZgDapPLUi6l95U9RMJztg2lIJPyCcn53JYDScWNh13FYKLkjWPoyHkO4kRz7
	Mlf5TAdUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxRC-0007r5-IQ; Mon, 27 Jul 2020 07:20:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxR7-0007ly-HM; Mon, 27 Jul 2020 07:20:38 +0000
X-UUID: 8dc75aa203c74aa88394fb8d09aa275c-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GCE0evIdyEqzM/0YYcavx+sGKjZL7yKWC2gJV9okxqg=; 
 b=NfzW4mAD55T9PjCGc0eceoPjeAW1Pqn5KBP+vdbufqB0AqljVtrror1bNmluimdiDFEuWWxyJeysS1us9nXyOGP347rPSGZqEbaYEhN2YT4lrtEeBeTwlkqqWcK3UcwYhhKMpyZZRbUHZX7r29nxxCgOMACn5mcNgavyg1E9rTY=;
X-UUID: 8dc75aa203c74aa88394fb8d09aa275c-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1653555852; Sun, 26 Jul 2020 23:20:33 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 00:16:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:40 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:40 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 09/11] usb: mtu3: use MTU3_EP_WEDGE flag
Date: Mon, 27 Jul 2020 15:14:58 +0800
Message-ID: <1595834101-13094-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EFF8B65C2BEBEA93AB9EB46D70B799355C8CC2F7183539089AC3D6D51822F01C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_032037_747164_4AA61BC8 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: Eddie Hung <eddie.hung@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use MTU3_EP_WEDGE flag instead of the member @wedged in mtu3_ep
struct, then @wedged can be removed.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h            | 1 -
 drivers/usb/mtu3/mtu3_gadget.c     | 9 ++++-----
 drivers/usb/mtu3/mtu3_gadget_ep0.c | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 8fd83bd..71f4f02 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -293,7 +293,6 @@ struct mtu3_ep {
 	const struct usb_endpoint_descriptor *desc;
 
 	int flags;
-	u8 wedged;
 };
 
 struct mtu3_request {
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index ef9fcd5..73a8536 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -190,8 +190,7 @@ static int mtu3_gadget_ep_enable(struct usb_ep *ep,
 	if (ret)
 		goto error;
 
-	mep->wedged = 0;
-	mep->flags |= MTU3_EP_ENABLED;
+	mep->flags = MTU3_EP_ENABLED;
 	mtu->active_ep++;
 
 error:
@@ -219,7 +218,7 @@ static int mtu3_gadget_ep_disable(struct usb_ep *ep)
 
 	spin_lock_irqsave(&mtu->lock, flags);
 	mtu3_ep_disable(mep);
-	mep->flags &= ~MTU3_EP_ENABLED;
+	mep->flags = 0;
 	mtu->active_ep--;
 	spin_unlock_irqrestore(&(mtu->lock), flags);
 
@@ -389,7 +388,7 @@ static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
 			goto done;
 		}
 	} else {
-		mep->wedged = 0;
+		mep->flags &= ~MTU3_EP_WEDGE;
 	}
 
 	dev_dbg(mtu->dev, "%s %s stall\n", ep->name, value ? "set" : "clear");
@@ -408,7 +407,7 @@ static int mtu3_gadget_ep_set_wedge(struct usb_ep *ep)
 {
 	struct mtu3_ep *mep = to_mtu3_ep(ep);
 
-	mep->wedged = 1;
+	mep->flags |= MTU3_EP_WEDGE;
 
 	return usb_ep_set_halt(ep);
 }
diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index 563a0a2..0ca4721 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -417,7 +417,7 @@ static int ep0_handle_feature(struct mtu3 *mtu,
 
 		handled = 1;
 		/* ignore request if endpoint is wedged */
-		if (mep->wedged)
+		if (mep->flags & MTU3_EP_WEDGE)
 			break;
 
 		mtu3_ep_stall_set(mep, set);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
