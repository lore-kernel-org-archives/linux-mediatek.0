Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D06C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:53:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C047F64F1D
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C047F64F1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WKnmgvSpFdZq0Jg/u51SHTP1486m0Vx2dHvRNVqU1a4=; b=KvTk7fAnnbI4gLrkXGmB+ymWR
	drtwfQtXmJDRCrqtL0KfmEiYVHCNZhpOPqm+72hYSb5d6lrvuRv9SnLc+ucWP97MF94TfHDKpAHDz
	GL56Awrj6CRPm6QbsQwapAgUtUSNd0ejCq+8EBrOoXIvuyDIHRlaUm9bLLqNKYGB4pdOLJawhiuK2
	xYko+bLeK+KucbLTeqhTG7VTIgNMx6LceLca7sBgUatgeqXN/GtBWUoKbpIFhR1YI5R8fFqlqjj43
	Hk4+a5cSOh7ZG2FgsX/8zQNkZIHHwF7mOQrqoL0YENXnJHCDRY9SM7WozVdGWXilK1jVSNzgDMmcX
	SzdPzQQBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ60p-00EdFk-38; Mon, 08 Mar 2021 02:52:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ60h-00Ed9c-N9; Mon, 08 Mar 2021 02:52:48 +0000
X-UUID: e833dd783bd5401287c4628bbafa67e9-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yolOyl6dt/dDYKERE464qxt3dUhYRbRNeM29K+NUHSE=; 
 b=oREpjgcTE/h88voVrzlxAOPqOeWaIC8A+lQNhhCbRtthgxALC5uxncduMc4mDwZTUexpBRyUksBmjzrb/X8qhvbMnl+dXNIZRuPxiL106ZAPUIk0pDhK6XcdtUg5lu/hKCkg0IwJ7X5zyBcTEz1mprp4apJkMfNcwum+r2jVf4E=;
X-UUID: e833dd783bd5401287c4628bbafa67e9-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 298653672; Sun, 07 Mar 2021 18:52:35 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:52:22 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 10:52:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:52:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 07/18] usb: xhci-mtk: add a function to get bandwidth
 boundary
Date: Mon, 8 Mar 2021 10:51:56 +0800
Message-ID: <805b3ba66c2f02a52de4440212519aaa58463039.1615170625.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AE290569BFD45F8BDE4A38EAFC32C1306295AB11A61D5806DDCC1B48B578842C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_025246_202094_DE5F9DBD 
X-CRM114-Status: GOOD (  13.10  )
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

This is used to simplify unit test.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/host/xhci-mtk-sch.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 9a9685f74940..8fe4481eb43d 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -37,6 +37,25 @@ static int is_fs_or_ls(enum usb_device_speed speed)
 	return speed == USB_SPEED_FULL || speed == USB_SPEED_LOW;
 }
 
+static u32 get_bw_boundary(enum usb_device_speed speed)
+{
+	u32 boundary;
+
+	switch (speed) {
+	case USB_SPEED_SUPER_PLUS:
+		boundary = SSP_BW_BOUNDARY;
+		break;
+	case USB_SPEED_SUPER:
+		boundary = SS_BW_BOUNDARY;
+		break;
+	default:
+		boundary = HS_BW_BOUNDARY;
+		break;
+	}
+
+	return boundary;
+}
+
 /*
 * get the index of bandwidth domains array which @ep belongs to.
 *
@@ -579,13 +598,7 @@ static int check_sch_bw(struct usb_device *udev,
 			break;
 	}
 
-	if (udev->speed == USB_SPEED_SUPER_PLUS)
-		bw_boundary = SSP_BW_BOUNDARY;
-	else if (udev->speed == USB_SPEED_SUPER)
-		bw_boundary = SS_BW_BOUNDARY;
-	else
-		bw_boundary = HS_BW_BOUNDARY;
-
+	bw_boundary = get_bw_boundary(udev->speed);
 	/* check bandwidth */
 	if (min_bw > bw_boundary)
 		return -ERANGE;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
