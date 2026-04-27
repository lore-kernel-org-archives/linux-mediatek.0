Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC98FF8868
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=; b=YvbJUEKJc4h3uYARrWQguJiEzy
	+fkM7wRb94RXW+I8DRAm36mq+80BNKsy0UyH2Y09mTCyxiy11W7/gOFbbFdCC2MJEGLCdWIhAaMaa
	d6pZurUOelEZ5MR7LVKdNcKseVJIpYgieHqBaXnyI6VtZPU5OSpXxoGqlNIlQ4tJsM67esvjpq/LX
	UCzDkxU/BHzI3+dtd64+1V+kdR6qUSSHJmvjy8JUQ7k+QQr3tYBMio+XfAG5dC0d26YLOchAbwCQS
	QCdFJ3NgPrpCewaw676B/KJ/99wCqhbCKwb1kumCHvjfKExHpK+5FfNAwmxdb6hDZxb0a+3X4QyM2
	8e52+ffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPHd-0000000HOcT-2Iw7;
	Mon, 27 Apr 2026 16:58:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPHa-0000000HObQ-3qes
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 16:58:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso52199095e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 09:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777309085; x=1777913885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=;
        b=VwkZYsQlZfmVuY+N6x6ZjKYQz6/3ntZaHqp6a7VWY98+OVKxjKa9vH0ZFbShGfMomv
         /ThglZXT0NO6lsbIrXz1OT5Vh+LRynwQTvxsQXD6EndjyUzYUEb6xjRqG7i8Y0GZiiVd
         hVIi7QpUXz2kkjI8yzNgQGSxCcimMjXr+/UiLpw8xbOC3imsS3s5cFodqqMYRuxJMDrr
         ke5PUqViwaGslgqQIP3Lp0IFrQPw71bU7dqm8m1BeU5SUMQpkUPKCiRiOym+2kRlWQnc
         SJpNGHnmQFq1MZIgKkLaK+6Bul/HXEHN6HjtWD25sw9UBaID/TKxw2ev6JTbh3EfVCOi
         uk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309085; x=1777913885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=;
        b=XlNQGgx5BVGdK6jJT5QMV1IR5/TlqigrXo81Zg1Kcgi6mB5gekfvPCk751Jg32EYDG
         tA49q884Yu1ZWMZQ54RbhV0E2oatUQ/vxh7xhpiXMBAk2Lmx9WkRPVkfreWeT6u+Auor
         qSbq5F7opGsCksrRKuqvv9th7wo12oKdY9ItsXkeU/RGY1lXjQcM7X9BHOi3iMed5Ujh
         Bc/zgfi0M+DEFxTo5ZsmAfDxxu2/pbgDKIw92Vb+5vLvDIUkhrWN3H6B/GxiKNetiUxF
         FUqaw/2E/F4PreNZReCjbUA5Vd7YOhTyJlImv9I/S/oU+zBLdEIiyK9OWu3L0+/YU7Ga
         +JDg==
X-Forwarded-Encrypted: i=1; AFNElJ9LmrGpkjWihwvwvq+YTDRx2SBoHwhOF2fwarHqYkvmlRQhH1NDYZOMGGr9wVBYECrj6IlcFt85B+0cG+MlzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwihOLaFm+1Edwk1xniF3GjiLzTd9lpA+j/SwxtSoauQ1qhAZ0K
	fpWgCxoM37lzmd2v7eiu0CpDPM9Y6FPd4G/3CHyXr9GDDdoPw1nKU6vi
X-Gm-Gg: AeBDiesbwkvI2sY12ZNCz8yhxx5lxh1DD3MtBqc1CiZNf/SAq/uA0RDVt6KOMBzL13v
	RpW3yGWaigfEspAqjq0RBhI/9JdnoSMhHIXBqDa/IvPbDtPCEO7LE+7zAts262Bk7PiqHRF00+9
	3zM0/d2o3eq1goEljCCsztxmQokSMAinkGBSTb5/YhUvOKXEmwwzlfdjCcAzVMDXhcAhA1b0hlO
	wEDEJUBFGmyAmu7Nk4tJM3oMceZgyMqh01YbLuI+1zVTpCf6vO1CB54zHN8c2zWUG2q+b9oYGeM
	5+5NejEuWSNM8LCeNKoKYf3AZ0r+lXhb2KRV+FzmJtCDsn7UfjZJN0xvIafHunUjPumM4xrl+W6
	cMkInvAejS0sduwMYLQTvsmowSDkPJk1aLQwwOLGJaye5clv9nLq8UZ0QKCkGeJ9Nun37XMiWtE
	O1CgTDaWyFuGvrJPsjFpCUoAYcATsQuw2OoGOpBGeNQBbFWhBH
X-Received: by 2002:a05:600c:a319:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48a76f91970mr1400915e9.29.1777309084799;
        Mon, 27 Apr 2026 09:58:04 -0700 (PDT)
Received: from localhost.localdomain ([196.235.239.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a76f7f483sm2721465e9.0.2026.04.27.09.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:58:04 -0700 (PDT)
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
Subject: [PATCH v2] iio: adc: mt6359: fix unchecked return value in mt6358_read_imp
Date: Mon, 27 Apr 2026 17:57:59 +0100
Message-ID: <20260427165759.5756-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_095806_970997_DB575B27 
X-CRM114-Status: GOOD (  17.17  )
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


