Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8026DC63797
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Jan 2023 04:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SE+ZkPRpNyah5KFkFmlvFD5P/yDO5NWK+lh8uAHJDSE=; b=MX+6tqln8dRwp8S1CGVF5A97Ah
	Mi+u1Oru4cC48pZvXmHxLrX7+hwwJIbDjRx8AfeyayU3NwlwwuRw/+Mo5l6ocRmeqsBFb9BBj8zE8
	4EqNI8mKG6Bhc/ay+6+30Z5cqYpgs/TnfAHdRMOfeZSaV2/ZSTGmgTRubbWvTGqO7cEm/HJ5vqyvT
	RhSFi6yTL8H9EfS8skf832pPm6/3Jog6buFdNH54amhty4PLNq2ALA2l66YVgd1gdIF5ln+qtUP6A
	FwTx3gL2LQiLUiVTdq7/UcXh+HDi8MjRWxfRdyaFMaayJVK2qhEqHq184Ou7iAtm2n9zK9cE/1CxQ
	HxkK3VXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGuuO-006ue4-Nd; Sun, 15 Jan 2023 04:46:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGuuL-006udp-4f
	for linux-mediatek@bombadil.infradead.org; Sun, 15 Jan 2023 04:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SE+ZkPRpNyah5KFkFmlvFD5P/yDO5NWK+lh8uAHJDSE=; b=oiUhy9PjYDB5JQUlCWsk3hPYB/
	5X3m19EN8zJGuMQ7VG3JyNlqyM7CQ/JtcLCwGWIJmgkTbTpE3e6A7PLOK7a7HyLZCNBZsVmv19hRD
	nVY9cLBV55+iciIZZcRwVPwzwJionASTZ9wYBlhUauDoF12O91ixvP4s+F6sHMOI1EK1BWXNQYpx0
	3d+Z8hd5KvXAIfSNcKAAvWOx98TE1S0MUZaIwl+qJ/G9KZAHLc2oMMNHn5bTWacd1I+RJdyOQXmTU
	vyBwbdh49hoAufbmrgkSgtUpbQJJsGNriypsSp64mfaHZIjzkEyAkBjxMymhV3BFYfk0fGcwO2UnX
	0nUwvjkQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGuu1-0051Q4-0u
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Jan 2023 04:45:58 +0000
X-UUID: 762eb7c2948f11edbbe3f76fe852e059-20230114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SE+ZkPRpNyah5KFkFmlvFD5P/yDO5NWK+lh8uAHJDSE=;
	b=b17A/ZgRhwqPCycbmRszwSYXLb3Q5DTZZ5Hb3gcIgySCA2qY5kSl3mZ8Q4PLmUqhiHFopUppm7NxVoOWquW8fmAHlusIIIFrU71VtnE9IMU0uehW8YLfz9JgMbgYIeofuAb4zCviqpwbCzNQDHFYjQCrbZCzLqvMXnB6sfU4VQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:e8323aa2-47b0-4f33-bb88-e18bf614a5ce,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:ec73458c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 762eb7c2948f11edbbe3f76fe852e059-20230114
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1530749156; Sat, 14 Jan 2023 21:45:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 15 Jan 2023 12:45:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 15 Jan 2023 12:45:37 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, Eric-SY
 Chang <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder
 Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: add memory barrier to SDIO queue kick
Date: Sun, 15 Jan 2023 12:44:57 +0800
Message-ID: <2489b17e8249ef8db840edb6168888ff5c887a6b.1673754074.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_044554_446589_D2B89075 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

Ensure the entry has been fully updated before SDIO bus worker access
it. This patch would fix potential memory risk in both mt7663s and
mt7921s.

Fixes: 764dee47e2c1 ("mt76: sdio: move common code in mt76_sdio module")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/sdio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index 228bc7d45011..419723118ded 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -562,6 +562,10 @@ mt76s_tx_queue_skb_raw(struct mt76_dev *dev, struct mt76_queue *q,
 
 	q->entry[q->head].buf_sz = len;
 	q->entry[q->head].skb = skb;
+
+	/* ensure the entry fully updated before bus access */
+	smp_wmb();
+
 	q->head = (q->head + 1) % q->ndesc;
 	q->queued++;
 
-- 
2.18.0


