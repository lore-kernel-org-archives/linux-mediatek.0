Return-Path: <SRS0=kKdk=A5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D794C433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 02:55:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEBC02070E
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 02:55:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="svZSHtWh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="h6JqILvm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEBC02070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n4sHN7mmcbfflQmsUtqfD58Mga14AklZ3FX9ezGKkQs=; b=svZSHtWh0IskPecwWop7y+sIJ
	fdmjqefoOedHJztBd3BLapyEvKd4euU14XYrnGEx+BN+MOXI6jHwvwddmBxhPtXIavQtTla+hZRmJ
	xLQ+iYI1KITDrjLaEB8TB3bEumv/b/9HK+do3IsoieV+nw2OyB6rMypWaswMo/FnVdlQnbjdIHhZD
	+iYZDQN7Y/MsW+lWawBEM7K8QpylyASXMZc3ozSLee0W5vT/c6993WOp1jGQ++2409wTeXlGyKjjK
	LNmXdX4aJ+s4dfViC6ZTW94iXKDH1dIrmSLiygQ0eH1rVzlONhKovun3YTJBHcX8hiP99WfRslrdk
	9t4U3fK2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwd0g-0006pm-U8; Sat, 18 Jul 2020 02:55:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwd0e-0006pA-1n; Sat, 18 Jul 2020 02:55:33 +0000
X-UUID: 2202d1b3d8b2448ca48e8648df77609b-20200717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JJ5o+WFe3CVKnlVdykIeEjsdjGfkUl9MSJCZgz3eF2c=; 
 b=h6JqILvmrVsxfhR1S5A3n9e/L1cwpXlmhF1eG/kO4ynP2Bsx/fIlOHDXdBLAQkOw2EwU0vFwTMHCjmRSr7EwZo3tuVoF+zFb+S9B95qrIj+wFoko8Kk6EBa+XonE2kfVGf852Uz/da6Cp377oyfkC6c+VdPZR4b4UaU0bJoA4OU=;
X-UUID: 2202d1b3d8b2448ca48e8648df77609b-20200717
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1148834522; Fri, 17 Jul 2020 18:55:17 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jul 2020 19:45:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Jul 2020 10:45:09 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 18 Jul 2020 10:45:10 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] usb: gadget: configfs: Fix use-after-free issue with
 udc_name
Date: Sat, 18 Jul 2020 10:45:03 +0800
Message-ID: <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1594881666-8843-1-git-send-email-macpaul.lin@mediatek.com>
References: <1594881666-8843-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7A91C36DAFF4860455E96955268D0533348A3C2AFE1C668A6C271346DB2534C92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_225532_310225_C3B5A6E9 
X-CRM114-Status: GOOD (  11.04  )
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

From: Eddie Hung <eddie.hung@mediatek.com>

There is a use-after-free issue, if access udc_name
in function gadget_dev_desc_UDC_store after another context
free udc_name in function unregister_gadget.

Context 1:
gadget_dev_desc_UDC_store()->unregister_gadget()->
free udc_name->set udc_name to NULL

Context 2:
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
Reviewed-by: Peter Chen <peter.chen@nxp.com>
Cc: stable@vger.kernel.org
---
Changes for v2:
  - Fix typo %s/contex/context, Thanks Peter.

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
