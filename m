Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90EDC47DDB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IV7dhqul9WvXyKJ2ZoYl348suTPEjJTKUrzYhGujRks=; b=viq6hzqGZ3OHTon+e1hsaR1icQ
	A2mhavSpXzIicXgz6onFoIKQnzVxIYrZCF/p1geDjI32MoGtjOq9nuzKqjHqNxmppbERxulmD4pXe
	3CzmSWclKarQfPI7oqXQc2khD3sbZA72xLZwVr+sKLxccN8tF+HspAelrD2JSA2c6lRMd5d5YN4lU
	agqJmPXYI0fTM26mIFyb+1+Dfm/xB1w08BmQhdFVg0zlJu7slaY17XsTMBq1zC9JipO4q9GRfZw5Q
	UI7hGv41wpblfXvZDI/cOOEVUmqtd64SnM9wlhPe5RUfjVh2NxJIfb7uc04qJcvzTlN7HJbOwDyYe
	WQ1O7Nmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTrB-00000007NC4-3WF7;
	Thu, 01 Feb 2024 09:59:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTr9-00000007NBG-1vpZ;
	Thu, 01 Feb 2024 09:59:40 +0000
X-UUID: 999f56aec0e811eea0bf134e88e6c2dc-20240201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IV7dhqul9WvXyKJ2ZoYl348suTPEjJTKUrzYhGujRks=;
	b=YCiSTW1YR5WgUfsccaksI0OH8Bg4smHLY1RBb3EkzQVTX+CrdDB7eyIUsXUCfXwibT2/YyXM/zMMUL5UdsCvOT6xcaN5PpYdNHS/vWGv4jEAWIvy+64lWrBJfUZFRyy9h5+cvo/FBi5V0Y8Wz9KIG11casO10Qwvf1ONKgAgpu4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:76bffc0e-c550-4f93-b8da-f9a13e2d2785,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:1394e88e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 999f56aec0e811eea0bf134e88e6c2dc-20240201
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <flash.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 303927029; Thu, 01 Feb 2024 02:59:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Feb 2024 17:58:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Feb 2024 17:58:57 +0800
From: Pin-Chuan Liu <flash.liu@mediatek.com>
To: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <cylen.yao@mediatek.com>, Pin-Chuan Liu
	<flash.liu@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] firmware: arm_scmi: Avoid to call mbox_client_txdone on txdone_irq mode
Date: Thu, 1 Feb 2024 17:57:52 +0800
Message-ID: <20240201095754.25374-1-flash.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.422700-8.000000
X-TMASE-MatchedRID: wpfAD6xEq/V3VjVXh/TSj0+4wmL9kCTxsEf8CpnIYtnz+Z+5iD+iRb87
	jWxVKGOh6lVWmieuZwnS1Xndr/786uHxFb2pjr4bsyNb+yeIRApCX8V1FiRRkt9RlPzeVuQQost
	SmZzTxtqmuE8sHNH+0VdTP5dw4GERGN63p9ap1YqTEgTE0DYkgNJ178I1tpklvQmfz7H+YLGjxY
	yRBa/qJcFwgTvxipFa9xS3mVzWUuCMx6OO8+QGvvp6VplSc3s0tpvpvul44/cJ0fmqU3YzVcLTD
	yr2YnVuSsYg+5kG385nseWfOBeyocaMMthp5d9Dfe0egsLORU77IUwzFKThe3mVKZusLp922v9O
	jYWA2uMMswg45VMfPadst5iAforfVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.422700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 35B1F35528FCD59015ED3E5BC9AED8B5A4809366F666BAE20EA5A4EB88B2D1CE2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_015939_512007_2E2F4589 
X-CRM114-Status: GOOD (  10.89  )
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
---
V1 -> V2:
 - Remove Change-Id
 - Use single line comment
 
 drivers/firmware/arm_scmi/mailbox.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/mailbox.c b/drivers/firmware/arm_scmi/mailbox.c
index b8d470417e8f..d391463e3208 100644
--- a/drivers/firmware/arm_scmi/mailbox.c
+++ b/drivers/firmware/arm_scmi/mailbox.c
@@ -8,6 +8,7 @@
 
 #include <linux/err.h>
 #include <linux/device.h>
+#include <linux/mailbox_controller.h>
 #include <linux/mailbox_client.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -275,7 +276,10 @@ static void mailbox_mark_txdone(struct scmi_chan_info *cinfo, int ret,
 	 * Unfortunately, we have to kick the mailbox framework after we have
 	 * received our message.
 	 */
-	mbox_client_txdone(smbox->chan, ret);
+
+	/* With txdone_irq mode, kick can be done by mbox_chan_txdone */
+	if (!(smbox->chan->mbox->txdone_irq))
+		mbox_client_txdone(smbox->chan, ret);
 }
 
 static void mailbox_fetch_response(struct scmi_chan_info *cinfo,
-- 
2.18.0


