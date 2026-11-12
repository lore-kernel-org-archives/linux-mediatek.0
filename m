Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62425606A32A
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 07:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kIEC445X;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=GCBFQZlp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CYmu2h57J7V3TF2BzSMf3tS7WBOuMEcTFljY+hFDEPI=; b=kIEC445Xvrw74KspenmWRIZ20M
	9LXHh2UivmdajCTCXgnOAItwItsIKZSFvOlnlTqLXRHDtfSKllAx0FB7agWuD2vjNcnHXAAZt9Ikj
	rQWu6Sqy0sAoPnKmR1ibhJDYboW139Z+zp7k6OqHTIgC19Fh0vX6MxwjKLfOiBjcQGREmTRAuGKdE
	7tYo3KaZQKt7lC39BKblS3F5BRgFJ/PLwx+Azlfh5IzuOF32pXl+Kd5gbvOQoVJWZPxMIOEYVaizs
	Nc3+yfPd7kw3IhZ93mBdLObz5MdL72VadQYTet5PoJTzGEmdVe6QUkfVXZ4Mah+avcxDEVC9odPjo
	1aced/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPIy-00000008wOT-05hc;
	Thu, 12 Nov 2026 07:33:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPIv-00000008wO6-2Ejh
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 07:33:06 +0000
X-UUID: 4976c600de6b11f1afed4741b24580c9-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CYmu2h57J7V3TF2BzSMf3tS7WBOuMEcTFljY+hFDEPI=;
	b=GCBFQZlpB7cHGBTFE/XF/j17J8+mnOIDTA/QTwm6WDRbDaHoRjxLcDK8GqN4GE1/BD6OlDzmP/tfOL135iFwGEXlRGHmA8IuIhHrMb/oeokPMmFECxeMIOwsaKMa7NooDjvuSLCgqbFQD3B99KssijQoEnKOfXX3inQkQ1bvs8k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:c7b7e3b9-3500-4633-a022-16b5797ab87e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:80c4bf30-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4976c600de6b11f1afed4741b24580c9-20261112
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1892223490; Thu, 12 Nov 2026 00:33:00 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:32:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:32:57 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: apply ACPI MTCL/MTVP to regd and 6G usage
Date: Thu, 12 Nov 2026 15:32:56 +0800
Message-ID: <20261112073256.1799643-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_233305_619959_210FFAA6 
X-CRM114-Status: GOOD (  27.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

Read the ACPI MTVP table and use it together with MTCL to decide which
5.9G/6G/EHT capabilities and 6G VLP operation are allowed.

MTCL:
- Accept the V1 short table (6G only) and cross-check the version
  against the table length so a short table cannot be read beyond its
  end. V1 has no 5.9G block, report 5.9G as depending on the driver
  (0x2) instead of forcing it enabled.
- Reject MTCL tables with an unknown version (0 or > 3).
- Add Table 8 List 5 (India, Nicaragua) to the country list and limit
  Australia 6G to Ch1-93, or Ch1-125 when the Australia_Ex bit is set.
- Fix the cc_list_be country order to match Table 9.

MTVP:
- Reject MTVP tables with an unknown version (0 or > 2).
- Add mt792x_acpi_vlp_allowed() to disallow STA connection to 6G VLP
  APs (IEEE80211_CHAN_NO_6GHZ_VLP_CLIENT) in countries not allowed by
  MTVP.
- Add mt792x_acpi_ap_6g_allowed() (MTVP V2) and reject 6G SoftAP in
  mt7925_start_ap() with -EOPNOTSUPP when not allowed.

Self-managed regd:
cfg80211 rebuilds the channel flags from the self-managed regd, so
channel flags set by the driver are overwritten. Apply MTCL/MTVP to the
regd rules built from MT792x_CLC_REGD instead:
- Remove the 5.9G/6G ranges disabled by MTCL from the rules, splitting
  a rule when needed. The max bandwidth of a trimmed rule is limited to
  20/40/80/160 MHz within the rule width, and a rule narrower than
  20 MHz is dropped.
- Set NL80211_RRF_NO_EHT when MTCL disables BE.
- Set NL80211_RRF_NO_6GHZ_VLP_CLIENT on 6G rules when MTVP disallows
  VLP.

Sync the FW with the self-managed regd, so the FW uses exactly the
channels and EHT setting cfg80211 built from it:
- Set WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER and resend SET_DOMAIN_INFO and
  the tx power from mt7925_regd_notifier() once cfg80211 has rebuilt
  the channel flags (NL80211_REGDOM_SET_BY_DRIVER). Before, the FW got
  the flags of the previous country plus the CLC restrictions.
- Skip mt7925_regd_channel_update() for a self-managed regd, the
  channel flags come from the regd only.
- Take has_eht from MTCL only, not from the CLC BE_CTRL table, like
  NL80211_RRF_NO_EHT.
- Send the 6G rate tx power only when cfg80211 has a 6G channel
  enabled, instead of checking clc_chan_conf.

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |   6 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  22 ++-
 .../net/wireless/mediatek/mt76/mt7925/regd.c  | 169 +++++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  18 ++
 .../wireless/mediatek/mt76/mt792x_acpi_sar.c  | 165 +++++++++++++++--
 .../wireless/mediatek/mt76/mt792x_acpi_sar.h  |  12 ++
 6 files changed, 375 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 289663fb84d7..33ef279a7145 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1964,6 +1964,12 @@ mt7925_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	int err;
 
+	/* MTVP: SoftAP on 6G not allowed in this country */
+	if (link_conf->chanreq.oper.chan &&
+	    link_conf->chanreq.oper.chan->band == NL80211_BAND_6GHZ &&
+	    !mt792x_acpi_ap_6g_allowed(&dev->phy, dev->mt76.alpha2))
+		return -EOPNOTSUPP;
+
 	mt792x_mutex_acquire(dev);
 
 	err = mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 14d346c4ff5a..f7d34e0ad96c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -4435,12 +4435,32 @@ int mt7925_mcu_send_ant_sar(struct mt76_phy *phy)
 				 &req, sizeof(req), true);
 }
 
