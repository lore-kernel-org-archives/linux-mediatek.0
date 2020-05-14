Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570D7C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 306682065D
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EVQa41BG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KaJb2VJ4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CGMHCk55"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 306682065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gDVN3tXDjDsM9Grz6gpOKNLvnBRBb+qWlRuwB08wXw4=; b=EVQa41BGvfPO4v
	VvEalI7bObghInlRpVqx+/jCw6lqBIvCfhFZG8/Xus1b+wXbGKMSDQy0UpTRO84QA30nlBM2keQTg
	CRCHWtAuDlmBNLYZLqtXI7sZkbb4YYLnDOtsiMDdV7yj/lHO4o8QI+M16g+HVOOFKUubRZHHv8rQI
	4rujzlCuKCStA8ONTsn8BO2oge0mtrCdrTzSdZOGoGxEnhOfMxzesTRg2ll1zepZpqlY89m0+1k7v
	veoRo7h7xh0t6eWFF/5kdLLPPRfj4a+J6wa3pV9lWboRH0/2owtuQLSL8MDE7bRFWTsHRCYBTMedI
	oXW4e+eDMyLmXugAEyGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ8tJ-0003Fu-F2; Thu, 14 May 2020 08:06:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ8t9-00037n-Pc; Thu, 14 May 2020 08:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=mrYggCzs9Es3fAAe5f56aAmDrVDKZRIo+656NWVNAmE=; b=KaJb2VJ4hnbwYT85m4GyIwxhu0
 7DtBDcQb+1g2cR/+jqc+fgQl5VPFX7XAaWf7eZ9tu1zrDDv7AGUZ5vvqGc8UU7JvOaz0SMPV5SkSN
 1Ve2lopgvfbShiGL9scBMzQI9V9pxlEWDsYWvVpK+HFIZRixBF8xTPQeXGOVE+6+mppRV2QWIIiW9
 tIY0Q2hUexFv9xl/8sN7iqmpmJIlSiLR/08gLucAAJSfm3pQ1DVRPL2MzFrVKhF+edZbDQw/UyOIf
 MSe9wRfK0vAQSQAAuBxbYFHpVSzYQFc1BBCTYJgb+pz63VTH+gvSVrSF4Ib4FD+BtRXUE8so/esTm
 +U1JDREA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ8t4-0006ol-W5; Thu, 14 May 2020 08:06:42 +0000
X-UUID: 771406d5acdf404ea80643361c820bcf-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=mrYggCzs9Es3fAAe5f56aAmDrVDKZRIo+656NWVNAmE=; 
 b=CGMHCk55cK2/bNG2A2iILno5IFMf1/qKxfzHDDUHO3mt0jR6l1CHH28XrZiZmfmOxDxULeY8nySjQBq62pfmXOVmCE+P5bdXDOmaNaCmJ6INFE18KxOOaYUezH11YXjl+oImim/sO9CUhnlSd91qMt6Yk38ucUYkHOLb1vqy20U=;
X-UUID: 771406d5acdf404ea80643361c820bcf-20200514
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1551782415; Thu, 14 May 2020 00:05:06 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 01:05:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 16:05:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 May 2020 16:05:01 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Sergey
 Organov" <sorganov@gmail.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] usb: gadget: u_serial: fix coverity warning: negative index
 at array
Date: Thu, 14 May 2020 16:05:00 +0800
Message-ID: <1589443500-3990-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_090639_536572_AC09BAE6 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: Stan Lu <stan.lu@mediatek.com>, Macpaul Lin <macpaul.lin@gmail.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This issue has been reported by coverity scanner.
Replace "int portnum" by "unsigned int", this void negative index at
array.

Signed-off-by: Stan Lu <stan.lu@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/usb/gadget/function/u_serial.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 8167d37..53951f2 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -587,7 +587,7 @@ static int gs_start_io(struct gs_port *port)
  */
 static int gs_open(struct tty_struct *tty, struct file *file)
 {
-	int		port_num = tty->index;
+	unsigned int	port_num = tty->index;
 	struct gs_port	*port;
 	int		status = 0;
 
@@ -1211,7 +1211,7 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
 	struct gs_port			*port;
 	struct device			*tty_dev;
 	int				ret;
-	int				port_num;
+	unsigned int			port_num;
 
 	coding.dwDTERate = cpu_to_le32(9600);
 	coding.bCharFormat = 8;
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
