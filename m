Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C2AC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:27:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C89F1616E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C89F1616E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p4Y7DyBqBIhMOSQEtbhJTaHwnBPUzG/NZWAJ9lfJeQQ=; b=cGPoGBCTKysMDHNYT0kJPnnTd
	PG5xcTCd3N3249gqdD9gszFDc1/Yb0is/B4ekHQpgxPLiVTv6Gse1hczWnJp62/nvgjY6AUT4Xz8T
	Nf3WSBh+ym5gTik7bC7FlV7DMPP/2XpejghzpSNVSDHSXq3n9S1HBkB69OAQMgscESRmuL0PdMu2b
	rSJ8ToS3WOychi5uNkuEy21vh/n74QOyr3VXG7Gxjk8eXTbuaJJwA73yh0ytU29y0H0SlpIwQatLt
	pxaPhbE0v9vFZJx7EPWk0oNTrLZm0NrtL22OWUWBXHTdFVPL+lCSUVafZNfChC/HVqoAk8FCfVE4e
	JyRhgaohg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgqlc-003BsP-DE; Wed, 12 May 2021 15:27:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqlG-003Bna-9Q
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 15:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oW516jzYudrgPpoHV87MKKEstdKadYWrqHFNhZ2YbXA=; b=FV21UBjz5OO0/TZa/fp4+XtCEA
 G1pL4hTshinDaH9oDj1Bknl0BLyARJDeNVVRWZIVB+tWDdwvF1cBwtbaUJTEpUsnMr1olZTqdGmmy
 DPt+QnG7OusdBGFoLLJ8Vi8Bu54IvOpco4G0nqRoSkVNWOJLCzda+oMdkm1FHpRhCMve0GIzAYrUM
 WCqRQpnGAkjpekTuAh0BUsUFv4mtrndcDt81miEpU39XxRWs0sMMXQ9PY5Si9/kuwsLYGLUcFCUAc
 wDqQX2wvMasU6DnDFxNhYOflbUdUoy0zdQoXKc/tq/3IoVREtNr0J2skgbjVXldI9mZJhDwM60BdO
 SddO8uqA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqlC-00AW71-Tn
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 15:26:57 +0000
Received: by mail-wr1-x429.google.com with SMTP id v12so24020877wrq.6
 for <linux-mediatek@lists.infradead.org>; Wed, 12 May 2021 08:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oW516jzYudrgPpoHV87MKKEstdKadYWrqHFNhZ2YbXA=;
 b=hXAKLlGslSY+StvaTShozecnK56pNk1iaHsdQQqcO3Oq+6ZookK9e21q3ejNQQvBqq
 RDhHax1vyl5VTyNgLtRs/87oEJGisOF/zGw7VnU0wP2Xli9Vmw1lNM1DP+o1bIMCNZc2
 49Wt8OIXmlP0FCA4GETy37IWb6XzuBEsV1YMjfjvHIqMtfiidrWJPN06kSnNPl8G0El+
 ejyDjMoNnCe3HFwf1hjDSq/tkolEptYzQzFsogm86a+12K46WgmdmimS0pkSjJdz7Qs1
 rZXRl5tgPlAYFLp0FQpP8s37hueBw3hseo+jn1R8u8CpczgMEdOlTFVKdL5IBJcLVRrv
 wbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oW516jzYudrgPpoHV87MKKEstdKadYWrqHFNhZ2YbXA=;
 b=jEDwNhZuH74Xjy9T1ZCZovY2c9CXWSTv5dGzW3sAnDhDFocT+7sIVwjop5uW1CFqTE
 Ctk83duGMnbWF7/Eok3i5QznyRMhbVevkTVRemk3qM+J3Aur31yzMbhw/v9Es27GUx7U
 BZ9SSOVvZygdLNk9f8grsz61Ew2S/Uy2+xZIpyuEi184dGoW+7bQrS1z6fUMGD3ex1qb
 es4x+8zhzEKe6vtV+AvLL5Y9aEB2ECxBC3nuWTQVKJ4LJ26hkYVrHgLr1dp/Fq5JFY0N
 L9VhABoSc1MgpFEioCbV2qJpZL37PiTn7IYEt/wfj/4nFRmW7eN5FbgRV4LKCwcRtEwb
 78SQ==
X-Gm-Message-State: AOAM530pVtPFCLiohnWb1kIkfgoUkw6esvjPjqg2BFSqD+5kPJfrajCD
 G1v6i30lsqDBEzyZt4616YCx5g==
X-Google-Smtp-Source: ABdhPJypo7Jgc6oAImKUv3gajv3k/NqdipfFKhkHkFZxxCQ1LulKIaO0IIMcNGTIuXb2LioBDAsYuQ==
X-Received: by 2002:a05:6000:1549:: with SMTP id
 9mr45965246wry.367.1620833213218; 
 Wed, 12 May 2021 08:26:53 -0700 (PDT)
Received: from mkorpershoek-XPS-13-9370.home
 (lfbn-tou-1-1465-169.w90-89.abo.wanadoo.fr. [90.89.34.169])
 by smtp.gmail.com with ESMTPSA id b7sm30931256wri.83.2021.05.12.08.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 08:26:52 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 1/3] Input: mtk-pmic-keys - use get_irq_byname() instead of
 index
Date: Wed, 12 May 2021 17:26:46 +0200
Message-Id: <20210512152648.39961-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512152648.39961-1-mkorpershoek@baylibre.com>
References: <20210512152648.39961-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_082654_979767_27EC0F77 
X-CRM114-Status: GOOD (  13.84  )
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
