Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E285C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8ITgvAhZ8RSF+B080AMULdqxWoFzeWj5eoZVoVsg/M=; b=0uAX5CO6+O3dDjtg0PIl4JIy7a
	knYUd/0RkndvhBDBc2DCOPmak3US+xuBIQDII9XDd6XsQhVQlypZwMTEqcHrWX/xE9qf9ITahRLwY
	fjtFlSqL/tB8i4xTlSV4bTKsM8WILAQIiZpBWNr8odaPpKJpLj1a20GVwHQc15wn1UPWvfirA3nFE
	JbTPDm4udN9wykPiXG0HKdqrXBUui39B8gkB1TYN5B21MxpzXH8ITizXWs2dnf1IthyMZYYSrUCvG
	MpcXxZFVLcNAxkH3pdMFkV/HWogpcrW2GINWu+lOINOvIbg/eEtI6cBijRzUTzTW7wlJmJO5GetGs
	3lwTa1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpf-0000000Gtst-1ouN;
	Wed, 20 Mar 2024 11:10:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpa-0000000Gtqq-2otH
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 11:10:03 +0000
X-UUID: 630d6ec2e6aa11ee9aa9374d6d45775a-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=X8ITgvAhZ8RSF+B080AMULdqxWoFzeWj5eoZVoVsg/M=;
	b=aoPEbMykvPWVYHXeTCc4G+HY/MO9cY0+E+Zu5IYwe1c9zBTDBIFIebmOfjPdTPrXjBfiAwq9cy/Wkj7XMlATiFnhIDvdnqLomcgbnpBKL0hlItOSdu2dqMXeWNeyM8G3zEGTIjn/XyDdEDc9d3BsdZlrFeN3Q8Zxn1pC8L324ns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:72dcef00-7542-495e-96b6-9349bf549aec,IP:0,U
	RL:0,TC:0,Content:19,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:19
X-CID-META: VersionHash:6f543d0,CLOUDID:d406a090-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 630d6ec2e6aa11ee9aa9374d6d45775a-20240320
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 492729883; Wed, 20 Mar 2024 04:09:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 19:09:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 19:09:23 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Henry Yen <henry.yen@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 05/10] wifi: mt76: mt7996: fix non-main BSS no beacon issue for MBSS scenario
Date: Wed, 20 Mar 2024 19:09:13 +0800
Message-ID: <20240320110918.3488-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320110918.3488-1-shayne.chen@mediatek.com>
References: <20240320110918.3488-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-1.577500-8.000000
X-TMASE-MatchedRID: uVuWzlu52RmtuHmXLC26Q0KcYi5Qw/RVVo4lwLFUdiuc6BFapCp/z1e/
	KWmAuveAIV4u8YKdeKtdPJV7o2tMJQzyMxeMEX6wFEUknJ/kEl7dB/CxWTRRu4PtEWvP7F7FE2U
	/xa551YOM/tIGy0ozX5kMJmvG7sHCNr+TKrgBJC3yPLLJKwlCvUrrG60YP2io77sCu63mYEoFb2
	esI+aqW1m+StfP/8zJgITnGkK0NFNRskXKHhdfKpij9M86UwHhsKHfMTjCprxgY1U509rkKp6oP
	1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-1.577500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DB7BBED5C167443EC6BD36A0ED0DAD60D12070B9A9CD921CD4CCD210DAF31ABF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_041002_756406_D9D29382 
X-CRM114-Status: GOOD (  10.79  )
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

From: Henry Yen <henry.yen@mediatek.com>

Do not add UNI_BSS_INFO_11V_MBSSID tag when bssid_indicator is not set
to avoid abnormal beaconing behavior in non-11v MBSS scenario.

Signed-off-by: Henry Yen <henry.yen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 744156655d9f..c4eefc593a40 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -819,11 +819,14 @@ mt7996_mcu_bss_mbssid_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	struct bss_info_uni_mbssid *mbssid;
 	struct tlv *tlv;
 
+	if (!vif->bss_conf.bssid_indicator)
+		return;
+
 	tlv = mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_11V_MBSSID, sizeof(*mbssid));
 
 	mbssid = (struct bss_info_uni_mbssid *)tlv;
 
-	if (enable && vif->bss_conf.bssid_indicator) {
+	if (enable) {
 		mbssid->max_indicator = vif->bss_conf.bssid_indicator;
 		mbssid->mbss_idx = vif->bss_conf.bssid_index;
 		mbssid->tx_bss_omac_idx = 0;
-- 
2.39.2


