Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4B1C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:01:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFDDA61875
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFDDA61875
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/11pXrDckuB83hqkiz5K+8l+rndtlxsTWTCn7LTXNMY=; b=CTUUpAHOrhGx3+
	IeSr7IoQ5rFdVsM6ASS5FvqrTNSkhmSgPPeut9xYNPGDUg2LZPYMCZDz7Nq+oJHkdeyMFygNQxDZQ
	/uNSRM+Vsaaow0sIwY6bcEyto0A9XBX9NMm81q2dSrbSuqbTcZfACgKl9qJgSEm254IV2OoW6OdSo
	zneTf1ffav+eRYQuNkPOxUjir+Nnifg9pdi97qyqBWOraSDpWO4kasF2sryUGEDm4P4OzJfHScozX
	BxlAY0ILl1GXnRzH9I+uGbOxZozsvVrNb2GZgADYeecd4RvkK02vLUfOoM/gKV4fWjPnSPcktVAk4
	ms6FOIPQuWQZL3ITmgaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFZQJ-00GeLf-E1; Mon, 16 Aug 2021 10:00:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFZPq-00GeCg-LU
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 10:00:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id h13so22779244wrp.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 03:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PpTp/5Tq0vrESfQrWF/0EYbh0U7tDoXhxB+uJr6AMbw=;
 b=fZgM7et7JYN90BplPUrj/GoO0GMYg2UGNctNv85sYTJZyAp9+5tYQ/atL9fS0rK3no
 2jQXLYyUaJtuipNYQqdWqHWJAJPb+u9Btp7iBxVu4tsGws2grDmPFkZAFSwKS7MHWgZ1
 mqpfHHPg9beVHo+CgtbDHCjaL0TE3Syn8NLiFhdmzq+aBDAUIKjUUJ03EE5TPZvuPDWn
 +iIqBddx4oYL04skb1+ky2iex/cWMpN8aG/o/3FgFS+hEiEyEWBNH05CE10XGJAdR9SV
 iZX9YJWkpYTxynqjuG/LCBhnUS7lB1LK1alovi3FK+/o9o0OmWst5uBWbXCpwn+vWvoc
 pnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PpTp/5Tq0vrESfQrWF/0EYbh0U7tDoXhxB+uJr6AMbw=;
 b=I8vln55EX5XKu+4vHK+GsPGektmFIpgTt+toE06obUaJyog2aGuPZcZ0u0PV8VTI6O
 k43AZKyVlntcZf2AoonrN7us+cJRCKrt2CAwk4yI/3QWEV75nqj8hBlpP0xEYwqUQtRd
 RlVCUHMlPXJQdGIIJVGaVAXmW2lVV7x/Ie6IUSrCVjUhDsRcdDgeSgiuAAsZBndAUKEV
 RBHTeApFKGUn3pzLbbkv7587Y3kNrV8+oF5G291ochrJ9pSNE3dn8uHkurWVOs3WQ51m
 Ia0TpKMXe8EWosHAh84TEqTrpPUKdUfQ3n+1+ZxGPifIXQnQ/ViVUuu14wMCRb99o37z
 lIrQ==
X-Gm-Message-State: AOAM5321s1N9Kmvqa+d//R3pfN9dQcpw2lfVEA42juBNNWagPTy6UJC3
 rIcUQVqPDvL/PP6DvOA+MxwuNw==
X-Google-Smtp-Source: ABdhPJx0rUUhNZQP2bVTR6MASpL3WdLxTe5ewjSHul88ww9MB25RzFpl0cLiAjLY5D8Dik1Igj8Q2w==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr16919690wrt.178.1629108017782; 
 Mon, 16 Aug 2021 03:00:17 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:92b1:d3c2:1204:85e2])
 by smtp.gmail.com with ESMTPSA id u10sm1916645wrt.14.2021.08.16.03.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 03:00:17 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH RESEND v3 1/4] Input: mtk-pmic-keys - use get_irq_byname()
 instead of index
Date: Mon, 16 Aug 2021 12:00:10 +0200
Message-Id: <20210816100013.100412-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210816100013.100412-1-mkorpershoek@baylibre.com>
References: <20210816100013.100412-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_030022_775338_B07E8405 
X-CRM114-Status: GOOD (  13.86  )
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
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
