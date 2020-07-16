Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C4FC433E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 06:41:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FACF206F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 06:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="19nciuXd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XRXOcdeT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FACF206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WuixRHbhhCtP/Eu724Og7P+KBv1F9QsdwisRo2Wp1xE=; b=19nciuXd0Y5UesqHYDdvYIr6Fm
	tL3Hw7rYzWW4oQ0i+GYEyCbHPmoWlxgY3U25oO09g816SZqFPWE2na4mrEeswRegjBRK5tGx0upJK
	oPlhM7REteIgaM32EEkaQhoGoeqoDC2Kv/Gx45rjTkYqrxzqVagrj83rRHdf5xBVb47HlpMx8YiHA
	KXgyzDkxzIJPkR6LtbDT3yV2Yl+DDydIh6LCWIkdxGTU+OYdaLiXDjQn1p+hA3Q+eH5w4zekw4zJz
	Hc3rTJd0tMx6TP3IxyUiOi+i76tRmay7EvRPwhMi9cBLsmguBpskC2c1pAWr24B+j2/oDLukv5I8U
	d0DufMvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvxaJ-0000XF-DV; Thu, 16 Jul 2020 06:41:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvxaG-0000WE-1r; Thu, 16 Jul 2020 06:41:33 +0000
X-UUID: e92548ae80ef45aeaeed4abe9851409f-20200715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ho71eZkBMon4Vz3VLsPtyCt1CUgMlDiLHMKnef2ILSA=; 
 b=XRXOcdeTwdFN5d5s8jX8hdz6O50rKSfYqC/FF81iO2+b53MPXL5/oC0kr7EVgPUpRORpRoYW96U7jERsz9vZ9HnAyr9cI8T9YQHHcldb5pesSvSRotu9pyGF/T3RirNz9Y82YCsHptjKZZ/PHrJZIhY7f3bsF0ReHtLCijHTROo=;
X-UUID: e92548ae80ef45aeaeed4abe9851409f-20200715
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1279607227; Wed, 15 Jul 2020 22:41:27 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jul 2020 23:41:21 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jul 2020 14:41:20 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 16 Jul 2020 14:41:20 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] usb: gadget: configfs: Fix use-after-free issue with udc_name
Date: Thu, 16 Jul 2020 14:41:06 +0800
Message-ID: <1594881666-8843-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_024132_319814_80564F40 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: stable@vger.kernel.org, Macpaul Lin <macpaul.lin@gmail.com>,
 Eddie Hung <eddie.hung@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There is a use-after-free issue, if access udc_name
in function gadget_dev_desc_UDC_store after another context
free udc_name in function unregister_gadget.

Contex 1:
gadget_dev_desc_UDC_store()->unregister_gadget()->
free udc_name->set udc_name to NULL

Contex 2:
gadget_dev_desc_UDC_show()-> access udc_name

Call trace:
dump_backtrace+0x0/0x340
show_stack+0x14/0x1c
dump_stack+0xe4/0x134
print_address_description+0x78/0x478
__kasan_report+0x270/0x2ec
kasan_report+0x10/0x18
__asan_report_load1_noabort+0x18/0x20
string+0xf4/0x138
vsnprintf+0x428/0x14d0
sprintf+0xe4/0x12c
gadget_dev_desc_UDC_show+0x54/0x64
configfs_read_file+0x210/0x3a0
__vfs_read+0xf0/0x49c
vfs_read+0x130/0x2b4
SyS_read+0x114/0x208
el0_svc_naked+0x34/0x38

Add mutex_lock to protect this kind of scenario.

Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: stable@vger.kernel.org
---
 drivers/usb/gadget/configfs.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 9dc06a4e1b30..21110b2865b9 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -221,9 +221,16 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 
 static ssize_t gadget_dev_desc_UDC_show(struct config_item *item, char *page)
 {
-	char *udc_name = to_gadget_info(item)->composite.gadget_driver.udc_name;
+	struct gadget_info *gi = to_gadget_info(item);
+	char *udc_name;
+	int ret;
+
+	mutex_lock(&gi->lock);
+	udc_name = gi->composite.gadget_driver.udc_name;
+	ret = sprintf(page, "%s\n", udc_name ?: "");
+	mutex_unlock(&gi->lock);
 
-	return sprintf(page, "%s\n", udc_name ?: "");
+	return ret;
 }
 
 static int unregister_gadget(struct gadget_info *gi)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
