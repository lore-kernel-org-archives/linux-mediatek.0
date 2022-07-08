Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86419C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e/XhPR4RTKfxybJoFYGTqD73kZGbJX9+LO/0OJjI2Ek=; b=ahiS248ugAQssnnzutK39grb6p
	AGy9bC9wR0V9rTcgnjGx5toZDbDOYFFfzE0qAdA0e1eB1n2EqNCXf+wKPqEYLprv0VEh9Zp8CjkUL
	q7WyGIGRCjLzWoJoHo2d3hNBLAD+ksC8ZhS/8vv8OAmCwaHf+A4zXLfVInbNafgFxTX5e1oCZdVbP
	i+LNnrZWJ95vak1Qb37IWy09CXKZO3WxGkWA6RGBjnCYhvSRhrJTwuECbRs05bTLu/gpNZrSzQTfF
	nBqgj6aGSLIEJysr5HEHHMoJiTD5Vq3nmqTPGUqShtRpG2NCln9g3xNotvXD4BtDcoVI3fbChmCyS
	KmqGu2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jE0-002U2m-P0; Fri, 08 Jul 2022 08:20:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jDI-002ThG-Fv; Fri, 08 Jul 2022 08:19:51 +0000
X-UUID: fefb5ad46aba494a918515b90ee1b8b1-20220708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5e66a2ba-dd53-4a69-86a0-a0dc3105c119,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:a1bae586-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: fefb5ad46aba494a918515b90ee1b8b1-20220708
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 863590294; Fri, 08 Jul 2022 01:19:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 15:19:07 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 15:19:06 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>
Subject: [PATCH 1/5] usb: mtu3: fix coverity of string buffer
Date: Fri, 8 Jul 2022 15:18:59 +0800
Message-ID: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_011948_594535_7CC783FC 
X-CRM114-Status: GOOD (  12.23  )
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

Use snprintf instead of sprintf which could cause buffer overflow.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h         | 4 +++-
 drivers/usb/mtu3/mtu3_debugfs.c | 2 +-
 drivers/usb/mtu3/mtu3_gadget.c  | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 8408e1b1a24a..9893dd1bafbb 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -92,6 +92,8 @@ struct mtu3_request;
 
 #define BULK_CLKS_CNT	4
 
+#define MTU3_EP_NAME_LEN	12
+
 /* device operated link and speed got from DEVICE_CONF register */
 enum mtu3_speed {
 	MTU3_SPEED_INACTIVE = 0,
@@ -272,7 +274,7 @@ struct ssusb_mtk {
  */
 struct mtu3_ep {
 	struct usb_ep ep;
-	char name[12];
+	char name[MTU3_EP_NAME_LEN];
 	struct mtu3 *mtu;
 	u8 epnum;
 	u8 type;
diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
index d27de647c86a..a6f72494b819 100644
--- a/drivers/usb/mtu3/mtu3_debugfs.c
+++ b/drivers/usb/mtu3/mtu3_debugfs.c
@@ -132,7 +132,7 @@ static void mtu3_debugfs_regset(struct mtu3 *mtu, void __iomem *base,
 	if (!mregs)
 		return;
 
-	sprintf(mregs->name, "%s", name);
+	snprintf(mregs->name, MTU3_DEBUGFS_NAME_LEN, "%s", name);
 	regset = &mregs->regset;
 	regset->regs = regs;
 	regset->nregs = nregs;
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 30999b4debb8..a751e0533c2d 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -635,8 +635,8 @@ static void init_hw_ep(struct mtu3 *mtu, struct mtu3_ep *mep,
 
 	INIT_LIST_HEAD(&mep->req_list);
 
-	sprintf(mep->name, "ep%d%s", epnum,
-		!epnum ? "" : (is_in ? "in" : "out"));
+	snprintf(mep->name, MTU3_EP_NAME_LEN, "ep%d%s", epnum,
+		 !epnum ? "" : (is_in ? "in" : "out"));
 
 	mep->ep.name = mep->name;
 	INIT_LIST_HEAD(&mep->ep.ep_list);
-- 
2.18.0


