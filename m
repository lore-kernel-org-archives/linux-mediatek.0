Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0242C79F8C
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 05:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UVPcEqdvMw0odJtdzU41jB5q01uD8558jbITbPIqW1c=; b=vgoRfyrthqRzQ5c8Cyain0Rccp
	1v6C1gdhPh6SgQKxJ9HcrtcVW8fSA5J0M5jyVerPq3egFSU/hoP2FloKEk9Sn0lP8ERzF1bAwOlWt
	bNuaxBfv6Np1ZpWJhwxhLpVOjJ4tTd47Q/q9ibekSpPbHEw76s45iM62KF6cR8halx9qEfyurcqs8
	89cvIh9N93Zy2FpDK4B+Vs1lNb8aGKgK4rfoKfCge2pSDrwlFEetgq8zgkogwVzQ9A0nynptmvSCn
	rzOUSLonpQD5u5j25cs/LvgD6eix0mPlt1DHVoHcyMPBPKzu0nBWAO6HMLOcuhHrhGh+Awohsst0o
	d9E5lsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BJs-0000000ApUe-0hpz;
	Wed, 09 Sep 2026 05:58:04 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BJp-0000000ApTF-1aDc
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 05:58:02 +0000
X-UUID: 65d202b8ac1311f1acbe4559397dec65-20260908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UVPcEqdvMw0odJtdzU41jB5q01uD8558jbITbPIqW1c=;
	b=rKXgeSB3BTk+rn1vMYl4yOYOIpvD3VpGu2SeBo1zSCn1Wd2nDBw3IArauOTfcb8xr+QE5A7vhmO2RcDgdUdIvkARxIDgCRhdC/8nhhn8k9AoYJlYJhreiJy37vy1ZZ1GkFARIErRb0ONwt+iKDMdio/ZFYpulqHBSd8D9d3nJj0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8d05e879-ee3f-4ede-ba6b-fb7bfe2f5524,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:66d01328-9ebf-4787-bb42-3cd26eee85aa,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 65d202b8ac1311f1acbe4559397dec65-20260908
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1971835196; Tue, 08 Sep 2026 22:57:53 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 9 Sep 2026 13:57:51 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 9 Sep 2026 13:57:51 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7928: only do CLC hw type sanity check on MT7925
Date: Wed, 9 Sep 2026 13:57:50 +0800
Message-ID: <20260909055750.929102-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_225801_437527_99158B06 
X-CRM114-Status: GOOD (  14.21  )
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

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

mt7925_load_clc() is shared by MT7925, MT7927 and MT7928 (0x7935 is
folded into 0x7928 in pci.c). The hw type sanity check it does on every
CLC region is MT7925-specific twice over: the encap bits live at
efuse offset MT_EE_HW_TYPE (0xa71) in the MT7925 layout, and only
MT7925 CLC blobs carry that hw type in their t0/t2 header. On
MT7927/MT7928 the driver therefore reads a byte that means nothing on
those parts and compares it against a header field that was never
populated, so a mismatch silently skips every CLC region and leaves
phy->clc[] empty - no country/regd table gets installed at all.

Gate both the efuse read and the two header checks on is_mt7925(), so
MT7927/MT7928 accept the CLC regions from their own firmware as-is.
No functional change for MT7925: PCIe still reads 0xa71 and filters by
encap type, USB still runs with hw_encap = 0 as before.

Fixes: 356b39285559 ("wifi: mt76: connac3: refactor CLC header type validation logic")

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c    | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index bd63789ab8f7..bf2cb6172cc8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -855,7 +855,7 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	if (!mt7925_regd_clc_supported(dev))
 		return 0;
 
-	if (mt76_is_mmio(&dev->mt76)) {
+	if (is_mt7925(&dev->mt76) && mt76_is_mmio(&dev->mt76)) {
 		ret = mt7925_mcu_read_eeprom(dev, MT_EE_HW_TYPE, &hw_encap);
 		if (ret)
 			return ret;
@@ -906,14 +906,16 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 		if (phy->clc[clc->idx])
 			continue;
 
-		/* header content sanity */
-		if ((clc->idx == MT792x_CLC_BE_CTRL || clc->idx == MT792x_CLC_REGD) &&
-		    u8_get_bits(clc->t2.type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
-			continue;
+		/* header content sanity, only MT7925 encodes hw type in CLC */
+		if (is_mt7925(&dev->mt76)) {
+			if ((clc->idx == MT792x_CLC_BE_CTRL || clc->idx == MT792x_CLC_REGD) &&
+			    u8_get_bits(clc->t2.type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
+				continue;
 
-		if (clc->idx != MT792x_CLC_BE_CTRL && clc->idx != MT792x_CLC_REGD &&
-		    u8_get_bits(clc->t0.type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
-			continue;
+			if (clc->idx != MT792x_CLC_BE_CTRL && clc->idx != MT792x_CLC_REGD &&
+			    u8_get_bits(clc->t0.type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
+				continue;
+		}
 
 		phy->clc[clc->idx] = devm_kmemdup(mdev->dev, clc,
 						  le32_to_cpu(clc->len),
-- 
2.18.0


