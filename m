Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18566E7717F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk49pXqoMYWny8tmzY5u5tahMKAPgzxyn6k/GluClh0=; b=RiqyYVWmzG0B5ip3dqh/imYbBE
	yucREGXzMXldG3qL5CRYTtsc8lESgZQxjBnAtbQcKXjbG+cifzlA1mvPai6tdDLbvuZJscArIDdGW
	0xLqyTqjw3fq4TuuvLZaaUZ4iCKF761fpXzFPj5YaLU//wndjeW74OmHU+vOxpJchJLfmEJki3Uqq
	QCuQJl4v6y8+w9t+AHZIWA9iwNWxx5chmt+rI6EEvkLKvu7r9EAC52JAh+wSKVV3wRPIWNS3BCkJw
	fd+Ur0WdwbNFyvPC2HimLjUJwR1KtKALMikTMPCirG01ikP2SnbI7Eq+4BzHLn2L7j44sZlzq6dFr
	f3TwsdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOT-0000000DOkA-11fL;
	Wed, 11 Dec 2024 01:20:01 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOR-0000000DOig-0TmH
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:00 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-29e5c0c46c3so3196195fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:19:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733879998; x=1734484798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yk49pXqoMYWny8tmzY5u5tahMKAPgzxyn6k/GluClh0=;
        b=gFKNyzWaH+UB82SHyj3IwG5SKQKlrOaPJRVLd09ez0tC3J3678n1OpXQH1Gy4IRga6
         0dss3+ZqQw5XTdKFpM9xGNwGnfwZL4RKHjt6uYoluNNyu6dB4FfYQkIBuvYqb4zKw6OU
         sggQok3cQG1H2SeDcw/XjCAccXIub2IC2YpDJ0GvMqJTbPGfNkGuHQc4xaX4u+EJaQmp
         q5KzaiytYSZnGSNSN2dPMMRXGccCnIhiqlgIahGnuk8XWFBAFNatifQ0crlEzcICAG4H
         ZgRoBNXxdvtAmZAwFPG4jfTW4e7uNeSAgpTfOhRko4GCqEkMDSh38ZhdSJH8hRLexy/f
         Pc1g==
X-Forwarded-Encrypted: i=1; AJvYcCUYeqVP8HOJRV7FVxLf/oYxWf9OwT9c1gj6kqq5fUaZ1wBTDDv7JpxQDaqHAYwhUobBOlAvobA4/Pp1zQ5Mpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRqrxTq81/6aWzYOfqqYuKMMiGsgoqLJO2bpZF4dYzA0GrSfz7
	zzzj5Af3cHaPitDSIaDW0SdOu/xcOgsY5Cj/TcvDeMni0KtoLvwCrZ2mmeTGxhs=
X-Gm-Gg: ASbGncs5MEQXYNpNP4duN6Q/yQFY4xeuTs6bemsS82znPdLpGfVOVC4tyEtAdR39wLp
	se7GKtBDHTUx5owFxT7lRJLgtAvLZ/121w4gipqYxacVXE6S1JadHZWl7KTBg/4oGixamMhKYCI
	te8xwXvHgcF4iQyCmlHexzQeISQLTL2UPzo6JEICogUftCiS/XWVxTTs8N5C2VGZtiRIz3w7NK7
	OHOlw4eB3EC+vTaaT+x5UdgDeVt1xkhRDSuf4+6wCxL7Rj6pCQ63l8wL9KsLm+dHsPv5T0=
X-Google-Smtp-Source: AGHT+IGqPCatQj/2c2jZ6uQhg94tt5NOTEosEEskQiKERWxs5QGjzv/Q6ATe/f81GUUeNedQJy5aqg==
X-Received: by 2002:a05:6870:7b49:b0:29f:8a1b:f76a with SMTP id 586e51a60fabf-2a012d9cdb7mr583515fac.28.1733879998456;
        Tue, 10 Dec 2024 17:19:58 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:19:57 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 06/17] wifi: mt76: mt7925: fix wrong parameter for related cmd of chan info
Date: Tue, 10 Dec 2024 17:19:15 -0800
Message-Id: <20241211011926.5002-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_171959_150165_209E9415 
X-CRM114-Status: GOOD (  10.12  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Fix incorrect parameters for the related channel information command.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 83f237d49c26..f6aa052ca802 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1200,6 +1200,8 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
 		req.roc[i].bw_from_ap = CMD_CBW_20MHZ;
 		req.roc[i].center_chan = center_ch;
 		req.roc[i].center_chan_from_ap = center_ch;
+		req.roc[i].center_chan2 = 0;
+		req.roc[i].center_chan2_from_ap = 0;
 
 		/* STR : 0xfe indicates BAND_ALL with enabling DBDC
 		 * EMLSR : 0xff indicates (BAND_AUTO) without DBDC
@@ -2177,11 +2179,27 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 	req = (struct bss_rlm_tlv *)tlv;
 	req->control_channel = chandef->chan->hw_value;
 	req->center_chan = ieee80211_frequency_to_channel(freq1);
-	req->center_chan2 = ieee80211_frequency_to_channel(freq2);
+	req->center_chan2 = 0;
 	req->tx_streams = hweight8(phy->antenna_mask);
 	req->ht_op_info = 4; /* set HT 40M allowed */
 	req->rx_streams = hweight8(phy->antenna_mask);
-	req->band = band;
+	req->center_chan2 = 0;
+	req->sco = 0;
+	req->band = 1;
+
+	switch (band) {
+	case NL80211_BAND_2GHZ:
+		req->band = 1;
+		break;
+	case NL80211_BAND_5GHZ:
+		req->band = 2;
+		break;
+	case NL80211_BAND_6GHZ:
+		req->band = 3;
+		break;
+	default:
+		break;
+	}
 
 	switch (chandef->width) {
 	case NL80211_CHAN_WIDTH_40:
@@ -2192,6 +2210,7 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 		break;
 	case NL80211_CHAN_WIDTH_80P80:
 		req->bw = CMD_CBW_8080MHZ;
+		req->center_chan2 = ieee80211_frequency_to_channel(freq2);
 		break;
 	case NL80211_CHAN_WIDTH_160:
 		req->bw = CMD_CBW_160MHZ;
-- 
2.25.1


