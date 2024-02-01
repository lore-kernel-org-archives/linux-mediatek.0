Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6B4C47DDB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 04:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bLgCShFq1WIC3Xl1kd4l8YHBBYLHXkqdRbA4uvGyyuA=; b=zjrUFXDnQs/q7mJi5/Btga2pmt
	HlrhyuKThNoAXpaGUiCw37TVFozjXhGSJlYm3n1gzVc+MGDspfEl1m+ldRAwkUf822G8mImE600lt
	QXOSJry3K0XaoQkET7VTQQbWd0RzpVqnNgcJnycrmlMeLsfd0sBdWOIA13N7qiQPXZ9DT4RrtnFE3
	bmxvXxTZNiYi1riEU3rrugROHOy4ISJLJywYIvORcRSwUnSsxUqhhzB67n+3f/e/mD2ZG65YbBlKm
	/RqkIsgHtSVUapar/IMYEdTWcN8l8nmEVu+7TlYgwtRlaoMvFttX71+4wgSrQ+hgKteSCIjMZ6BfZ
	nD72JtSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVP52-00000006ZdP-2Tkx;
	Thu, 01 Feb 2024 04:53:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVP50-00000006Zcr-3PWZ;
	Thu, 01 Feb 2024 04:53:39 +0000
X-UUID: d9d31d44c0bd11eea0bf134e88e6c2dc-20240131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bLgCShFq1WIC3Xl1kd4l8YHBBYLHXkqdRbA4uvGyyuA=;
	b=iiOYb/2ZPevhED8wObTiUgUTIi7YTMZcy0iMRL+9cmWRVOnUoT+GeLzDiPmmaGTf264Gbc2EQ6fuXqDQqq0CZlGfxmYgfIvB7HAN8B0Prktb8NX8HlTTN4AzpQMBUwjXdNMjMHJzhH5GatM2xniyuEWC6tKyg0r4kYbtjh0uZ6M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:73698b1b-f893-4eb5-b18d-bc7042f6acd6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:4d037e83-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d9d31d44c0bd11eea0bf134e88e6c2dc-20240131
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <flash.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 595192597; Wed, 31 Jan 2024 21:53:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Feb 2024 12:52:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Feb 2024 12:52:54 +0800
From: Pin-Chuan Liu <flash.liu@mediatek.com>
To: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <cylen.yao@mediatek.com>, Pin-Chuan Liu
	<flash.liu@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] firmware: arm_scmi: Avoid to call mbox_client_txdone on txdone_irq mode
Date: Thu, 1 Feb 2024 12:52:50 +0800
Message-ID: <20240201045253.14390-1-flash.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.938200-8.000000
X-TMASE-MatchedRID: V0b+0D6KeHB3VjVXh/TSj0+4wmL9kCTxsEf8CpnIYtnz+Z+5iD+iRb87
	jWxVKGOh6lVWmieuZwniU0wvQv0w64JrRWPc34Z+A9lly13c/gGy4iyjvVWTon5h6y4KCSJc3oz
	JRX7b4NnHBJlWHsfjZDhRWiGxovmInVURoFo9SBy5kfgtJfb41X0tCKdnhB589yM15V5aWpj6C0
	ePs7A07fhmFHnZFzVqsuEZvQp0J9pIfsylPBBktLaUERHa8u2NERrrPWZ/TB+IKiZao8KaJQeWS
	4msO1E5EoIaZ0cyok3N8/wCCOEm3aRHRNjz1UNJSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvr
	HlT8euJ0YHKn7N1oOA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.938200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6840BBDB642849DB19F6FAED2D4AB1AD13039BD7662C89BC26B20A7DB8D9EFCA2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_205338_859980_C281A04A 
X-CRM114-Status: GOOD (  10.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On txdone_irq mode, tx_tick is done from mbox_chan_txdone.
Calling to mbox_client_txdone could get error message
and return directly, add a check to avoid this.

Signed-off-by: Pin-Chuan Liu <flash.liu@mediatek.com>
Change-Id: Iacbe0d36ef9cc16974c013c3e94c47dc79eae52b
---
 drivers/firmware/arm_scmi/mailbox.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/mailbox.c b/drivers/firmware/arm_scmi/mailbox.c
index b8d470417e8f..f6fe801c2e34 100644
--- a/drivers/firmware/arm_scmi/mailbox.c
+++ b/drivers/firmware/arm_scmi/mailbox.c
@@ -8,6 +8,7 @@
 
 #include <linux/err.h>
 #include <linux/device.h>
+#include <linux/mailbox_controller.h>
 #include <linux/mailbox_client.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -275,7 +276,12 @@ static void mailbox_mark_txdone(struct scmi_chan_info *cinfo, int ret,
 	 * Unfortunately, we have to kick the mailbox framework after we have
 	 * received our message.
 	 */
-	mbox_client_txdone(smbox->chan, ret);
+
+	/*
+	 * With txdone_irq mode, kick can be done by mbox_chan_txdone.
+	 */
+	if (!(smbox->chan->mbox->txdone_irq))
+		mbox_client_txdone(smbox->chan, ret);
 }
 
 static void mailbox_fetch_response(struct scmi_chan_info *cinfo,
-- 
2.18.0


