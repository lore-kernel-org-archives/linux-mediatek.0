Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF159D116EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Nov 2025 17:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lSM32csH2X23xXw6xgAstXFSe1ZcOlrmsYctqKwHp88=; b=jB5JM7X92hNKdyu9EFyy7aCpxZ
	FgU9aUOofWt1Gh22s7QYE/kccb/91moAUfjhe+pUAnkuQUFojAygVumPfudoSd9JcUIl8SOHRd2Lj
	p8jx004b7BSG6p+10sWF7iwCUBAch/S+z53wXFnBqk/2zTxW0nmSn2gI24k6zDuk6v9ksP4ZztZIL
	/7W2riwhJ8dSwPlmAVKl2dQhai64F5h7I+6lbqFKdRN3kWn8SeQ6EP/IBH0tvHbrPSl8c6b9R6u//
	aCRMWBzc2TacgIWyZQZxCu7m1ulO4YTMiEOXL/pKc2bwsWgP9vlBYGD2Y5Ek6jhpN7xgHYyRwjF3h
	trHScEhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2XB-00000000kBT-0Vyg;
	Fri, 28 Nov 2025 17:45:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2X8-00000000kAk-2kon
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Nov 2025 17:45:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so23639005e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Nov 2025 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764351924; x=1764956724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lSM32csH2X23xXw6xgAstXFSe1ZcOlrmsYctqKwHp88=;
        b=ht0ZTrKAlFvkMp20Vvb0D0JI8IEp5mjQtLC7VHsLgrgneiAdDOY9NN8eUBXhq10Gmo
         IaOaK0q12P60Art1rdmMBIqtV1p0UOTOTGs+nO3nlguV5LESTDTPaiOPhHQu2WnJ5pB0
         EPQQc8yHQS+DjEyE6xG+p2v51xJvT5uI3Bceg0KaEuM6UNacRZTbnO2ZrWem5eJsCawV
         eaOgsrbLq+6Bo66W7HPiziBAIWp+73cYFpX/gNc2azY/CGAo1mGVOtazYOLgB3ln6t0K
         BbVAUQgvekexOZ9ZovpVZsEtYCFf+C9lu5Mrkuz6WYgYO8u9tHAv9TXMnOCggJNZDZHH
         LbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764351924; x=1764956724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSM32csH2X23xXw6xgAstXFSe1ZcOlrmsYctqKwHp88=;
        b=S2iVsKvxXvhIUPbmoSkP5WNYWkz6h0I5sD9TphCuSwrpqGlkh/XOSPB80kJuxwP+c2
         nOhAOXTV8PRRn+bgHaUK53i56wRqSaJfeIr6Hlih7LAk+Sq2hX0f8s/aoBmjKbmdXfix
         cpQwEnmPrcF5h2TUzJWhjnaVUpbYZIj3E/8SDGf8zVoB3FZwWU7gFQtokBDeNjIcwHYU
         vuVAkZqlUcC2LcEHmSgG2MmUhrGUVJvJL3/MuzqnXahuDw12je7/HVBWZAgwGshi/lYM
         t6aGluD2WtUssVRvb9CHcqJZ/k7wsY1TmPM7+B0V7RDqWqVHX7/7AlO+ECfNb9UiV2mO
         9WWw==
X-Forwarded-Encrypted: i=1; AJvYcCVV+1BB0YqxvCmuh3kvS3PsVFAkDZFBLAd/K5T3e6Xwhd0sKyQpT/RhTwR4Q6+TuDjlvI+pdhJ8nf71nCfJZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSI5YikXEhm1+eAP2PTOb9iTVKHhRxZ4KzQPhrRJlnPOJSizuC
	kyPEKqoYmkmHgf6TyzWTDaQWnRPe9PB/mgqkkKj9j7ewmpM+N/Y00ojC9IM81Xz4
X-Gm-Gg: ASbGncsATCOJDrsxy8zq4GcNxPq4y2PoC4miEhAzCgmK9n8gzMXAnK8Tti+1EPIk4Tw
	MIclm+KnYUaDOjefjzjZv18kX+OqNh1ph1BlsUF+FCd6tJdjFl4OOFNoV8ZkU30E+VOyvHJqt/o
	WBXq8MEinCCEZ2apOq9qsw+1wguAA6EVkvaYD1cyUYAuWmEeVUlPvM2P/JHtRdnEvI5DJi+ADS9
	73dNdJALr/WK9iQUYYUM+Q2uIKcybrkTwkPyXXOBqCBlcNB5F+PC2o+HHckpIAEftT0AUlx822+
	H8VwxzY6t0RTZPiD8S13drqPBFfoFiVI3TibWVua+jI5US6qpTBbQvUpvkJoZhE+MpjYMrlDvBP
	l2x1X0qnaQzOSQ8XGi7hcNtfs6kkJwdko7zPjj1eJKTiWFOMETgfXt/myGzsLEudT3b/IeRKcmn
	W2dLrBG/1GQ/CR1NkSEzmT
X-Google-Smtp-Source: AGHT+IGr8jf1cEOxcEb6EeKeJchwsXTCgWnn9x2mUsKIoWiq9E4Ha2G7avXXtjB+xtyEdcahgOM1nA==
X-Received: by 2002:a05:600c:46d2:b0:477:54cd:2030 with SMTP id 5b1f17b1804b1-47904b1afcemr162142095e9.21.1764351924189;
        Fri, 28 Nov 2025 09:45:24 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5c3c8csm13452898f8f.2.2025.11.28.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 09:45:23 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: mt7996: Fix spelling mistake "retriving" -> "retrieving"
Date: Fri, 28 Nov 2025 17:44:30 +0000
Message-ID: <20251128174430.318838-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_094526_700552_F770FD6D 
X-CRM114-Status: UNSURE (   8.32  )
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

There are a handful of spelling mistakes in various warning messages.
Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index 29bb735da4cb..1422533e59c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -120,7 +120,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring0 addr\n");
+			 "failed retrieving NPU wlan rx ring0 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND0].regs->desc_base);
@@ -129,7 +129,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring1 addr\n");
+			 "failed retrieving NPU wlan rx ring1 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND1].regs->desc_base);
@@ -138,7 +138,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rxdmad_c ring addr\n");
+			 "failed retrieving NPU wlan rxdmad_c ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_RXDMAD_C].regs->desc_base);
@@ -159,7 +159,7 @@ static int mt7996_npu_txd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 				       &val, GFP_KERNEL);
 		if (err) {
 			dev_warn(dev->mt76.dev,
-				 "failed retriving NPU wlan tx ring addr\n");
+				 "failed retrieving NPU wlan tx ring addr\n");
 			return err;
 		}
 		writel(val, &dev->mt76.phys[i]->q_tx[0]->regs->desc_base);
-- 
2.51.0


