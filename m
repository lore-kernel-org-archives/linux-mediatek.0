Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EC4C5DF62
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 03:16:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 469DA2053B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 03:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PAgN4/ZU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 469DA2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3lLRgtcSQcz8M9GYdZF5tYvSft3lZFXwqeU3Qmcz6+Q=; b=PAgN4/ZUxy330z
	Y+IPMjTUDn+/D2WtMdV6Zgaq/v86/Wjz1e83+0j275nu/+Vl8CfwylPiOkPbxHmCY5fUL0dysTcoY
	pDTGuH1YV2jmDgmQHpQjhXsVtldnIM8VOPseIFBSwp9iQZyVjUGu/mQO2SYwzo/d8b6VmHhI28C1V
	qVfTbVUFJ99I/A4pHz4RFXZYWJaHXrigvk22j44SOyPQB9rJ/UxHj4EFetcuWfsOn07aAi7ZqT+O4
	zzLL/wu+jTSastabGDD8f7utmvHip7aYWa+biLc0wBJC2KxptNHEjKpGs8ZXvxclCPPSo4lJBbtn8
	EWXQymKJ1uel335P32Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSBnx-0008Fu-Cg; Wed, 06 Nov 2019 03:16:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSBnu-0008EG-12; Wed, 06 Nov 2019 03:16:19 +0000
X-UUID: 79d9b0d2d44d4f82abf652617e149700-20191105
X-UUID: 79d9b0d2d44d4f82abf652617e149700-20191105
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1844636388; Tue, 05 Nov 2019 19:16:06 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 5 Nov 2019 19:16:01 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 6 Nov 2019 11:16:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 6 Nov 2019 11:15:57 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
Subject: [PATCH 01/28] usb: common: change usb_debug_root as static variable
Date: Wed, 6 Nov 2019 11:15:02 +0800
Message-ID: <8cb137d5376b4e317dc22dcb9e81a1125b781f8f.1573008519.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_191618_075807_35139D9B 
X-CRM114-Status: GOOD (  13.13  )
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

Try to avoid using extern global variable, and provide two
functions for the usage cases

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/common/common.c | 16 ++++++++++++++--
 include/linux/usb.h         |  5 ++++-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 1433260d99b4..639ee6d243a2 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -293,8 +293,20 @@ struct device *usb_of_get_companion_dev(struct device *dev)
 EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
 #endif
 
-struct dentry *usb_debug_root;
-EXPORT_SYMBOL_GPL(usb_debug_root);
+static struct dentry *usb_debug_root;
+
+struct dentry *usb_debugfs_create_dir(const char *name)
+{
+	return debugfs_create_dir(name, usb_debug_root);
+}
+EXPORT_SYMBOL_GPL(usb_debugfs_create_dir);
+
+struct dentry *usb_debugfs_create_file(const char *name, umode_t mode,
+			void *data, const struct file_operations *fops)
+{
+	return debugfs_create_file(name, mode, usb_debug_root, data, fops);
+}
+EXPORT_SYMBOL_GPL(usb_debugfs_create_file);
 
 static int __init usb_common_init(void)
 {
diff --git a/include/linux/usb.h b/include/linux/usb.h
index e656e7b4b1e4..ad96e0aa0127 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -2001,7 +2001,10 @@ extern void usb_register_notify(struct notifier_block *nb);
 extern void usb_unregister_notify(struct notifier_block *nb);
 
 /* debugfs stuff */
-extern struct dentry *usb_debug_root;
+extern struct dentry *usb_debugfs_create_dir(const char *name);
+extern struct dentry *
+usb_debugfs_create_file(const char *name, umode_t mode, void *data,
+			const struct file_operations *fops);
 
 /* LED triggers */
 enum usb_led_event {
-- 
2.23.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