+/* any 6G channel left enabled by cfg80211 */
+static bool mt7925_mcu_6g_enabled(struct mt76_phy *phy)
+{
+	struct ieee80211_supported_band *sband = &phy->sband_6g.sband;
+	int i;
+
+	for (i = 0; i < sband->n_channels; i++)
+		if (!(sband->channels[i].flags & IEEE80211_CHAN_DISABLED))
+			return true;
+
+	return false;
+}
+
 int mt7925_mcu_set_rate_txpower(struct mt76_phy *phy)
 {
 	struct mt76_dev *mdev = phy->dev;
 	struct mt792x_dev *dev = mt792x_hw_dev(mdev->hw);
+	bool en_6g;
 	int err;
 
+	/* self-managed: follow the channel flags cfg80211 built from the regd */
+	if (MT7925_REGD_SUPPORTED(&dev->phy))
+		en_6g = mt7925_mcu_6g_enabled(phy);
+	else
+		en_6g = dev->phy.clc_chan_conf;
+
 	if (phy->cap.has_2ghz) {
 		err = mt7925_mcu_rate_txpower_band(phy,
 						   NL80211_BAND_2GHZ);
@@ -4455,7 +4475,7 @@ int mt7925_mcu_set_rate_txpower(struct mt76_phy *phy)
 			return err;
 	}
 
-	if (phy->cap.has_6ghz && dev->phy.clc_chan_conf) {
+	if (phy->cap.has_6ghz && en_6g) {
 		err = mt7925_mcu_rate_txpower_band(phy,
 						   NL80211_BAND_6GHZ);
 		if (err < 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
index a039ec3ee47b..fac910406aa9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
@@ -42,7 +42,8 @@ void mt7925_regd_be_ctrl(struct mt792x_dev *dev, u8 *alpha2)
 		goto out;
 	}
 
-	if (!phy->clc[MT792x_CLC_BE_CTRL])
+	/* self-managed: EHT follows the regd, which only applies MTCL */
+	if (MT7925_REGD_SUPPORTED(phy) || !phy->clc[MT792x_CLC_BE_CTRL])
 		goto out;
 
 	clc = (struct mt7925_clc *)phy->clc[MT792x_CLC_BE_CTRL];
@@ -83,6 +84,8 @@ mt7925_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 	struct mt76_dev *mdev = &dev->mt76;
 	struct ieee80211_channel *ch;
 	u32 mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, mdev->alpha2);
+	u16 end_6g = mt792x_acpi_get_mtcl_6g_end(&dev->phy, mdev->alpha2);
+	bool vlp = mt792x_acpi_vlp_allowed(&dev->phy, mdev->alpha2);
 	int i;
 
 	if (mtcl_conf != MT792X_ACPI_MTCL_INVALID) {
@@ -132,6 +135,14 @@ mt7925_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 		    IS_UNII_INVALID(4, 6875, 7125, ch->center_freq))
 			ch->flags |= IEEE80211_CHAN_DISABLED;
 
+		/* MTCL: Australia 6G channel range */
+		if (ch->center_freq > end_6g)
+			ch->flags |= IEEE80211_CHAN_DISABLED;
+
+		/* MTVP: disallow STA connection to 6G VLP AP */
+		if (!vlp)
+			ch->flags |= IEEE80211_CHAN_NO_6GHZ_VLP_CLIENT;
+
 		if (!dev->has_eht)
 			ch->flags |= IEEE80211_CHAN_NO_EHT;
 	}
@@ -149,7 +160,11 @@ int mt7925_mcu_apply_regd(struct mt792x_dev *dev, u8 *alpha2,
 		return ret;
 
 	mt7925_regd_be_ctrl(dev, alpha2);
-	mt7925_regd_channel_update(wiphy, dev);
+	/* self-managed: cfg80211 builds the channel flags from the regd, the
+	 * FW gets them as they are (see mt7925_regd_notifier())
+	 */
+	if (!MT7925_REGD_SUPPORTED(&dev->phy))
+		mt7925_regd_channel_update(wiphy, dev);
 
 	ret = mt7925_mcu_set_channel_domain(hw->priv);
 	if (ret < 0)
@@ -184,6 +199,31 @@ void mt7925_regd_notifier(struct wiphy *wiphy, struct regulatory_request *req)
 	struct mt76_connac_pm *pm = &dev->pm;
 	struct mt76_dev *mdev = &dev->mt76;
 
+	/* self-managed: cfg80211 has just rebuilt the channel flags from the
+	 * regd set by mt7925_regd_update(), send them to the FW so both sides
+	 * use the same channels, and resend the tx power since whether the 6G
+	 * table is sent depends on these flags too
+	 */
+	if (req->initiator == NL80211_REGDOM_SET_BY_DRIVER &&
+	    MT7925_REGD_SUPPORTED(&dev->phy)) {
+		if (dev->hw_full_reset)
+			/* __mt7925_start() sends it after the reset */
+			return;
+
+		if (pm->suspended) {
+			/* resent by mt7925_mcu_regd_update() on resume */
+			dev->regd_change = true;
+			return;
+		}
+
+		mt792x_mutex_acquire(dev);
+		if (!mt7925_mcu_set_channel_domain(hw->priv))
+			mt7925_set_tx_sar_pwr(hw, NULL);
+		mt792x_mutex_release(dev);
+
+		return;
+	}
+
 	if (req->initiator == NL80211_REGDOM_SET_BY_USER &&
 	    !dev->regd_user)
 		dev->regd_user = true;
@@ -284,6 +324,120 @@ mt7925_regd_query_regdb(struct mt792x_phy *phy, char *alpha2)
 	return NULL;
 }
 
+/* Largest of 20/40/80/160 MHz that fits both bw and width, 0 if none */
+static u32 mt7925_regd_bw(u32 bw, u32 width)
+{
+	static const u32 bws[] = { 160, 80, 40, 20 };
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(bws); i++)
+		if (MHZ_TO_KHZ(bws[i]) <= min(bw, width))
+			return MHZ_TO_KHZ(bws[i]);
+
+	return 0;
+}
+
+/* Remove [start, end) kHz from the regd rules, splitting a rule if needed.
+ * A rule left narrower than 20 MHz is dropped.
+ */
+static int
+mt7925_regd_clip(struct mt792x_dev *dev, struct ieee80211_regdomain *regd,
+		 int n, int max, u32 start, u32 end)
+{
+	struct ieee80211_freq_range *fr;
+	int i;
+
+	for (i = 0; i < n; i++) {
+		fr = &regd->reg_rules[i].freq_range;
+
+		if (fr->end_freq_khz <= start || fr->start_freq_khz >= end)
+			continue;
+
+		if (fr->start_freq_khz < start && fr->end_freq_khz > end) {
+			if (n == max) {
+				/* no slot to split, drop the upper part so the
+				 * restricted range is never left enabled
+				 */
+				dev_warn(dev->mt76.dev,
+					 "regd rules full, drop %u-%u kHz\n",
+					 end, fr->end_freq_khz);
+			} else {
+				regd->reg_rules[n] = regd->reg_rules[i];
+				fr = &regd->reg_rules[n].freq_range;
+				fr->start_freq_khz = end;
+				fr->max_bandwidth_khz =
+					mt7925_regd_bw(fr->max_bandwidth_khz,
+						       fr->end_freq_khz - end);
+				if (fr->max_bandwidth_khz)
+					n++;
+				fr = &regd->reg_rules[i].freq_range;
+			}
+			fr->end_freq_khz = start;
+		} else if (fr->start_freq_khz < start) {
+			fr->end_freq_khz = start;
+		} else if (fr->end_freq_khz > end) {
+			fr->start_freq_khz = end;
+		} else {
+			fr->end_freq_khz = fr->start_freq_khz;
+		}
+
+		fr->max_bandwidth_khz =
+			mt7925_regd_bw(fr->max_bandwidth_khz,
+				       fr->end_freq_khz - fr->start_freq_khz);
+		if (!fr->max_bandwidth_khz) {
+			memmove(&regd->reg_rules[i], &regd->reg_rules[i + 1],
+				(n - i - 1) * sizeof(regd->reg_rules[0]));
+			n--;
+			i--;
+		}
+	}
+
+	return n;
+}
+
+/* cfg80211 rebuilds the channel flags from the self-managed regd, so the
+ * MTCL/MTVP restrictions have to be carried by the regd rules. Only the
+ * ACPI tables are applied here, the regd itself comes from MT792x_CLC_REGD.
+ */
+static int
+mt7925_regd_apply_acpi(struct mt792x_dev *dev, struct ieee80211_regdomain *regd,
+		       int n, int max, char *alpha2)
+{
+	u32 mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, alpha2);
+	u16 end_6g = mt792x_acpi_get_mtcl_6g_end(&dev->phy, alpha2);
+	bool vlp = mt792x_acpi_vlp_allowed(&dev->phy, alpha2);
+	bool eht = true;
+	struct ieee80211_reg_rule *rule;
+	int i;
+
+	if (mtcl_conf != MT792X_ACPI_MTCL_INVALID) {
+		/* 5.9G: UNII-4 */
+		if ((mtcl_conf & 0x3) == 0)
+			n = mt7925_regd_clip(dev, regd, n, max,
+					     MHZ_TO_KHZ(5845), MHZ_TO_KHZ(5925));
+		/* 6G: UNII-5/6/7/8 */
+		if (((mtcl_conf >> 2) & 0x3) == 0)
+			n = mt7925_regd_clip(dev, regd, n, max,
+					     MHZ_TO_KHZ(5925), MHZ_TO_KHZ(7125));
+		else if (end_6g < 7125)
+			n = mt7925_regd_clip(dev, regd, n, max,
+					     MHZ_TO_KHZ(end_6g), MHZ_TO_KHZ(7125));
+		eht = ((mtcl_conf >> 4) & 0x3) != 0;
+	}
+
+	for (i = 0; i < n; i++) {
+		rule = &regd->reg_rules[i];
+
+		if (!eht)
+			rule->flags |= NL80211_RRF_NO_EHT;
+
+		if (!vlp && rule->freq_range.end_freq_khz > MHZ_TO_KHZ(5925))
+			rule->flags |= NL80211_RRF_NO_6GHZ_VLP_CLIENT;
+	}
+
+	return n;
+}
+
 int mt7925_regd_update(struct mt792x_phy *phy, char *alpha2)
 {
 	struct wiphy *wiphy = phy->mt76->hw->wiphy;
@@ -294,7 +448,7 @@ int mt7925_regd_update(struct mt792x_phy *phy, char *alpha2)
 	struct ieee80211_regdomain *regd;
 	struct ieee80211_reg_rule *rule;
 	struct mt7925_regd_rule_ev *ev;
-	int i, num_of_rules = 0;
+	int i, num_of_rules = 0, max_rules;
 	struct sk_buff *skb;
 	int ret = 0;
 
@@ -320,7 +474,9 @@ int mt7925_regd_update(struct mt792x_phy *phy, char *alpha2)
 		goto err;
 	}
 
