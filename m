Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE81C38150
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNQtKh9bModTpWH38BJ8Wnv4gv4BE649XF4YBalyJck=; b=xQeoLKUdVLfoGkQoir5XyLah9k
	CwMUvIbOHyOKkkX6LHJsga/JAWRC/HZCQYHfYGBewCmObxKJTpOR8NyGi7F4KG71g251A1eSFoEnR
	dZXNvpi6NcCIs1NnPalAr0cZwi8MP4QDU/+6oJUrFvRwowLfSROqYPThGYvD5rpW255/EjcrKsWoe
	963XhiHsifzf5ZX55HX1KzIToiTLOBC3567h7f6aTJfkCsCdrmMCx/kj+iPcMlad+chsFy2a1cdus
	1nVKoIXcVK2DaLTprg72vYePmx51vAxEuVu/WErgHhmRgnvSdBCI+AxxhsYaRGHW++kkO7c6AeElz
	CftVDS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mT-0000000HXh3-0gJi;
	Sat, 06 Jul 2024 08:28:29 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mR-0000000HXfD-0CJR
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:28 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-25075f3f472so367167fac.2
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254506; x=1720859306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNQtKh9bModTpWH38BJ8Wnv4gv4BE649XF4YBalyJck=;
        b=wgHY+5TmlJCdlb+NhyyBPP/CkjCuKn3bFh8nMb2RIVxqo5jRqnoytwm3UPFQl95tl/
         Ghfr4l2NkzkarRryd0/G0XkRsrYHOf09HWMRE55RIg4M6VjKMFLG/5U3BUTv96+Mlqpf
         zvWetIKfAvEv8Nv3JC7kHnoMq/LXxgiYI741f829s3oI79OTQGUVFa0rJo1fqZBrO0ot
         RY8XX77jLr29zXERV0L22HHdGtTz+KSR2RD5AApROY0SXKC+nD54+97QKQQ/uDVRY8Kv
         br1vBMWqA+ZNOgUNf+ISdA9GHTUg/Fkg7sf72EQ1P7GUh8Ph8K5NcjCUBfDhI8i2YDbz
         WBEA==
X-Forwarded-Encrypted: i=1; AJvYcCXVL0EDOScArt5izNWB04xTGFklcDNREcKsjcM0ym8odyAF4LdpimNllvHD3qgd4Q/QgWLVfIGuKPtT60vdYStGgGFWnhFQDpZRZ/a78ZVrgo/8
X-Gm-Message-State: AOJu0YwEc7O5ikLj+/NpS8iuXmT2wyGvt3Mo0IyDNimSfcX5XO1LtSdO
	wwSpp9SqB5nORu8jYRsGeJ+cO2x3nXcdNsZ8N+98q5mQCh3nyvS+
X-Google-Smtp-Source: AGHT+IHN1M66NzqNwtknjegs1rT75zTFpJEy7wrGI7ifp6dtVEt/+v1/Wwqi9urwSqufR1oHldYTvA==
X-Received: by 2002:a05:6870:5590:b0:25e:1817:e4a8 with SMTP id 586e51a60fabf-25e2bf93ebcmr7013302fac.4.1720254505963;
        Sat, 06 Jul 2024 01:28:25 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:24 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 03/37] wifi: mt76: mt7925: set Tx queue parameters according to link id
Date: Sat,  6 Jul 2024 01:27:43 -0700
Message-Id: <84a401891b8942f66d1ffbd0a3f10866c94d1bc0.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012827_110720_60623D4C 
X-CRM114-Status: GOOD (  10.95  )
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

Configure TX queue parameters according to link id.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a043d93f3e1d..da70c203d618 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1306,6 +1306,7 @@ mt7925_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	       const struct ieee80211_tx_queue_params *params)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif, link_id);
 	static const u8 mq_to_aci[] = {
 		    [IEEE80211_AC_VO] = 3,
 		    [IEEE80211_AC_VI] = 2,
@@ -1314,7 +1315,7 @@ mt7925_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	};
 
 	/* firmware uses access class index */
-	mvif->bss_conf.queue_params[mq_to_aci[queue]] = *params;
+	mconf->queue_params[mq_to_aci[queue]] = *params;
 
 	return 0;
 }
-- 
2.25.1


