Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F01C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 02:18:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0E03615FF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 02:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0E03615FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LddyPqJDsxSr6N7jHwisKt/LWuq2k7eGQkyU/XCQbI0=; b=qyvWoZaiVPo+JrjBYdSuuysUNB
	K7eQRxW7oVcSTVdrQZUxs98X9IyxWy4iWKdO0Lt36xEXLR9NBxJ//M9wiLgbbeXtUt3DBFM/u4r7W
	ZJiemutYM1rIlRQFh2k2fh9jYTH7woAE2Lg449O+dzqsrfgBFlOr4Z020B7OSAD+1aPzBsBWHUHsL
	6siE1aVNE675hP8TWjwOJMuFxsSwt8bYFXwV/HErNVlxfehL8by3PWHTJPi9ZvNxQGjzPS9DGGvzg
	frqTA2w0QXSy6mwm0ly9hEERUn9IBZr+aHvRkEpTAceuPuwDL0cRSLRUN5D0XE8gHoztaOKkksMNR
	Eson8uwg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgeRs-001lXB-Dr; Wed, 12 May 2021 02:18:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgeRc-001lWH-Ne; Wed, 12 May 2021 02:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=S7OF+exXYtIvRd7559JPvBR/2paGQW4nsINHPcchD2o=; b=ZjSVd3pmrPXsvoh00Asuc5xrjk
 5R3291YwWMwZ7kQF2APQgZnGth4vuN1LaCPv67UbqHwVRr2VNcnT5y7TsPiDzpOLlofjRTbBLEqvx
 eDA4NkCEYQtgfHA74nvSp94CW73eSkSZzmBks5POqCoOHnkjExi+dnBjPbAI9pCbyewNhNFl37KVZ
 Lcnu6OZTmyYGmDF65xohwNY+8QXCcgdIOHnWZAlXHiB+06rcrzXHWjVygdAXeiHitwjnx6i8DaVJt
 2FaGfUAOlZb0ue1Il8uE3qPPPVlhvuXthnG6RCHA6r6WuPQ7/5S8vraGldxmTKhVXdDY6I9UX1un3
 rQeA1JDA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgeRZ-00A33V-A6; Wed, 12 May 2021 02:17:50 +0000
X-UUID: 815f8c4e2fca4db0a114142f0b81ec76-20210511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=S7OF+exXYtIvRd7559JPvBR/2paGQW4nsINHPcchD2o=; 
 b=jZkR7sbLd41ppGnBJqXiSTMA+KMquSo4oGQwTfJjMUmuBPaNzo/KgffwZRLwXEoa5VftfbIq8KEvOp9CBHWgxDiFCDpMjMeuQoJdKtvFcVk+p/Rd8DWIpWCU8g0nccrjL/nAu50ZGgTUoxfO18H99oA9PVyy8olNlhOC8O+YSsA=;
X-UUID: 815f8c4e2fca4db0a114142f0b81ec76-20210511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1557157786; Tue, 11 May 2021 19:17:43 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 19:07:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 May 2021 10:07:39 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 12 May 2021 10:07:39 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Bixuan Cui <cuibixuan@huawei.com>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Oliver Neukum <oneukum@suse.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tianping Fang
 <tianping.fang@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, "Ikjoon
 Jang" <ikjn@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 <stable@vger.kernel.org>
Subject: [PATCH v2] usb: core: hub: fix race condition about TRSMRCY of resume
Date: Wed, 12 May 2021 10:07:38 +0800
Message-ID: <20210512020738.52961-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_191749_377734_34A8FE19 
X-CRM114-Status: GOOD (  11.64  )
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

This may happen if the port becomes resume status exactly
when usb_port_resume() gets port status, it still need provide
a TRSMCRY time before access the device.

CC: <stable@vger.kernel.org>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: Tianping Fang <tianping.fang@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2:
    cc stable suggested by Alan,
    and add acked-by Alan
---
 drivers/usb/core/hub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index b2bc4b7c4289..fc7d6cdacf16 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3642,9 +3642,6 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
 		 * sequence.
 		 */
 		status = hub_port_status(hub, port1, &portstatus, &portchange);
-
-		/* TRSMRCY = 10 msec */
-		msleep(10);
 	}
 
  SuspendCleared:
@@ -3659,6 +3656,9 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
 				usb_clear_port_feature(hub->hdev, port1,
 						USB_PORT_FEAT_C_SUSPEND);
 		}
+
+		/* TRSMRCY = 10 msec */
+		msleep(10);
 	}
 
 	if (udev->persist_enabled)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
