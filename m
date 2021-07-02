Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09044C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:44:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C654B6103E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C654B6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4Y7DyBqBIhMOSQEtbhJTaHwnBPUzG/NZWAJ9lfJeQQ=; b=pg1VyooiHA6Bg2
	7n2Bcr5/HUjLY+PTxYzqDZkyT1lY4V4Caz1flXIQ+/Iy8TVaZ0Dx6ejeba0tLo5ZrSpLH69f29XQd
	0KoA68Iu371V6PujFTZ8EV7u1o+d2d1kifLcFfBXZphh4VoZZoIrRACkL0oULvGenBmHSp18Xx3RC
	IQnqdGHO4vhBOipos/wI0vHw//Pz5UH+SExsPB2fLNdPq19TxllaUf1LOmFCoy+fegobkr79uEo/J
	r+pCEzARla2SaT9lMGoQfnVDJh7nie14JGgej8Ivao5qQ1kIQ+uNVLJQ9iYDRbyEibkH+8dnBvFYe
	D/ZFAnW9bQiRpBhtNMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJSp-0039Hd-09; Fri, 02 Jul 2021 13:44:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJS1-00392C-HT
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 13:43:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o22so6733217wms.0
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oW516jzYudrgPpoHV87MKKEstdKadYWrqHFNhZ2YbXA=;
 b=way0cvmvpUF//pESK1MSlN8gcdEsyHAj69bCaL8IEYc/LJFan9v4vW+vRFvWi/g8WP
 J7gizRBnYmsPfmvIxK2d8dYdAiE+nK4MsM0CkehKQICDARLSSkWPhMNtOrq/6sk0h411
 Tq/PqhIeQheLbehlGW03RwZhuWTFvIH6cAnHv/DcsvmgsgJsXX98CXH+Wl77SohHEXzn
 e9XGyeBgy2RwEAYENMlHA/oIzzz0Y7iBj73tYeMXYhDEp9Y8kwNspNTjN25SrY1MTZVk
 NDxg/Z1i9V44vzjr7iAxiAmP+8YOHRbl6NxRwvzY11V2AtrEQ6/QrCKqOMSzS7gNpLOp
 ivlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oW516jzYudrgPpoHV87MKKEstdKadYWrqHFNhZ2YbXA=;
 b=qEQdlUVgxJx0suzLHsvoF6ozY0Jqid4jLRZEz1nwGBpYYU9O4CGqlGa7fMP8tytvzN
 0SfNwde/K4+3ojYwut9Rq1XhMBj5gcYPKz4igBUCsnT71Q4kkl0ReYCKT6ZJMWFEiM+f
 H/aGZJ2gAsbJNXf9fITNAGN9TioqDLOJPltOLWTJ/dEBTbHjtTq220su5DUXfJaAoG72
 5n7NR/VLyV0ktlcJKVG/qBtcNKvlxyIIk1zwXa//Z1bPEoyoO/rVw1kPVb6cbeI3YFqP
 unzRW+kjhldPSev9/bwq6959AZkha70+N2XXzt1uptj9WuDfemZ3V7Pb1NG8CV70I/Fo
 ESDw==
X-Gm-Message-State: AOAM533DRtbXRl/QHIFIna5zCA3Ms0ZqUpDS5oSbwM4az8C4aTgGxhBw
 CyX2Y7SSGZIZwTL2jTAISVq99w==
X-Google-Smtp-Source: ABdhPJxnTvB/oQhCVJWoCiwXtj3UUFWvJwpbiwNjlYhBG7D/FteEWRxC1TD81lekqvYBm7ouvzta9A==
X-Received: by 2002:a7b:c3ca:: with SMTP id t10mr16781680wmj.74.1625233403909; 
 Fri, 02 Jul 2021 06:43:23 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:c5f3:6ae:eaf:87a2])
 by smtp.gmail.com with ESMTPSA id s1sm12595512wmj.8.2021.07.02.06.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:43:23 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v3 1/4] Input: mtk-pmic-keys - use get_irq_byname() instead of
 index
Date: Fri,  2 Jul 2021 15:43:07 +0200
Message-Id: <20210702134310.3451560-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
References: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_064325_621395_0D42E7B3 
X-CRM114-Status: GOOD (  14.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some pmics of the mt6397 family (such as MT6358), have two IRQs per
physical key: one for press event, another for release event.

The mtk-pmic-keys driver assumes that each key only has one
IRQ. The key index and the RES_IRQ resource index have a 1/1 mapping.

This won't work for MT6358, as we have multiple resources (2) for one key.

To prepare mtk-pmic-keys to support MT6358, retrieve IRQs by name
instead of by index.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 62391d6c7da6..d1abf95d5701 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -241,6 +241,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	unsigned int keycount;
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node, *child;
+	static const char *const irqnames[] = { "powerkey", "homekey" };
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
 	struct input_dev *input_dev;
@@ -268,7 +269,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	input_dev->id.version = 0x0001;
 
 	keycount = of_get_available_child_count(node);
-	if (keycount > MTK_PMIC_MAX_KEY_COUNT) {
+	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
+	    keycount > ARRAY_SIZE(irqnames)) {
 		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
 		return -EINVAL;
 	}
@@ -276,7 +278,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	for_each_child_of_node(node, child) {
 		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
 
-		keys->keys[index].irq = platform_get_irq(pdev, index);
+		keys->keys[index].irq =
+			platform_get_irq_byname(pdev, irqnames[index]);
 		if (keys->keys[index].irq < 0) {
 			of_node_put(child);
 			return keys->keys[index].irq;
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
