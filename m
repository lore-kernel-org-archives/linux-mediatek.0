Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AD4CF2590
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yds5XsztjRetd0eY+2gfotwVU2fKNh8j54ZoUQ3yI+4=; b=Zimunu76Z1ghrcATSN4Q8/i3Dr
	HTVA8Qq5cQTv/BEMuDe2gmDnKBJj6EhNux9wkVo63ImMVDFKXVOML4DrmBSIfP1CRY/VCeMo1U2+x
	gVgPD5alYuVS29nZiOwhvsH7qnaH/b0Nvu4uVdcWCYea4w1zEEMQhSM7SoAdLjq5lGW+S/FDcD9pb
	7S1ZXVRvLYWGqBH7yUQpFZLalLQc8UFpd0MruiKPY6q4WRBDRyo3zrdnxhimfSAOCY9ym3KJhBYXM
	JjDGrZARfKLn2NYCdL9U4uRmkbwp8jVD8oE9qaa6iPtHoE/MvWp0IXiiSRmU7TJoC4P0RlSew7w8b
	weamfXFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0EDj-00000003poY-3wDK;
	Mon, 14 Oct 2024 06:06:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0EDe-00000003pnR-0Fu5;
	Mon, 14 Oct 2024 06:06:18 +0000
X-UUID: 67e26ce089f211efb3adad29d29602c1-20241013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Yds5XsztjRetd0eY+2gfotwVU2fKNh8j54ZoUQ3yI+4=;
	b=g+BpLFZZGuLU85enMvoYdtDjfavdzDqx+7BiTB2PuPh8s0xCacKetlu2azX6p5SHIcKlU/lsZ0gmreqYhijDRs1ogYzO1TkWjDJ+7dlVk50Lo9XltAx1U0C3QYaA31Cwql5rLHGgYDPTIotvHrDgTPGMIU84qb8NJpslAJ3cnOw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c0fe0544-8b00-4cfa-9446-b8387286ac9a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:fdbd3265-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 67e26ce089f211efb3adad29d29602c1-20241013
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1499819784; Sun, 13 Oct 2024 23:06:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 13 Oct 2024 23:06:06 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 14:06:06 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sky Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [RFC PATCH net-next 1/1] net: phy: Add capability to enable/disable 2.5G/5G/10G AN in ethtool
Date: Mon, 14 Oct 2024 14:06:03 +0800
Message-ID: <20241014060603.29878-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_230614_141408_525DD9C7 
X-CRM114-Status: GOOD (  10.81  )
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

From: "SkyLake.Huang" <skylake.huang@mediatek.com>

For phy loopback test, we need to disable AN. In this way,
users can disable/enable phy AN more conveniently.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/phy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 14224e0..10772f8 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1085,7 +1085,10 @@ int phy_ethtool_ksettings_set(struct phy_device *phydev,
 		return -EINVAL;
 
 	if (autoneg == AUTONEG_DISABLE &&
-	    ((speed != SPEED_1000 &&
+	    ((speed != SPEED_10000 &&
+	      speed != SPEED_5000 &&
+	      speed != SPEED_2500 &&
+	      speed != SPEED_1000 &&
 	      speed != SPEED_100 &&
 	      speed != SPEED_10) ||
 	     (duplex != DUPLEX_HALF &&
-- 
2.45.2


