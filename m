Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA55FFF8860
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=; b=U9H9//sG1y7HbmdPR/KLCmXsuA
	Y/jQZ1gzko0kfX03kcL6EyhQ0HMwFZnEk+8wAs1/HKuXEfQm80aemhcMKm3fB+y18m647UnkkAmxo
	7eM1TLTlmTu0+TPr/Kz1vHHnKftzjeP/qjhJvDM2/8UnpgcosQtNfccOYPP+Fb3xZft9brquakEKr
	WQ5mSoJDi8xt2bJuJ3IsXtF168l8Txw5Ca+l7pv4mkcwSSUuU8tHzqalKf33KM6FV0qSeUN3MypqO
	NDUg8d9CI3zS/ZaUuy0Rtb8s+8jIerbrAMKA8LaYTQ5k20eS59sT5L3L4pwUqi/qNrX0dSqMApDXF
	uQaHUwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPBp-0000000HOIM-2H0w;
	Mon, 27 Apr 2026 16:52:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPBm-0000000HOH7-3Y8k
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 16:52:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so137880075e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777308725; x=1777913525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=;
        b=mdYKTQKSY0zu2N52TvU/WTE+4Hge3b2wxlDhPZJw4qSQ49b4BrrFOTPOD3/oC5RcTc
         x/G41GtDDx3c2C8iAIsRldRQ3GVr1FraYqd/dcp7OqPlb4YhJI0GOxMW15mvLk7ayDlU
         0tyv2crbFiG6mQr3caeuIDYqZdos4lshS1rVwjoqVW3XA7L6LCS5yVeAUFGYkwVd6+ok
         EVEibz9NpN7o+9xuD9EnejFRkgTbIyPRhglbE7t3Ziunt8raIp/XzUVhqlqFLkPAhxzY
         ROK9OaeYEwhBdjgXnORSDbzosx9gckZvZ0NAOT5B8C/wJz093AsdEx4cIMKU9rxzPOVo
         I96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777308725; x=1777913525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=;
        b=WlGdGPTxy7eDHnnw6hS4xufU8spplH1NqKFo8kEqpmA3AOopJgGd6vEfQfqoJdtLdR
         vyIVhGmgoRpHaju5UeiJ+hqs6359ln9rmYdNhr0v/bLGEBqp6fwXQUBD8kwITtbPcEpD
         HumX5H2YjlZ4CZYXTfioXbf+Tn3Oaj3Ov7HOflRZ1GWEqGSWPPu2nOKRFdbvw/FjkyOC
         wdmg9Z02zzzypODno9v9chNpOxIi0W2JLCvd4I5EwVQfRBzwwfKtTTUSl4OAOJiG4Rgv
         1E35Q8tmi8uvO/D3sZqa0Jf7G9LX2SEes6KGVL8iAlJwfU4pU+hGw2v4N16Aam26HYQL
         imwA==
X-Forwarded-Encrypted: i=1; AFNElJ/KIlweV682+z8cSNIudAfOZgydEYaWayE7cNKWg/Y9HY+KjuE1NVdgvanYl2/urAGn619vNdKdR8aOj/erVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7TM122qxozUEijfRF0o/HXEIm83UaLKmr/w1jLUrd9HdMk3rG
	dvHIPt3Zk5JVjkzdNPlN4Jy6Fn7XDQ0HqCiThQmo6vc9n8PZnEwiB9wI
X-Gm-Gg: AeBDiet6H6rSd3LDQNgleHM6CBXYus4KuUGx6F9XurxVQHtuEYXuApwZMrmZMfRg+tK
	y6kUXvgOzdUlHeYBCUT21wX5w4XQNHXksQ2+gpcXI/JSGOvIyrfVwnkXPfuQgQCe3BFyZxNovpj
	Y+Lgxpeb4Z+hqc/tJnCJ2jxf1W+JK5xLgcyi+2xeTbi3C/y3qM9CkR9D2fmpD9a5YapEnxrP0VE
	ZeJQB0zM/y7nyVn7pj1Qv1zD2M1dmDMW8tmcpLg20JjMKV1hc5vxrKw3FuJFxIFWlAdnCvNRMMa
	QqnF4nh01gyDEkKSdx2ARYTm0LsBPQP5ppmZ6sbi9foodCCAOXMp59JTahx4Xy1zPveswB6Z9fy
	NkVdYBJdQkxM+k622gRIAtDXI8Qif5Dt1kdrrdIUBT5sIwGU5g9TTbBXQyorSVX5+90/0n8sa8F
	q7JIxEkh279iRaQE+8n/gc33XFyaPivnm0iJf0ltN7zU/89H5a
X-Received: by 2002:a05:600c:6216:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-48a76f53addmr2241825e9.9.1777308724693;
        Mon, 27 Apr 2026 09:52:04 -0700 (PDT)
Received: from localhost.localdomain ([196.235.239.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a773aeb6dsm1483495e9.5.2026.04.27.09.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:52:03 -0700 (PDT)
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
Subject: [PATCH] iio: adc: mt6359: fix unchecked return value in mt6358_read_imp
Date: Mon, 27 Apr 2026 17:51:51 +0100
Message-ID: <20260427165152.5583-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_095206_903503_4E545643 
X-CRM114-Status: GOOD (  17.19  )
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

In mt6358_read_imp(), the return value of regmap_read() is currently
ignored. This is problematic because if the bus read fails the variable
val_v remains uninitialized.

The function subsequently assigns this uninitialized stack value to
*vbat, leading to incorrect measurement results being reported to
the IIO subsystem without any error indication.

Update the function to check the return value of regmap_read(). Ensure
that mt6358_stop_imp_conv() is still called to clean up the hardware
state before returning the error code.

Fixes: 3587914bf61 ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Changes in v2:
- Added Fixes tag.
- Re-examined the entire driver for unchecked regmap operations.
  While several regmap_write() and regmap_set_bits() calls also ignore
  return values, I focused on this specific regmap_read() in 
  mt6358_read_imp() because it leads to an uninitialized variable usage
  (val_v). This makes this fix critical for reporting correct data 
  to userspace.

 drivers/iio/adc/mt6359-auxadc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 6b9ed9b1fde2..f927bff4a26a 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -497,10 +497,13 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
 		return ret;
 
 	/* Read the params before stopping */
-	regmap_read(regmap, reg_adc0 + (cinfo->imp_adc_num << 1), &val_v);
+	ret = regmap_read(regmap, reg_adc0 + (cinfo->imp_adc_num << 1), &val_v);
 
 	mt6358_stop_imp_conv(adc_dev);
 
+	if (ret)
+		return ret;
+
 	if (vbat)
 		*vbat = val_v;
 	if (ibat)
-- 
2.43.0


