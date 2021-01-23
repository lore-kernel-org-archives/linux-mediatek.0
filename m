Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522A6C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:45:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC00523A5B
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC00523A5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4OMXHxJgmJFJwM+JaEiOuxsxTBJR1js98VM+Yo4hvTc=; b=OjIjKR3gAYt2ksW/XqnSVh7CI
	VcdGkZRr+hsMvijLcdvOFTZ/Yvrcwa6RyeGd2yX9fXWcy7LtNxu4v3+YjDhKyNKzvGs8wsv+JdIaD
	kK8OaCaRiJSKIIjHjSLsdrbvqlFIAvAfoOBjnC1CHt6ssE+4ba82VtgxU/Ikny79MDBeanPC3f0Pr
	jbC/uY2UlcpaAtMpqubZwSnWtCdsYb4ZYfyfCRPpq9g3EpeRN4N8X5By4RPf9q2jADzuI/UWmyLs0
	mkOmNWq0dXqIZHKtglH81BveH6GPsOUINlYoKkhIhArYtCrLlhbyLIi7i0gFcKoM1IUBvbc+xmKcp
	IXPJ6Hb3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3EXy-0005WV-3b; Sat, 23 Jan 2021 08:45:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3EXr-0005UR-Jy
 for linux-mediatek@lists.infradead.org; Sat, 23 Jan 2021 08:45:27 +0000
X-UUID: e96e977df26a491cbe08f4db23eda46b-20210123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XDjo8KH05CnwnmvJjXVqWVVexEcDgAMoZ6xu3FDdb+4=; 
 b=TbrixRCFr4A9RkamPRsmACa6XdVeE5p1xB8qkYpdTUxafXe8tOTstR3PcyYJZiep6yjR9nslD6eGOaMe1iv8PMKZUR4sq6nv0xRLaGzPmkyTNLvuQmqAkLoWcgByjFkH9ow1ezOLE63GQTYuy2jxavJhMv6iLWMZLZI5SGAVrUY=;
X-UUID: e96e977df26a491cbe08f4db23eda46b-20210123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1041564162; Sat, 23 Jan 2021 00:45:18 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 00:35:30 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 16:35:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Jan 2021 16:35:16 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v7 11/22] mt76: mt7921: introduce support for hardware
 beacon filter
Date: Sat, 23 Jan 2021 16:35:02 +0800
Message-ID: <501a4e58991eeb7d1cfbd9c9d4758eaf3523466e.1611389300.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1611389300.git.objelf@gmail.com>
References: <cover.1611389300.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 01375A47BFC12CE786A73FCD19F248AA4914751E6EF20B1AB8FCDDF40618D3FF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_034523_996916_AB21DDC7 
X-CRM114-Status: GOOD (  11.94  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com,
 Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Introduce support for hw beacon filter available in the mt7921 firmware.

According to mt7921e firmware, enabling hardware filter would rely on
mt7921_mcu_uni_bss_bcnft and disabling hardware filter still rely on legacy
mt7921_mcu_set_bss_pm.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 75 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  4 +
 3 files changed, 80 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 913b56065de6..768456c7aa7f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -2500,3 +2500,78 @@ int mt7921_mcu_uni_bss_ps(struct mt7921_dev *dev, struct ieee80211_vif *vif)
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_BSS_INFO_UPDATE,
 				 &ps_req, sizeof(ps_req), true);
 }
+
+int mt7921_mcu_uni_bss_bcnft(struct mt7921_dev *dev, struct ieee80211_vif *vif,
+			     bool enable)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct {
+		struct {
+			u8 bss_idx;
+			u8 pad[3];
+		} __packed hdr;
+		struct bcnft_tlv {
+			__le16 tag;
+			__le16 len;
+			__le16 bcn_interval;
+			u8 dtim_period;
+			u8 pad;
+		} __packed bcnft;
+	} __packed bcnft_req = {
+		.hdr = {
+			.bss_idx = mvif->mt76.idx,
+		},
+		.bcnft = {
+			.tag = cpu_to_le16(UNI_BSS_INFO_BCNFT),
+			.len = cpu_to_le16(sizeof(struct bcnft_tlv)),
+			.bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int),
+			.dtim_period = vif->bss_conf.dtim_period,
+		},
+	};
+
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return 0;
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_BSS_INFO_UPDATE,
+				 &bcnft_req, sizeof(bcnft_req), true);
+}
+
+int mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
+			  bool enable)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct {
+		u8 bss_idx;
+		u8 dtim_period;
+		__le16 aid;
+		__le16 bcn_interval;
+		__le16 atim_window;
+		u8 uapsd;
+		u8 bmc_delivered_ac;
+		u8 bmc_triggered_ac;
+		u8 pad;
+	} req = {
+		.bss_idx = mvif->mt76.idx,
+		.aid = cpu_to_le16(vif->bss_conf.aid),
+		.dtim_period = vif->bss_conf.dtim_period,
+		.bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int),
+	};
+	struct {
+		u8 bss_idx;
+		u8 pad[3];
+	} req_hdr = {
+		.bss_idx = mvif->mt76.idx,
+	};
+	int err;
+
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return 0;
+
+	err = mt76_mcu_send_msg(&dev->mt76, MCU_CMD_SET_BSS_ABORT, &req_hdr,
+				sizeof(req_hdr), false);
+	if (err < 0 || !enable)
+		return err;
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_CMD_SET_BSS_CONNECTED, &req,
+				 sizeof(req), false);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
index 2103e1d3ac94..de3a9aabec04 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
@@ -211,6 +211,7 @@ enum {
 	UNI_BSS_INFO_QBSS = 15,
 	UNI_BSS_INFO_UAPSD = 19,
 	UNI_BSS_INFO_PS = 21,
+	UNI_BSS_INFO_BCNFT = 22,
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index f4435cc1712f..161e328fc4ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -356,4 +356,8 @@ int mt7921_mcu_cancel_hw_scan(struct mt7921_phy *phy,
 			      struct ieee80211_vif *vif);
 u32 mt7921_get_wtbl_info(struct mt7921_dev *dev, u16 wlan_idx);
 int mt7921_mcu_uni_bss_ps(struct mt7921_dev *dev, struct ieee80211_vif *vif);
+int mt7921_mcu_uni_bss_bcnft(struct mt7921_dev *dev, struct ieee80211_vif *vif,
+			     bool enable);
+int mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
+			  bool enable);
 #endif
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
