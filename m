Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AEFC5DF9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FLXoQ3eZi+0ZhLhJQdslPk4Jatagvv9bTwe/bZk+2E=; b=jWTYRADzlBiX1EWMvYWY6z3rjo
	us8Kf3WTAv5LpbnQFoU5JBO2oS1YtTCV1ddHQaMsYQ4sGch0g12zM4/vx8c9Mmq2ckyTAJB15sm0m
	EzhfPjc+4T2u3QNtQNSZ/q5JcBmpSEQ1VO1yx6ECl8gvAKw61bhceSuIESDxbaxLKhjCziSuA7Nr1
	2f1D7X2PY32s9U2LvyCUtaWHFnBI6GBveSQghEjoXExMa9u0/F7DXWrZoWOLw3CeATGjCqU8CJYZ+
	dWEXDU2Kjw/0CCXQKhxL5oGQDAUzS6u5m3MzpnZnKcdGi6km5QrtqGiH5ChkR/Z7oEjKSchJW4sDh
	nENg1MIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajh-0000000HKds-1mpl;
	Mon, 24 Aug 2026 19:53:37 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajf-0000000HKc0-0LEx
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:36 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7ee4399c3abso3635243a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601214; x=1788206014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5FLXoQ3eZi+0ZhLhJQdslPk4Jatagvv9bTwe/bZk+2E=;
        b=PGg5Bx7HGTfqqc7Oe1uMVYqkGMrsQWNuVV1Nc6ZV9Jwnp70rQ10N/ASytzditZmfsc
         JkaDZrAgUfKL/dYsJy3ZzxcBn3CKHejclJxPCUaNIduBvWdmRbf0WXwdrOzcxyEwewey
         DPi5hNeaulopWsP5t083gllNFVvw2CXIwqDxTWKPFxfiMl8FieJsOaY2HlEYxZb8aglP
         Wo72y1dkpHPTjcf5YjmGbHAjT1mfSrjWqiuqCY3zp63YSl14kdvrzv6AAkLns2NKM+3v
         l0Y2KVEs1DwTVeOSeEBCr1Zz9BfL91si+SLp8KgbEB3TQiqgNUt+CyiP4NBn/iDWwFqa
         qVSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKiWJaV7D67WE+41j4LbuLqIrPYD+RzeGpsoGXndCYhVXJmD4N7WWbkyuObhDQ3pIdycfi+AqfaWLZ7Vt5pQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mSGn/SpZSkMxNueCvCn74IouanA393f41mBoOGyt1VpGARfkSw
	TrSexN0NjovD5UsFjdkc6XK2Ybl3f7vCNkF1SbuUC4XX9hZi+KCPcDfj
X-Gm-Gg: AR+sD10ETM7xANvprQuJ0X5zEHW6K5shKiMa4VIfTFbXtW0aKxtTwPoa4DKsi2c4YJH
	E5LVQnojjc3bBcvKBSfo08+53j+KpI9V14sUvBABZBglHkAB3H2a3SYqrc0uA9v2+rgJI4W/IOn
	iRqcqoqybxmXLeYOdlMF6Ft3FNAoFo0H3czRJsyMdHoeKQQrQXbkdcafLrPTmxL21pPlTrYHlUW
	4Hww0k5dkYFgwhnzS9YUiDKmboDTPJd2ddYQIdCMgvCaWe2Hw/IMEhFay+eunR7G48ZmI0W8BuG
	xIy1/EQhEwmeYTrJKVyGfOlXmEHksURmVlYZXdCaJG/9NoGpXW+nmyxZsw63KeTBm10MGwDmhaf
	u9m8SSkTxRHAf098G+OAV4XJeHPGqM8GDu841BZ5Z49cBDR1lnk97C6u+h3qjoKyg4E1ZxEdBbm
	DuSL1+klQRMYUILtSMpdfRkSnMb+ZvqetRYfn0NVw2J0PDBECi0deDxX9FuagHiXzUULaEwmmYs
	fq1Mg0c729Klb3mJkg4miLJHJ08mjPgzoZLUFEzfTac
X-Received: by 2002:a05:6820:208c:b0:6ae:33fb:4546 with SMTP id 006d021491bc7-6b190411b18mr1066445eaf.9.1787601214175;
        Mon, 24 Aug 2026 12:53:34 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:33 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 12/15] wifi: mt76: mt7925: add ULW event handling and peer ULW update
