Return-Path: <SRS0=vEIf=YZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BD3CA9ECB
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 02:29:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52CC2067D
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 02:29:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HTKNDwpx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C52CC2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9lBoFtjHz99FQbVljnzgaQ2hYy7vy/8LikhxguXhr/E=; b=HTKNDwpxEmAJik
	GBhmUSa5JLYxHabFQezJThuv7ebhqdsVQoajbqkgAyPHrQqqPGFmHUkbyy/nC4M6hG1JsSEJpk3H8
	+5MYlwxVJemzGtQ97m3hc2vB7lAkM7H3LDJkAQLBywk6xBPAyiqAVOKARejr80u7IXSAqN44yk18Z
	lyjVmZRT0586fJywJkQTFburlCfvJVjATXlvly0AmEirAta61YQCagq76gRzEIW4ESKnpZCH6nwR8
	y4HQHijFezxrvsVsfJnvzelp/y/RmgI6Cm8Zl/nvkxZ9qp6Dvzj5TT1dh5wzb729ayI6jI21ORswl
	CD27lrnqYcPBbsQt2qTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQMh3-0001l7-B6; Fri, 01 Nov 2019 02:29:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQMgr-0001cp-BJ; Fri, 01 Nov 2019 02:29:30 +0000
X-UUID: 83277e11ca37469fb56730e960c7b4fb-20191031
X-UUID: 83277e11ca37469fb56730e960c7b4fb-20191031
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1806161455; Thu, 31 Oct 2019 18:28:40 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 31 Oct 2019 19:29:16 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 1 Nov 2019 10:29:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 1 Nov 2019 10:29:10 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <felipe.balbi@linux.intel.com>
Subject: [RFC PATCH] usb: common: change usb_debug_root as static variable
Date: Fri, 1 Nov 2019 10:29:09 +0800
Message-ID: <1572575349-5596-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0BC6BF59A4B94D77E8F22C50E62B63F4624266A34528C7C889666C16795174A52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_192929_394280_246AF88A 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Try to avoid using extern global variable, and provide two
functions for the usage cases

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
NOTE:
    Prepared but not send out patches for drivers using usb_debug_root,
because I'm not sure whether this patch is needed, and many drivers
will be modified.
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
