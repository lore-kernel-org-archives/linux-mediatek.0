Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58846E7717F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yl5+M/3Wjfu1WokgjzEWNvkbZlxOvtZ069F9urs3Uak=; b=rVBxdjreYxZE+a5kg/mMtQ9SGW
	Ah2ucHjj+u+/0O7u+CDiwFj2p4ikvZ9OCi81+GqbwN6ZC/VzOBkfIuhtYk/ILDCQzlXWEy3/W1UKB
	HKJ9/3hzQ92a3UV+ZWmnYShO/wIZ9zV/t7/fvOnwRMdjeen/kEoF6gF/H14JlvtspfTpE2ZzVqODc
	whJBi+MlA+4UJSlb1p0hdy0zOHAMVZZVr4UKehPSV5zzsVqF403Unt5+cV461r2I9e3lm8aBRgdv6
	/tf7QdzJnQis2gRdKWEdO6AaAoKkylNxEC9PaeWLswUe33x/bXhuSPuJTOpRnoO0qE2hp0Ma1IG/Q
	bRD8bGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOX-0000000DOln-2IJi;
	Wed, 11 Dec 2024 01:20:05 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOV-0000000DOkh-0sHn
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:04 +0000
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5f2ae985cc4so1384556eaf.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733880002; x=1734484802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl5+M/3Wjfu1WokgjzEWNvkbZlxOvtZ069F9urs3Uak=;
        b=oS2oltzr30yn3z7zQCDgPrwI+ri92kEWhj/EnQsqMLy3C2XyFbXAvuTJk+PiOS1mbs
         rY676W/29pChdhUrHXBMsETOVkRWRKmh/nNALGGO0B2+IraOYAQgTnVKknVEsVPizqk+
         zok7tmHh9IbKXdFwEw/e6do4ztYW1VbBokH2Crw42JaF3h+U7zOTD/+m9VCZFWRDNhVL
         M1+WUpRuLnpybYAlzLy/XAARqzUHxyXBrAc65RxmOYfGNP2SzsN0Oj/ST53Rir9odSLx
         TbhDTYf7w2gGFUgB3WJWHdPZjMirVn6o9IQzizI40SEyHXqp7mElE52HOghdpjhpxxNu
         jRZw==
X-Forwarded-Encrypted: i=1; AJvYcCWgDEr/qqt48srls6dtLVMRKOGuaPLZWRKv3vaHz3smHF8XBNFpnw/7fNK1JBfLQiTxqVqLh3cGJO26l9jXpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzerTi3czSj202BHpmjlqo9FVDS+KVgE+fFw2JSimV4imGBAHFg
	bhTZ9NK0nIdd5T8CPmUoOOE5qyY45MU7pqKXwKBfRNhXKux04nuC
X-Gm-Gg: ASbGncvW65w1/TPu85Wy01hgsrIUSNAdjaJ6QCI2Txs/BrewmScflI9N5dWVyocEgHs
	fzpGitjcKG27Ku6l8dO6Wh5AsfG2cmIYXtt4oSapeDdxKLHTtAiDuGOL8B04ABH64/cxEoaYvGM
	CBnQEBaW//KOB5T1tCAmo/htYlVnEpWKDaPDyYP4Nia7DX0MEIXFM9gtA6lfCLpoQfMF3pbOKMT
	CQJNo2cdDDSefeuiTwO2LHkfjXrlXve+P9BvE4p2jsuQtLaA3uS8NtSeacpUmaciy7NBm4=
X-Google-Smtp-Source: AGHT+IFGjk93XHCKgWPxTkUaom6Dr1++sOdagiuWtt7nKIOG70Vy6CmIPsr1hmkgXTjKZwbXe2st+Q==
X-Received: by 2002:a05:6871:820f:b0:29e:4b63:d7 with SMTP id 586e51a60fabf-2a012bb3bd5mr562846fac.1.1733880002127;
        Tue, 10 Dec 2024 17:20:02 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:20:00 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Leon Yen <leon.yen@mediatek.com>
Subject: [PATCH 07/17] wifi: mt76: mt7925: Fix CNM Timeout with Single Active Link in MLO
Date: Tue, 10 Dec 2024 17:19:16 -0800
Message-Id: <20241211011926.5002-7-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172003_247871_82040B9F 
X-CRM114-Status: UNSURE (   9.13  )
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

From: Leon Yen <leon.yen@mediatek.com>

Fix CNM command timeout issue when only a single active link is available
during MLO connection to fix the following kernel log error.

[  741.931030] wlan0: [link 1] local address be:90:e0:22:c4:22, AP link address 08:0c:43:7a:19:2a
[  741.931042] wlan0: [link 1] determined AP 08:0c:43:7a:19:2a to be EHT
[  741.931052] wlan0: [link 1] connecting with EHT mode, max bandwidth 160 MHz
[  741.931071] wlan0: WMM AC=0 acm=0 aifs=2 cWmin=3 cWmax=7 txop=47 uapsd=0, downgraded=0
[  741.931076] wlan0: WMM AC=1 acm=0 aifs=2 cWmin=7 cWmax=15 txop=94 uapsd=0, downgraded=0
[  741.931080] wlan0: WMM AC=2 acm=0 aifs=3 cWmin=15 cWmax=1023 txop=0 uapsd=0, downgraded=0
[  741.931085] wlan0: WMM AC=3 acm=0 aifs=7 cWmin=15 cWmax=1023 txop=0 uapsd=0, downgraded=0
[  741.931095] wlan0: moving STA 22:0c:43:7a:19:2a to state 3
[  749.090928] mt7925e 0000:2b:00.0: Message 00020002 (seq 15) timeout
[  752.162972] mt7925e 0000:2b:00.0: Message 00020003 (seq 1) timeout
[  755.234975] mt7925e 0000:2b:00.0: Message 00020002 (seq 2) timeout
[  758.306971] mt7925e 0000:2b:00.0: Message 00020004 (seq 3) timeout

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index f6aa052ca802..d0bfc7711a80 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1153,7 +1153,12 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
 			u8 rsv[4];
 		} __packed hdr;
 		struct roc_acquire_tlv roc[2];
-	} __packed req;
+	} __packed req = {
+			.roc[0].tag = cpu_to_le16(UNI_ROC_NUM),
+			.roc[0].len = cpu_to_le16(sizeof(struct roc_acquire_tlv)),
+			.roc[1].tag = cpu_to_le16(UNI_ROC_NUM),
+			.roc[1].len = cpu_to_le16(sizeof(struct roc_acquire_tlv))
+	};
 
 	if (!mconf || hweight16(vif->valid_links) < 2 ||
 	    hweight16(sel_links) != 2)
-- 
2.25.1


