Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71526FF885D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 02:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eNGha38KYXK7mTaNFdD1kyRzSrZGKEbgGIpx5vaJrTA=; b=u9DBQtkIvqC14cioLr6jjVciul
	by7MvW/OJBF3r206jBcj1jhw/+V1wgMgQSJSy+1cPC27guurSqYZUG8gYsVQsZeb56GSwmJfsML4J
	8BZQfRrQzXYcBY6Afx+91HoGWeq9sNdiHlm3lHqoWz84GCljLrzDNOyyo442Se9sM2pEKT2O+FwU6
	Iooq7YN1pfQHGs/Vdi0pX30PtAzMN1pZugfPxKYO0tw56dtGdygB6Io7sY7MZkmp5RAuWBfrp+rFm
	Wy5jo7cSLjdzLXJ+TemnzNfL0QNHIT7bNycS3+bqPO4ao5fCFTxkjAl65kyOouv6oOnMBH78TxtKP
	h9fwFObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBQp-0000000G2Ni-0lcl;
	Mon, 27 Apr 2026 02:10:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBQn-0000000G2Mz-05Ul
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 02:10:42 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8296d553142so5261541b3a.3
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Apr 2026 19:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777255839; x=1777860639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNGha38KYXK7mTaNFdD1kyRzSrZGKEbgGIpx5vaJrTA=;
        b=Fp9/9x9TKS81sfpXuE9RoPIiCGnoKZSFv4Td9affMoZhZ4+73KtNHM9XvDEABw8m3f
         MFTMBFICBMzfbMylb1DMsoM9U6RhckEvBVpolsuJ7lUVuF2m5e1gzVyXoFVuVIB9VQU8
         quQ3oUFgowgWuMcsG3sIFRy4yuP0XMf3SwoHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777255839; x=1777860639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNGha38KYXK7mTaNFdD1kyRzSrZGKEbgGIpx5vaJrTA=;
        b=A6/HbXOanwZTgP/6S3YuKyVvCcsCsK+rPWkNwgFTe11GnZ334q/U6NoMYwTbjVyZAN
         8froG5jRKpE4NwQvK0tbZM3RdjHajNHAomqPasxEdO3OrM/7kw6D+NaDHB6UXiettWSP
         MOgBb6vxQdRQRosEY7OvJrGWp5DKyOwpoiDDJ2TGRVqg0jxwdwXl/Epa2zNhCvLtbsRu
         RQcD+OkbkXKfgaougTPEtALKzE9xXrD1In4H3dCwZWapgZJyXStkhbzPs+iIYSYatnCX
         8XtbmsfS24uPFGRWtMdQLo/mZyB4eEOeWJt8wpI3sEZhoC72O7JVN0O7LbRAqWGB3GGf
         KX1g==
X-Forwarded-Encrypted: i=1; AFNElJ81m673I8M8+ELHQGgxHaRJUq1pobRyVPJsWzUHwPks5AWznb2WZFuRTOt2scc30H/+iPnDxpiy/wgBOUHrRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9ER0/dCiIocX1pkjr6bePon6MY5gH+f0pT8x/qGIgv3QcAgmj
	r6T13TDAw5PFAss2f2yXbWbpnOYlBa0gwSihlECtDnmwswztbhUoT9MxGeubHsIirw==
X-Gm-Gg: AeBDieso3v7x3jicH3w49qZ6Q3CexUER2sCs02be/rI4W6lafjhmTP9sI8b187SXcnM
	7t+mm/bSWUhIiAuFxYx7CkWXMVGIuEZcSYJiiAzd50VhPLFbcM25DBYM/iyyoWJiIpTKtnl+asm
	/DJKavv2pWK7INeyy6FhplJSpAhyF/CclVurfB5WLeEUQyZJjtbSPVPQRnmzn8I0+qaKLR/we1v
	cN3CJp8GfSJtc5pg0aXBQrp53ACHJNcouMIYvpY1zPycMRHXXni2kBX7HP2dezAeJ5d9oDyTUA8
	YdHpNRBKeMhLjFn4fqbnJKElWVTLFzADyNOcJyb193Xb/wvSqvDWfcMid05A0LoI/bKp4+oXAmc
	/NeJixzSV64lEmDdFnLAgIw8Ohilwar0JNHy0PGDtHZ36zsalYLqSQ7E0SRkiwpUxKQzuYviSIj
	hJKsh9oGQ2RByreIlCuUCVYO+Qxx3872s0zczqxLc2l2qCR9tEQfctSZ3vcw7RLcLAJkoCwJCNe
	pthIJvUJeoWCJagtC6TDhlHjPJrbg==
X-Received: by 2002:a05:6a00:c81:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-82f8c908083mr40534324b3a.43.1777255839376;
        Sun, 26 Apr 2026 19:10:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:8f3b:cb24:e20a:84bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe41cfsm33097883b3a.43.2026.04.26.19.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:10:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: paris: Directly modify registers to set GPIO direction
Date: Mon, 27 Apr 2026 10:10:19 +0800
Message-ID: <20260427021021.2049015-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_191041_104958_DE9F15ED 
X-CRM114-Status: GOOD (  12.75  )
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

pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
the pinctrl mutex. This causes a gpiochip operations to need to sleep.
Worse yet, the .can_sleep field in the gpiochip is not set. This causes
the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
whether it can use a spinlock or needs a mutex. In this case, it ends
up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
takes a mutex. This causes a huge warning.

While this class of Mediatek hardware does not have separate clear/set
registers, the pinctrl context has a spinlock that is taken whenever
a register read-modify-write is done.

Switch to directly setting the GPIO direction register bits to avoid
the mutex.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 6bf37d8085fa..e4c0bc27d984 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -886,19 +886,24 @@ static int mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	return pinctrl_gpio_direction_input(chip, gpio);
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+	const struct mtk_pin_desc *desc = &hw->soc->pins[gpio];
+
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, 0);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+	const struct mtk_pin_desc *desc = &hw->soc->pins[gpio];
 	int ret;
 
 	ret = mtk_gpio_set(chip, gpio, value);
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(chip, gpio);
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, 1);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


