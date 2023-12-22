Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3C2C46CD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Dec 2023 01:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlDacxKy3kw2V31VPbFA31vCyG6tzaqHDDnumX3xRM8=; b=p/9i2SCHj2dg9KcxDt8RDX4VYf
	d0Bmod5qRPh2K04Xvaq86U9oY5rmFUR6yr/0UZrc8VGeom+pmIlQbFgogi2E58H7lXT83C0+QB995
	RPOWl95tsM7MZ97gUrlFlsrlWy1NWuND0J5gmaLN/AgNl5G6JIkrW327WHsqaR43Uz1PWlwavWEW8
	9LWCvH+Yqon1+J7WMcDJVjT0apVyf9nbuGtf2/H8FSSPe/sXnr83tf71S8dC3HzKb1ROFTbv+YvZS
	hnjsqBH7kyNsgen0Xxr652iNLZFb7JJRRSGIb52hKbz3ZygTWs/VZ2d7s/Ztvq8P0APiRUCLjqJx3
	o8RSo69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGUCZ-004ahU-2J;
	Fri, 22 Dec 2023 01:19:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGUCU-004agd-0J
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Dec 2023 01:19:45 +0000
X-UUID: 2abe5ea6a06811ee9b09ad09c76753c8-20231221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JlDacxKy3kw2V31VPbFA31vCyG6tzaqHDDnumX3xRM8=;
	b=c+DFQfouZTjO3R3+o/mhQxmESeGtkq2/ZOjxsytpvcN2oBN9bhZV6Hw2iRZnw3pni7txXev2JNMNWeEfCIP5BJJ/KpiSoww6WGJSXQfAleYVsPXGLSqh7uc+1bqe7h4zZlpYz/p/kZBLuq81kJy1yO+pwEojTy/q8GIrgKy22cI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:c4c1bdb9-f656-41cf-bb11-6b22cc906c54,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:02790a82-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2abe5ea6a06811ee9b09ad09c76753c8-20231221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1403619712; Thu, 21 Dec 2023 18:19:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Dec 2023 09:09:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Dec 2023 09:09:32 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [v4,2/2] wifi: mac80211: refactor STA CSA parsing flows
Date: Fri, 22 Dec 2023 09:09:14 +0800
Message-ID: <20231222010914.6521-3-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231222010914.6521-1-michael-cy.lee@mediatek.com>
References: <20231222010914.6521-1-michael-cy.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_171942_144065_16B14C59 
X-CRM114-Status: GOOD (  23.49  )
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

The new Wi-Fi Standard (IEEE Std 802.11-2020 9.4.2.160) specifies that
the Wide Bandwidth Channel Switch (WBCS) Element subfields have the same
definitions as VHT operation information if the operating band is not
S1G.

The problem comes when the BSS is in 6 GHz band, the STA parses the WBCS
Element by ieee80211_chandef_vht_oper(), which checks the capabilities for
HT/VHT mode, not HE/EHT mode.

This patch refactors STA CSA parsing flow so that the corresponding
capabilities can be checked. Also, it adds the way to use op_class in ECSA
Element to build a new chandef.

In summary, the new steps for STA to handle CSA event are:
1. build the new chandef from one of the CSA-related (Sub)Elements in
   following order,
   - Bandwidth Indication (Sub)Element
   - Wide Bandwidth Channel Switch (Sub)Element
   - Operating class in Extended Channel Switch Announcement Element
   - Channel Switch Announcement Element
2. convert the new chandef into operation information according to the
   operating band in order to check if the new chandef fits STA's
   capabilities.
3. downgrade the bandwidth until current bandwidth is not disabled.

Co-developed-by: Money Wang <money.wang@mediatek.com>
Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
v4: The biggest difference in this version is that the WBCS Element has
higher priority than op_class when STA handling CSA event.
Other changes most come from your suggestions. (ex. coding style, static
allocation in functions)
About the 'strict mode' you mentioned, we agree to making it a future
work, and let this patch handle the original problem we faced.
---
 net/mac80211/spectmgmt.c | 302 ++++++++++++++++++++++++++++++++-------
 1 file changed, 249 insertions(+), 53 deletions(-)

