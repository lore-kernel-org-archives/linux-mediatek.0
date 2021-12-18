Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEA1C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZ7tP5ougfHPcSaasnuv6m9CR7TZklD7NC7ZP+pWtLQ=; b=pBW6Th8BZ/IMze
	anTZx45cWz27/HChWQrx5UjWIBbSz+Rdj7A7p+KJlD+ROAy7wRo36gPPuyPgWq9C2Ge7HTMi92+yp
	ccFl0tAtmwQkQNmt2r7dBIbPeSoWc/V7NkLnI/FBL3P8R6/00CIp3WkLAdsB1Y3cUZiUULZedqgjZ
	Sp4XEiKOvKz3IAtrNyR7ysT/8jShB7fOD6kz4h3hSmxO+z7OLkSVbCUXHI0jxVJVjRILpAMSAXOWc
	+x98ChohAXeOluO+sWMFcOAFM5JiIOPnmj8TTKEZ1Jk/B4K93HrKJD0nTrkghrPiay8uJUvUCYvMI
	s2FWvXqVdbfkkK1qWC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myWTf-00DR1x-6v; Sat, 18 Dec 2021 09:58:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myWTc-00DQzx-BK; Sat, 18 Dec 2021 09:58:05 +0000
X-UUID: ab5f50480c3446b39c68d0ee344342b0-20211218
X-UUID: ab5f50480c3446b39c68d0ee344342b0-20211218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 54220784; Sat, 18 Dec 2021 02:58:01 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Dec 2021 01:58:00 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Dec 2021 17:57:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 18 Dec 2021 17:57:57 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Felipe Balbi <felipe.balbi@linux.intel.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Eddie
 Hung" <eddie.hung@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH v2 4/4] usb: mtu3: set interval of FS intr and isoc endpoint
Date: Sat, 18 Dec 2021 17:57:49 +0800
Message-ID: <20211218095749.6250-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218095749.6250-1-chunfeng.yun@mediatek.com>
References: <20211218095749.6250-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_015804_419374_CDCA3A76 
X-CRM114-Status: GOOD (  10.29  )
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

Add support to set interval also for FS intr and isoc endpoint.

Fixes: 4d79e042ed8b ("usb: mtu3: add support for usb3.1 IP")
Cc: stable@vger.kernel.org
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch
---
 drivers/usb/mtu3/mtu3_gadget.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index b6c8a4a99c4d..9977600616d7 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -92,6 +92,13 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
 			interval = clamp_val(interval, 1, 16);
 			mult = usb_endpoint_maxp_mult(desc) - 1;
 		}
+		break;
+	case USB_SPEED_FULL:
+		if (usb_endpoint_xfer_isoc(desc))
+			interval = clamp_val(desc->bInterval, 1, 16);
+		else if (usb_endpoint_xfer_int(desc))
+			interval = clamp_val(desc->bInterval, 1, 255);
+
 		break;
 	default:
 		break; /*others are ignored */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
