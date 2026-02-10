Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED1BEA3F0B
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 05:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3tE87q+qfGSEa6Oly0BwPABhpAUQacJ2LeCqBjkgvs=; b=CGQYpOiMvtOwTqS+AotOfMx9wf
	dItC32CYJ7HeZKBdTzdktCRABh1VGZTt15QtuCuumAHPS04gLZxajUgbwDYIpmbPKdNKjs1VM8Ywh
	mB/RsCNOHCTNbYOwbbqhD+01gL9GwEv1q4/t3EG+i08oM53f+TIs2HliyBI1PZGTTGy8DNxX+jZCN
	wAzic0VdK3b9QT6dDCl6+VhPa+8kWBCnrN+8LIlUwtfQ053/S93bQGO5MMA7comMz84FRQDrS+xAr
	0f0t4Q8ixmgb6Kfs0ywdggM73RQ/yqIgHovIDmoMEmvHNe/Sl9amMh1La11o8m1iWyMC1d0CMWQOc
	IrYlaZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUh-0000000GU6r-44me;
	Tue, 10 Feb 2026 05:41:03 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUe-0000000GU1K-1NqM
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 05:41:01 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8c6b16bd040so516459085a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Feb 2026 21:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702059; x=1771306859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3tE87q+qfGSEa6Oly0BwPABhpAUQacJ2LeCqBjkgvs=;
        b=Au/y28rXI+CNXaEBwD+6yz1U0dF4n4CFNgfHIsh6aZBKYITOhs9RU4I+3N3Q+FjYzi
         Hbt6tC7gm9ZZivxduhb0RnG7ZlF9tUi1VLNETNvTMLL4pPrIRgSp/VnIHH8Vvc3ukrTj
         Xqpijljkf2Q0zH+oz2UdpagdRb6KVHDWHXkpQOG4DxilS8OAYWxXl/TngvbvHxY0+/KD
         CISfoAzzzfH+FgMOF1eJC9fX3t1LfJh4BDn1i35dwNBf2N3CvRm/MQqPxQ7qRUIsGGtb
         E82FIZhJ49ay7SKT7WeDknOz7NRYakrN++oIPHGzUMMMxQPYwEBOlCMXjQTYqJCAIq18
         x59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702059; x=1771306859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3tE87q+qfGSEa6Oly0BwPABhpAUQacJ2LeCqBjkgvs=;
        b=LQsFO28GxWVcIB9OiAS4vVitBLmVHcQgVBGvYMK215SgmVcNzTL2T7O7HeunEAqwDE
         lT1TqwZ00UmV6VHYGbKJkZoAPn7MRi9XHMiWieet+99BJo+Gz/YonodUe3pxvpFaCq0I
         eivQCLMgI2OpBeoBGy8Texn/U78Jilfu3GuU7TrCk61rCRk6yNYW5rKjPTsUXfuexW27
         JoJz2ZODbFIM+13AwMTuCPBK7+DM/cyiAVP+WEse8ZXBfVuQgK+Li7rhGku5Mzu+JVss
         dmOoePrOWfUOW84aqaUkR/AWvzraKNzN58oKRga4hfa8Y3m8TfIlBPkupO9UfbzyGLSa
         2WHg==
X-Gm-Message-State: AOJu0Yw8k+GgYjPfU8I3U+djSCfK9QlUDm9ufFHG6+dgsAlgKmoc8fFq
	SaFFC4aR4wvu1KkLYcfdrr62HvtRZ00OfC421XFi+chIzZjN8hgFAy9GLyk9HnsG
X-Gm-Gg: AZuq6aKn50DDkG5beBX6WtsVLgaxvxDODKxl57Bev0Ce7dOJSqHQFnRv1uHjZTdKa0w
	q8uOyVYb6RpfOVQ6eN/jjxMLsgWKzySJjDSdXOslXNkdhP3jLa+cAiEKFIMMKv+/LNMWZGhjLJr
	rTnZkHOsJoVT49EkRsK13sjKXqX3bgSfAAvCjaHZ+4+i/GD/8UgOu1GD9kRZ48CYATfQqT46MsF
	WbgMgU6NE4bQxnzxShydXpbz7vYDJYAvQlixp5qs5bvdGFiYpgmbjC+d06DZCdLf+qNQJYdmGIl
	Ywp+e7Co6EAeiLYQhte6jOJ1wElYsBRg3C3DVfxUgffrEsRgxUMDUhLBevTewg5CfedI64WW7dS
	HwG49s5Y5IraHmGwTpGnx+yEaz2o1C7Q4cXMj4rhulKvNAZ0h8Mr2zNTame1rAWNZHCJ/dykjcO
	1lsdc+XsqvG3NGmtkeTixrVJS4DCejm1hFO8gRbSL3j7Uh7G3pIXOqWK9hW5XLDuba9ZgmmgqjI
	A==
X-Received: by 2002:a05:620a:4041:b0:8ca:305b:748e with SMTP id af79cd13be357-8cb1f6ec283mr118885285a.57.1770702058705;
        Mon, 09 Feb 2026 21:40:58 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:40:58 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 4/5] regulator: mt6363: Fix interrmittent timeout
Date: Mon,  9 Feb 2026 23:37:04 -0600
Message-ID: <20260210053708.17239-4-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_214100_463364_0F3790C4 
X-CRM114-Status: GOOD (  13.38  )
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

Sometimes, the mt6363 regulator would fail to initialize and return with
a TIMEOUT error, so add an extra instruction to wake up the bus before
issuing the commands.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/regulator/mt6363-regulator.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index e0fbf92e7685..03af5fa53600 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -861,7 +861,7 @@ static int mt6363_regulator_probe(struct platform_device *pdev)
 	struct irq_domain *domain;
 	struct irq_fwspec fwspec;
 	struct spmi_device *sdev;
-	int i, ret;
+	int i, ret, val;
 
 	config.regmap = mt6363_spmi_register_regmap(dev);
 	if (IS_ERR(config.regmap))
@@ -870,6 +870,13 @@ static int mt6363_regulator_probe(struct platform_device *pdev)
 	config.dev = dev;
 	sdev = to_spmi_device(dev->parent);
 
+	/*
+	 * The first read may fail if the bootloader sets sleep mode: wake up
+	 * this PMIC with W/R on the SPMI bus and ignore the first result.
+	 * This matches the MT6373 driver behavior.
+	 */
+	regmap_read(config.regmap, MT6363_TOP_TRAP, &val);
+
 	interrupt_parent = of_irq_find_parent(dev->of_node);
 	if (!interrupt_parent)
 		return dev_err_probe(dev, -EINVAL, "Cannot find IRQ parent\n");
-- 
2.51.0


