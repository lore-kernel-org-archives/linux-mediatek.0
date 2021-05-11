Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22D8C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 12:52:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13DD66191C
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 12:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13DD66191C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mdsdC5JUTCqJuiUoDoyH/C4VDjI9Px7EDiBc8ZInifM=; b=P+Zqw77qflMdYxxNFNoARAzZbE
	hGZBXJ1ODxQL8Rb2S3o0yqpGUtsIU+mLyXdsCGFYlchpAx9WyaQ0sMyGU8pCtiO7XzpKDTWISW4Lq
	iHeu6lkWf36UJcODm+c3xZyJKh1D0aa2/s2Lmq1tlKmIRtJdGXxj7aa/OFjVVmUDval6gO2IzKro9
	mh0DXFpykR9cn/LCjyITJeKtt0xjIDL0/be6fGePRMsJ+cDJftaDbR4NrWIt2mQFQNxk+53LKW+7h
	30jGdhcm/EZ+TLUo9zkg+E31sKBL60/DQq7T0OPin5ShlMH/4LrRPLmrJFNUrBgj4ovrx9ErWvMqg
	caew1O0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgRrW-00HUp5-HC; Tue, 11 May 2021 12:51:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgPWd-00Gtsq-IJ; Tue, 11 May 2021 10:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=7mA+DxiAAOQg8Tv/4aivT1IxFnHWjDwzMts7rO+5/i0=; b=kV/eVkhAydTBKdcJKVYiiOZgs1
 ubXC76YpwW6ewk4yTgcDvLh+4uuS2kFVESIFUaIl9EOm86hSJLyw5bS3bFVbuCVgJAkdJhyA/zFaK
 aemjt/foHkZekBvddztYG/6y+CKgJuYAWx0MBm62vCpOvkkAmzQsbFy8I0wX2l6eIJN9v+ZGEsZ6G
 lboTay0ugMalIn2//iKX8amgGIMVPLnPhFAIw4iWSFmKQomDv6VHtx8OlxS8rLo7qSepnw1cIwHwg
 qu8gkgaGNq/cpNyE4xIDwUCHB/EnUmHK2NMmI9AmkUQNWplgNLA9eP2TFsPAxh9gtlE+8iItvTwtV
 qXGu8XjQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgPWa-009T56-C2; Tue, 11 May 2021 10:22:01 +0000
X-UUID: 3999818e87174570940cc859b0aae209-20210511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7mA+DxiAAOQg8Tv/4aivT1IxFnHWjDwzMts7rO+5/i0=; 
 b=SXQCUhScLetzo00znDNhac2rGHvzyJjIP9Vy9tQPM8cyy1xJzFbsZJqTSiPlQy3W7qrUpFvRkR8W22lNqkjTCYBV0YtdyAgS5SEvK0sBSccdFhcYYhtvBiP8deW+WG9R5kMhji/ErwqiY/4CpIrET7RQjg5Uyu8LAVkXy2lopYs=;
X-UUID: 3999818e87174570940cc859b0aae209-20210511
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1542072207; Tue, 11 May 2021 03:21:55 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 03:21:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 18:21:52 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 11 May 2021 18:21:52 +0800
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
 Jang" <ikjn@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH] usb: core: hub: fix race condition about TRSMRCY of resume
Date: Tue, 11 May 2021 18:15:22 +0800
Message-ID: <20210511101522.34193-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_032200_437903_63B9765B 
X-CRM114-Status: GOOD (  11.20  )
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

Reported-by: Tianping Fang <tianping.fang@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
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
