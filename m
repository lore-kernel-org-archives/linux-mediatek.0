Return-Path: <SRS0=GsAT=ZG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4F2C432C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 10:44:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 482C7206F0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 10:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LK2M78hQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="syu3tUp6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 482C7206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAG9/JhnpExOahDtLn6v6cRhRS/onIzY1v/1DZEzES8=; b=LK2M78hQ6h6mQx
	TmBPVBM77mPKjrCyrJTcF6xi+chVdpY9aCntO6hqp4DEJ9HFQIVfEXUPpYSQigRRr7aTSgHtlfktP
	DL4WeG13rgejjm12xlgPlKHTTLxtBXTDE9zJAlTbCHkfJK/eLXoAuOwnZvdG/IlUCMvceoDe/+fSA
	U+rhj+5ToIx07cspUBhbGyfByMRzSCAYK7dFFwickM4x5JqoGHhdnNtI7Daw7nI0KzNopNP7wybLU
	+GhhE2eyctIxYmekjCp4KtX+NndiqL+86vzp59y1iiu0NGNSaaX0WJ2TSoe9kkuYTJWowZ3PRqvDO
	I70a0T/eR8ByI9GTAKSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVCbo-0002TP-Me; Thu, 14 Nov 2019 10:44:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVCZh-0000Xe-JI; Thu, 14 Nov 2019 10:42:07 +0000
X-UUID: 97c903ed303f4568993daa83c2e38f9d-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/v3ZAT8MMQQn1PPsfQoog57z7OcnmZ7w9uOMGarZugY=; 
 b=syu3tUp6lna58QPhWBba55763BxJzF6t2O6L3uGMsDn07/JNmIb2sMun06KfMMSTQR3QOP4JyEqdkJh+6Z0IDu7ta0GtILkHoiaFWfgDKb2aldJc8knJffu0IKZkF1+6+8kx5E/cdbTjQAHjkesQIMdwt1t6334bbHKne6DcsCs=;
X-UUID: 97c903ed303f4568993daa83c2e38f9d-20191114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1596701801; Thu, 14 Nov 2019 02:42:04 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 02:41:49 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:53 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:48 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
Subject: [PATCH v3 10/13] usb: gadget: udc: renesas_usb3: create debugfs
 directory under usb root
Date: Thu, 14 Nov 2019 18:41:22 +0800
Message-ID: <1573728085-29016-10-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1573728085-29016-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1573728085-29016-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 662CFFC5D757F574D8AD256B9DEA6AC1A087CE590745DB105BB6C8C4E4FE39652000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_024205_688545_264C4C8E 
X-CRM114-Status: GOOD (  12.94  )
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
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index e098f16c01cb..4dde69e7f6b1 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2535,7 +2535,7 @@ static const struct file_operations renesas_usb3_b_device_fops = {
 static void renesas_usb3_debugfs_init(struct renesas_usb3 *usb3,
 				      struct device *dev)
 {
-	usb3->dentry = debugfs_create_dir(dev_name(dev), NULL);
+	usb3->dentry = debugfs_create_dir(dev_name(dev), usb_debug_root);
 
 	debugfs_create_file("b_device", 0644, usb3->dentry, usb3,
 			    &renesas_usb3_b_device_fops);
-- 
2.23.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
