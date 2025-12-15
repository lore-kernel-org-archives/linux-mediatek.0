Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8511CD59D99
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Dec 2025 06:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+EYT2mUwkDDgBM3uPCtiIrJtFGpEl9FNkQxtU/d7BY=; b=v4Hr51ywxggSP4JYPChIYljb6+
	2Lvc3yvv102NNjFFmkUnPe9weWypVACgEnorsTFGKpCvAJVhMNPI1D8Pec9TLdrMQ5CzkmeG7lGX+
	epyezczZR0KWuc0/OfzJrKSKCjdtJtd4QTmcqc2XBN44cx6g977hx+O5h14LVLDDTD+IetdjpzT+z
	bizzcNb7O3hBkHeQzhnJrtJm4J4WpDiVN3CusG9etc+2grsf1kTRGbsvsAgjz6DBjVbrTRSZmy/QS
	6KABZxad3k1jWF0dXjQQMnfbcxGKADoT933+N1R8mDjpzPzf9kx2RRiEKAgjN7jDVKyfY2dr9RTeq
	rRSHVokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV2Dm-000000039nF-2R1f;
	Mon, 15 Dec 2025 06:38:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV2Dg-000000039ky-2JBp
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Dec 2025 06:38:10 +0000
X-UUID: 9aaca800d98011f09f706fa2197c6ceb-20251214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=e+EYT2mUwkDDgBM3uPCtiIrJtFGpEl9FNkQxtU/d7BY=;
	b=fc56RGhLzFXQ1raJkA4HlAoT5gwhb2fUVA5f8IpUvXgMPtVoQjStzQMrzPDseqVQ0IgsQAuOcYK5SahCP8AgGtRtTQjk+itw6TW/euNXU6dvpRfxdyFljTonzHbe/nZ4Pa6PTcWLQ4X545ZZRfYKHbF0hSP4TLpnM8cV8W7fbew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:7b8dedd0-6015-45bd-ba80-33dd76e52c9b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c47ac602-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9aaca800d98011f09f706fa2197c6ceb-20251214
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 823547548; Sun, 14 Dec 2025 23:38:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 14:37:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 14:37:59 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 v2 4/7] wifi: mt76: mt7996: abort CCA when CSA is starting
Date: Mon, 15 Dec 2025 14:37:25 +0800
Message-ID: <20251215063728.3013365-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251215063728.3013365-1-shayne.chen@mediatek.com>
References: <20251215063728.3013365-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_223808_883453_AE4A12C7 
X-CRM114-Status: GOOD (  10.53  )
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
index 0e514b818d0f..73c3741b532e 100644
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


