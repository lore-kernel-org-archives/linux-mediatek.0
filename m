Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18198FF8860
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fw48R4PzR3KFTTv359LsUwBmKa+PCYa6JMxKAyiv4UA=; b=ZtY8LRoTpIItE8a7aklWfVGUUs
	zzHLjYbxfgXHsvTKq8C16HE4jEIG7t59rTu9VCNkeQHU2f4zolK8mHFbcSTpfYOYd9Co6EZCrny1t
	FVgLpljNOhhFKEfKFF+HNiPwwt3e4KS3G1Bx0unw02vLKqFJaLPDjjDm60347nP4CIar9XIcBR9co
	xaJyn0GaM+BjALdmwN+MpNXxFgsO3rrpOHAkELMXnfsCn7NvigTlFiVFAlCZzbaKrgoU1EkUJhiog
	OrISVPvtmsPm91Wi2NmIgQKigmQUBMpMc8dhw7qXogg+2O/lBlBB+4y0Pn9jK49CSeqO03hRfFIeh
	wPR9VVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfEr-0000000EYaL-0cqu;
	Sat, 25 Apr 2026 15:48:13 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfEp-0000000EYa1-27Pt
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 15:48:12 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7dbd801138eso4640805a34.1
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 08:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777132090; x=1777736890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fw48R4PzR3KFTTv359LsUwBmKa+PCYa6JMxKAyiv4UA=;
        b=l9Y8MvGO57nazaZSqj7RlDUBSGcpayE8qL74HIeWL10TNpEPVFJ/eWgyfjKe1oPTfp
         9WDIoIKtjP5X6l9a2Of/QdoJhCadrM256rG3wEmSoecavKn1Wx1VFSBURQTjdfAyzd+V
         JP9POnFm7PLWSMz70vk44DmHy25LDDdMXe/t/K0vmBgg9EA9iPXvFLYa6zDwRmOGxCB/
         CaYX5j2EnGrdekYxYDISYjytEyNCappj3tq+QfbslXLNMgdiSrF6Knl5Ppdy/Ac0+KV7
         ZMAJgG9bEeQFFGJa1dPGSkLmv6DJ+gSQVrA3zMBPO5/lUoS1rKVnn1amvQVTN1aRm94D
         H4MQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qpnlDS5ol+VHYEFtNyqA3HhQcC9/n/d+GwsI1AoaNps+TrH4UtA2cYw+u00vriW+DyypLvC3kE0LW14ERZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCoVGwPzQXJ4g+ObeJqoja6PnBh6FbfB86OeZnHbTPgYUcyHD9
	xsreKE9hBXZjivvAOb5eZu29TqDvQhNwzgRUUbO+3CIvoJ00Rfxgf7lf
X-Gm-Gg: AeBDievRk8BmimlvP7+dEZaAJNgM079gBWZzk4q8mfcQ16Fsw3p8f7q8V2SXUOEwteA
	+CEterywoV9fogFVF6M5FMTEM6IXB6iteMlekliTcd1ZJWhrWeckocK7Uu9CRJ2gtGevJzaS4v8
	a2DPsdWhYLvTN1pUsA6GVBY1UhUn3HkN/tz457NH/3JhRunSW96UTpFyD94RNt1ruVsevXHE/k8
	l1AU/tBKEP6jAFKEwei7rzflNgY5PW6cQLmFhhjjcm7bSuXXnMh46pT86gAfr8j9pZMVADqjyDb
	jC63Jh/4YlwjNnOXACNCi8CPpMkorDYv7Lwr+of7t6NFOkoRWgIS3yfbQbaDETor+z9hyPtSTXA
	nEbpMj9jem0nnthCDWmZ62aTBIeNHBRh1CiioKM7FjN5cHw64UMz0ACYZYSn47X8i7KSmxJkYVk
	m81BtNK17DwtsmW3XEfDOS75ukb7VdUuk8SOWOJ8CIPHQMyBIE+xzhAvYqG7JKfzr8Mjv6XM20N
	A==
X-Received: by 2002:a05:6820:83ce:10b0:694:85a9:d898 with SMTP id 006d021491bc7-69485a9e036mr8923901eaf.23.1777132090179;
        Sat, 25 Apr 2026 08:48:10 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:9f96:11d3:5f6c:5582])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69493183021sm10094808eaf.13.2026.04.25.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 08:48:08 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Yao Ting Hsieh <yao-ting.hsieh@mediatek.com>
Subject: [PATCH 2/3] wifi: mt76: mt7925: pass WCID explicitly to mt7925_mcu_sta_ba()
Date: Sat, 25 Apr 2026 10:47:20 -0500
Message-ID: <20260425154721.738101-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425154721.738101-1-sean.wang@kernel.org>
References: <20260425154721.738101-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_084811_551721_8640E642 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

From: Sean Wang <sean.wang@mediatek.com>

mt7925_mcu_sta_ba() currently hides the BA target behind an implicit WCID
lookup.

Pass the WCID explicitly so the caller controls which BA context is being
programmed.

No functional change intended.

Tested-by: Yao Ting Hsieh <yao-ting.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 37cdf3e8a067..c720d21c1727 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -624,9 +624,8 @@ void mt7925_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff *skb)
 static int
 mt7925_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif_link *mvif,
 		  struct ieee80211_ampdu_params *params,
-		  bool enable, bool tx)
+		  struct mt76_wcid *wcid, bool enable, bool tx)
 {
-	struct mt76_wcid *wcid = (struct mt76_wcid *)params->sta->drv_priv;
 	struct sta_rec_ba_uni *ba;
 	struct sk_buff *skb;
 	struct tlv *tlv;
@@ -664,6 +663,7 @@ int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
 		msta->deflink.wcid.amsdu = false;
 
 	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, params,
+				 &msta->deflink.wcid,
 				 enable, true);
 }
 
@@ -675,6 +675,7 @@ int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
 	struct mt792x_vif *mvif = msta->vif;
 
 	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, params,
+				 &msta->deflink.wcid,
 				 enable, false);
 }
 
-- 
2.43.0


