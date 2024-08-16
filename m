Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8233AC531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z12cKt2Fya2BcGcfBm4pxjf+7XYj5q5rwAR516ix9Go=; b=gHmCUKDJcW8V58sGrFdNnuQsed
	F+Fn02oF1B/RlPe1tCXUZ5S+Wnmco/p9y6g+muVyC5mcVDKxZALjv9AozulPF0Q+2ekA+j9os5+Gv
	kUllJtbAgAGwYRRLSuo+gzaTsKNRYgqAQo3hUPguZIekscDSbJAf4aN11BwpxsmjuuVZDvs0nTJXl
	Rzza2wA34eemL+oHTCUZ6LTwWYXykytJMLqlPRinuPixQ+VVt8wGzKTaDkGuWuQEuxbDdEnDb9U48
	Y83vdy9Q4yZ88q/tE1RiZhmX95hZTL4Ixq9aGWRk77oLX9NvAVD/v7blWUvRlIxhnE1BeM4ZGHiyf
	DrCJoSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setdx-0000000CV7m-04UT;
	Fri, 16 Aug 2024 09:53:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setc5-0000000CUb1-0MwT
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 09:51:18 +0000
X-UUID: 111b9cee5bb511efb3adad29d29602c1-20240816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=z12cKt2Fya2BcGcfBm4pxjf+7XYj5q5rwAR516ix9Go=;
	b=soRUbuJs/w3UYNwM3cIS1wnHiRh7V0THj3Rpsn7zGQK2PStOlXD497FKkDZ+Ybw/Srwpos9xRMhAYs/tDqvXWLHMpIdK6MXFjTouDldxEpjRi370Nf/DHV36CB4kG58E/hRBpZvyGyuuEsccqEdfJjQE3dAtBCPzFaThBFyslHs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:8c767d44-ab18-4eff-b49e-a3ab66c4e0fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:c663b1fe-77bb-433c-b174-ffb8012693b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 111b9cee5bb511efb3adad29d29602c1-20240816
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 705889636; Fri, 16 Aug 2024 02:51:10 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Aug 2024 17:50:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Aug 2024 17:50:15 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Rex Lu <rex.lu@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>
Subject: [PATCH 10/12] wifi: mt76: mt7996: fix handling mbss enable/disable
Date: Fri, 16 Aug 2024 17:46:33 +0800
Message-ID: <20240816094635.2391-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240816094635.2391-1-shayne.chen@mediatek.com>
References: <20240816094635.2391-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.738000-8.000000
X-TMASE-MatchedRID: NB29Ml8pA5+MLrybB70frhK6EFc0lvV0NACnndLvXwcFi3R9x/2qQp7O
	325kkkmtHa1OFK8PqLp+vz3/nHYaomSBCik5/ZoSdrnuu4cCcfFCX8V1FiRRkt9RlPzeVuQQIub
	j9bOa7MsojlDYdAoPBTLaKLaWub4PHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgWJgTEpee1jLEkPF
	OL0IWMv6tgcaa32v4+aX4c4HU22RBXNwy8dTpk73aqcyzs5P01HZhrzKUL75oWVTwFenPVPUAs2
	b6oloUkwZBgUyJVEbl6Fw8/PpTMRaVvmiAyeA2kc5MSfkiJFI5p3LlElBHTlw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.738000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A9015BE46A30762D5819E37EB2D208F55F8E2312483CD7430838C14C749845D52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_025117_159639_5EE6E8E0 
X-CRM114-Status: GOOD (  10.15  )
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

From: Rex Lu <rex.lu@mediatek.com>

When mbss was previously enabled, the TLV needs to be included when
disabling it again, in order to clear the firmware state.

Fixes: a7908d5b61e5 ("wifi: mt76: mt7996: fix non-main BSS no beacon issue for MBSS scenario")
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 238b1f78ff7c..e8d34bfbb41a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -822,7 +822,7 @@ mt7996_mcu_bss_mbssid_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	struct bss_info_uni_mbssid *mbssid;
 	struct tlv *tlv;
 
-	if (!vif->bss_conf.bssid_indicator)
+	if (!vif->bss_conf.bssid_indicator && enable)
 		return;
 
 	tlv = mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_11V_MBSSID, sizeof(*mbssid));
-- 
2.39.2


