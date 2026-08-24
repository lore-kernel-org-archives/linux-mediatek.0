Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588C4C5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EriCpE7nLrKxCs8zjRjnWUKrJxVNObqHZPSmW7MiZOs=; b=oacL9FZ17ZfEC6r8NQf/u3x0cb
	NocKmpV4JFwU0vBzl+pgAOBoaj0H+SVjsITxwQZm8m8VMud7CRhkFSokeWTaqX0gyiKgNiJVEv7Br
	WOgBQ51KRkUvgEFeC5Q2t/WGSllI1QeL4Rv1IixuHkj21bIEzrgMLThFWdapGLgHmDXSRaSWoj915
	XYVrw4cxEtLOIRcuxIdlAT4TWXcWuKJ8bxHUFH0D35W4CJBUUG5yvSV3njKLCHZG1fP06ETnK7B+o
	aLpOIVZg3tgcBvIhiy2Hdo0RvTfkDIcV83n8pc9nrKUFFvCoHEotzYt3gAMci8uaUSGY4IHaqD8CR
	hBslwIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajf-0000000HKca-1bbD;
	Mon, 24 Aug 2026 19:53:35 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajc-0000000HKaR-3rYz
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:33 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7ee4399c3abso3635217a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601212; x=1788206012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EriCpE7nLrKxCs8zjRjnWUKrJxVNObqHZPSmW7MiZOs=;
        b=mAUCOFQq0QXLbcICdJTFEyEWKONjZRlWtaZBmez0IAkqfFpyRxViPdMbjjEFvmxfqr
         K4C5FsHyFRQSOHUli35YILzYQIrXA+si1epxY2GoI4iNiCHPeC+f3SF8VNa0mNvqfqWY
         KeMNPqRF5dXD4xpt9fz9b6aXad7WNY8qK0NyQtjsB+DfeIbdDDT0CUIgCuuEo9zs5Ggd
         njh22FSThr/3NroYF+qaxq9Bp3vgchv85sfEq87BvEms0h15O5dciDFFKA1awAQqtsqn
         oBdV/sNdmOyjfz88kYIhJi9dz6nF1loP5SDgGHvgZ8CQKlB56fMlAXeILCYMc4l3eXmk
         Jyog==
X-Forwarded-Encrypted: i=1; AHgh+RpzrHD2T7k826MAG2+nOfYSqZJ9KtA6iah5LT4VpCNs4Mp2j6GAoMOFvddzRi/3klkdip9kN9ysP7tFAeaqMQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lkGb4Zfv/ypxt8eWgDu7Ca9kb7yINZaUNIqJUsYbckkgE7SP5l
	b95Gb7l8mrBoYArahDPNDpexJEHAXh7E4bziLE8vnC+kLvTwNtPVDuAj
X-Gm-Gg: AR+sD11tzE/gRgQ00cUWBjVOkE7jSDYkH7SuqzITLiBwFc0A4ogAjT+l6P5Jsb6ceLB
	OLPf4YIsDMZOE9X4yzTwQDbM4COWjo5ZPR3PYsyf0SpzX4aMu8J+tjZW8d+cAQ+mjZn7H5P6pAw
	q98gxzzIMlAm+ItOXaPSLr2lY/ORzj7CPKFfyyw7s+IkypT7Ywlz5G9ImIwFjl7gbVH56x2IutT
	paDKPHfPnW4A+Ua0ph/NkWBQ3BoJGo6W8CVbRgmghfdpWVXltYVaNkGqmphahHj1SKobKpgjCMm
	YkocM7BovVBXCuU9x3ko7z31SGPEvot4L9OEUL+k6pdTiqSNUqBylerODEn0ny2ZHDRLfopcdrL
	79isGlxKVas2BzrK0An+HfsHlQ7TxY+HzULSCD0SUFMB8RutMbmUVU+/nUsgWbrtte9g74/PRmK
	w9FKyn3ysJzE6cK7z8NIn/H7KIaRyPzUjTdCWYJ3Gss60AQJOWC3sot9Ugn9vzEyzSg2FXHALi5
	gcBkvA3mnmYJbG1b1Z2d2p4rhyJtSOmSnT4rU5+pXHkgu5XGqKOH2k=
X-Received: by 2002:a4a:ec46:0:b0:6b1:63f4:daef with SMTP id 006d021491bc7-6b1905225f2mr959043eaf.30.1787601211747;
        Mon, 24 Aug 2026 12:53:31 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:31 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 11/15] wifi: mt76: mt7925: clear CRB before deactivating NAN peer record
Date: Mon, 24 Aug 2026 14:52:23 -0500
Message-ID: <20260824195227.12589-12-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125332_971026_2A4B054F 
X-CRM114-Status: GOOD (  12.19  )
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

Send a zero avail_map CRB TLV before the peer record deactivation
command. This ensures FW clears the committed schedule slots for
the departing peer, preventing stale CRB entries from affecting
subsequent NDP connections.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 4a1f80fac1b5..16fb196e1bf5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -809,18 +809,18 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 int mt792x_nan_set_peer_rec(struct mt76_dev *mdev,
 			    struct ieee80211_sta *sta)
 {
+	struct mt7925_nan_sched_update_crb_tlv *crb_tlv;
 	struct mt7925_nan_common_hdr *hdr;
 	struct mt792x_sta *msta;
 	struct mt792x_nan *nan;
 	struct sk_buff *skb;
+	struct tlv *tlv;
 	int ret;
 
 	if (!mdev || !sta)
 		return -EINVAL;
 
-	skb = mt76_mcu_msg_alloc(mdev, NULL,
-				 sizeof(struct mt7925_nan_common_hdr) +
-				 sizeof(struct mt7925_nan_sched_manage_peer_rec_tlv));
+	skb = mt76_mcu_msg_alloc(mdev, NULL, MT7925_NAN_PEER_MAX_SIZE);
 	if (!skb)
 		return -ENOMEM;
 
@@ -835,6 +835,25 @@ int mt792x_nan_set_peer_rec(struct mt76_dev *mdev,
 		return 0;
 	}
 
+	/* Send a zero-avail_map CRB TLV before deactivating the peer record so
+	 * firmware clears the committed schedule slots for this peer.  Without
+	 * this, stale CRB entries linger and cause scheduling conflicts for
+	 * subsequent NDP connections that reuse the same sch_idx.
+	 */
+	tlv = mt76_connac_mcu_add_tlv(skb, NAN_UNI_CMD_UPDATE_CRB,
+				      sizeof(struct mt7925_nan_sched_update_crb_tlv));
+	if (!tlv) {
+		dev_kfree_skb(skb);
+		return -ENOMEM;
+	}
+	crb_tlv = (struct mt7925_nan_sched_update_crb_tlv *)tlv;
+	crb_tlv->sch_idx = msta->nan_sched.sch_idx;
+	crb_tlv->flags = NAN_CRB_USE_DATA_PATH;
+	crb_tlv->is_use_ranging = false;
+	crb_tlv->comm_ndc_ctrl.is_valid = false;
+	/* avail_map is zero-initialised by mt76_connac_mcu_add_tlv */
+
+	/* Deactivate peer record and release connection index */
 	if (mt7925_nan_peer_rec_tlv(skb, sta, msta, false)) {
 		dev_kfree_skb(skb);
 		return -ENOMEM;
-- 
2.43.0