-	regd = kzalloc(struct_size(regd, reg_rules, num_of_rules), GFP_KERNEL);
+	/* room for rules split by mt7925_regd_apply_acpi() */
+	max_rules = min(num_of_rules + 2, NL80211_MAX_SUPP_REG_RULES);
+	regd = kzalloc(struct_size(regd, reg_rules, max_rules), GFP_KERNEL);
 	if (!regd) {
 		ret = -ENOMEM;
 		goto err;
@@ -342,7 +498,6 @@ int mt7925_regd_update(struct mt792x_phy *phy, char *alpha2)
 		rule->flags = mt7925_rule->flags;
 	}
 
-	regd->n_reg_rules = num_of_rules;
 	regd->dfs_region = ev->dfs_region;
 
 	memcpy(regd->alpha2, alpha2, 2);
@@ -351,6 +506,8 @@ int mt7925_regd_update(struct mt792x_phy *phy, char *alpha2)
 	dev->regd_change = true;
 	mt7925_mcu_regd_update(dev, alpha2, ENVIRON_ANY);
 
+	regd->n_reg_rules = mt7925_regd_apply_acpi(dev, regd, num_of_rules,
+						   max_rules, alpha2);
 	ret = regulatory_set_wiphy_regd(wiphy, regd);
 
 	kfree(regd);
