Return-Path: <SRS0=Qt5b=ZM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FC8C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2019 06:45:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 886BA206D8
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2019 06:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="krLKLTSL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CW/Z+rLH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 886BA206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14I11DUsTPcwRpUTX8fEPFk64EaDKtHzgEQhklxkdkI=; b=krLKLTSLpLyiGs
	0oSEwHzOSy8r/srVNpN3wxptccIh9hIKMdzZ5NGcIVgurAJjkmktt6HEKJxXQ5mcUAGlL5E4LGxBg
	x60TcZLkNnaKPiIQxkULuNMh0d8O7yUt8XFUMZscalvz7DYFi3ydjqBSJq1J+EajoAdCO1Doqomek
	/VMTiBjOqjbzGDVA4wn9/LAJmvwksjUQ5iaH7udNeFcOMjFtkNJ19LBN2LPvU/+3Ma0H7YTMt6Kq/
	ywjJUy+8VXQKP0a6rJeOuS9ywRQgM30I4zAZEpzlMoszfTgd0uO4TD44DY3Te/52McelLS8JWgf3r
	ltVKmZMGFO/gR7gClUpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXJkJ-0005r0-Ru; Wed, 20 Nov 2019 06:45:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXJjr-0005KA-P5; Wed, 20 Nov 2019 06:45:21 +0000
X-UUID: fcd013f8f5324450948e941c868e937a-20191119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Bf0H4NjN87Eyxjtkpl/ipYmRPL+ArIku0qP3VxKPEJk=; 
 b=CW/Z+rLH7yh0KtlkqNa8gXmqCBJm2VfPuoEHk7LWs2Q49rtSS1Tyyny6qiU0Bz1ofy9O2xhnw2NgccaT8pbrga68Ni/FFWh4Q02wH2ba0ULMbAp4uyMaXA4tqsFcWQ41+U4cVI+6VFy53hOrAXVGEFkqJ0Kk2tLW6DOtT7Yv7fU=;
X-UUID: fcd013f8f5324450948e941c868e937a-20191119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1307336309; Tue, 19 Nov 2019 22:45:16 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 19 Nov 2019 22:43:41 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 20 Nov 2019 14:42:31 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 20 Nov 2019 14:43:00 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [RESEND PATCH v3 3/3] usb: gadget: udc: gr_udc: create debugfs
 directory under usb root
Date: Wed, 20 Nov 2019 14:43:03 +0800
Message-ID: <1574232183-5760-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1574232183-5760-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1574232183-5760-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 13A396944ECAEF168D722F1FF46B51809385C180D0D671363AF7CA160F0B07A82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_224519_820936_F939A1DD 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Bin Liu <b-liu@ti.com>,
 Cristian Birsan <cristian.birsan@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Now the USB gadget subsystem can use the USB debugfs root directory,
so move it's directory from the root of the debugfs filesystem into
the root of usb

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3:
  1. fix up build error of undefined usb_debug_root

v2:
  1. abandon new API usb_debugfs_create_dir(), and use usb_debug_root
---
 drivers/usb/gadget/udc/gr_udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index 7a0e9a58c2d8..5d5a0bc79757 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -29,6 +29,7 @@
 #include <linux/list.h>
 #include <linux/interrupt.h>
 #include <linux/device.h>
+#include <linux/usb.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/dma-mapping.h>
@@ -208,7 +209,7 @@ static void gr_dfs_create(struct gr_udc *dev)
 {
 	const char *name = "gr_udc_state";
 
-	dev->dfs_root = debugfs_create_dir(dev_name(dev->dev), NULL);
+	dev->dfs_root = debugfs_create_dir(dev_name(dev->dev), usb_debug_root);
 	debugfs_create_file(name, 0444, dev->dfs_root, dev, &gr_dfs_fops);
 }
 
-- 
2.23.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
