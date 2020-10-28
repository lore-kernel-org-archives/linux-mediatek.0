Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAA2C388F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 17:56:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B6DB247FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 17:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EWigRmqs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f9d+1Ye5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B6DB247FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KYHQGbAwRGuN1x9P4M48J9w+/NEWhsVAcZgwy8vBk3s=; b=EWigRmqsTS/j7Hi/OcyLzSr8s4
	osQP2QtTVE9xqWzzzDQjhfDnklun/1kUfCisfN2gag8+CnZliveKIkRoxZfJw1vGmQxx4c56kHOTB
	LDYbrbkPKsiG6B3qxICZ2hfuQ+4XQnQyjobrRvqd8hPyilPz9eRhcJfqc1ozP64mX0GlGmJ4qdJ4T
	yAdSluWQZEOluXXopqvnoj5bwGcB08A3oEfB6gRHj/1Yv91fCdA/h+kNxP4DMm1HZ7LFyqrlwz5Ja
	O99jABORvtkrpKaBFU7/AarOsusriXnXig/TbtI681LNyLX06XxBgpCv2jbOxp0+J7QVIRBXSVIyc
	enLe8xMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXpg8-0008Nd-VC; Wed, 28 Oct 2020 17:56:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXpg3-0008M8-CY; Wed, 28 Oct 2020 17:56:06 +0000
X-UUID: f772cbaf3ea24da09ea9caada2409641-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RYETYlae4iO6GU8GFOfcOxXXaKOlfrIac/CifbWh6Vw=; 
 b=f9d+1Ye50YEfT+J6TUF2CkzptokDTDHCxboGoiugNHN8j+LgHzAVS++gE+llW0w5KHjPcnoaEfxv8DhBV2l7FSGAReI143KV4+3SAszPGvWy5rPf+sNmg7Jp0VWPdGn8+NYvOMLISzNduwj83cVxLIg3LrN+cUGbjwhQeD6vLhw=;
X-UUID: f772cbaf3ea24da09ea9caada2409641-20201028
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2027246276; Wed, 28 Oct 2020 09:55:44 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 10:55:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 01:55:27 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Oct 2020 01:55:27 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: <macpaul@gmail.com>, <chunfeng.yun@mediatek.com>, <eddie.hung@mediatek.com>
Subject: [PATCH v2] usb: gadget: configfs: Fix use-after-free issue with
 udc_name
Date: Thu, 29 Oct 2020 01:55:23 +0800
Message-ID: <1603907723-19499-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8BA88157233FE31D320A44BF339572E794FB14D30A408FA9247CAD67040C28E02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_135604_208807_CD6E7C0D 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Ainge Hsu <ainge.hsu@mediatek.com>, Macpaul
 Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Macpaul Lin <macpaul.lin@mediatek.com>
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

 drivers/usb/gadget/configfs.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 56051bb..d9743f4 100644
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
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
