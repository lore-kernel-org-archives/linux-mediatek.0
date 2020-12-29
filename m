Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1CAC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:02:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9527420825
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9527420825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KYHQGbAwRGuN1x9P4M48J9w+/NEWhsVAcZgwy8vBk3s=; b=p1ub3udA2EnjvmzNqeS/Hsp1F
	SdJQ+Il5taqENXq0dm3qhAvImLU8e1yxFcqkk8bVTaAHsN3g1EO+PJ6YPgCQef2xkNtDPxAlugHOn
	DteRT4493zGW4p/pQy/sGdgMby7TScitykP7cLNLrI2nV0Tox9a4qdLS7XR2kqKpJCk9mwCduhh0/
	mqn+/jW0zyHdXmfrAbpwo0ydE44u8leML9GL4YMJuYodIMpwCwD3yAT4COs4aOn/ZiIJqpn2QJ3hy
	gKZJxRdvrv47vxy3ppSFKEYJ7/yYOeGBfNoVXuE0IJ8dcpawdH45aFFdWX612g/pp5Z8nFAueH1KE
	wqINszbMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuCm4-00076j-Sq; Tue, 29 Dec 2020 11:02:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuCm2-00075v-7R; Tue, 29 Dec 2020 11:02:44 +0000
X-UUID: 7a2affd94acc47fc9d48d37efd58655a-20201229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RYETYlae4iO6GU8GFOfcOxXXaKOlfrIac/CifbWh6Vw=; 
 b=ARcmqUoev/v5dDTQG3syOpbynR1+ixYIBWULMXdee5hfevsvOxaarboMLt2pArHGZaNZyryW7e5/sa1KsFYU5/sHpcrwBHr0sms+a6tY0RWt6sUqwgKqbNx0MvfJVyMF/iAHXrPTU+JVTu8kSnBDF79XAO3DHA4WOTCWg6kBguQ=;
X-UUID: 7a2affd94acc47fc9d48d37efd58655a-20201229
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1672162126; Tue, 29 Dec 2020 03:02:32 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Dec 2020 02:54:31 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Dec 2020 18:54:22 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 29 Dec 2020 18:54:22 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>
Subject: [PATCH RESEND v2] usb: gadget: configfs: Fix use-after-free issue
 with udc_name
Date: Tue, 29 Dec 2020 18:53:35 +0800
Message-ID: <1609239215-21819-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
References: <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D7599083FB75AC51A42E27F5D4110B8FDDD3B0ADAEA3DC865F0F32B8950722872000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_060243_023941_2B6CAC3C 
X-CRM114-Status: GOOD (  12.48  )
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
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, Ainge Hsu <ainge.hsu@mediatek.com>,
 stable@vger.kernel.org, Macpaul Lin <macpaul@gmail.com>
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
