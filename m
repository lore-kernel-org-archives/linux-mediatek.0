Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E204EC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:24:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 888BA21D7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HBpx1Vqe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="afwxzIUV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 888BA21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RluBSRy7m9ZDQ9fkKHQdtt/kI85DhwtE+MrAMsrqyAk=; b=HBpx1VqeLAINIZZLjFbrOPMd9
	kPiUMXvI9cCWRvUmL6BrLk6V0CHk1BtfATokzFadjS/Q7dEZPVmZQH7PbD8ppwh7TvZp5WH9O84NK
	3fRqus9M6uTaZeaN04ZP9cDyf8WXfcppdkQQ39Vtbns00GRk01p9rrb23xL/D9UwdK76OyayKRxMj
	IzedZQRBRWwf0CfVH0uJTjAvoai2Gr+CfDO76UB9CYhVIOzxME7015KnOZaTSJNFoBoxH+YgyK/vu
	AX06GbLkzbLhx3Y+N65DNeHSTEUuMketFYXwLVe8b1uqfsXixFzQ9bVERiuoH1c6/r3UeLo45lQuk
	Ae5xaUENw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLh9S-00055l-Uh; Fri, 25 Sep 2020 06:24:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLh8q-0004mp-MO; Fri, 25 Sep 2020 06:23:38 +0000
X-UUID: da554b49beee4a45ba31c95f869af7d0-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=L++qiABiAzjVbnpi2fjLv+qiJlqqsDdE0Ctsz0YdEqI=; 
 b=afwxzIUV1kZ/u7NLemFjMHMdOzJWmVqJR8sZtAKii8zKMEyd9wCuK/oL1dTi52WW3pWWvShs3utIIDUKhVaPWF8tP8aco6wyPLD9KiZ56UXdFXPYZxzsXZVp+M8Axonuuel9KX/nrZD6BBq/xp3lYxjBculO5YwyffDW+Z5S38w=;
X-UUID: da554b49beee4a45ba31c95f869af7d0-20200924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1385979615; Thu, 24 Sep 2020 22:23:31 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 23:23:23 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 14:23:21 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 14:23:21 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH V3 RESEND 05/11] usb: gadget: bdc: fix check warning of block
 comments alignment
Date: Fri, 25 Sep 2020 14:20:26 +0800
Message-ID: <1601014832-29726-5-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1601014832-29726-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1601014832-29726-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0D6ADDFBD2EDD57D0FE79EE2B100B82431459905CE42507AF0FACDA5C3638E202000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_022336_883421_5D009B78 
X-CRM114-Status: GOOD (  16.73  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 Sasi Kumar <sasi.kumar@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

fix the warning:
  WARNING:BLOCK_COMMENT_STYLE:
  Block comments should align the * on each line

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
v3: add acked-by Florian

v2: add Cc Florian
---
 drivers/usb/gadget/udc/bdc/bdc.h     | 2 +-
 drivers/usb/gadget/udc/bdc/bdc_ep.c  | 2 +-
 drivers/usb/gadget/udc/bdc/bdc_udc.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index fcba77e..c0ee735 100644
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
index 44f3a12..3fb36c8 100644
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
index 248426a..0c1ab95 100644
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
