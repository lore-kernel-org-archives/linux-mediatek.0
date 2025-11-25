Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E94CFD37C
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Nov 2025 03:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRutTgWiFsY/ANndouOE9D1C02+484u/Y3DsWLLZ6BM=; b=4YHz+P5ey4yfI/ipRCUUBzhpT5
	Sv2VMgoYbNispBa3lWy9dkIZoLg6PyVmSgVcZWVvbRulaqpDmMYDJqXzexsmwG1BQJM5ySn5brNaa
	QY1pZe6dX3pIe12xuebdNxYM2KGaoG89lbs7NauUSHo7rqDsoUcX5PHrC48jLh6ZuRR2ItxU2mV+Y
	1IiVNxGZBpsAmTXEjM6c9OONf3z4uIhBr1IRxkuf1CqCd9POcThl58+gPK220R3uP9BFdIbqgzNJX
	Uet6uMdUNrfhOubEk+eceP9+1Qek4kgXKe1AasSbms9ND87FPbl0XwfoqfgwrYOskz43M3XEwkOqy
	EYlZio4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNk1f-0000000Chf4-2kzN;
	Tue, 25 Nov 2025 03:47:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNk1c-0000000ChYv-04DG
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Nov 2025 03:47:33 +0000
X-UUID: 759b889ec9b111f09f706fa2197c6ceb-20251124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VRutTgWiFsY/ANndouOE9D1C02+484u/Y3DsWLLZ6BM=;
	b=OcL+QCZiJ402RC9rgyPsRhu2DTb/y70nTIs39UvE4r1i8Lz0YwtYXUcFy2Cc+2HVPWrBAvxmD6aktWnPtL657i8ab8pDEjsplWV9LnXB+kxT07VEW+ccRSklPs/VG8BShM0tphAOORKu3BTXsywChBASX2sHTSv5zXyQk4P7qv0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:5f24e079-f5a4-433a-b639-4efb47921717,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:72152abb-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 759b889ec9b111f09f706fa2197c6ceb-20251124
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1158021756; Mon, 24 Nov 2025 20:47:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 25 Nov 2025 11:47:24 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 25 Nov 2025 11:47:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 4/7] wifi: mt76: mt7996: abort CCA when CSA is starting
Date: Tue, 25 Nov 2025 11:46:36 +0800
Message-ID: <20251125034639.1416214-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251125034639.1416214-1-shayne.chen@mediatek.com>
References: <20251125034639.1416214-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_194732_108100_2F3FCD1E 
X-CRM114-Status: GOOD (  11.85  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

When CSA countdown is going to start, carry UNI_BSS_INFO_BCN_BCC tag to
abort any CCA countdown.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 10 ++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h | 11 ++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 8f2b3f4f25ab..4e78f8e585d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2796,6 +2796,16 @@ mt7996_mcu_beacon_cntdwn(struct sk_buff *rskb, struct sk_buff *skb,
 
 	info = (struct bss_bcn_cntdwn_tlv *)tlv;
 	info->cnt = skb->data[offs->cntdwn_counter_offs[0]];
+
+	/* abort the CCA countdown when starting CSA countdown */
+	if (csa) {
+		struct bss_bcn_cntdwn_tlv *cca_info;
+
+		tlv = mt7996_mcu_add_uni_tlv(rskb, UNI_BSS_INFO_BCN_BCC,
+					     sizeof(*cca_info));
+		cca_info = (struct bss_bcn_cntdwn_tlv *)tlv;
+		cca_info->cca.abort = true;
+	}
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index 5b3597ca79be..1283beb0dc19 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -412,7 +412,16 @@ struct bss_bcn_cntdwn_tlv {
 	__le16 tag;
 	__le16 len;
 	u8 cnt;
-	u8 rsv[3];
+	union {
+		struct {
+			bool static_pp;
+			bool abort;
+		} csa;
+		struct {
+			bool abort;
+		} cca;
+	};
+	u8 rsv;
 } __packed;
 
 struct bss_bcn_mbss_tlv {
-- 
2.51.0


