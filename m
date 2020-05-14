Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99645C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 04:11:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7939E20659
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 04:11:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o6Nh/kmC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nFstotdN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7939E20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qJfUDel+oLAkrRyszUKffWFcEYW67eBdXEqdu267xTM=; b=o6Nh/kmCm6Y8eY
	f370/yCY1Ga6luNOCjqdp1+KT5ZH2RD16ZPt4mh8ljXp71bjX0iZzdqweJNWvybsiuNQCR3iLzklc
	LXZvM95ySMxG8nZ/1VHltFpPs0v1GJMFQxxFAy2vDL8D6lSW+yedE85AwcdpiceOqvRaebk/wLl5L
	O90QjkA1D1PPRDg6gGbaAY5Wrutp2zIDV1NPf8yTYvOPOiWtyxKh7sNVH7X4PyD4WTk1xT8SpmYA8
	iGdHlrA9JZcJYrsODpsXkr6IfdV+K6JZf8P1wZEI/hxnxzMhODomZ67k98qiBxDANi7YeheFcXoUG
	PseymTG4p0nm3GF9bYGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ5Dn-0002wM-TZ; Thu, 14 May 2020 04:11:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ5Dl-0002vo-C1; Thu, 14 May 2020 04:11:46 +0000
X-UUID: 27342437d645467c91b496b6b36dd4ec-20200513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Vq25CpGWDu4hIaBmnMbm4KOdW3U78xl9MWNuHHP8T8w=; 
 b=nFstotdNa3SfFlRGyKRvIvFXNVdmnoEjdudl25XUI4akzKPpTw8ix0qR6NfaeJbn9tQCq+Sv/TWIHQjyGmogyAFLgFljRKPN0q8yJo7JB8UbzGseJ9dWOJbb71w8uKeCG2TPl/j9wgSt7nSgmjliu6ycZp4yqSYYSqzKflfVtYE=;
X-UUID: 27342437d645467c91b496b6b36dd4ec-20200513
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 335795387; Wed, 13 May 2020 20:11:39 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 May 2020 21:01:36 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 12:01:20 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 May 2020 12:01:19 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Min Guo <min.guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Hans de Goede <hdegoede@redhat.com>, Bin Liu <b-liu@ti.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] usb: musb: mediatek: add reset FADDR to zero in reset
 interrupt handle
Date: Thu, 14 May 2020 12:01:12 +0800
Message-ID: <1589428872-29282-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7786936E7E97A400A420A3B5D83AA16F375A89018EEAA40ED48FEFC21FA816762000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_211145_435823_D774C057 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
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
Cc: Macpaul Lin <macpaul.lin@gmail.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When receiving reset interrupt, FADDR need to be reset to zero in
periphearl mode. Otherwise ep0 cannot do enumeration when re-pluging USB
cable.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/usb/musb/mediatek.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index 6196b0e..eebeadd 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -208,6 +208,12 @@ static irqreturn_t generic_interrupt(int irq, void *__hci)
 	musb->int_rx = musb_clearw(musb->mregs, MUSB_INTRRX);
 	musb->int_tx = musb_clearw(musb->mregs, MUSB_INTRTX);
 
+	if ((musb->int_usb & MUSB_INTR_RESET) && !is_host_active(musb)) {
+		/* ep0 FADDR must be 0 when (re)entering peripheral mode */
+		musb_ep_select(musb->mregs, 0);
+		musb_writeb(musb->mregs, MUSB_FADDR, 0);
+	}
+
 	if (musb->int_usb || musb->int_tx || musb->int_rx)
 		retval = musb_interrupt(musb);
 
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