Date: Mon, 24 Aug 2026 14:52:24 -0500
Message-ID: <20260824195227.12589-13-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125335_134413_FB3E34BC 
X-CRM114-Status: GOOD (  16.40  )
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

From: Stella Liu <yu-ching.liu@mediatek.com>

Forward NAN Unaligned Window attributes between FW and mac80211:
report ULW updates from FW via cfg80211_nan_ulw_update() and push
peer ULW attributes to FW with NAN_UNI_CMD_UPDATE_ULW.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 84 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   | 40 ++++++++-
 2 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 16fb196e1bf5..53736b156f69 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -397,6 +397,52 @@ mt7925_nan_mcu_handle_de_event(struct mt792x_dev *dev, struct tlv *tlv)
 	ieee80211_nan_cluster_joined(dev->nan_vif, cluster_id, true, GFP_KERNEL);
 }
 
+static void
+mt7925_nan_handle_ulw_update(struct mt792x_dev *dev, struct tlv *tlv)
+{
+	struct mt7925_nan_ulw_event *evt;
+	struct mt7925_nan_ulw_attr attr;
+	struct wireless_dev *wdev;
+	u16 len;
+
+	if (!dev || !tlv)
+		return;
+
+	if (!dev->nan_vif || !ieee80211_vif_nan_started(dev->nan_vif))
+		return;
+
+	len = le16_to_cpu(tlv->len);
+	if (len < sizeof(*tlv) + sizeof(*evt)) {
+		dev_warn(dev->mt76.dev,
+			 "nan: short ulw event tlv len=%u\n", len);
+		return;
+	}
+
+	evt = (struct mt7925_nan_ulw_event *)tlv->data;
+	wdev = ieee80211_vif_to_wdev(dev->nan_vif);
+	if (!wdev)
+		return;
+
+	dev_dbg(dev->mt76.dev,
+		"nan: ulw_update wdev=%p owner_nlportid=%u sched_id=%u seq=%u dur=%u\n",
+		wdev, wdev->owner_nlportid,
+		evt->sched_id, evt->seq_id, le32_to_cpu(evt->duration));
+
+	/* Reorder the FW fields into NAN spec Table 109 attribute layout */
+	attr.attr_id = NAN_ULW_ATTR_ID;
+	attr.length = cpu_to_le16(NAN_ULW_FIXED_PAYLOAD);
+	attr.sched_id = evt->sched_id;
+	attr.seq_id = evt->seq_id;
+	attr.start_time = evt->start_time;
+	attr.duration = evt->duration;
+	attr.period = evt->period;
+	attr.count_down = evt->count_down;
+	attr.ulw_overwrite = evt->ulw_overwrite;
+
+	cfg80211_nan_ulw_update(wdev, (const u8 *)&attr, sizeof(attr),
+				GFP_KERNEL);
+}
+
 void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 {
 	struct tlv *tlv;
@@ -425,6 +471,9 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 		case NAN_UNI_EVENT_REPORT_DW_START:
 			mt7925_nan_handle_dw_ind(dev, tlv);
 			break;
+		case NAN_UNI_EVENT_ID_ULW_UPDATE:
+			mt7925_nan_handle_ulw_update(dev, tlv);
+			break;
 		default:
 			break;
 		}
@@ -736,6 +785,37 @@ static int mt7925_nan_update_crb_tlv(struct sk_buff *skb,
 	return 0;
 }
 
+static int
+mt7925_nan_peer_ulw_tlv(struct sk_buff *skb,
+			struct ieee80211_sta *sta,
+			struct mt792x_sta *msta)
+{
+	struct mt7925_nan_update_ulw_tlv *ulw_tlv = NULL;
+	struct ieee80211_nan_peer_sched *sched = NULL;
+	struct tlv *tlv = NULL;
+
+	if (!skb || !sta || !msta)
+		return -EINVAL;
+
+	sched = sta->nan_sched;
+	if (!sched || !sched->init_ulw || !sched->ulw_size)
+		return 0; /* No ULW to send, not an error */
+
+	if (sched->ulw_size > NAN_ULW_MAX_SIZE)
+		return -EINVAL;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, NAN_UNI_CMD_UPDATE_ULW,
+				      sizeof(struct mt7925_nan_update_ulw_tlv));
+	if (!tlv)
+		return -ENOMEM;
+
+	ulw_tlv = (struct mt7925_nan_update_ulw_tlv *)tlv;
+	ether_addr_copy(ulw_tlv->nmi_addr, sta->addr);
+	memcpy(ulw_tlv->ulw_attr, sched->init_ulw, sched->ulw_size);
+
+	return 0;
+}
+
 int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 				 struct ieee80211_sta *sta)
 {
@@ -788,6 +868,10 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 		goto free_skb;
 	}
 
