Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96454C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=//93L4URrHmR8B3HrNQ8EFflcTNsIf4QRUriQS6sCkU=; b=2fp1w84Cvsqczq
	VzlXCdjIjcRp1Ywbk9jG6WhV8PX3OYbZU0ifiF17DWiJK9m9TWLawTdO7S/Ezs6lvyfQadlPtckv3
	awY48JljN9ZLwcS8xUouYh/qc8EcUllHBUY6ajrh2SQc+S7B8lPzerSznaRC++jrWzYmJOsSjf+DA
	Xs7xs26eosr5Ag76iUZ8230yeXk4+G4o5JiHclVQHkSzzlchKdoLxU2KvInDfeN2uXgf97r7d9Q0C
	id6nXYanElM20SwVq0yV83Yy4MjlTR7OYvk1c234LT76JZ28DNc9v7u62/KFT+cv5s2QqWalSqNaZ
	KAXUCUPV6IntsphR3pzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUONP-00C0NA-I8; Wed, 16 Mar 2022 07:47:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUONE-00C0Kv-0E; Wed, 16 Mar 2022 07:47:13 +0000
X-UUID: 8b42a2c03f9f4d649178dd396be32f4d-20220316
X-UUID: 8b42a2c03f9f4d649178dd396be32f4d-20220316
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 540197412; Wed, 16 Mar 2022 00:47:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 00:43:31 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 16 Mar 2022 15:43:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 15:43:29 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>
CC: <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <mark-pk.tsai@mediatek.com>, <yj.chiang@mediatek.com>
Subject: [PATCH] driver core: Prevent overriding async driver of a device
 before it probe
Date: Wed, 16 Mar 2022 15:43:28 +0800
Message-ID: <20220316074328.1801-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_004712_061464_E9FCF1F1 
X-CRM114-Status: GOOD (  13.52  )
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

When there are 2 matched drivers for a device using
async probe mechanism, the dev->p->async_driver might
be overridden by the last attached driver.
So just skip the later one if the previous matched driver
was not handled by async thread yet.

Below is my use case which having this problem.

Make both driver mmcblk and mmc_test allow async probe,
the dev->p->async_driver will be overridden by the later driver
mmc_test and bind to the device then claim it for testing.
When it happen, mmcblk will never do probe again.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/base/dd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f47cab21430f..f0bd779a4696 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1085,6 +1085,7 @@ static void __driver_attach_async_helper(void *_dev, async_cookie_t cookie)
 
 	__device_driver_lock(dev, dev->parent);
 	drv = dev->p->async_driver;
+	dev->p->async_driver = NULL;
 	ret = driver_probe_device(drv, dev);
 	__device_driver_unlock(dev, dev->parent);
 
@@ -1131,7 +1132,7 @@ static int __driver_attach(struct device *dev, void *data)
 		 */
 		dev_dbg(dev, "probing driver %s asynchronously\n", drv->name);
 		device_lock(dev);
-		if (!dev->driver) {
+		if (!dev->driver && !dev->p->async_driver) {
 			get_device(dev);
 			dev->p->async_driver = drv;
 			async_schedule_dev(__driver_attach_async_helper, dev);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
