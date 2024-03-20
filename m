Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5E9C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 11:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBbJ7twBVAqDbUxIxah5SvIfVEI2z/dsLfJesl39ads=; b=MazKB63UxBGkFrrTCrDVCM+Tjm
	C6M++2Kdx1mATsrb87AhgzFjEK1rexIiTipjkPT2O5h4Fe+ZoRTkzwBb/jlW2EGdNsVKLnJwunFvQ
	j1beLo8EeGplWEUOLM1EoH4tRrQ0ZqGTcuXMsrsp5WSKXSArdpEeePH6a/0IOplXS1rjpk/Hn7thF
	RwJTNUjI/ITXPsdvGgZBEc4Ss532HsZdM7p0NC3KowVNJjCB2NGhRM74yxzUQJ+6yjCcEdtUplLpb
	k5OWb/4rjDQpv/qKLIAqdpJr1dfVFtGbo871trOTeiaiIU/Yj3om7POjELPGayW+SrjbPiVS3KeDV
	E34gX4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmu8V-0000000GxsB-462l;
	Wed, 20 Mar 2024 11:29:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmu8T-0000000Gxr1-2mmP
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 11:29:35 +0000
X-UUID: 1c3fc5fae6ad11eeacdb61a41848c7d2-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hBbJ7twBVAqDbUxIxah5SvIfVEI2z/dsLfJesl39ads=;
	b=WVf+LinYEL+VTwSien4xazawy/t+5zq9RanIL8lldCH6bd9CC5dTsrT1k4Fbyz78m+EcJedQFdrnOhgKYtTBPrpCvXZPpb5NPjr8U1/mUZ/c3F/p3guc6Fb+SrthKpjevyrFNCz7tuEK4VZeRKKTK1Lf8YkCTz3axAmrFQx6PHE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:3e19d9b6-695e-4301-aca7-08638ef5f573,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:6afc1d00-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1c3fc5fae6ad11eeacdb61a41848c7d2-20240320
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1922651372; Wed, 20 Mar 2024 04:29:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
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
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 04/10] wifi: mt76: connac: enable HW CSO module for mt7996
Date: Wed, 20 Mar 2024 19:09:12 +0800
Message-ID: <20240320110918.3488-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320110918.3488-1-shayne.chen@mediatek.com>
References: <20240320110918.3488-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.826000-8.000000
X-TMASE-MatchedRID: k3uTSxq8mZ/Lqx3pQDUvTnGBmLio+mJgrXeN27EOXQLfUZT83lbkEPq+
	JLKFEPMF4ZQqYHZtqxhXRv7QPop4cPfA/LmKnHFmogGd8wIUGILUrb18dSl4GPYpl5XkgVFjIub
	j9bOa7MttwxAO+W1YhBIuFMMW4kD5GexLvU6j8fCeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hfNj
	F5BHUO+0AQcGZiE5uGmInxkPkOlrp5XdcgEikaW7sy7EGOvZXM/bACiyJkTD8=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.826000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: AE94E37B5F1E38F048B009B9F97E07BED01A57256AE23C62365BE3C61A356AB72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_042933_750592_4478D56D 
X-CRM114-Status: GOOD (  10.47  )
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

From: Howard Hsu <howard-yh.hsu@mediatek.com>

For mt7996 chipsets, the HW CSO module can help to identify TCP traffic,
which assists the firmware in adjusting algorithms to improve overall
performance.

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   |  7 +++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 657a4d1f856b..608deb47dada 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -610,6 +610,12 @@ struct sta_rec_ra_fixed {
 	u8 mmps_mode;
 } __packed;
 
+struct sta_rec_tx_proc {
+	__le16 tag;
+	__le16 len;
+	__le32 flag;
+} __packed;
+
 /* wtbl_rec */
 
 struct wtbl_req_hdr {
@@ -777,6 +783,7 @@ struct wtbl_raw {
 					 sizeof(struct sta_rec_ra_fixed) + \
 					 sizeof(struct sta_rec_he_6g_capa) + \
 					 sizeof(struct sta_rec_pn_info) + \
+					 sizeof(struct sta_rec_tx_proc) + \
 					 sizeof(struct tlv) +		\
 					 MT76_CONNAC_WTBL_UPDATE_MAX_SIZE)
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index ddd93ec1dddd..744156655d9f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1748,6 +1748,18 @@ mt7996_mcu_sta_bfee_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 	bfee->fb_identity_matrix = (nrow == 1 && tx_ant == 2);
 }
 
+static void
+mt7996_mcu_sta_tx_proc_tlv(struct sk_buff *skb)
+{
+	struct sta_rec_tx_proc *tx_proc;
+	struct tlv *tlv;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_TX_PROC, sizeof(*tx_proc));
+
+	tx_proc = (struct sta_rec_tx_proc *)tlv;
+	tx_proc->flag = cpu_to_le32(0);
+}
+
 static void
 mt7996_mcu_sta_hdrt_tlv(struct mt7996_dev *dev, struct sk_buff *skb)
 {
@@ -2159,6 +2171,8 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 	/* starec hdr trans */
 	mt7996_mcu_sta_hdr_trans_tlv(dev, skb, vif, sta);
+	/* starec tx proc */
+	mt7996_mcu_sta_tx_proc_tlv(skb);
 
 	/* tag order is in accordance with firmware dependency. */
 	if (sta) {
-- 
2.39.2