+	ret = mt7925_nan_peer_ulw_tlv(skb, sta, msta);
+	if (ret)
+		goto free_skb;
+
 	ret = mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
 	if (ret && idx_allocated)
 		goto clear_idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 32e2e9cfffc7..c9207b5c899e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -50,7 +50,8 @@
 	(sizeof(struct mt7925_nan_common_hdr) +				\
 	 sizeof(struct mt7925_nan_sched_manage_peer_rec_tlv) +		\
 	 sizeof(struct mt7925_nan_sched_update_peer_cap_tlv) +		\
-	 sizeof(struct mt7925_nan_sched_update_crb_tlv))
+	 sizeof(struct mt7925_nan_sched_update_crb_tlv) +		\
+	 sizeof(struct mt7925_nan_update_ulw_tlv))
 
 /* NAN Availability Attribute */
 #define NAN_AVAIL_ATTR_ID_OFFSET	0
@@ -81,6 +82,7 @@ enum nan_uni_cmd_tag {
 	NAN_UNI_CMD_UPDATE_CRB			= 10,
 	NAN_UNI_CMD_MANAGE_PEER_SCH_RECORD	= 12,
 	NAN_UNI_CMD_MAP_STA_RECORD		= 13,
+	NAN_UNI_CMD_UPDATE_ULW			= 16,
 	NAN_UNI_CMD_UPDATE_AVAILABILITY_CTRL	= 20,
 	NAN_UNI_CMD_UPDATE_PEER_CAPABILITY	= 21,
 	NAN_UNI_CMD_CHANGE_NMI_ADDRESS		= 24,
@@ -92,6 +94,7 @@ enum nan_uni_cmd_tag {
 
 enum nan_uni_event_tag {
 	NAN_UNI_EVENT_ID_DE_EVENT_IND		= 19,
+	NAN_UNI_EVENT_ID_ULW_UPDATE		= 39,
 	NAN_UNI_EVENT_REPORT_DW_START		= 59,
 	NAN_UNI_EVENT_REPORT_DW_END		= 60,
 };
@@ -165,6 +168,32 @@ struct nan_rpt_dw_evt {
 	__le16 dw_num;
 };
 
+#define NAN_ULW_ATTR_ID		0x17
+#define NAN_ULW_FIXED_PAYLOAD	16	/* Table 109 fixed fields */
+
+struct mt7925_nan_ulw_event {
+	u8 sched_id;
+	u8 seq_id;
+	u8 count_down;
+	u8 ulw_overwrite;
+	__le32 start_time;
+	__le32 duration;
+	__le32 period;
+} __packed;
+
+/* ULW attribute laid out in NAN spec Table 109 field order */
+struct mt7925_nan_ulw_attr {
+	u8 attr_id;
+	__le16 length;
+	u8 sched_id;
+	u8 seq_id;
+	__le32 start_time;
+	__le32 duration;
+	__le32 period;
+	u8 count_down;
+	u8 ulw_overwrite;
+} __packed;
+
 struct mt7925_nan_conf_dw {
 	u8 config_2dot4g_dw_band;
 	__le32 dw_2dot4g_interval_val;
@@ -389,6 +418,15 @@ struct mt7925_nan_sched_update_crb_tlv {
 	struct mt7925_nan_sched_faw_ndc_timeline faw_ndc_timeline[NAN_TIMELINE_MGMT_SIZE];
 } __packed __aligned(4);
 
+#define NAN_ULW_MAX_SIZE	256
+
+struct mt7925_nan_update_ulw_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 nmi_addr[ETH_ALEN];
+	u8 ulw_attr[NAN_ULW_MAX_SIZE];
+} __packed __aligned(4);
+
 struct mt7925_nan_sched_map_sta_rec_tlv {
 	__le16 tag;
 	__le16 len;
-- 
2.43.0


