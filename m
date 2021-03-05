Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30879C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:14:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B548564DD1
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B548564DD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hzhiODtr4BHo1qB0nW3Ix24i5Q6EanODUotY5KyOV5k=; b=COkDtuCo8j4AQ9n0+C/8D7If2
	XAStmERnsapcqmExzfxCyncHO3/rdZRbGAVKTKOKUY2Q2zhJJcKwcoMGBbY9EgHT6TwivFaiIJdBh
	6EPrhQ+Bp1BHOwPB+O4W6ZdiLhOmLQ44YG6bW7KM2O6qqelGQ11SBAn/6HuVjlWPUF9fUNDqs7B26
	rZWUI83fYn8e1oFXCdUBfblHbuzbqwSvur9Wq0xusEvSi7/+htbZznDB5pgrDboNvgujMhFgKxfPa
	Pbks9oLlkXtF05aWL0u0HXh8oxtFUfT1yyoFffwUlB1iX334UPZrgbqUIoi3kdA9vqqJVgIQxwNr3
	ri7KWGXoA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6Ws-00EBoa-MM; Fri, 05 Mar 2021 09:13:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6WT-00EBgW-0T; Fri, 05 Mar 2021 09:13:28 +0000
X-UUID: 7ad9b3fef816442ebc870927d48b9226-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Bzq/9CfVNa4MClxkiDI8HPVlI6a9Z0sKOd9ysnmo9kY=; 
 b=sDcxmSi2JBIm3WBSliT5Kzxidag899oAE0uDunWftAnwD4Cw75i7tyMfNhUKmOfWG6thMRDfMovOZ0nUwjfUuAC3Nqu6mu5cXMqxhLiR69upDUNV41L3MjOPWn74HKkZ5mEi3Agjdn8e0O1BQmzPD9KglrHeTevj3bs5XlSBtPM=;
X-UUID: 7ad9b3fef816442ebc870927d48b9226-20210305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 711771454; Fri, 05 Mar 2021 01:13:20 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 01:03:20 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:18 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 07/17] usb: xhci-mtk: add a function to get bandwidth boundary
Date: Fri, 5 Mar 2021 17:02:45 +0800
Message-ID: <1614934975-15188-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_091325_878700_406D2690 
X-CRM114-Status: GOOD (  12.68  )
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
 drivers/usb/host/xhci-mtk-sch.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index bef82c1f909d..cb597357f134 100644
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
