Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92678C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 06:06:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 636182074D
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 06:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mHIuOGTY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FBkv0fye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 636182074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yksSDodCgmuZpI0nRAXK6pcNSVonV6WRanzPy0u+iuM=; b=mHIuOGTYKo1YUT
	LRGWyT0tWNZU+JIp3+btmi3yTy0ydfOstmnHooD7YMu7cecaKSex8wftQin+nhC3IU5na32Faru6B
	XzMI6dzJ4YHuFu7oEkkW2em/JiRtUpzBYwdL0EAWHxOy5atnGWucGtcXoGe36wUceJSisDPddHITH
	zUhHlBmuuBjx9J2uftlu6voF+E+hEeulociOq3krKpLEPQE4Ph2FXiYwq4X0pM1MSohXnISaavBvQ
	u8s81Jj+nkRj1Mr5rAZq99Cif1z3VRxYRb86h3/mKs7PgNpCkSXEl1hQdMovrtA0deAqhoVot96iz
	zQXeh74cvzwvrru57WCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl4jM-00070K-C4; Tue, 16 Jun 2020 06:05:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl4jA-0006qj-Rx; Tue, 16 Jun 2020 06:05:46 +0000
X-UUID: 974c8f32b9004047b42ec588d973793e-20200615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BPShzPSzUBgzvJatHzLV7WF1DWhjMLFlqkFxwyyWS5o=; 
 b=FBkv0fyeRgDTyXe8iUwI9IPwb6MaVvXciO2dpce5oXEfL8gxfzyx4UrrNTGJrhmTufqKVirad5KF7nuKkmdkBj6E4agj/CZFBHsGIK36ZvpRWAyceCciyNFHi+nCX/cmPywU5j+VA3BmNSRaELv6746UtnTE+lFC7fJwuQf2noo=;
X-UUID: 974c8f32b9004047b42ec588d973793e-20200615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1786751854; Mon, 15 Jun 2020 22:05:39 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 22:56:19 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 13:56:19 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Jun 2020 13:56:19 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] usb: gadget: u_serial.h: increase MAX_U_SERIAL_PORTS to 8
Date: Tue, 16 Jun 2020 13:56:17 +0800
Message-ID: <1592286977-30483-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_230544_911012_B6451F9C 
X-CRM114-Status: UNSURE (   8.60  )
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

Mediatek's LTE modem needs up to 8 ports to connect to PC for logging
and debugging under some scenarios. Hence we suggest to increase the
definition of MAX_U_SERIAL_PORTS to 8 for some complex embedded systems.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/usb/gadget/function/u_serial.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_serial.h b/drivers/usb/gadget/function/u_serial.h
index e5b08ab..7d61113 100644
--- a/drivers/usb/gadget/function/u_serial.h
+++ b/drivers/usb/gadget/function/u_serial.h
@@ -12,7 +12,7 @@
 #include <linux/usb/composite.h>
 #include <linux/usb/cdc.h>
 
-#define MAX_U_SERIAL_PORTS	4
+#define MAX_U_SERIAL_PORTS	8
 
 struct f_serial_opts {
 	struct usb_function_instance func_inst;
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
