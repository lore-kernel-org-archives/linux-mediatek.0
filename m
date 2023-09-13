Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D63EDEC6B
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 14:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQDxa2zx1X81lzl1+vipiYWxKX40ZvcKKak1KSbRfVo=; b=oAr8pp2mxgImOsk53QhPd8ZSuk
	e7pCg2p/QKt2SJRJZ11Atf0A2RjErQbExm+z2T3ERbyKXLNzi27dCkKh5Xn87plhwXEc3qxAuL1tl
	HxjK9dm2Wg3jnuL17t6h5jJhaDXn9nMg7KDvzz2g9094uR/kVJ5wF3xqDb2Z2RQMZ5fCVWQDHteg6
	FT9hnkd8xkKCUNBg8WIpyIKPTN/ipRvfMdQnkB+SDhuAdAIQ+MvZh0x5chDadElYdnMHswQ+xaqJj
	o4oDtimFmXdC4z4cOGlf+h4UW3cufOdxAty05ymxs/larhJyIqf/m/doSq1zB3tocXSZljNUNM3Tu
	Wd2AUfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgR7E-00692Y-1J;
	Wed, 13 Sep 2023 14:45:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgR76-0068xO-0Z
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 14:45:09 +0000
X-UUID: 1cca4e8a524411ee86758d4a7c00f3a0-20230913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PQDxa2zx1X81lzl1+vipiYWxKX40ZvcKKak1KSbRfVo=;
	b=padZm7wBsWB0cVN+3vTC4jjtj77aMsLAj92hYNistLVbR8yLrxQD3tSRNttPUazrEFJdvUOngN95I+WocwvzLnxAQTUytkqwb1F9M337sxoTrytadqakU48oq4PgE/OYOSB2RXOsgo8CUFubdo5cMWpQkSuweFCMCoBAJlhioLQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:091ebdec-d335-4835-9e58-168949b03bb4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:12f5cbbe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1cca4e8a524411ee86758d4a7c00f3a0-20230913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 121745936; Wed, 13 Sep 2023 07:44:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Sep 2023 22:44:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Sep 2023 22:44:24 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2 16/17] wifi: mt76: add mt7925 to Makefile
Date: Wed, 13 Sep 2023 22:43:44 +0800
Message-ID: <c76dc537c6575cfa22b2a2e560b03bf7957c44e1.1694595134.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1694595134.git.deren.wu@mediatek.com>
References: <cover.1694595134.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.945700-8.000000
X-TMASE-MatchedRID: E6K/LcOYTbPKRSR886eK0gPZZctd3P4BfS0Ip2eEHnwj/1Rbkzl1E95/
	HgWYxplM5MIx11wv+CPKayT/BQTiGmRC/Be9tHFfUw3dg58guK1eSoDdWjhLENTT9twbPLPvSRg
	IuXfPVjl7g8nCEeZ0VqNqiEMp+bIAN3lVf0HC2I6zVGiGpNbTb0EsBv8VOmZSdATQdtPksR+3/J
	iWOe6GXXSWgQ2GpXdZbxffl9hhCBw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.945700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E3FA70FA19B525EB3D50983E1411946F36628336F5192B405E4FB90FB80D628B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_074508_237588_DBCE617E 
X-CRM114-Status: UNSURE (   8.09  )
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

(Patches split into one patch per file for easier review, but the final
commit will be one big patch. See the cover letter for more info.)

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index 85c4799be954..d6575fe18c6b 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -44,3 +44,4 @@ obj-$(CONFIG_MT7615_COMMON) += mt7615/
 obj-$(CONFIG_MT7915E) += mt7915/
 obj-$(CONFIG_MT7921_COMMON) += mt7921/
 obj-$(CONFIG_MT7996E) += mt7996/
+obj-$(CONFIG_MT7925_COMMON) += mt7925/
-- 
2.18.0


