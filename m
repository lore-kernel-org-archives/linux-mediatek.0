Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D03C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=; b=HJmfpzvKZltWYsyJLxARHglgPy
	6E7ryXTnXNgtamvIlPz3kpoUb3Rmjkty/p7kJV6jc7an1l7FhT/czsTNn3x99a7bPhVTiyjSRaLxu
	/2q00tCtfGFDjKQ2UIOHIjLCcelX/ujNpVtUmynuaNrqh8bU+TKadHCQ/xBw/LkG7/CMV0DSqZh3N
	+ExXl2y0cgCvd6Yp8EZWR65o/wL3oV1+Fp8cw/6QQmpjZXFKRn0lXNawH/lxowTtdbZsINvxMxWp4
	8OuTSToRkDhQ0QVss3+Wd6/RjKJQGmgnZxRp9l+PvIEYKFvCsGw9QibINhoi2COSZF5adrFUOw5m9
	NhLDKd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkj-0000000GNJv-2ac3;
	Thu, 03 Sep 2026 05:12:45 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkh-0000000GNG5-33Fc
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:44 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso1530257a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 22:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412363; x=1789017163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=KlbfqUx/CCcbnZqTYKRTWSRKZjEDcR5BvcMaruad+kD7p+0pMVVN2tdBExuElf8Tia
         7RF2sccigx82dvQCBuoTDOgFjm8TfBRYLmfvZKLzxqyG+S0iN+mtGF5V45DRXAtXCHow
         tEj12ylkwoVcwI5Nr5q613VOn33cw3VoAJbSu+g5JxaHXAuIrS5Rti0sNulXUNUqH+Ji
         0s9UljQff76qUuZ+LRvyknv6FgH3khYD2psUjNVk+O7sJ7fyKkStaQLMS6excHeBjsGj
         JDZtQqHRGVHhkSuhW4RQ3eTPQntb0+amkJFR0FoM6uawNrOAvGrQfllU32mr8awwGcYL
         bswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412363; x=1789017163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=a6Y+mwniyoQbG0aGggEBBO4ojh1vUGR9OB1/5YoprFaAteXkid/iC+Lo32J21rCrZX
         Ui5gvgOGX8Pk03/GRoUpKaUYrm5Af5km/wKFz6ZtGABuu/D+Hm80JDY6i26lKlNM+gLl
         YlAKwi7asZ+0kW+WHQOJNA8FfX9nUI+G2qJSFM1N1BRmbFtgaAM2DsnlF7h/4Nnm5pzN
         DXisUz4toqMB3Tg85bnSJAyewohLth/9j69AeWrAUVTMViW3pXFQtc+cG9hQjFOnL8Fn
         KWiASfHz0XsLIgdQZ5OfaIHgDIbSj3dNTpEQgzMzKSS+wvpGwIGMUtXPbNOQ9KQeaBvv
         PvSw==
X-Forwarded-Encrypted: i=1; AKwUvBwJW/NMbZxyUvYPyX2wu1l7xYWL/590tYlLsuDrhTfNZRShH+HtJI4DheO5+KuvRUhl/SeyJCCSuLgM9NxXsA==@lists.infradead.org
X-Gm-Message-State: AFuF++nsoTGg3bCtY8QIyA4IbGNmhtP59tv1vm/nKO7xE601RyYg0aMQ
	UxC2ZABhInPNcvy6AEeQCFWL2qbWTy77NVWc42UNWI1HSuJio4AP1qmD
X-Gm-Gg: AYBFou2esOEYWOwbiRqGaezX/cWz9naQyjFcujZrWJHLGnHvgzk8LIZuIGiExRwdrNd
	8RvDkqaSb+IwR+I3c63Q5QyhXtuC0x+hO24pW+Q4dE5xkyYqEgg3MtyIA4ZqoBi3TtNUHRDkWMz
	RM46LviECbl7RYW+P+te1GmpZeeZVkyMXV0wO7rbnq/zJCrm3iqrH7I0qvG4ZIkTBxgT6VFrHqF
	sSX2nHvul6Ji692lZUDqUWH/RbjxUmvfpYn1wq4KuO+j6q9v7oFlTHb/AXL85+9EmG8UeJoRY1h
	hUPCQ7FqQjDjvu7TsxZ8ZjkqplG+eFfQ0DiBCU08LvgP8fKcWtRnYAoaMO6qQT8PV99RKNy+cRX
	H/ipOo7kAY2Qarb4cTj0ut0qddzMwAvKJGTMT4bXrqQMoJRpTRbj+lLwE4Rr8buwn6bHd1uTsr2
	h5jvEfQ4G1GS2rxXWbDGp7iC8bcmmhfS+D8FkE40IreBET+EeTJ1/mkPeKk02pvGiyttJ6KmNUb
	J905tSXdiVBDPeLhNYZ4xRiFgGvqcv8uwKOecmFzBzT+NhX4aBYTRJTXmfdPSmqe6tne/d7+0Cn
	JSLT
X-Received: by 2002:a17:90b:4c4e:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39aee0674ecmr13930896a91.12.1788412362952;
        Wed, 02 Sep 2026 22:12:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 8/8] ASoC: mediatek: mt8186: Drop redundant probe error messages
Date: Thu,  3 Sep 2026 12:11:50 +0700
Message-ID: <20260903051150.178057-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221243_786342_2AAA81D9 
X-CRM114-Status: GOOD (  12.97  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

platform_get_irq() returns a negative value on error and does not
return zero. Therefore, only check for a negative error code and
return it directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 143386c54dd7..4bf098657fb4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2852,10 +2852,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* init audio related clock */
 	ret = mt8186_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error, ret %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* init memif */
 	afe->memif_32bit_supported = 0;
@@ -2885,15 +2883,14 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id <= 0)
-		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
-				     "no irq found");
+	if (irq_id < 0)
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	ret = enable_irq_wake(irq_id);
 	if (ret < 0)
@@ -2957,10 +2954,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8186_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "err_dai_component\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
-- 
2.43.0


