Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA082C5DF81
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 04:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwfUQZyxeQn6CZecIrqNJeI2DT4d3jBF64B9NW5XMEM=; b=A25wxns69Z95SeXh9kewiYr+8l
	MeypYlhbP9hlmrkTaJktDEck9Wg8PvmfSj2+nAEvHZzvUmsQqaeOQLLsF50rrk8ojHlEID/PF4bOB
	Zfj5C4xHWbLBQEW7//cF5SynX6lrnsPSVv0GhYGATZzQ20wRVI/bNt+GUosYUlAY0chcxzkXI+jLo
	XolO6DmJhBtiuLkMdgdA6KGvwblWk3cUhHECzT34GMojFN8Ywu86B3DMlQKwZpVNQzqVKeg7fba9E
	qgE4aD9ay1t3f3xjmqcM0RS5M1C1sQIJ0ZON63Gdx+rFaAgKWB7IIzcO9uIAz/GPmQyQTjO6nLzW/
	VX8v6qTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyirD-000000008Lq-1Xwb;
	Tue, 25 Aug 2026 04:33:55 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyir4-000000008Ej-1uIw
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38e7109321dso3115272a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 21:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632426; x=1788237226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwfUQZyxeQn6CZecIrqNJeI2DT4d3jBF64B9NW5XMEM=;
        b=bzK3oUU64LNtRf9AL6PJukS21qE2VflXTJn7+T/GXsuNkdh+Eckf0mHI0/2+SYln7B
         tOW91TXXczTv0mtDZdrDuSbYZQEAg7zxKFlISq1mlkiX7sgE6lreOv45ejAmPMiUNsN+
         CGfi3oPutvIijb1tjDvlYFqnusdpd31UEsQ/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632426; x=1788237226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mwfUQZyxeQn6CZecIrqNJeI2DT4d3jBF64B9NW5XMEM=;
        b=mx4iCNVMG8B6AqrG+1xA3BzcwpXL/CFJ7GCgfNBRCY4w7EsxdM4T/VsLP1N9bp6tlY
         ACkzfwZkFd0NkaL28EOjOdBBYbpGpAPNUwXjacwfaq2kJUO3hP4EsFGkEhiuN0NrpFtL
         Oi0FX8nmssgaYtb4ftpCQzbEqSkEbO4eT135KnO6fhoOZO6t1Enrc2coOb8qQIgmQ0+D
         tI6ANF5cvqE48fVTEh7qaJCuOSn3OGQ4TYpGu8swgnvw/YNJzGirXkTqasO1wXK2jGHV
         zNmgINSM6gU14e8T9BJCQB8xu15n2g2X0jo4lri2sR/cys2xjSC0VxOAomJMHKQCRb6W
         pY/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrsJCAVhFaTxkqad7qxWJu33YjGGN8vx8TXbUXoojKMki1Oefjy9x5U5RFEoiRwfBcjfQp0pzR211Xsy/dyeA==@lists.infradead.org
X-Gm-Message-State: AFuF++kbNQJmImWv4uqYf6yr2Z93qkR0o5iInOTSe6mJE6KtGq5HQrYX
	Ahw9+SASZguLJ42b4WFEC5HVzOogwV+QaNnmY7QhS1uOzbrHVJGYfdKm+SAubfMjsQm/z3MiyR+
	I3bI=
X-Gm-Gg: AR+sD12rrEUEmJhmRvv2zFanafXaEe1QfylsRZ8hMi36pEV4QxdaBc/M7Sn2eP+HzOH
	z/JwcBJGv0MvnaKcKiwWy20b6fLoqxNBEKxvIomGjY7CG+yn4YizWoHYM2kVU+Uel/9nwAfe9Kx
	QJsUuzrmJ4PH5tB9vGS1rvNMBURJXUHvOxn1mZJk0bxccfQyz4SZw0Rd3Hc3Uve88PZm3rqc9Yg
	mp9uh958Wc8BfwB1FLVWLG0GHOD6HPIR2BkAvHU2wL4KNqwva8HHxRM51BkA8aVu9T+1nsEO3wE
	QqpumXWm3L6VcMqM1udmWTJwHjbTKfq/bHGAVLpp+y3M/Nc86+k6Bemod44M3+9lw1nVHVkb2+Z
	zCPFH+kKXS3+qdg25CZtc/2vRaklCXL/vwqrmJQ2/5x4w2zLZWPrYBCmod7zHX8XQUzd988vwN4
	VI0CjY3uAIMZMFdSweXCfcIXHX89sYJGh1EjeIL9682AjV2VhpyOn3wBgXCznhn4ZhyoI45k+KI
	PSIv0DxtcM/e08lbVDFhroD9bZbP8aYR5O+wpbC2HTGhiUpEjjMiLw8LA==
X-Received: by 2002:a17:90b:2e4b:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-396464a18c5mr7911836a91.10.1787632425871;
        Mon, 24 Aug 2026 21:33:45 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/7] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue, 25 Aug 2026 12:16:22 +0800
Message-ID: <20260825041628.988369-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213346_502459_1349DA5A 
X-CRM114-Status: GOOD (  17.39  )
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
2.55.0.860.g4b6b3295ed-goog