diff --git a/net/mac80211/spectmgmt.c b/net/mac80211/spectmgmt.c
index 55959b0b24c5..7d565888d8c4 100644
--- a/net/mac80211/spectmgmt.c
+++ b/net/mac80211/spectmgmt.c
@@ -19,6 +19,203 @@
 #include "sta_info.h"
 #include "wme.h"
 
+static bool
+wbcs_elem_to_chandef(const struct ieee80211_wide_bw_chansw_ie *wbcs_elem,
+		     struct cfg80211_chan_def *chandef)
+{
+	u8 ccfs0 = wbcs_elem->new_center_freq_seg0;
+	u8 ccfs1 = wbcs_elem->new_center_freq_seg1;
+	u32 cf0 = ieee80211_channel_to_frequency(ccfs0, chandef->chan->band);
+	u32 cf1 = ieee80211_channel_to_frequency(ccfs1, chandef->chan->band);
+
+	switch (wbcs_elem->new_channel_width) {
+	case IEEE80211_VHT_CHANWIDTH_160MHZ:
+		/* deprecated encoding */
+		chandef->width = NL80211_CHAN_WIDTH_160;
+		chandef->center_freq1 = cf0;
+		break;
+	case IEEE80211_VHT_CHANWIDTH_80P80MHZ:
+		/* deprecated encoding */
+		chandef->width = NL80211_CHAN_WIDTH_80P80;
+		chandef->center_freq1 = cf0;
+		chandef->center_freq2 = cf1;
+		break;
+	case IEEE80211_VHT_CHANWIDTH_80MHZ:
+		chandef->width = NL80211_CHAN_WIDTH_80;
+		chandef->center_freq1 = cf0;
+
+		if (ccfs1) {
+			u8 diff = abs(ccfs0 - ccfs1);
+
+			if (diff == 8) {
+				chandef->width = NL80211_CHAN_WIDTH_160;
+				chandef->center_freq1 = cf1;
+			} else if (diff > 8) {
+				chandef->width = NL80211_CHAN_WIDTH_80P80;
+				chandef->center_freq2 = cf1;
+			}
+		}
+		break;
+	case IEEE80211_VHT_CHANWIDTH_USE_HT:
+	default:
+		/* If the WBCS Element is present, new channel bandwidth is
+		 * at least 40 MHz.
+		 */
+		chandef->width = NL80211_CHAN_WIDTH_40;
+		chandef->center_freq1 = cf0;
+		break;
+	}
+
+	return cfg80211_chandef_valid(chandef);
+}
+
+static void
+validate_chandef_by_ht_vht_oper(struct ieee80211_sub_if_data *sdata,
+				ieee80211_conn_flags_t conn_flags,
+				u32 vht_cap_info,
+				struct cfg80211_chan_def *chandef)
+{
+	u32 control_freq, center_freq1, center_freq2;
+	enum nl80211_chan_width chan_width;
+	struct ieee80211_ht_operation ht_oper;
+	struct ieee80211_vht_operation vht_oper;
+
+	if (conn_flags & (IEEE80211_CONN_DISABLE_HT |
+			  IEEE80211_CONN_DISABLE_40MHZ)) {
+		chandef->chan = NULL;
+		return;
+	}
+
+	control_freq = chandef->chan->center_freq;
+	center_freq1 = chandef->center_freq1;
+	center_freq2 = chandef->center_freq2;
+	chan_width = chandef->width;
+
+	ht_oper.primary_chan = ieee80211_frequency_to_channel(control_freq);
+	if (control_freq != center_freq1)
+		ht_oper.ht_param = control_freq > center_freq1 ?
+			IEEE80211_HT_PARAM_CHA_SEC_BELOW :
+			IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
+	else
+		ht_oper.ht_param = IEEE80211_HT_PARAM_CHA_SEC_NONE;
+
+	ieee80211_chandef_ht_oper(&ht_oper, chandef);
+
+	if (conn_flags & IEEE80211_CONN_DISABLE_VHT)
+		return;
+
+	vht_oper.center_freq_seg0_idx =
+		ieee80211_frequency_to_channel(center_freq1);
+	vht_oper.center_freq_seg1_idx = center_freq2 ?
+		ieee80211_frequency_to_channel(center_freq2) : 0;
+
+	switch (chan_width) {
+	case NL80211_CHAN_WIDTH_320:
+		WARN_ON(1);
+		break;
+	case NL80211_CHAN_WIDTH_160:
+		vht_oper.chan_width = IEEE80211_VHT_CHANWIDTH_80MHZ;
+		vht_oper.center_freq_seg1_idx = vht_oper.center_freq_seg0_idx;
+		vht_oper.center_freq_seg0_idx +=
+			control_freq < center_freq1 ? -8 : 8;
+		break;
+	case NL80211_CHAN_WIDTH_80P80:
+		vht_oper.chan_width = IEEE80211_VHT_CHANWIDTH_80MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_80:
+		vht_oper.chan_width = IEEE80211_VHT_CHANWIDTH_80MHZ;
+		break;
+	default:
+		vht_oper.chan_width = IEEE80211_VHT_CHANWIDTH_USE_HT;
+		break;
+	}
+
+	ht_oper.operation_mode =
+		cpu_to_le16(vht_oper.center_freq_seg1_idx <<
+				IEEE80211_HT_OP_MODE_CCFS2_SHIFT);
+
+	if (!ieee80211_chandef_vht_oper(&sdata->local->hw, vht_cap_info,
+					&vht_oper, &ht_oper, chandef))
+		chandef->chan = NULL;
+}
+
+static void
+validate_chandef_by_6ghz_he_eht_oper(struct ieee80211_sub_if_data *sdata,
+				     ieee80211_conn_flags_t conn_flags,
+				     struct cfg80211_chan_def *chandef)
+{
+	u32 control_freq, center_freq1, center_freq2;
+	enum nl80211_chan_width chan_width;
+	struct {
+		struct ieee80211_he_operation _oper;
+		struct ieee80211_he_6ghz_oper _6ghz_oper;
+	} __packed he;
+	struct {
+		struct ieee80211_eht_operation _oper;
+		struct ieee80211_eht_operation_info _oper_info;
+	} __packed eht;
+
+	if (conn_flags & (IEEE80211_CONN_DISABLE_HE)) {
+		chandef->chan = NULL;
+		return;
+	}
+
+	control_freq = chandef->chan->center_freq;
+	center_freq1 = chandef->center_freq1;
+	center_freq2 = chandef->center_freq2;
+	chan_width = chandef->width;
+
+	he._oper.he_oper_params = cpu_to_le32(u32_encode_bits(1,
+					IEEE80211_HE_OPERATION_6GHZ_OP_INFO));
+	he._6ghz_oper.primary =
+		ieee80211_frequency_to_channel(control_freq);
+	he._6ghz_oper.ccfs0 = ieee80211_frequency_to_channel(center_freq1);
+	he._6ghz_oper.ccfs1 = center_freq2 ?
+		ieee80211_frequency_to_channel(center_freq2) : 0;
+
+	switch (chan_width) {
+	case NL80211_CHAN_WIDTH_320:
+		he._6ghz_oper.ccfs1 = he._6ghz_oper.ccfs0;
+		he._6ghz_oper.ccfs0 += control_freq < center_freq1 ? -16 : 16;
+		he._6ghz_oper.control = IEEE80211_EHT_OPER_CHAN_WIDTH_320MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_160:
+		he._6ghz_oper.ccfs1 = he._6ghz_oper.ccfs0;
+		he._6ghz_oper.ccfs0 += control_freq < center_freq1 ? -8 : 8;
+		fallthrough;
+	case NL80211_CHAN_WIDTH_80P80:
+		he._6ghz_oper.control =
+			IEEE80211_HE_6GHZ_OPER_CTRL_CHANWIDTH_160MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_80:
+		he._6ghz_oper.control =
+			IEEE80211_HE_6GHZ_OPER_CTRL_CHANWIDTH_80MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_40:
+		he._6ghz_oper.control =
+			IEEE80211_HE_6GHZ_OPER_CTRL_CHANWIDTH_40MHZ;
+		break;
+	default:
+		he._6ghz_oper.control =
+			IEEE80211_HE_6GHZ_OPER_CTRL_CHANWIDTH_20MHZ;
+		break;
+	}
+
+	if (!(conn_flags & IEEE80211_CONN_DISABLE_EHT)) {
+		eht._oper.params = IEEE80211_EHT_OPER_INFO_PRESENT;
+		eht._oper_info.control = he._6ghz_oper.control;
+		eht._oper_info.ccfs0 = he._6ghz_oper.ccfs0;
+		eht._oper_info.ccfs1 = he._6ghz_oper.ccfs1;
+
+		if (!ieee80211_chandef_he_6ghz_oper(sdata, &he._oper, &eht._oper,
+						    chandef))
+			chandef->chan = NULL;
+	} else {
+		if (!ieee80211_chandef_he_6ghz_oper(sdata, &he._oper, NULL, chandef))
+			chandef->chan = NULL;
+	}
+}
+
 int ieee80211_parse_ch_switch_ie(struct ieee80211_sub_if_data *sdata,
 				 struct ieee802_11_elems *elems,
 				 enum nl80211_band current_band,
@@ -28,12 +225,13 @@ int ieee80211_parse_ch_switch_ie(struct ieee80211_sub_if_data *sdata,
 {
 	enum nl80211_band new_band = current_band;
 	int new_freq;
-	u8 new_chan_no;
+	u8 new_chan_no = 0, new_op_class = 0;
 	struct ieee80211_channel *new_chan;
-	struct cfg80211_chan_def new_vht_chandef = {};
+	struct cfg80211_chan_def new_chandef = {};
 	const struct ieee80211_sec_chan_offs_ie *sec_chan_offs;
 	const struct ieee80211_wide_bw_chansw_ie *wide_bw_chansw_ie;
 	const struct ieee80211_bandwidth_indication *bwi;
+	const struct ieee80211_ext_chansw_ie *ext_chansw_elem;
 	int secondary_channel_offset = -1;
 
 	memset(csa_ie, 0, sizeof(*csa_ie));
@@ -41,6 +239,7 @@ int ieee80211_parse_ch_switch_ie(struct ieee80211_sub_if_data *sdata,
 	sec_chan_offs = elems->sec_chan_offs;
 	wide_bw_chansw_ie = elems->wide_bw_chansw_ie;
 	bwi = elems->bandwidth_indication;
+	ext_chansw_elem = elems->ext_chansw_ie;
 
 	if (conn_flags & (IEEE80211_CONN_DISABLE_HT |
 			  IEEE80211_CONN_DISABLE_40MHZ)) {
@@ -51,26 +250,29 @@ int ieee80211_parse_ch_switch_ie(struct ieee80211_sub_if_data *sdata,
 	if (conn_flags & IEEE80211_CONN_DISABLE_VHT)
 		wide_bw_chansw_ie = NULL;
 
-	if (elems->ext_chansw_ie) {
-		if (!ieee80211_operating_class_to_band(
-				elems->ext_chansw_ie->new_operating_class,
-				&new_band)) {
-			sdata_info(sdata,
-				   "cannot understand ECSA IE operating class, %d, ignoring\n",
-				   elems->ext_chansw_ie->new_operating_class);
+	if (ext_chansw_elem) {
+		new_op_class = ext_chansw_elem->new_operating_class;
+		if (!ieee80211_operating_class_to_band(new_op_class, &new_band)) {
+			new_op_class = 0;
+			sdata_info(sdata, "cannot understand ECSA IE operating class, %d, ignoring\n",
+				   ext_chansw_elem->new_operating_class);
+		} else {
+			new_chan_no = ext_chansw_elem->new_ch_num;
+			csa_ie->count = ext_chansw_elem->count;
+			csa_ie->mode = ext_chansw_elem->mode;
 		}
-		new_chan_no = elems->ext_chansw_ie->new_ch_num;
-		csa_ie->count = elems->ext_chansw_ie->count;
-		csa_ie->mode = elems->ext_chansw_ie->mode;
-	} else if (elems->ch_switch_ie) {
+	}
+
+	if (!new_op_class && elems->ch_switch_ie) {
 		new_chan_no = elems->ch_switch_ie->new_ch_num;
 		csa_ie->count = elems->ch_switch_ie->count;
 		csa_ie->mode = elems->ch_switch_ie->mode;
-	} else {
-		/* nothing here we understand */
-		return 1;
 	}
 
+	/* nothing here we understand */
+	if (!new_chan_no)
+		return 1;
+
 	/* Mesh Channel Switch Parameters Element */
 	if (elems->mesh_chansw_params_ie) {
 		csa_ie->ttl = elems->mesh_chansw_params_ie->mesh_ttl;
@@ -134,59 +336,53 @@ int ieee80211_parse_ch_switch_ie(struct ieee80211_sub_if_data *sdata,
 		break;
 	}
 
+	/* parse one of the Elements to build a new chandef */
+	memset(&new_chandef, 0, sizeof(new_chandef));
+	new_chandef.chan = new_chan;
 	if (bwi) {
 		/* start with the CSA one */
-		new_vht_chandef = csa_ie->chandef;
+		new_chandef = csa_ie->chandef;
 		/* and update the width accordingly */
 		/* FIXME: support 160/320 */
 		ieee80211_chandef_eht_oper(&bwi->info, true, true,
-					   &new_vht_chandef);
-	} else if (wide_bw_chansw_ie) {
-		u8 new_seg1 = wide_bw_chansw_ie->new_center_freq_seg1;
-		struct ieee80211_vht_operation vht_oper = {
-			.chan_width =
-				wide_bw_chansw_ie->new_channel_width,
-			.center_freq_seg0_idx =
-				wide_bw_chansw_ie->new_center_freq_seg0,
-			.center_freq_seg1_idx = new_seg1,
-			/* .basic_mcs_set doesn't matter */
-		};
-		struct ieee80211_ht_operation ht_oper = {
-			.operation_mode =
-				cpu_to_le16(new_seg1 <<
-					    IEEE80211_HT_OP_MODE_CCFS2_SHIFT),
-		};
-
-		/* default, for the case of IEEE80211_VHT_CHANWIDTH_USE_HT,
-		 * to the previously parsed chandef
-		 */
-		new_vht_chandef = csa_ie->chandef;
+					   &new_chandef);
+	} else if (!wide_bw_chansw_ie || !wbcs_elem_to_chandef(wide_bw_chansw_ie,
+							       &new_chandef)) {
+		if (!ieee80211_operating_class_to_chandef(new_op_class, new_chan,
+							  &new_chandef))
+			new_chandef = csa_ie->chandef;
+	}
+
+	/* check if the new chandef fits the capabilities */
+	if (new_band == NL80211_BAND_6GHZ)
+		validate_chandef_by_6ghz_he_eht_oper(sdata, conn_flags,
+						     &new_chandef);
+	else
+		validate_chandef_by_ht_vht_oper(sdata, conn_flags, vht_cap_info,
+						&new_chandef);
 
-		/* ignore if parsing fails */
-		if (!ieee80211_chandef_vht_oper(&sdata->local->hw,
-						vht_cap_info,
-						&vht_oper, &ht_oper,
-						&new_vht_chandef))
-			new_vht_chandef.chan = NULL;
+	/* if data is there validate the bandwidth & use it */
+	if (new_chandef.chan) {
+		if (conn_flags & IEEE80211_CONN_DISABLE_320MHZ &&
+		    new_chandef.width == NL80211_CHAN_WIDTH_320)
+			ieee80211_chandef_downgrade(&new_chandef);
 
 		if (conn_flags & IEEE80211_CONN_DISABLE_80P80MHZ &&
-		    new_vht_chandef.width == NL80211_CHAN_WIDTH_80P80)
-			ieee80211_chandef_downgrade(&new_vht_chandef);
+		    new_chandef.width == NL80211_CHAN_WIDTH_80P80)
+			ieee80211_chandef_downgrade(&new_chandef);
+
 		if (conn_flags & IEEE80211_CONN_DISABLE_160MHZ &&
-		    new_vht_chandef.width == NL80211_CHAN_WIDTH_160)
-			ieee80211_chandef_downgrade(&new_vht_chandef);
-	}
+		    new_chandef.width == NL80211_CHAN_WIDTH_160)
+			ieee80211_chandef_downgrade(&new_chandef);
 
-	/* if VHT data is there validate & use it */
-	if (new_vht_chandef.chan) {
-		if (!cfg80211_chandef_compatible(&new_vht_chandef,
+		if (!cfg80211_chandef_compatible(&new_chandef,
 						 &csa_ie->chandef)) {
 			sdata_info(sdata,
 				   "BSS %pM: CSA has inconsistent channel data, disconnecting\n",
 				   bssid);
 			return -EINVAL;
 		}
-		csa_ie->chandef = new_vht_chandef;
+		csa_ie->chandef = new_chandef;
 	}
 
 	if (elems->max_channel_switch_time)
-- 
2.25.1