@@ -422,6 +579,8 @@ int mt7925_regd_init(struct mt792x_phy *phy)
 	if (MT7925_REGD_SUPPORTED(phy)) {
 		wiphy->regulatory_flags |= REGULATORY_WIPHY_SELF_MANAGED |
 					   REGULATORY_DISABLE_BEACON_HINTS;
+		/* get the notifier once cfg80211 has applied our regd */
+		wiphy->flags |= WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER;
 		return mt7925_regd_update(phy, "00");
 	} else if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN) {
 		wiphy->regulatory_flags |= REGULATORY_COUNTRY_IE_IGNORE |
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index c491f5a42cb4..98fb03ff0df3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -685,6 +685,9 @@ int mt792x_init_acpi_sar(struct mt792x_dev *dev);
 int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default);
 u8 mt792x_acpi_get_flags(struct mt792x_phy *phy);
 u32 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2);
+u16 mt792x_acpi_get_mtcl_6g_end(struct mt792x_phy *phy, char *alpha2);
+bool mt792x_acpi_vlp_allowed(struct mt792x_phy *phy, char *alpha2);
+bool mt792x_acpi_ap_6g_allowed(struct mt792x_phy *phy, char *alpha2);
 #else
 static inline int mt792x_init_acpi_sar(struct mt792x_dev *dev)
 {
@@ -706,6 +709,21 @@ static inline u32 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2
 {
 	return MT792X_ACPI_MTCL_INVALID;
 }
+
+static inline u16 mt792x_acpi_get_mtcl_6g_end(struct mt792x_phy *phy, char *alpha2)
+{
+	return 7125;
+}
+
+static inline bool mt792x_acpi_vlp_allowed(struct mt792x_phy *phy, char *alpha2)
+{
+	return true;
+}
+
+static inline bool mt792x_acpi_ap_6g_allowed(struct mt792x_phy *phy, char *alpha2)
+{
+	return true;
+}
 #endif
 
 #endif /* __MT7925_H */
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 227a6960f135..28146d74109d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -9,8 +9,13 @@ static const char * const cc_list_all[] = {
 	"CA", "CL", "CN", "ID", "JP", "MY", "MX", "ME",
 	"MA", "NZ", "NG", "PH", "RU", "RS", "SG", "KR",
 	"TW", "TH", "UA", "GB", "US", "VN", "KH", "PY",
+	"IN", "NI",
 };
 
+/* Table 8 List 5 Bit5: extended 6G channels (Ch1-125) for Australia */
+#define MT792X_MTCL_AU_EX_ROW	4
+#define MT792X_MTCL_AU_EX_COL	5
+
 static const char * const cc_list_eu[] = {
 	"AD", "AT", "BE", "BG", "CY", "CZ", "HR", "DK",
 	"EE", "FI", "FR", "DE", "GR", "HU", "IS", "IE",
@@ -22,8 +27,13 @@ static const char * const cc_list_eu[] = {
 static const char * const cc_list_be[] = {
 	"AR", "BR", "BY", "CL", "IQ", "MX", "OM", "RU",
 	"RW", "VN", "KR", "UA", "", "", "", "",
-	"EU", "AT", "CN", "CA", "TW", "NZ", "PH", "UK",
-	"US",
+	"EU", "AU", "CN", "CA", "TW", "NZ", "PH", "GB",
+	"US", "JP",
+};
+
+static const char * const cc_list_vlp[] = {
+	"00", "EU", "US", "CA", "GB", "AU", "NZ", "TW",
+	"JP", "KR", "BR", "VN",
 };
 
 static int
@@ -93,19 +103,35 @@ static int
 mt792x_asar_acpi_read_mtcl(struct mt792x_dev *dev, u8 **table, u8 *version)
 {
 	int len, ret;
+	u8 ver;
 
 	ret = mt792x_acpi_read(dev, MT792x_ACPI_MTCL, table, &len);
 	if (ret)
 		return ret;
 
-	if (len == sizeof(struct mt792x_asar_cl))
-		*version = ((struct mt792x_asar_cl *)*table)->version;
-	else if (len == sizeof(struct mt792x_asar_cl_v3))
-		*version = ((struct mt792x_asar_cl_v3 *)*table)->version;
-	else
+	/* V1: 6G only, V2: + 5.9G, V3: + WF7 */
+	if (len != offsetof(struct mt792x_asar_cl, mode_5g9) &&
+	    len != sizeof(struct mt792x_asar_cl) &&
+	    len != sizeof(struct mt792x_asar_cl_v3))
 		return -EINVAL;
 
-	return ret;
+	/* version is at the same offset in all layouts */
+	ver = ((struct mt792x_asar_cl *)*table)->version;
+
+	/* the table must carry every block its version claims */
+	if ((ver > 1 && len < sizeof(struct mt792x_asar_cl)) ||
+	    (ver > 2 && len < sizeof(struct mt792x_asar_cl_v3)))
+		return -EINVAL;
+
+	/* only the versions with a known layout are accepted, a corrupt
+	 * version byte must not make the parser guess a layout
+	 */
+	if (!ver || ver > 3)
+		return -EINVAL;
+
+	*version = ver;
+
+	return 0;
 }
 
 /* MTDS : Dynamic SAR Power Table */
@@ -190,6 +216,36 @@ mt792x_asar_acpi_read_mtfg(struct mt792x_dev *dev, u8 **table)
 	return 0;
 }
 
+/* MTVP : 6G VLP Country List Table */
+static int
+mt792x_asar_acpi_read_mtvp(struct mt792x_dev *dev, u8 **table)
+{
+	struct mt792x_asar_vp *vp;
+	int len, ret;
+
+	ret = mt792x_acpi_read(dev, MT792x_ACPI_MTVP, table, &len);
+	if (ret)
+		return ret;
+
+	vp = (struct mt792x_asar_vp *)*table;
+
+	if (len < offsetof(struct mt792x_asar_vp, mode_ap) ||
+	    memcmp(vp->names, MT792x_ACPI_MTVP, 4))
+		return -EINVAL;
+
+	/* V2 must carry the SoftAP 6G block */
+	if (vp->version >= 2 && len < sizeof(struct mt792x_asar_vp))
+		return -EINVAL;
+
+	/* only the versions with a known layout are accepted, a corrupt
+	 * version byte must not make the parser guess a layout
+	 */
+	if (!vp->version || vp->version > 2)
+		return -EINVAL;
+
+	return 0;
+}
+
 int mt792x_init_acpi_sar(struct mt792x_dev *dev)
 {
 	struct mt792x_acpi_sar *asar;
@@ -224,6 +280,13 @@ int mt792x_init_acpi_sar(struct mt792x_dev *dev)
 		devm_kfree(dev->mt76.dev, asar->fg);
 		asar->fg = NULL;
 	}
+
+	/* MTVP is optional */
+	ret = mt792x_asar_acpi_read_mtvp(dev, (u8 **)&asar->vp);
+	if (ret) {
+		devm_kfree(dev->mt76.dev, asar->vp);
+		asar->vp = NULL;
+	}
 	dev->phy.acpisar = asar;
 
 	return 0;
@@ -404,12 +467,20 @@ mt792x_acpi_get_mtcl_map(int row, int column, struct mt792x_asar_cl *cl)
 	u8 mode_6g, mode_5g9;
 
 	mode_6g = (cl->mode_6g > 0x02) ? 0 : cl->mode_6g;
-	mode_5g9 = (cl->mode_5g9 > 0x01) ? 0 : cl->mode_5g9;
 
 	if ((cl->cl6g[row] & BIT(column)) || cl->mode_6g == 0x02)
 		config |= (mode_6g & 0x3) << 2;
-	if (cl->version > 1 && cl->cl5g9[row] & BIT(column))
-		config |= (mode_5g9 & 0x3);
+
+	/* no 5.9G block in V1, leave it to the driver (0x2, as in the V3
+	 * fallback) instead of forcing it enabled
+	 */
+	if (cl->version < 2) {
+		config |= 0x2;
+	} else {
+		mode_5g9 = (cl->mode_5g9 > 0x01) ? 0 : cl->mode_5g9;
+		if (cl->cl5g9[row] & BIT(column))
+			config |= (mode_5g9 & 0x3);
+	}
 
 	return config;
 }
@@ -485,3 +556,75 @@ u32 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2)
 	return config;
 }
 EXPORT_SYMBOL_GPL(mt792x_acpi_get_mtcl_conf);
