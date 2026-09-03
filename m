Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE82C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 15:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mry3nYNEPrZxqkxatWuTZFq3w4sR1ZqgrHlSjI3OqFs=; b=D3+vqAW/2kMYvflSZEJavDXfX6
	mRW6j3B2Q8w6mbekBNVkzzEuTcUc+7jB0CEUCYt+vUuDNUPW3ZIQtHajjF0vbWNqaQq1cAQmmtB/O
	NiBQCQxAT4v6suUx6iHG+aExX93MfvPG6WY5bJisjedo/g1wg1gOU87xDMT7E2kDDUS9xxURmuYi9
	woUzBnPsvRkVSAxLcu/fgW0KkCIscTn5XaDsfJWohw/sgc4y5Zgakh1R5Vg7inYucyjlKSig/T99u
	ofDXoX7+qGDzLsUKBC+pOB8U31jUFS8lkWgG0umOIqgR2+KtlRZMxusSKSu+Y9pCYT1WVehmN+p+y
	a1Gc7uzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29bp-000000002WQ-1dqm;
	Thu, 03 Sep 2026 15:44:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29bm-000000002Uy-2FCI
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 15:44:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso285165e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Sep 2026 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788450249; x=1789055049; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mry3nYNEPrZxqkxatWuTZFq3w4sR1ZqgrHlSjI3OqFs=;
        b=XKWL+v2ZLcGw9LVPNA1/VY7DrFZYj1L4DPGJTDOpW4iPj8xj3BYYfDl40db5crIl+l
         kD8Wb2Kj1wgeUnEd/lx2TFhKPZnFOyIrS1fcL+FQp0ILzUT8rBeos2P1zjp65z29uN7B
         GMdin6/YZsUEIW5yazDA71ZXv8hhLBtcE8UNbXoC6PJN7ita+iEyJT/7bH20Zq9ZwIVD
         /mCOfjCfZv9ZWA94xQgQAAhaKuvsXKTX8m3ZeCVMc8oCP3QMvU7s4jRITZi9VEUKp/yc
         ic/gm++UDpfla/CYgLnFwVrSBoiG53oVW/6fHQYfZjBxY0azApJCLOMJYhZZhoqAvcZ+
         B09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450249; x=1789055049;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mry3nYNEPrZxqkxatWuTZFq3w4sR1ZqgrHlSjI3OqFs=;
        b=k6aYzaqZUV2cxTqJpFnXmiLUX5CsXCTHI8jsRweK0PbBjXUKlAENsr+i8vel+5tlTq
         EWcNGtnHItdE0bFPJ7ek/HJg0tYyeactN8Cb1Z6gqPIykC27PFX5vwQgKuDKJ+AVPssn
         iyAwNjIYZtYUgUoVyDuFLr4ThxPbWJBSnXBykUI3OtNTT6WPQEIsZJcNs+kOgCUrnBgA
         lqUcPDWuo4txrl9vvhapymiwBrtwNzl0mRPbU44rceu9oqJ8EBCy2D+V2U1l1QQVH4on
         BQGvEE2qb6BzID/n18YHmPsMeQfS4AY9MFvJ3uf2l9aLWMx7+FgFZMMo0RTI82czpADA
         ygLg==
X-Forwarded-Encrypted: i=1; AKwUvBz2Z4ufbJ9EP6cJpf74Cb9TTM+z0Cw4Le6sNW96RCjgRyRm3Uil2jbGZ5B4ZWV6BpZ196PXiD6zio1D6kZy+A==@lists.infradead.org
X-Gm-Message-State: AFuF++mMF8TXFMoriegXT9v4mAkgwU5CdC6DR7gRFc3bYXh+9cpPBcCl
	D7ZQTbAHupe0l3qWibw+zr69jH3qt7MD2f1zxPMrVshTHZR6Wap4vev/
X-Gm-Gg: AYBFou00zh7OnZlwsNHP/+9GnhHTGaLk/QgyXzY9k4ZWBJ3lsSl7jQsNMFqde2dAo2c
	TJjgjgPne4STewrAcK6qsI1T7LleSo4a8eFWTwueTbrrFV7wzwSd5MEuz2aFVsosnvRloTMpaVI
	7ql6++mB5hpaw2jPL6KuUIlCmPmjmRfMW4B+1E/keH9S0drr0iRV7gcCKdVNqP226RfknAiBSce
	c4rqVWoaYvvD3W/UTHxHNLeJFXljKoon0DDjxZFBbHW3k1n6krKGWT0GCBq1pfWYQoMJdTEhGx1
	yBtB7hUxUNLOIWDcxOESTA0rvP1mkLzVApX3jcjtDedd5TkawbR+UDTX4whZljsTyBTXav6+FaO
	tphWewqebqlvnC+B1xsB/5GoIVaCPZlQvxr3h1plCQFokVT/ruWQGAvLHiEDE+C/9eEwO2OOqXq
	yGYci4FT++1vJRA/Wy1fy+j1Ent1qiWD1SiY941EosLDuM3O0fipvZux8e/iE=
X-Received: by 2002:a05:600c:6c4a:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49cf5baafc7mr14910805e9.6.1788450248541;
        Thu, 03 Sep 2026 08:44:08 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47b9817sm121063135e9.1.2026.09.03.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:44:07 -0700 (PDT)
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
Date: Thu,  3 Sep 2026 16:42:04 +0100
Message-ID: <20260903154204.20872-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_084410_590556_70BB2C1A 
X-CRM114-Status: UNSURE (   9.12  )
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

There are multiple spelling mistakes in dev_warn messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index b8006b8729a1..3fb9f39c2f61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -283,7 +283,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring0 addr\n");
+			 "failed retrieving NPU wlan rx ring0 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND0].regs->desc_base);
@@ -292,7 +292,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring2 addr\n");
+			 "failed retrieving NPU wlan rx ring2 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND2].regs->desc_base);
@@ -302,7 +302,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND0].regs->desc_base);
@@ -311,7 +311,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND1].regs->desc_base);
@@ -320,7 +320,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND2].regs->desc_base);
@@ -330,7 +330,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan ind_cmd ring addr\n");
+			 "failed retrieving NPU wlan ind_cmd ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_IND].regs->desc_base);
-- 
2.55.0


