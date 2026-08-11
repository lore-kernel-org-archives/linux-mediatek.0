Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09025C5AC67
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0rjMz7r89FDG00LgKpSG7rJxKNH2nfPyMU32ONUt3s=; b=p47jOudk/kFpK3hgREeH+g4w6U
	SCMMxgENH3NLAsmvkx3hSt2ekzZ337Lz26fpKtEIAUb7CrGZSdKiNgkHQdbxwvX4SeVan2mjHxHaF
	iyj1HwOYhTKRCBdvqeknWbz2hBtykL/1lKVrWxd9ip0ucM9bsYyadiW2uJg9JFhcDIxM6A549hUXa
	ZewOIFiVHMJTpQoBIOcCp2b5NBmi9Cp/6l3lGCpnDE1TpgTqjNDpeLmixpVR8WCMRhIL5S2WyaWb1
	BL8nSjVfkTybMV2UN2aUreQBaHrPQLPyRBqfMrIWMZ7QfS6zQ2XLatUjprCyWCAciVEunivCcOMIz
	HBPG1P6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTj-0000000E0Oj-0vZ1;
	Tue, 11 Aug 2026 12:21:14 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTV-0000000E0FJ-2Hjm
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 12:20:59 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3453880a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 05:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450857; x=1787055657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0rjMz7r89FDG00LgKpSG7rJxKNH2nfPyMU32ONUt3s=;
        b=QVcA+/xejkqANHuqD6deBy3rB3wf+ox5nIp56o+28MdZ3Xqe2+3lE0Pmosi9I44lcV
         YsUOsGZsImjX8sbxfZJgyeimHcNc92oe/DzocmfmMmN3pa+VpM7nhgB7uIAKeTQ6cVGz
         +6E7fsByZJPTAAAQQn2XDdM5GfK4ayFo+0mgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450857; x=1787055657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0rjMz7r89FDG00LgKpSG7rJxKNH2nfPyMU32ONUt3s=;
        b=k4qvAt2IJbq3cb+E6EEDW9WpFa9vWDFbLP+ASc47IMmQ6sIerSjwbeSxbv2eNywkQs
         M9kyoClq5Zm1hdnfbEYELTyNDGXb4+zH+BNpE2ufwqoxPlU/tne/+aO0K4g3xb9HMhb+
         zrtC7CvsVPvw30A3SpD65pwILu0BDk/A5tkTlwW2+vJKrdsFrlyTJ0czXAIjLn7ZreNL
         qI7J4dvUhFIGz4WvlrwCVb8FKdfE40TEp4J4GAuO/FwgisvpP/iRZfjMq6JoLg0nBm2c
         rkZGYlqMivy/g3U46+h1ivUZXkER1Xl4mSFVNMj0z7F6P77WLrvp5kaPI+bi9B0z5v16
         KVkg==
X-Forwarded-Encrypted: i=1; AHgh+RqxvRPoBsAdU7ow5iVFOkRFYJzm/bdYlxlG0tZitaBcPEfRtinzUrri4RPRJdSIYAqvxkx4FEz6RYZ/AoExLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGmYkYE8uBtJBb89kVYvXvMI36D1kbTtNcPcxwOwVFh7g534c4
	HH1DTiKBOuhv1rN/pzF/aUNRncFPq1dS/kgcEjigG3OBMTeURK6T11iDLL3/TMoSOA==
X-Gm-Gg: AR+sD11b8KqqHWiA2gOMfcAtsUPWFV9W58qJKYTcRCRB1kbb/Dq9FxYs6aIxSCkPMJb
	hiVAZJnRIYH+bCKjPlAvBjzcFyK1FlcjUquA4hejp9HTDWKran1otIXRpc0eGsIlgjPxGTvUM82
	R1BUPnHjbP1xHCHkYHD4X4rSKeHYNNGiZUni5LE8EguXbMFoKbDSqHsYvYNOCWXb70MgnuBs87c
	B6cnnx9y4Ejl01ET6bOutfI8G+4SLu+LYVNum+5XM56+jnGvFTQyMe3H+66nMhWB9OnZs7nZ4zL
	XrbtovBO1KR8hzkeBBgSwNjM/BiNpPgwwmtXD+opjrJfibzCb3jBgRdXwmmU9/ITQww+sVe8a3T
	Cv7gFhlP3aSw1LjLfOoNmEk4rEyEgQO6Fh6Q+8Pcro0bSYWbW690lj3IXuVwDLdg1juoPVKmoEU
	wr7+xN4hd9YxB8Vp230qHaH2W2Ke5OPo/WJ7OqmO/IVUUB+KDrj8Ggg92k9g/wv6dAoFnH4vneG
	/R2m18npO+KymzdejEHdmfll3YYCW9xVdHNapVc+CQKLA==
X-Received: by 2002:a05:6a00:32c3:b0:845:40d1:87fa with SMTP id d2e1a72fcca58-84fa873632emr3028343b3a.25.1786450856753;
        Tue, 11 Aug 2026 05:20:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/9] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue, 11 Aug 2026 20:20:05 +0800
Message-ID: <20260811122011.3539250-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052057_613946_87D6BC0C 
X-CRM114-Status: GOOD (  17.24  )
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.55.0.679.g6767b8d81c-goog


