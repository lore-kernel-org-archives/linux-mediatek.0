Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22C9C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:01:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931A920784
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931A920784
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FrKak5OCzn01cjzm8j8RWLIsKe1510kiWpwBYvYfaQI=; b=qCioGumQqVMHrYDdxPZS/SiTk
	4a4DFFpPW0v/Y1JspGHMH7kc2ArrOsXe4p2GmNhMhLJTX4L/J6/aUMcpodYnWcUcE4NzhLzmrsdVA
	ZxtIOi9oFxtKy3XIzfiA8ojjL8ZfuB/Sl7f9FUW6CUheUqo3lPkFO67uRCw58iD1mfKDkG2A3tzfW
	om/IK+h6Q4NuXeiwT7iwdNacvEBG5ic6fUBC6iDsEZqBPFktEMm6H4OCkuSiRqWHFX+tE9rL1zeu8
	DST8snc1CmPV5Qv7pHFnF6w/L8/fOoHRTQmqLNzAA4KUkE/hQWcMDIrH7O4QSzOncgZc47/M2gMkE
	YBBf4U8kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwU9t-0000eL-EK; Mon, 04 Jan 2021 18:00:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwU9q-0000bw-6o
 for linux-mediatek@lists.infradead.org; Mon, 04 Jan 2021 18:00:43 +0000
X-UUID: 6248a3cf1bff40e39e11819a98d7fe0f-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=T92ChxrXJABdLXrIwD5zxZzoAjd7kc5BE2R6i9H/MQQ=; 
 b=mYXw6pXdR50y+6TfZScyk3FNE/kulk4TCW0nUoqduRv97oAHdyI+61szjGB302tJMQFSXnCnK6n1H0jl2g5zrcRo8Sz74VJ4+ESnowagmvEwAGJCrc3OioJORDgQzXXkuWu+logyCm/GW86Yks05ILQojRHIzi3BC/A0FAVA8bk=;
X-UUID: 6248a3cf1bff40e39e11819a98d7fe0f-20210104
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1930430389; Mon, 04 Jan 2021 10:00:38 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 10:00:36 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 02:00:22 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 02:00:22 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v5 12/15] mt76: mt7921: introduce 802.11 PS support in
 sta mode
Date: Tue, 5 Jan 2021 02:00:16 +0800
Message-ID: <f18c2946e92cec13ad99e7183368a64ee179e67b.1609781247.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1609781247.git.objelf@gmail.com>
References: <cover.1609781247.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4AD92DE587271B366A083A8AD8E3D63A36979B79EE6382F62C23F7DD18B2B6942000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_130042_404365_BBDBAA45 
X-CRM114-Status: GOOD (  14.28  )
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

Enable 802.11 power-save support available in mt7921 firmware

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  2 ++
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  3 +--
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  3 +++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 21 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 +
 5 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 9aa110f6562b..039f9c206b05 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -83,6 +83,8 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
 	ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
 	ieee80211_hw_set(hw, WANT_MONITOR_VIF);
+	ieee80211_hw_set(hw, SUPPORTS_PS);
+	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
 
 	hw->max_tx_fragments = 4;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index a5d3f5023ea4..ca059dc245a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -690,8 +690,7 @@ void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
 	txwi[1] = cpu_to_le32(val);
 	txwi[2] = 0;
 
-	val = MT_TXD3_SW_POWER_MGMT |
-	      FIELD_PREP(MT_TXD3_REM_TX_COUNT, tx_count);
+	val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, tx_count);
 	if (key)
 		val |= MT_TXD3_PROTECT_FRAME;
 	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 2147bcc53148..0af5e536e5cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -560,6 +560,9 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))
 		mt7921_mcu_set_tx(dev, vif);
 
+	if (changed & BSS_CHANGED_PS)
+		mt7921_mcu_set_vif_ps(dev, vif);
+
 	mutex_unlock(&dev->mt76.mutex);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 99fa49a69ae5..ab2630ca31ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -2527,3 +2527,24 @@ u32 mt7921_get_wtbl_info(struct mt7921_dev *dev, u16 wlan_idx)
 
 	return 0;
 }
+
+int mt7921_mcu_set_vif_ps(struct mt7921_dev *dev, struct ieee80211_vif *vif)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct {
+		u8 bss_idx;
+		u8 ps_state; /* 0: device awake
+			      * 1: static power save
+			      * 2: dynamic power saving
+			      */
+	} req = {
+		.bss_idx = mvif->idx,
+		.ps_state = vif->bss_conf.ps ? 2 : 0,
+	};
+
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return -EOPNOTSUPP;
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_CMD_SET_PS_PROFILE, &req,
+				 sizeof(req), false);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index dc6064100f53..80610fe22af4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -362,4 +362,5 @@ int mt7921_mcu_sched_scan_enable(struct mt7921_phy *phy,
 int mt7921_mcu_cancel_hw_scan(struct mt7921_phy *phy,
 			      struct ieee80211_vif *vif);
 u32 mt7921_get_wtbl_info(struct mt7921_dev *dev, u16 wlan_idx);
+int mt7921_mcu_set_vif_ps(struct mt7921_dev *dev, struct ieee80211_vif *vif);
 #endif
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
