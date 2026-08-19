Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0014C5B572
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=su1SMdbYrcQtL6nGPT54azE3paygNfyKYAwqD8h0dws=; b=Azp5/KuPnSd++IPJvitxK5OCsC
	3WQA18pxrr5KmaQNNIv5MYmaH0Zs3nUAFSzHKr4lqwb6qDUsTvetDoAVNgiLJPCO0hGNA1F43kFiw
	2FZiBdZ7/W/5LGtgppKNti/kEfaSt44BU+fJdHYhnamJ5grb/0FDTDIgbKqTXqCncFiGIyk7CGNGc
	qh9RWUx7yDvDTGtkFcSa/2vuDYIZQmJJj5kUxJwrkPapaYvKL5zMJRdHoifrzMTIy1QHObt2hHkBv
	94mH0+c7Xa3DMswFtxH1tU5NB5XFzN1vQoG2HTmION1RxEtMkEQWDKvJJKWuZ8q/jLYazP82DmnfH
	nqcXkpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbZC-00000009Ij4-1yPf;
	Wed, 19 Aug 2026 08:22:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbZ9-00000009IhL-2EXj
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 08:22:32 +0000
X-UUID: 190d47029ba711f1afed4741b24580c9-20260819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=su1SMdbYrcQtL6nGPT54azE3paygNfyKYAwqD8h0dws=;
	b=FWIMwjd4n7jlYLWDvSPMBM1DUVLIIRrLYPa8pKlF9N26tm9p3Kbgd52/HbenD0VOkD53Ir1+mUoV3rJpaW/QlyXJtz6AfSOmLzjV+mQuFC/Z8ZCzCTnNzWXmxAqffDElZWfwvVZ6Z/qW1gJpLWWcRp7cJ1ZW0dHVY/RUnLCISCg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:be141ee5-2bcb-401a-a404-f8f37b544a85,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:1e4d2ffe-f4cb-4ad2-b022-e3ac6648bf25,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 190d47029ba711f1afed4741b24580c9-20260819
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 604017111; Wed, 19 Aug 2026 01:22:20 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 19 Aug 2026 16:22:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 19 Aug 2026 16:22:18 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.lai@mediatek.com>, <stable@vger.kernel.org>, Devin Wittmayer
	<lucid_duck@justthetip.ca>
Subject: [PATCH v3 1/2] wifi: mt76: mt792x: fix UAF in SDIO TX path when out of memory
Date: Wed, 19 Aug 2026 16:21:28 +0800
Message-ID: <20260819082129.1062282-2-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260819082129.1062282-1-eason.lai@mediatek.com>
References: <20260819082129.1062282-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_012231_777878_93AB22C9 
X-CRM114-Status: GOOD (  10.78  )
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

Using __skb_pad() instead of skb_pad() in mt76_skb_adjust_pad()
to prevent double-free, as the caller handles cleanup.

Fixes: 808f2767d421 ("wifi: mt76: mt792x: Fix memory leak in SDIO TX path")

Co-developed-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Signed-off-by: Eason Lai <eason.lai@mediatek.com>
---
v2: no v2 change
v3: add Signed-off-by: Devin Wittmayer and send as series
---
 drivers/net/wireless/mediatek/mt76/tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 3707ee19e4ae..ec503521ae63 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -879,7 +879,7 @@ int mt76_skb_adjust_pad(struct sk_buff *skb, int pad)
 		}
 	}
 
-	if (skb_pad(last, pad))
+	if (__skb_pad(last, pad, false))
 		return -ENOMEM;
 
 	__skb_put(last, pad);
-- 
2.45.2