+
+/* Upper edge (MHz) of the 6G band allowed by MTCL. Australia is limited to
+ * Ch1-93 unless the Australia_Ex bit is also set, which extends it to Ch1-125.
+ */
+u16 mt792x_acpi_get_mtcl_6g_end(struct mt792x_phy *phy, char *alpha2)
+{
+	struct mt792x_acpi_sar *sar = phy->acpisar;
+	struct mt792x_asar_cl *cl = sar ? sar->countrylist : NULL;
+
+	/* 6G of AU is disabled by mt792x_acpi_get_mtcl_conf() if its bit is clear */
+	if (!cl || cl->mode_6g != 0x01 || memcmp(alpha2, "AU", 2))
+		return 7125;
+
+	if (cl->cl6g[MT792X_MTCL_AU_EX_ROW] & BIT(MT792X_MTCL_AU_EX_COL))
+		return 6585;
+
+	return 6425;
+}
+EXPORT_SYMBOL_GPL(mt792x_acpi_get_mtcl_6g_end);
+
+/* Look up alpha2 in an MTVP country list bitmap */
+static bool
+mt792x_acpi_mtvp_cl_match(const u8 *cl, const char *alpha2)
+{
+	int row = 0, col = 7, i;
+
+	for (i = 0; i < ARRAY_SIZE(cc_list_vlp); i++) {
+		if (!memcmp(cc_list_vlp[i], alpha2, 2)) {
+			row = i / 8;
+			col = 7 - i % 8;
+			goto out;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cc_list_eu); i++) {
+		if (!memcmp(cc_list_eu[i], alpha2, 2)) {
+			col = 6;
+			break;
+		}
+	}
+
+out:
+	return !!(cl[row] & BIT(col));
+}
+
+/* Whether MTVP allows STA to connect to 6G VLP AP in country alpha2 */
+bool mt792x_acpi_vlp_allowed(struct mt792x_phy *phy, char *alpha2)
+{
+	struct mt792x_acpi_sar *sar = phy->acpisar;
+	struct mt792x_asar_vp *vp = sar ? sar->vp : NULL;
+
+	/* MTVP is optional, depends on driver */
+	if (!vp || vp->mode_vlp == 0x02)
+		return true;
+
+	return vp->mode_vlp == 0x01 && mt792x_acpi_mtvp_cl_match(vp->clvlp, alpha2);
+}
+EXPORT_SYMBOL_GPL(mt792x_acpi_vlp_allowed);
+
+/* Whether MTVP allows SoftAP on 6G in country alpha2 */
+bool mt792x_acpi_ap_6g_allowed(struct mt792x_phy *phy, char *alpha2)
+{
+	struct mt792x_acpi_sar *sar = phy->acpisar;
+	struct mt792x_asar_vp *vp = sar ? sar->vp : NULL;
+
+	/* no SoftAP block before V2, depends on driver */
+	if (!vp || vp->version < 2)
+		return true;
+
+	return vp->mode_ap == 0x01 && mt792x_acpi_mtvp_cl_match(vp->clap, alpha2);
+}
+EXPORT_SYMBOL_GPL(mt792x_acpi_ap_6g_allowed);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
index 474033073831..dc63c60b3907 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
@@ -14,6 +14,7 @@
 #define MT792x_ACPI_MTDS		"MTDS"
 #define MT792x_ACPI_MTGS		"MTGS"
 #define MT792x_ACPI_MTFG		"MTFG"
+#define MT792x_ACPI_MTVP		"MTVP"
 
 #define MT792X_ACPI_MTCL_INVALID	0xffffffff
 
@@ -94,6 +95,16 @@ struct mt792x_asar_cl {
 	u8 cl5g9[6];
 } __packed;
 
+/* V1 ends at clvlp[], V2 appends the SoftAP 6G block */
+struct mt792x_asar_vp {
+	u8 names[4];
+	u8 version;
+	u8 mode_vlp;
+	u8 clvlp[6];
+	u8 mode_ap;
+	u8 clap[6];
+} __packed;
+
 struct mt792x_asar_fg {
 	u8 names[4];
 	u8 version;
@@ -118,6 +129,7 @@ struct mt792x_acpi_sar {
 		struct mt792x_asar_cl_v3 *countrylist_v3;
 	};
 	struct mt792x_asar_fg *fg;
+	struct mt792x_asar_vp *vp;
 };
 
 #endif
-- 
2.18.0


