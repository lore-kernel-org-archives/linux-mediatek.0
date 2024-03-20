Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25BCCD11BF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+MGvbJYjhy895if8D0sU6axrp3f+KhPZVFX8vDFO74=; b=B7h1zGXEkzJol7RtNy0iytkzjq
	+KE+bq2OpQXUQtHBvqPnjlJF+3GM+O+NC8yh84yBt9GT1H4dHnHV6iuj7q1VCGTePAl73YDq2odza
	+XCTYqKDOxPDfsw772K2axCkqyLqmzbxT757U/csNQl2mFZ0vH/W2xa3ht+x3gKFhuc1ys1D7NV9c
	HGf1v1U83wFBu0JJLQS+N2Tp5Gf+71WnbM4KrJC17twMOvQVfn9YHEmjffhjFGRUkjq26WilcFKjN
	Rnw41SEzZC2hZki9B53GZmAsMU3DNpZzePG6dgNoNJkdC3XZQLLWMsxX5qIkxGu6md7ev3BaB18x3
	bCJJd9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpg-0000000GttW-179l;
	Wed, 20 Mar 2024 11:10:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpd-0000000Gts4-2o0d
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 11:10:06 +0000
X-UUID: 6635a286e6aa11ee9aa9374d6d45775a-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=K+MGvbJYjhy895if8D0sU6axrp3f+KhPZVFX8vDFO74=;
	b=Fl8G3QP7SKNDfmM+koblgjFicKJ7WTtg+7qcPXzyN8kID7RDOychurrr0Cdcz5HygyQJteBvhnff9luIWTv3YrFfnm3Weo2CmnZl92UwxCie1rRUkQZcw0Y1o8fxsXsRzQcfE8Pohx0+CkOR+zlCO9s7OzoufhCEFAlo7kZLm48=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:de2cbf53-c925-4708-9092-7e0a696a7e1d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:01dbb881-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6635a286e6aa11ee9aa9374d6d45775a-20240320
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1280960941; Wed, 20 Mar 2024 04:10:02 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 19:09:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 19:09:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Henry Yen <henry.yen@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 10/10] wifi: mt76: mt7996: add sanity check for NAPI schedule
Date: Wed, 20 Mar 2024 19:09:18 +0800
Message-ID: <20240320110918.3488-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320110918.3488-1-shayne.chen@mediatek.com>
References: <20240320110918.3488-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.702000-8.000000
X-TMASE-MatchedRID: t43B5J96WnnRf7QIWE0s11Pjo7D4SFg4gQP483M95wG7+NPPxj+R6t/Z
	UmGP9YkbhowmdCKCKbJQvZkUW2KxIxTHZeyG5hlHKaMQ6tw7oDJMkOX0UoduuQqiCYa6w8tvwnA
	mnjhKdO06hUOcTonr9IAy6p60ZV62fJ5/bZ6npdjKayT/BQTiGvSCB5CtNVQm9h6EyZUhUzJM/6
	T6cXS4kA7HGxMqtNz79LqXQCbqlpj98p0nQevxSqjbnW3VwgJ6XTIolEqa8UudEJeX4QSuE6DE4
	wLr4uZ8dATQdtPksR+3/JiWOe6GXXSWgQ2GpXdZbxffl9hhCBw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.702000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 023958FE130D5E334E7896CE6F46781782A9312B444C4D588DFEA1FE25D904B22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_041005_734694_DA275CC8 
X-CRM114-Status: GOOD (  11.72  )
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

From: Henry Yen <henry.yen@mediatek.com>

It's observed that host driver might occasionally receive
interrupts from unexpected Rx ring, whose Rx NAPI hasn't been
prepared yet. Under such situation, __napi_poll crash issue
would occur, so we add a sanity check to prevent it.

Without this patch, we might encounter kernel crash issue
especially in WED-on & RRO-on software path.

Signed-off-by: Henry Yen <henry.yen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index 304e5fd14803..6de5b7de4ac8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -560,7 +560,7 @@ static void mt7996_irq_tasklet(struct tasklet_struct *t)
 		napi_schedule(&dev->mt76.tx_napi);
 
 	for (i = 0; i < __MT_RXQ_MAX; i++) {
-		if ((intr & MT_INT_RX(i)))
+		if ((intr & MT_INT_RX(i)) && dev->mt76.napi[i].poll)
 			napi_schedule(&dev->mt76.napi[i]);
 	}
 
-- 
2.39.2


