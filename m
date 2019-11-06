Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE674C5DF62
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 03:17:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D74D2053B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 03:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QHa2jeyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D74D2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iU7dbKepeI3VejSF8obVDv45Is4lXVDhZC8P92bcNM=; b=QHa2jeyib9+oiV
	JggmaUew0r55O8/RxZuUwNBjN4UPkTxiWEy0q3yG3qK/hgQgV4SykC/RQ4sfsTn/n1FIc4r43g2DQ
	M5dLcwhCm/0ujJMOg22vXr3ftqjioF/lOK6Qp8WhMmH2DIqcMWKHgr5/6NVT63HmtLqd7btCqkNXc
	nvUaAuBhIezVm41wive4+UPA+m0kqbVU0KBImFCdORY5Z3s+9DDkqQG8HLbXRC6nRI9M1vXTyqSrm
	69+kIfr7FQZ7Oh2dBDn84qepdJUJtyuVp168PbeAUBfMWirKCQymchSwgw9Oz/wet65CBpSernFI9
	48fh3YnRYj7piqSJEvMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSBoj-0000Yl-99; Wed, 06 Nov 2019 03:17:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSBoh-0000Uy-8o; Wed, 06 Nov 2019 03:17:08 +0000
X-UUID: 0fdf8c8217d4484dacdb1818fc7ebad0-20191105
X-UUID: 0fdf8c8217d4484dacdb1818fc7ebad0-20191105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 101557275; Tue, 05 Nov 2019 19:17:00 -0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 5 Nov 2019 19:16:43 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 6 Nov 2019 11:16:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 6 Nov 2019 11:16:39 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
Subject: [PATCH 14/28] usb: mtu3: use usb_debugfs_create_dir() to create
 directory
Date: Wed, 6 Nov 2019 11:15:15 +0800
Message-ID: <27f6c9e4d1ece4996a7555efa0c9b8248f39426c.1573008520.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <8cb137d5376b4e317dc22dcb9e81a1125b781f8f.1573008519.git.chunfeng.yun@mediatek.com>
References: <8cb137d5376b4e317dc22dcb9e81a1125b781f8f.1573008519.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_191707_318049_F2C3815C 
X-CRM114-Status: GOOD (  13.21  )
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
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Wolfram Sang <wsa@the-dreams.de>, Yangtao Li <tiny.windzz@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Mans Rullgard <mans@mansr.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kevin Cernekee <cernekee@gmail.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 bcm-kernel-feedback-list@broadcom.com,
 David Kershner <david.kershner@unisys.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Cristian Birsan <cristian.birsan@microchip.com>, linux-media@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Mathias Payer <mathias.payer@nebelwelt.net>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-mediatek@lists.infradead.org, Minas
 Harutyunyan <hminas@synopsys.com>, Simon Horman <horms+renesas@verge.net.au>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Dmitry Torokhov <dtor@chromium.org>, Guenter Roeck <linux@roeck-us.net>,
 Pengutronix
 Kernel Team <kernel@pengutronix.de>, Colin Ian King <colin.king@canonical.com>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The usb_debug_root is now a file-scope static variable, use
usb_debugfs_create_dir() to create directory under usb root

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
index c96e5dab0a48..4195eb6f7a74 100644
--- a/drivers/usb/mtu3/mtu3_debugfs.c
+++ b/drivers/usb/mtu3/mtu3_debugfs.c
@@ -529,7 +529,7 @@ void ssusb_dr_debugfs_init(struct ssusb_mtk *ssusb)
 void ssusb_debugfs_create_root(struct ssusb_mtk *ssusb)
 {
 	ssusb->dbgfs_root =
-		debugfs_create_dir(dev_name(ssusb->dev), usb_debug_root);
+		usb_debugfs_create_dir(dev_name(ssusb->dev));
 }
 
 void ssusb_debugfs_remove_root(struct ssusb_mtk *ssusb)
-- 
2.23.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
