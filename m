Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D20CC433F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 08:51:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE6EF221F0
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 08:51:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t+/pGpbw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OhrQ1t5m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE6EF221F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=axnC6JZ5Zx4kCi05c8mzWVntu8cWqnE2aoKstFtg+Nw=; b=t+/pGpbwg+RUYjPfhl7hV4ujk
	QNU+ZcSRUlCJ5m/Z+8Y/EFvsODUy6HezIPf0apdFRgId1gxGv4uHH1kbSvbseSUqo/0XxYc9pHQDU
	nYn1SNMitA6SjyKZV1l1el9chCRFIk5CWYvAGT6fr6RoOF4woZyde2JfQwxk1Swg5MXqCn3fajXje
	RdrNA5fK9N2ICJf16TRYj7t4nV0jHqrKdLF+IETybrvhD54Y0J+eme+gLhcqcyY+DudgtYGdfBUyL
	vV4jkMuujMRKVsqaVnOszUhn/1GeVkurTMdHjZY8klh/2PhzQnzIn5q7MrDfE0GJEYeAyyZCaOakL
	1At7gbVJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvGeM-0007DK-DT; Tue, 14 Jul 2020 08:50:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvGeI-0007Ah-8h; Tue, 14 Jul 2020 08:50:51 +0000
X-UUID: c2278aeaf486459181b1a62ef098145a-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x8d1kEG6R+1qdYQiFEoh0ig9IPYEAfPS4Hed6ezF5p8=; 
 b=OhrQ1t5m+ESdFkKDyOoNw1rD9iDC9NmPzBRnT4WWmsins8iXrCd6R5ZApYWBN3ups6MeV3XSECmXk8xUV3+wOZH9bVaOvvbxbF2QrzihrotQr0vxzyvh99nIgZqR3Q4X649PKqUk/sEmMEefaC2pg5XyDABg1R8BqG7EcbCYB2k=;
X-UUID: c2278aeaf486459181b1a62ef098145a-20200714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1667912739; Tue, 14 Jul 2020 00:50:44 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 01:50:40 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 16:50:37 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 16:50:36 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 6/9] usb: gadget: bdc: fix check warning of block comments
 alignment
Date: Tue, 14 Jul 2020 16:48:51 +0800
Message-ID: <1594716535-24699-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 18474C77123EBD5264D3D952833CE7C25037C52314ACC75B1619A0426DD44BC32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_045050_454890_535C6602 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

fix the warning:
  WARNING:BLOCK_COMMENT_STYLE:
  Block comments should align the * on each line

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/gadget/udc/bdc/bdc.h     | 2 +-
 drivers/usb/gadget/udc/bdc/bdc_ep.c  | 2 +-
 drivers/usb/gadget/udc/bdc/bdc_udc.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index 9615438..6940934 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -35,7 +35,7 @@
 /*
  * Maximum size of ep0 response buffer for ch9 requests,
  * the set_sel request uses 6 so far, the max.
-*/
+ */
 #define EP0_RESPONSE_BUFF  6
 /* Start with SS as default */
 #define EP0_MAX_PKT_SIZE 512
diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index 0c44002..eea66d5 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -68,7 +68,7 @@ static void ep_bd_list_free(struct bdc_ep *ep, u32 num_tabs)
 		 * check if the bd_table struct is allocated ?
 		 * if yes, then check if bd memory has been allocated, then
 		 * free the dma_pool and also the bd_table struct memory
-		*/
+		 */
 		bd_table = bd_list->bd_table_array[index];
 		dev_dbg(bdc->dev, "bd_table:%p index:%d\n", bd_table, index);
 		if (!bd_table) {
diff --git a/drivers/usb/gadget/udc/bdc/bdc_udc.c b/drivers/usb/gadget/udc/bdc/bdc_udc.c
index 15652c5..ba9365e 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_udc.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_udc.c
@@ -164,7 +164,7 @@ static void bdc_func_wake_timer(struct work_struct *work)
 	/*
 	 * Check if host has started transferring on endpoints
 	 * FUNC_WAKE_ISSUED is cleared when transfer has started after resume
-	*/
+	 */
 	if (bdc->devstatus & FUNC_WAKE_ISSUED) {
 		dev_dbg(bdc->dev, "FUNC_WAKE_ISSUED FLAG IS STILL SET\n");
 		/* flag is still set, so again send func wake */
@@ -205,7 +205,7 @@ static void handle_link_state_change(struct bdc *bdc, u32 uspc)
 				 * if not then send function wake again every
 				 * TNotification secs until host initiates
 				 * transfer to BDC, USB3 spec Table 8.13
-				*/
+				 */
 				schedule_delayed_work(
 						&bdc->func_wake_notify,
 						msecs_to_jiffies(BDC_TNOTIFY));
@@ -379,7 +379,7 @@ static int bdc_udc_start(struct usb_gadget *gadget,
 	 * Run the controller from here and when BDC is connected to
 	 * Host then driver will receive a USPC SR with VBUS present
 	 * and then driver will do a softconnect.
-	*/
+	 */
 	ret = bdc_run(bdc);
 	if (ret) {
 		dev_err(bdc->dev, "%s bdc run fail\n", __func__);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
