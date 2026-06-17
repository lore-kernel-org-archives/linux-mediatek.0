Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FA4CD98F0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7pPEGyznt8zx2nGwkMD/hEWm9QWv8j1adOO6kvRVOjs=; b=Qkzn5fgtsU08TI5hPNmqomsEIH
	TI13+CguzmAzXKqUKpsnCzCAQq7FMdPE5ozGfmJR3pnbw6vao3ZrABNF4jv4vfJZBGk//3meWD1Cw
	3gnYprmGh8xCOhLVHkVwfQkIVOW8wKX/6Z8Zz/06/LL0vD8YFpSb28gRd7NOVhaa1G/NwZg4PFmbY
	3TyBu7r+I6HLXJLs7YiRDLuDWeEklBB+qs6jQY8IlcgjqthW5mzGxkqi6aECNxsd6WAWJ1T0qzVxK
	3/YNtO2Id3pj1FolpVCAUkjZ9XYwp2WQ7xRMLoJU+pizb3SBJB8vrze9Z5I+RqkY5UM3tKWCLj+Pp
	3IaWva9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkSZ-0000000GnH6-1J3R;
	Wed, 17 Jun 2026 07:13:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkSW-0000000GnGO-3hY2
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 07:13:13 +0000
X-UUID: fe6233a26a1b11f1acbe4559397dec65-20260617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7pPEGyznt8zx2nGwkMD/hEWm9QWv8j1adOO6kvRVOjs=;
	b=Bkwh7i6rMNcmZblWvugNi7tpDlDiGHrjMQcgBzF95XNunWedgOugmwBd8TpP6/4n/AX06+Xf4gfsBoKLgbvaiZHqMltiYMLuhqgIcQ3iEuIePvrYXriyZNU0tqY3CLP0L3VKUfUcr7tHh1nXWVyNxXjVGmIAfBY6suYyKUoha3o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:bd4338a9-bc76-4134-a30d-175d9a109400,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-25
X-CID-META: VersionHash:d497b38,CLOUDID:e410355f-e8d6-486f-848f-3ae1d0432240,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50,
	EDM:-19|2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe6233a26a1b11f1acbe4559397dec65-20260617
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 624589317; Wed, 17 Jun 2026 00:13:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Jun 2026 15:13:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 17 Jun 2026 15:13:06 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jared.huang@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: update clc before setting sar power table
Date: Wed, 17 Jun 2026 15:13:05 +0800
Message-ID: <20260617071305.1808394-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001312_934157_D620C4B6 
X-CRM114-Status: UNSURE (   9.43  )
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

From: "Jared.Huang" <jared.huang@mediatek.com>

Fix the power table update sequence to ensure CLC is loaded before
setting SAR power table.

The firmware requires CLC baseline to be established first
to properly calculate the final power limit as min(clc_limit, rate_limit,sar_limit).

Fixes: 9557b6fe0c8b ("wifi: mt76: mt7925: refine the txpower initialization flow")
Signed-off-by: Jared.Huang <jared.huang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a9059866b701..afb2b473bef7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1824,9 +1824,15 @@ static int mt7925_set_sar_specs(struct ieee80211_hw *hw,
 	int err;
 
 	mt792x_mutex_acquire(dev);
+	err = mt7925_mcu_set_clc(dev, dev->mt76.alpha2,
+			 dev->country_ie_env);
+	if (err < 0)
+		goto out;
+
 	err = mt7925_set_tx_sar_pwr(hw, sar);
-	mt792x_mutex_release(dev);
 
+out:
+	mt792x_mutex_release(dev);
 	return err;
 }
 
-- 
2.45.2


