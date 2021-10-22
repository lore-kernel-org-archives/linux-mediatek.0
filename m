Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65398C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 06:48:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 244E260EE3
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 06:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 244E260EE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DzHdXchuFBjXpmeKm72W9rd4l4lHM6PaWdK5nl4AEng=; b=qXCl/8nAk4rBJG
	laoE8VZqte5mC6fZIdRP8Q/sB7exC/1hUawDW6Eat4rpGz2nYjsQc4obxTAl8tNA4S7Vs3f/YciXQ
	4wx5q6Wbl8H+t3rMx0aNU1V77hmJh4HI0XdJs+EStgM3angGLU5DJZt3bdJ6sds2P5voyFnv9sAAl
	p1H8B7OA0jGmKJO/wGQNY/NyKaXj0s9xHT0DrPjNHrW4Acm566xu4TNjgA/5kKpudDTQ6RPBj7his
	2eaKksxOgrHQYoO7xMEVv4kOOMlltRCzdqq+3T2Vd3+2c9WQUERu2Pjp0OuYEahOzKT7UWSs2ovfW
	Jsz6+5vAvVjCQLj7QUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdoLT-009qDZ-18; Fri, 22 Oct 2021 06:48:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdoLO-009qAa-Nb; Fri, 22 Oct 2021 06:48:01 +0000
X-UUID: 41dc4b1f4fef4cf1b69d2197f6544922-20211021
X-UUID: 41dc4b1f4fef4cf1b69d2197f6544922-20211021
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1652010741; Thu, 21 Oct 2021 23:47:53 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Oct 2021 23:47:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 14:47:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Oct 2021 14:47:50 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
CC: <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <tequila.yuang@mediatek.com>, <yj.chiang@mediatek.com>,
 <mark-pk.tsai@mediatek.com>
Subject: [PATCH] dm: add module parameter bdev_wait
Date: Fri, 22 Oct 2021 14:47:47 +0800
Message-ID: <20211022064748.30136-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_234758_799049_0FDA4144 
X-CRM114-Status: GOOD (  12.61  )
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

dm_early_create() fail if the target block device not found in
the late init stage.
The block device is created in mmc_rescan() which kernel do
it async by queue it into system_freezable_wq.
Add module param bdev_wait to support waiting the block device
ready before dm_early_create() like prepare_namespace() does.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/md/dm-init.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/md/dm-init.c b/drivers/md/dm-init.c
index b0c45c6ebe0b..a3d24cafa4f4 100644
--- a/drivers/md/dm-init.c
+++ b/drivers/md/dm-init.c
@@ -8,11 +8,13 @@
  */
 
 #include <linux/ctype.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/device-mapper.h>
 #include <linux/init.h>
 #include <linux/list.h>
 #include <linux/moduleparam.h>
+#include <linux/mount.h>
 
 #define DM_MSG_PREFIX "init"
 #define DM_MAX_DEVICES 256
@@ -20,6 +22,7 @@
 #define DM_MAX_STR_SIZE 4096
 
 static char *create;
+static char *bdev_wait;
 
 /*
  * Format: dm-mod.create=<name>,<uuid>,<minor>,<flags>,<table>[,<table>+][;<name>,<uuid>,<minor>,<flags>,<table>[,<table>+]+]
@@ -286,6 +289,12 @@ static int __init dm_init_init(void)
 	DMINFO("waiting for all devices to be available before creating mapped devices");
 	wait_for_device_probe();
 
+	if (bdev_wait) {
+		DMINFO("Waiting for block device %s...", bdev_wait);
+		while (!name_to_dev_t(bdev_wait))
+			msleep(5);
+	}
+
 	list_for_each_entry(dev, &devices, list) {
 		if (dm_early_create(&dev->dmi, dev->table,
 				    dev->target_args_array))
@@ -301,3 +310,5 @@ late_initcall(dm_init_init);
 
 module_param(create, charp, 0);
 MODULE_PARM_DESC(create, "Create a mapped device in early boot");
+module_param(bdev_wait, charp, 0);
+MODULE_PARM_DESC(bdev_wait, "Wait until the block device ready before dm_early_create");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
