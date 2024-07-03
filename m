Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90510C3271E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2J9B7zhjK3f29ovrL4Llul+VWCgxd/DHWLce6tzebVg=; b=gu7/JCr/E7+hnFN4u4w/TlzZeM
	1DJkH2KeI6JKymYTSpihEX9LjMP8x1J+YDW65hs7rQi5RI5VMPjK2bZhgZa4vSuLwXD5RuG6OVXfo
	4JFy6B/dDfwvJfuQ5a/BJCQcWD3k70I515zlPDfaJDTwqRbh94Uv8eftuQyd2ie+gUUHmOiNcqfY+
	vBA//Xvk2Z3Cbp4K8zhne4uduqZsgfcEsySaprTbz3s822LGs8ls4MRugsOeoI6EoMb3WoV+loZ+3
	BRCsEYaNbMSJD2+AUNoO1hIyhYWmF8s//6LlOTaT4sjc/piEUH2B4O/vMlILxgWH7o+BVtpy3NkIZ
	A2AxRHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lY-0000000BXV2-0QlG;
	Wed, 03 Jul 2024 21:43:52 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lV-0000000BXT4-0ppF
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:50 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-70228a1af2eso45436a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043028; x=1720647828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2J9B7zhjK3f29ovrL4Llul+VWCgxd/DHWLce6tzebVg=;
        b=evlb74BWMfbr7yDKyFNOtqbQCnL8JugTPR9FJzt2HctNm2rZlwFyUeimAzqV/i24wO
         DpEDsJlBZk9tbZCAN/ZNTVpmkmjJzzPbnI11QJzM9fvkI0LSm6zs2t06/Cb7ty36+8gb
         JLUFJrEdWbSHYxLpqr42WiumIvx+3+a7wTou/SGOPmTHEE2yHtHJgXCiBNoO7rhcsWNU
         RF1JzzgeWEwdI8og2JTteNgkzz/e8SlXwwcESMeor4Fd6qlvCpzK3tuU4VVzwNfXq1RD
         MF44eZjhCixpnXWEsV5r9IReMhYzj8bZQ6iDA2aWS8C3LCv3ydbG9Lw7sfjgS2fez9RU
         BCcw==
X-Forwarded-Encrypted: i=1; AJvYcCVDYWb3oFLbtrCt3jRJuLLm3pfmKw6UykWyhMGNVvO/dy8H0el7/sGPirhBdU/wdAbjrY9fmMZdsgMg9e+y13UkntIGx+Q4ms8b0i8HF4fOStHr
X-Gm-Message-State: AOJu0Yx869eE6Vvls6T85bOH+Vgf0bplmfRD2ihliLhK9obkz2O/7mVq
	ZWjbHlJvRJjbrv/MGOdY876Ul4j0st0q2WpJX/qYvYIjoVrC8nft
X-Google-Smtp-Source: AGHT+IGmS4lxO+9/5KpWC0FYHXRgQxAMPZY/PNjXZVYVqL4NuwCgC1ZKfvRFuBZHJYGD3zKGbvWLeg==
X-Received: by 2002:a9d:65c5:0:b0:700:ca13:30bc with SMTP id 46e09a7af769-70207763b58mr13703664a34.2.1720043028356;
        Wed, 03 Jul 2024 14:43:48 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:46 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 28/29] wifi: mt76: mt7925: update mt7925_mcu_sta_rate_ctrl_tlv for MLO
Date: Wed,  3 Jul 2024 14:42:33 -0700
Message-Id: <cf15c40ca54e933b3a9ada3c65bed902ed259bef.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144349_267759_99AD0ED5 
X-CRM114-Status: UNSURE (   9.88  )
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

Get band information from the per-link BSS.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 36ddc64ed7d6..829d87d4eb95 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1707,7 +1707,9 @@ mt7925_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb,
 			     struct ieee80211_link_sta *link_sta)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct cfg80211_chan_def *chandef = &mvif->bss_conf.mt76.ctx->def;
+	struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif,
+							   link_sta->link_id);
+	struct cfg80211_chan_def *chandef = &mconf->mt76.ctx->def;
 	enum nl80211_band band = chandef->chan->band;
 	struct sta_rec_ra_info *ra_info;
 	struct tlv *tlv;
-- 
2.25.1


