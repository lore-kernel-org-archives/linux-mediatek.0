Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6432FF8860
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FwBDxvhhf1dytDgVC9wEZNucPdGR8g31jisecswPi0k=; b=0CUj52QqyUhlz+hlWyWNLlBgiA
	zdGZcKDLqypuv79Y43xMneLaz85xCnuW/MEob17rfSqW8EjCjYGEACOypXQ0E35ZSfpupBmyjYdak
	1QFTbHDcC0SOP2AMslpgNeWanQljPvw2Ht/HiLo7T6/DZgn8pd5FL5ZhKkdHkfPp0zYtVU/7ATkTy
	0paXtWchp6YxTgjYcdA/JczoojMlq/a6sxUEYn1CvAQbRNTw1a2R9X1fJAHcgaAsv/TkmBFVTsfX+
	VoV57mJkmKoiS1nEdxz/jukvLCBJ+PbrYoenkxCNLhehAOG/xoWKdBh99WMXLm9rkx2TpdF0F66Am
	DnYG4P1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRKG-000000001vN-4A9y;
	Mon, 27 Apr 2026 19:09:00 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRKE-000000001ud-3Mw2
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 19:08:59 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43eada6d900so10379743f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 12:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777316937; x=1777921737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FwBDxvhhf1dytDgVC9wEZNucPdGR8g31jisecswPi0k=;
        b=h8LPolDyunBRtntegMvKJ+uSxak2biUwHtQgWADkgCl2+Vq2+7ced/Ap2iaefX9aa2
         zmuxnEZV9knRW5XyP1+2mdaZXFotCCws91elly9ISdXWiBlb/9SzPzI7aBrH0az6upF4
         pA3oj2n2H5PfDBr39xhBhWWP/ikrG3/xvjyf/cxJU14SL2xC1pdb734gSVL7KJcYDJLt
         +1pwBHEj1cZEzfZRx+ofjfypqtzJ4ETxyo1bcIF6ZGTVGdic50tkm2tPV8lp7Z4lXZmk
         0T82mmvAKgzQFMLBvD/rBVrB7A0ZL68uDUWtEPZ1F1P4eVhuVHCsB+eM1DjgPP4kPc07
         viTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316937; x=1777921737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwBDxvhhf1dytDgVC9wEZNucPdGR8g31jisecswPi0k=;
        b=hYHW/qmr/zwolWJ0MTCd4fjpfBUdz78PA4M7ejE+3e2PNyPah45v59ok69EPbsIvFp
         80oiOfjSGtpdq8oFCeDzGiC/ISgQANf1En2uhzGCHhUXEx25n/37HAVvtC7fXOt18cQb
         cEHtRcKrGOrpraH3OmWpbji5HxyAVPgYyuPybRkGO6huAGLTE52gLt/3owuGNNiGplIQ
         ssjd40VxgDrIWWGMH0suAUlAXT26eibbdLX/qbQNqwdbQq8chqjohxk7c7M0kuXPIon+
         JQX8k9XTR0yhgXsq7EKllI4xWWhn0mJf5KTokspa1i2CN37Sj7y7cCV9AEnIPuBPs9fJ
         RXdA==
X-Forwarded-Encrypted: i=1; AFNElJ/WVq0czDUrpA3MvvPvPIXS5+0yiaNw+A7BnjparYyqHaGbVxdBT/T4uKlwz7J79IsF5OWSO6ORig8qjP0BQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvnMhv+yX8qYS3CTq0kxmYmW1MfND5S4vAmbrKiN1+BTXpCGZY
	B+NjLQdXOnEUnqGHgdfmw0US4gsdlg6Q0BLiBrXdU9ZEm1BCIluIPH7/
X-Gm-Gg: AeBDieuaVD4HzdHB64Iyx2NEW/rrQxOtKp/mec2RPiGNgMgcf4UVGnf9uKmT9er1dTn
	fJB1ZU4RnQTA1o38xIRsu0lq12AL6Kb/wqrnMQoaw45rVo4bX0Ktn8DIwui1vJYOZ7+p2EKmIDL
	Uon0K4wJxcNjVW1u5ymhSDoIEvvOrb+fbmxptGYcAwiQvOL7xrbqiahX4rCU2eAcW7S3g+Tg5W2
	aBPeROqzDC3Q1ipag+wkBvilOBjawKtw6rd/YdVnHag9OEpBSSYtaOH/Oy/gYi35w+oo82lh6RG
	9rDe5cyDT0QrDaULV6ETmqoxAgv7tosXvRKeEo7ihhT8HsT83mkisgVtgQ7SH6zbfBegYC8/XV0
	OgcMnkIhpG+FH25Zjo1wczlXEIohfYWW0Q1n/aHuC7jDdOSJ6oZaKj7+orzBQ6wGPAo40I+214J
	kYT+D2jEivSwVII8YJCqwGUMTD5djE7vAssThmhrSggq7GfDv4
X-Received: by 2002:a05:6000:240e:b0:43d:6fb7:fee1 with SMTP id ffacd0b85a97d-4464aced261mr153573f8f.46.1777316936724;
        Mon, 27 Apr 2026 12:08:56 -0700 (PDT)
Received: from localhost.localdomain ([196.235.239.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463cb59d5esm504286f8f.7.2026.04.27.12.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:08:56 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH v3] iio: adc: mt6359: fix unchecked return value in mt6358_read_imp
Date: Mon, 27 Apr 2026 20:08:49 +0100
Message-ID: <20260427190849.14963-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_120858_855645_23AD4B42 
X-CRM114-Status: GOOD (  15.62  )
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

In mt6358_read_imp(), the variable val_v is passed to regmap_read()
but the return value is not checked. If the read fails, val_v remains
uninitialized and its random stack content is subsequently reported
as a measurement result.

Initialize val_v to zero to ensure a predictable value is reported
in case of bus failure and to prevent potential stack data leakage.
This also satisfies static analyzers that might otherwise flag the
variable as used uninitialized.

Fixes: 3587914bf61 ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Changes in v3:
- Initialize val_v to zero at declaration instead of checking regmap_read()
  return value, as suggested by Jonathan Cameron and Andy Shevchenko.
- Update commit message to reflect this new approach

Changes in v2:
- Added Fixes tag.
- Re-examined the entire driver for unchecked regmap operations.
  While several regmap_write() and regmap_set_bits() calls also ignore
  return values, I focused on this specific regmap_read() in
  mt6358_read_imp() because it leads to an uninitialized variable usage
  (val_v). This makes this fix critical for reporting correct data
  to userspace

 drivers/iio/adc/mt6359-auxadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 6b9ed9b1fde2..0e52effa55db 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -489,7 +489,7 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
 	const struct mtk_pmic_auxadc_info *cinfo = adc_dev->chip_info;
 	struct regmap *regmap = adc_dev->regmap;
 	u16 reg_adc0 = cinfo->regs[PMIC_AUXADC_ADC0];
-	u32 val_v;
+	u32 val_v = 0;
 	int ret;
 
 	ret = mt6358_start_imp_conv(adc_dev, chan);
-- 
2.43.0


