Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF2FC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 03:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tN9jhmEpDllv2BKTkYeYf6Cf6lSOqb/dZCImu3oGykE=; b=42QBtw/8+JetvV
	xGV3Uz1XtPdeVSyeC4/9glnYmXb4QpyYhrWbYMX/ApbXpGnAdPXnkqQxDsieNouyWUEPUTVL7x2gX
	W48Ukex48/ZEivku1RsTWy+UWf5WBksKOXzJushitQq5kCQlGyUiZ+eD9m2H3YF69kEDcf1SR27eP
	AjMbErZbziY+Ft2DRx6xbc4DUbltgtC+b47dcCTxOfVC/jilMYVKUSl+SkhoA+OJpmB31pHx26xqt
	U16iLuZ2NVHvQKyU67SEqGmFh9Kswm6F64Gc9H+9IK9IwOG+946ql3WWFOWKU9mDfOZsgtxWGYjT8
	mcMw0EhRNldVo+u+QYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9elj-00HGHp-IU; Tue, 18 Jan 2022 03:02:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eNd-00H1jA-Jv; Tue, 18 Jan 2022 02:37:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 57824B81132;
 Tue, 18 Jan 2022 02:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A929BC36AE3;
 Tue, 18 Jan 2022 02:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473471;
 bh=syKAXgGkNN/cd6e1sptDYNJgaiCH3RcEKn5+Joj72mU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oez/vXLaSeLvXzcRh+Afy/jWXdBgOdGA792VFRJFtssreaHwUAAMYX54IPgGeN8iG
 Z180qCKOYhY0Iom1y9uQo76hfnqHpbnG5pe502p/PufeesF/KtXsoT08eY6PCgoGox
 Z6k1OLeXXMvMGwe4vzMo2kUPHNjlcqJAdGVjXwcpk16dU6ifGVzMTl94dsnKNocx0e
 aPAW1dFJIyhLEJ/KFlkvavXM46VSwcP7ic4mYVtjWH0qhlBvVkLIWkL14z5jZyUpdn
 rPIqMEq7B6FFKl+tE56IUcDiSOhKcy372mSEaD7bX6qFBMS9XGiLuXKdpHeWiuVad4
 bbKqgsSkNm8aA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Chiu <chui-hao.chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 130/188] mt76: mt7615: fix possible deadlock
 while mt7615_register_ext_phy()
Date: Mon, 17 Jan 2022 21:30:54 -0500
Message-Id: <20220118023152.1948105-130-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_183753_829122_52B7AE3A 
X-CRM114-Status: GOOD (  13.01  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

[ Upstream commit 8c55516de3f9b76b9d9444e7890682ec2efc809f ]

ieee80211_register_hw() is called with rtnl_lock held, and this could be
caused lockdep from a work item that's on a workqueue that is flushed
with the rtnl held.

Move mt7615_register_ext_phy() outside the init_work().

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index a2465b49ecd0c..87b4aa52ee0f9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -28,8 +28,6 @@ static void mt7615_pci_init_work(struct work_struct *work)
 		return;
 
 	mt7615_init_work(dev);
-	if (dev->dbdc_support)
-		mt7615_register_ext_phy(dev);
 }
 
 static int mt7615_init_hardware(struct mt7615_dev *dev)
@@ -160,6 +158,12 @@ int mt7615_register_device(struct mt7615_dev *dev)
 	mt7615_init_txpower(dev, &dev->mphy.sband_2g.sband);
 	mt7615_init_txpower(dev, &dev->mphy.sband_5g.sband);
 
+	if (dev->dbdc_support) {
+		ret = mt7615_register_ext_phy(dev);
+		if (ret)
+			return ret;
+	}
+
 	return mt7615_init_debugfs(dev);
 }
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
