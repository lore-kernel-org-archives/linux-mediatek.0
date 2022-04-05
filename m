Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DBBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 20:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rgo7HPRlZu3e5G8Pk1FFLg0vBj2j8P1PNqe2e8vCdsM=; b=Se1Mhmem5n8Wjr
	nC4g5YA5rYQVFENcWhBS/VaCZAjjr0tNVxtTfFIcfN3mQh0G8Alv7pgNY2kGZamb/g6Y1acl1qera
	mEOVT047cYL/oZxLGdr2K/2ErjczKyoi22En114zyP1g6qW3azsQJEKCcWDLYiPRscBICcc/2GKAz
	9B+TSpmJrIJYWJGs+uGzvIeyN8HHGTG98qDd+x8Eb5Up91ecDbrBox4JMS8qIRd890teRDK/8ES87
	hc/dpvfLAiC4pA+SWW3WREQYbZpnav94IqN0fXtTJzFmkxAkipeSyPrW6LVPUKuuSz64osrIl+7iN
	kWZ+UuIqSpsSIxmgZ+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbpjN-002aDY-AU; Tue, 05 Apr 2022 20:24:49 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbpjC-002aAv-BG; Tue, 05 Apr 2022 20:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gXvEQrfZY9HNBpxfU0Zzm6NHw+EacTGssl2BnoA7qE0=; b=J/ymy3Uqmx90f5JQAtw03vc9mI
 argCvDrmevWZn0QJBD+TAfBEovMmoU9fFQtdxBxq/MuDi7lA885JpmqN346nTYSu/rGDeO9+1Zpyw
 snXS5Ep9sk87UP6kj0wY6cSoPwMkT3ONEZH/30dNvKHuzbFEnFn/3KOY5I0HKFEj2iJQ=;
Received: from p200300daa70ef200456864e8b8d10029.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:4568:64e8:b8d1:29] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nbpJX-00035V-7B; Tue, 05 Apr 2022 21:58:07 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/14] net: ethernet: mtk_eth_soc: support TC_SETUP_BLOCK
 for PPE offload
Date: Tue,  5 Apr 2022 21:57:51 +0200
Message-Id: <20220405195755.10817-11-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405195755.10817-1-nbd@nbd.name>
References: <20220405195755.10817-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_132438_602288_515FF1B0 
X-CRM114-Status: UNSURE (   9.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This allows offload entries to be created from user space

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 0113cddcebf4..da3bc93676f8 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -563,10 +563,13 @@ mtk_eth_setup_tc_block(struct net_device *dev, struct flow_block_offload *f)
 int mtk_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 		     void *type_data)
 {
-	if (type == TC_SETUP_FT)
+	switch (type) {
+	case TC_SETUP_BLOCK:
+	case TC_SETUP_FT:
 		return mtk_eth_setup_tc_block(dev, type_data);
-
-	return -EOPNOTSUPP;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
 int mtk_eth_offload_init(struct mtk_eth *eth)
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
