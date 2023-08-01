Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ECDC001E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQDxa2zx1X81lzl1+vipiYWxKX40ZvcKKak1KSbRfVo=; b=Vb5Le0RdnmLmVkynCg+j9ZEPur
	rp8XhVz2oBZ3UoGMKZ9/M/xAXGZwc7BBzSlTcpK5RL6ygUEmD9poR5KpRpML57Jrsg/Jap7M+ZrWu
	NeAqqCy7W4UNZYnE4NMsNtvIJuwRLveaxgKfN6g2P/51/WfqunhwVq7o/Jq04kGnQl7pgzbt68Tig
	KTSCzkUouCgvDbJz7iVCxe1+nhOoomi5oFTKyuTPRFFpVIuSmitXUkbG+v19oKrZosTQgiQ/QALmX
	QdLt5Sv9E0lZFuWCffSJnq1Hb9apdHraKQRU1FlL/RcLxCA1pGNdkVWjxdqF0L5xaws2Ja9Qy3Wy3
	T2vuuf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqU5-002cFH-0c;
	Tue, 01 Aug 2023 14:36:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqU2-002cBu-1S
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:36:23 +0000
X-UUID: c69c2534307811ee912e1518a6540028-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PQDxa2zx1X81lzl1+vipiYWxKX40ZvcKKak1KSbRfVo=;
	b=VEV8W2ms4GYe2BnxrGoKz+mlaqJXmsH2QeDa0f6DC2WTt5MBrKH4tddA245doLj5JeoBpXRVq9sq4mjhiHktQ43RCLTurzY8S7gYKFluvcFTA3WCuoNlSNfue4NTPHIwnXghqe5qeImGImunJJmN+iXDTF3ntzmEjWZRTOlW7GM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:27f1cbd6-7e13-4f21-bf1c-cf30d4dbc698,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.30,REQID:27f1cbd6-7e13-4f21-bf1c-cf30d4dbc698,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:1fcc6f8,CLOUDID:c48f91d2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:230801223546ROWL43RD,BulkQuantity:4,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: c69c2534307811ee912e1518a6540028-20230801
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 485094904; Tue, 01 Aug 2023 07:36:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 22:35:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 22:35:44 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 16/17] wifi: mt76: add mt7925 to Makefile
Date: Tue, 1 Aug 2023 22:34:32 +0800
Message-ID: <cb8568de7edf6c0e07a343a44e7f4930f0f5cf55.1690864199.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1690864199.git.deren.wu@mediatek.com>
References: <cover.1690864199.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073622_492505_2E7D1FD6 
X-CRM114-Status: UNSURE (   8.35  )
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


