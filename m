Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61974C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:10:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 171DF207BC
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 171DF207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LCv+PlMExI0SECKA4a5F8iSQUgDTs7pQxMrib/b75go=; b=Exnn1r8tS6BSQz2Sfb+CHS7m5
	jWSteY+K5suP8c4amm+CXuW7PFKxFLMcTBYNBeLy3BTyEYxJoyXrRhUZS2svjDhH15Rn51eqrRZ/T
	RTcN7VoKLgUcO0CG9BPV8RG0KE/L4h+JbH8vIopn1eS+2FlGeHx/dWeAr9cQ+zVK5okfDj7E1iSG9
	Gp8PZ2nbXqgdLwwdz/bNz8sv/UGJB46rNmLG8RGACda/DlaJxLI7gVpnO6g/+HOC0Kw+QLbK6Qs0p
	jY9R59Gcyw6H2Z3ZTp6QURepeEHyM971yhH5Mdz0+dBp+cdABuIX2ykINjaan4Po0dOERpbU1DBU5
	VNCDFyusA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwUJM-0002XU-Kw; Mon, 04 Jan 2021 18:10:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwUJJ-0002Wd-Uj
 for linux-mediatek@lists.infradead.org; Mon, 04 Jan 2021 18:10:31 +0000
X-UUID: 8cb8cb46fd154b5a89657c6f079acc80-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/hAQ+OWBVeZBACiPTix1+HierCfQNVUTDsFLGUjpaB4=; 
 b=MjoNN60SYbrRYGgElTh2Ew1nvhYr7Pm3EIkXMcCD2rliFIxSzU2FysUHlxM6NceN0HJMiujxnW5X+nFqZIffEp8Sxk4rsdQfyVK7V8v5fP2xUuCdY8q9MtdvbvAFEE5Kc7zxUvPnpWThxBo3AQrpf7IjKAgZL0unwr/3ua+SVMg=;
X-UUID: 8cb8cb46fd154b5a89657c6f079acc80-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 602068947; Mon, 04 Jan 2021 10:10:25 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 10:00:24 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 02:00:22 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 02:00:22 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v5 13/15] mt76: mt7921: introduce support for hardware
 beacon filter
Date: Tue, 5 Jan 2021 02:00:17 +0800
Message-ID: <d9c69b2d1aca66058fd7818634e8eb47a3060efc.1609781247.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1609781247.git.objelf@gmail.com>
References: <cover.1609781247.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7023ADF14FC02051B5C95B6EB14B9910678001398CEBC45489DF465243F17F1B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_131030_197860_93A08C19 
X-CRM114-Status: GOOD (  11.69  )
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

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 40 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +
 2 files changed, 42 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index ab2630ca31ca..1ea209852ef9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -2548,3 +2548,43 @@ int mt7921_mcu_set_vif_ps(struct mt7921_dev *dev, struct ieee80211_vif *vif)
 	return mt76_mcu_send_msg(&dev->mt76, MCU_CMD_SET_PS_PROFILE, &req,
 				 sizeof(req), false);
 }
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
+		.bss_idx = mvif->idx,
+		.aid = cpu_to_le16(vif->bss_conf.aid),
+		.dtim_period = vif->bss_conf.dtim_period,
+		.bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int),
+	};
+	struct {
+		u8 bss_idx;
+		u8 pad[3];
+	} req_hdr = {
+		.bss_idx = mvif->idx,
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
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 80610fe22af4..54d3d21abf91 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -363,4 +363,6 @@ int mt7921_mcu_cancel_hw_scan(struct mt7921_phy *phy,
 			      struct ieee80211_vif *vif);
 u32 mt7921_get_wtbl_info(struct mt7921_dev *dev, u16 wlan_idx);
 int mt7921_mcu_set_vif_ps(struct mt7921_dev *dev, struct ieee80211_vif *vif);
+int mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
+			  bool enable);
 #endif
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
