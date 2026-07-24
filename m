Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC422C531F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NoVN4zs7tL3OcBdEPkkFH48P9b0ZAT03ln1vk/rYEpc=; b=UrotY6iZ5T2+MzCxMmC8+nVlX0
	AqonU9KI43Jg7TObAsf1UuItRmam/kL/8eQ2OD+/bR2HPaRETOo2WeTKD/C7WFhabDVdusympamPr
	6nMHDYd9CMKtsM64jmnvawBeCATzIsgoaq2UDKpbyNNiqHsZuPiHcyQ6NR+Tpwm2E9NuzqxMpuQoj
	ySHdQKkY/gunmFBCAMLBmLT3lOgPkgNl7OFTb60bE90X08k+vI76fnjUI+PVz60kEiR30LYV2hz/p
	pR6biXhilCUwBn8QeUvkZ6aESrudHrMR1HLtcQN60ejNMaFyR77nYQy8Ef2RMWbSMF4bt4WoYW8Yr
	Ka66yfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBcz-0000000FsxE-2HCl;
	Fri, 24 Jul 2026 08:51:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBcw-0000000FswX-3dp3
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:51:32 +0000
X-UUID: dbdf0696873c11f1afed4741b24580c9-20260724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NoVN4zs7tL3OcBdEPkkFH48P9b0ZAT03ln1vk/rYEpc=;
	b=rXxQXNAc91zSmXxUXpUxoZXwO2iTe/3pFnwhqcTEmTeJmRnQXb2XBbZH/YzjwMm+J8sGZMw9X9+nHjt1WW/+DnWtJ7erTfJ3f4ct8ZZdgxXXAWF8oCZv+P4rpU07u5VdnzCUMH2Chdp0WrnGFR/P4H28R+QTfsqMwkZKmuOK1FQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:d26bb942-d55e-4b41-a5e5-63b906ab7b69,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:f9875f98-d7dc-4717-b0e4-6dc2a9a44c15,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dbdf0696873c11f1afed4741b24580c9-20260724
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 119488650; Fri, 24 Jul 2026 01:51:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 24 Jul 2026 16:51:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 24 Jul 2026 16:51:25 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: connac3: refactor CLC header type validation logic
Date: Fri, 24 Jul 2026 16:51:24 +0800
Message-ID: <20260724085124.3156143-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_015130_916367_BC306822 
X-CRM114-Status: UNSURE (   9.18  )
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

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

Separate the hardware encapsulation type validation into two distinct
checks based on CLC index type. For BE_CTRL and REGD indices, validate
against the t2 header type, while other indices should validate against
the t0 header type. This ensures proper CLC filtering for different
calibration data structures.

Fixes: 4ce639ea518f ("wifi: mt76: mt7925: add regulatory wiphy self manager support")
Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index a12b939b6123..37502d8a0e7d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -899,8 +899,11 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 			continue;
 
 		/* header content sanity */
-		if ((clc->idx == MT792x_CLC_BE_CTRL &&
-		     u8_get_bits(clc->t2.type, MT_EE_HW_TYPE_ENCAP) != hw_encap) ||
+		if ((clc->idx == MT792x_CLC_BE_CTRL || clc->idx == MT792x_CLC_REGD) &&
+		    u8_get_bits(clc->t2.type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
+			continue;
+
+		if (clc->idx != MT792x_CLC_BE_CTRL && clc->idx != MT792x_CLC_REGD &&
 		    u8_get_bits(clc->t0.type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
 			continue;
 
-- 
2.18.0


