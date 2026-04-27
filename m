Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55563FF8861
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g+pkBk61K0bONezvT3hKFR4CsnavUHfQ0OwvNOKj+rk=; b=PfEhJs9HtifIoUSw5DglBkU6CV
	tlpb2hIJ2iA3SoAWS4tJ1Feb7dxh/LhFwz+5VpCtQmXst4zSeKHdRy/C1EyB+Yf30FpDHijf29Peo
	b9TsUEEzoM8+5qlOEXWRJa6wFG6I385KCdD3Pmwqyuzc7NmS8HaEiqx37aBU32bzJLEKyIiLwTsEp
	WmG450hjIr0yjJVweaXskveh/a7AhLoq5fn4FuU7H3b1iAYpvqxB2Bix+yBlSXVgASHEyW9usM/Ke
	nQEI0SJo8+MPD2UkqpBKOCbJzyCn3otXy0RNjBrGLWlRppjJRpONgMBAgK/8+Lwhx6omUrVeXdEIl
	QHwgjBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHkL-0000000GVZ1-0XD5;
	Mon, 27 Apr 2026 08:55:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHkH-0000000GVVA-2ar3
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 08:55:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso73390805e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 01:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777280111; x=1777884911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+pkBk61K0bONezvT3hKFR4CsnavUHfQ0OwvNOKj+rk=;
        b=QihJgHVAQs2ctx/d40qXO8uUuMGHKjDMUrh62DZdlJNYBwea3aADeXk8piL5HNPoYf
         pZ46ZjdpTR5PsTRfOPC6euYPoZY0iWImDD59dVqpY4TMDKUKNzMz7Ly8At5vXbLbb/4D
         CqeqUaVrc4mea3nZnKYyDlEZO8c/lBVf9PYP+9yNdE2tzGlBAJop4McnsJ7Eul8Dxv8R
         96jPlwSai8IRMdD3leSKzN2MYyMKbjN50fnn8AKaqni9jsw2jKzfriBZm+rP2PSbE/YQ
         gCd/+uJWtDjLwRQ4kZm9DhQuFzjRXdmap/4cazWNbvg2TXE/87s/prNX6E7WaSaZ+iH4
         qTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777280111; x=1777884911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+pkBk61K0bONezvT3hKFR4CsnavUHfQ0OwvNOKj+rk=;
        b=nAJTH9cbnDJLCNjYOXem82xOoWeZ6viYAnSWr5BMpCXn+wqz1XelRmJEEe37WR7cWT
         b5J1WI8GCWT6btij3uBR0kLPewiMSCllReQNzNlgcscowvD4zxU4SGf16UF2tNpe/KaD
         xyyKQtcfFZ38y7/UJnZ5fzpkoqYsN8Ni61w9MQ6B0ZUuP+qRmvFtWxrd5p6qmctGySuq
         0sHSaTYmOh5ztmWIejS5bDjPliYocMJuvduZOaJwWQ54Kt1ISJ3xo/dDF/bVNAmft6BR
         gh2tGIf+yGoykR+SWAqlmu2ZWj2raUV29i+Ozpy7dv3Tw9CJ4Pk9ie016aBgMN7YgrOe
         tusQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uV6dqi7zYNpbhAXN2RB1WGDC7M4rpv8A+SFJYcHz5JySqqGoJTOwAMdeduCJsDvXPQy6iWugbh1fXDrKRiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ67UEjt/liSsT/MG4jHkWYsXQJsrx0YhlBXhBKSngq2frwlQE
	C/E8yrxPPEviIf3PEYiMsjKK6JkfGgdZIoLRsA4Xc+n/GYkmSGJfTdwI
X-Gm-Gg: AeBDieuW53Wbw5+fqzR0/a3hebulkqg5R4gMIdd/nxnk6+gLtjIQXgqaZ24fgYJ4ipX
	jusT2uDdHtjWvxM8G0D7qk6zr2uAIailgY5jMBSGTSITxW4Q04JjYbej6NnP4J+WMpJeEuA4/gF
	gFTh/qLLPU4/M87BSh5A4bpSbhzTl72Qpv/pUb7VrHe4laiwwJ5YZ5n3wpOIJl9QgWydRkFnDyj
	RQbsWIuhXvUb6tWEsTncAMZOvAXovj9aq6vGEiusPWdinv1uG04BlNzmPsSYyruTy780gyzqrsE
	iGzQR6u4nX/EPcqJN3Fur3USoG++3hG27A20MvVft1Fy2E3CiJ6Wt3TPqKxrqBJKe1+A9PQl9gG
	FhH29qb7knns+5okKuM8x3A8WbBVBRZ9J+4w283EF/Tja30mhP0i3aH9HQX7zDuQ22jJUTM+ktc
	W2uyB0OC9c+t7CjfaMQsUHV7se2ZvGpgkMDNlgfAyYU9eFc8q1JC+lKuUXPOw=
X-Received: by 2002:a05:600c:4a15:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-4891aed16d8mr269026355e9.23.1777280111056;
        Mon, 27 Apr 2026 01:55:11 -0700 (PDT)
Received: from localhost.localdomain ([196.235.152.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d5b1sm82248879f8f.30.2026.04.27.01.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:55:10 -0700 (PDT)
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
Date: Mon, 27 Apr 2026 09:54:57 +0100
Message-ID: <20260427085458.38546-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_015513_674728_B3710F99 
X-CRM114-Status: GOOD (  15.33  )
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

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
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


