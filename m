Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EF4FF885A
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnXr/jzwqEDsGXW+QC8Pss1CT+aHwUpMjIqrf83mbHw=; b=NPZPNR686na5TW0lL/a9I3wPHv
	2Mbg/SKmyqWv0Hd3koavlctHUTuUjpf8Eof2g1DnbtaOA4f0oBhrcWW+Idadx+g1U2M02ie1TUPsG
	6sDOmNUY4UhfmTvMAmNi4CFslBU5YzzbD4gzTrvEhuBcOGxHKoTkumgMMgcQr4L7YRoyzCLysX4KL
	m3xrn7MBCIpoZJqYe7Y85dcGXgvyT0DrDdCpH2do17wsTtdmrV/mAZJuUoyrdKSdcxIpaNFxUr+ez
	ao6Xc1Qmuv5LWCtUwJt8bUnt45YQF36GUfM0VQGaLH8IrbGi5suF2i0t8R1CiwaPZUm9zO7LSPvKK
	ssa37Fow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1i-0000000EmEa-1u61;
	Sat, 25 Apr 2026 19:50:54 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1f-0000000EmEG-1ivy
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:50:52 +0000
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dbcb467f2bso8198104a34.3
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146650; x=1777751450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VnXr/jzwqEDsGXW+QC8Pss1CT+aHwUpMjIqrf83mbHw=;
        b=ZQrHrJhwAGifUe3ZyH7oCYo08aWIrBtTYyd8qnbOMdr+G+l31sFRzC95+DnBfEQaHb
         6syobY+pmSX3Rp9emdZ98Xce6mAsrIaVOegLS3WcKN0b6TK3PYSWlXx4J3hVOBGAJkn9
         meOC9T8zHPV/gUcHZ28MV6rU5MkUDlctSqqfVWt6CNnCp2rvY+Xn/35Vf4qTsNqQqslu
         zoE/8kiBTduihbYakTBSq+2CIarrSXxLoHRbXks9bL0AtGL+LNWrVhjhYt0z8YT7h33H
         YL5SzBZLFbXRIUuAJvIKDzx+DXvAsIbST+fvHB1JZ7JhI63j2mwhIYrRIFDpaczZALKM
         Nrxg==
X-Forwarded-Encrypted: i=1; AFNElJ8D5KrsutaUzEW4ysqZkFlp1SZ9Vn9Ct8+6HWWLuTJ3kSSKWey2+9E26y6uaQq7kNbQu3dfn72xFq2S2HEy1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTFuAjPxW16eE2dArs1mExsfVdmZ8JLv7FwdCUOKNLRpB21ZzG
	M6iJXSH/de9bpk/aTDSpXy8JHYxL26L8YYEk80TaEsJL98Zlhov3wwEB
X-Gm-Gg: AeBDieuFD4ixmMt3t/qqvO/9QuPOcIFscj5T1YMXOVFWPPoWcf2HjpI2a4u3TgPNEz8
	QDRpZIzQFuqn5vHUuXrpV8HvTdgcsAS71W6JNzPCrI0r1kKFJN3Lj+X8zR/jwxUsDPWrhMl4vwt
	vafc5HO3aeLbbZjNtDf9fMobW/i0tRfgmW0WBafyF+WWvkgnZTomiH5q0rOQVGo9vIvTe5s0QeU
	cUI6cbPPsZoOVwU7uDAwMO0My1am7YP/F/S+eZy5892DoXz7Mvf0eYED8i8dCscsVE3uhjw/lQI
	eGwZaGIwYRzsO2byM3YRMV61HBXEvIsZJ87BkkyGO8JJ6mS8oLvgc9raVGyS8Aeive6YTZfNWeI
	EIar05Jy2X9E4I+UwXP37cm9zThXKjEnrIDdEo/G/KIofp1WYCrobyeJU68Qg7gj3AWNDWvwF/h
	wNIf8w+7AzaW/PneGfH8Idzts6oNAFRvpYmSm49MFYYwlmqvg68IdIG07OYTrJekvPJtJndjK0y
	Q==
X-Received: by 2002:a05:6830:411a:b0:7d7:570b:6800 with SMTP id 46e09a7af769-7dc951fc052mr23530525a34.23.1777146650499;
        Sat, 25 Apr 2026 12:50:50 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:49 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Javier Tia <floss@jetm.me>,
	Marcin FM <marcin@lgic.pl>,
	Cristian-Florin Radoi <radoi.chris@gmail.com>,
	George Salukvadze <giosal90@gmail.com>,
	Evgeny Kapusta <3193631@gmail.com>,
	Samu Toljamo <samu.toljamo@gmail.com>,
	Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
	Chapuis Dario <chapuisdario4@gmail.com>,
	=?UTF-8?q?Thibaut=20Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
	=?UTF-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 04/21] wifi: mt76: mt7925: populate EHT 320MHz MCS map in sta_rec
Date: Sat, 25 Apr 2026 14:49:54 -0500
Message-ID: <20260425195011.790265-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125051_457081_01389C76 
X-CRM114-Status: UNSURE (   8.62  )
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

From: Javier Tia <floss@jetm.me>

The sta_rec_eht structure has a mcs_map_bw320 field, and the channel
width mapping includes NL80211_CHAN_WIDTH_320, but the 320MHz MCS/NSS
map was never copied from the station's EHT capabilities to the MCU TLV.
This prevents negotiation of 320MHz channel width even when both the
hardware and firmware advertise support for it.

Add the missing memcpy for the 320MHz MCS map, matching the existing
pattern for BW20, BW80, and BW160.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 016c534f748c..f403d9d925e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1667,6 +1667,7 @@ mt7925_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
 		memcpy(eht->mcs_map_bw20, &mcs_map->only_20mhz, sizeof(eht->mcs_map_bw20));
 	memcpy(eht->mcs_map_bw80, &mcs_map->bw._80, sizeof(eht->mcs_map_bw80));
 	memcpy(eht->mcs_map_bw160, &mcs_map->bw._160, sizeof(eht->mcs_map_bw160));
+	memcpy(eht->mcs_map_bw320, &mcs_map->bw._320, sizeof(eht->mcs_map_bw320));
 }
 
 static void
-- 
2.43.0


