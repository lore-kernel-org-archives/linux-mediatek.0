Return-Path: <SRS0=GsAT=ZG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F4FC432C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 10:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A867206F0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 10:44:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gtwbqxe/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AFdqXxeY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A867206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/gvBWxCZ4ZAEzgUouAhLJRuOtk8TF7peFSOhBPgkvU=; b=Gtwbqxe/3xv1BE
	1vtumD9uOeLWyhwmn5jSHEEskDe1veaDHiQwXRJcloyH6+IxeKRNrEQgKJO4fE44MyE5xNw6U8t/E
	Xl4rc7AGD9nL3HLJ5DiZPIaq0GKURf4BTAwrkSAl4aGTPzzDjyhtAomfKzN9bUUe7HFKbPL53KJ1H
	/pRYW48TK7nnVPVKxbt2DzjQrZY95P0UjStvBkNDWecIEduCoZPYtEZ4bNffssK5s273x7AC3eu5V
	c06htzWQxg263MhzmLVXHQ0Sf6BfRu/UdDReaJPU3Cfeoc4BjZJ/MsSWCkQkf0nMvJEWR9nUVk6IY
	hItDtBCeZfdkWEuwmXdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVCbl-0002PQ-7T; Thu, 14 Nov 2019 10:44:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVCZg-0000W9-Nb; Thu, 14 Nov 2019 10:42:06 +0000
X-UUID: 1ed0a91083b948f5a1e5ee2fa3cfecbb-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2oPmrtmT8z3a06jOc+ndJyeQ70dpMqfM0UstsjdEuiQ=; 
 b=AFdqXxeYWS+DKOBFSumwSQIxwk50+bGMhKY3AfBXaNDGmkmRBl10Wsmo3mPFoF7ylX/uVNaDB4uiewl8yo0ynswaQqljgVWLMdgJZmqbpFl9gr6sSd7ONkf/nxegBTJhZbcusd24oSYyxzQ0oG9qyE1rURHYDtDRTkUSGNGwKg8=;
X-UUID: 1ed0a91083b948f5a1e5ee2fa3cfecbb-20191114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1048158960; Thu, 14 Nov 2019 02:42:01 -0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 02:41:46 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 14 Nov 2019 18:41:56 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:55 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
Subject: [PATCH v3 13/13] usb: gadget: udc: s3c2410_udc: create debugfs
 directory under usb root
Date: Thu, 14 Nov 2019 18:41:25 +0800
Message-ID: <1573728085-29016-13-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1573728085-29016-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1573728085-29016-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_024204_937317_883B2D3B 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: Peter Chen <Peter.Chen@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Yangtao Li <tiny.windzz@gmail.com>, linux-kernel@vger.kernel.org, Minas
 Harutyunyan <hminas@synopsys.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kevin Cernekee <cernekee@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Cristian Birsan <cristian.birsan@microchip.com>, linux-media@vger.kernel.org,
 Fabrizio
 Castro <fabrizio.castro@bp.renesas.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bin
 Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org,
 Biju Das <biju.das@bp.renesas.com>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Now the USB gadget subsystem can use the USB debugfs root directory,
so move it's directory from the root of the debugfs filesystem into
the root of usb

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: no changes

v2:
  1. abandon new API usb_debugfs_create_dir(), and use usb_debug_root
---
 drivers/usb/gadget/udc/s3c2410_udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index f82208fbc249..0507a2ca0f55 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.c
+++ b/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -1978,7 +1978,8 @@ static int __init udc_init(void)
 
 	dprintk(DEBUG_NORMAL, "%s\n", gadget_name);
 
-	s3c2410_udc_debugfs_root = debugfs_create_dir(gadget_name, NULL);
+	s3c2410_udc_debugfs_root = debugfs_create_dir(gadget_name,
+						      usb_debug_root);
 
 	retval = platform_driver_register(&udc_driver_24x0);
 	if (retval)
-- 
2.23.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
