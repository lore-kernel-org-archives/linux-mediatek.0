Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53891C5DF9C
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 04:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oxe4lxlNlfZyQDAPdCLYOQIha/yPu61CBjEM7zjIg/A=; b=3wBTRcchn5mrvttRxCxv95L0zz
	9Ycbce0lJhmPTblbUZBNr9fVD2gydRFUOGm7SNifBT2kJNeq5VVdIcIGgDqzTs32yCfm8QfKT73Dt
	pnW/cog0VpOFtei/SjJMEQR3sUGK87xpEol2eWQUmupeq01leSobAs+93QTNWkfN3+RZjAbxJ06HC
	HG9RmDE/wBaBo/MXqnqtR44LxyUKFBcLjD4Q8VghHD9gLJk8jF+YoPSVG+k5mm7v9Y5j/F5THhhzV
	y9mBvuYs2h5VvhY4BO2oB2X85HtoIhSE+ga6x/gtDuTG8zX1jruJJFXe2bhY+P+G7VNyh21P2ePGF
	bvOetPBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyirD-000000008Mo-2xZH;
	Tue, 25 Aug 2026 04:33:55 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyir8-000000008ID-1nUJ
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:52 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38e347638adso4093814a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 21:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632430; x=1788237230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oxe4lxlNlfZyQDAPdCLYOQIha/yPu61CBjEM7zjIg/A=;
        b=FIWVfFyZMm7ZCFtyLOnx2wR/EHrq7zDwUMLQV8ybkWKII0bbYSfz0M8zUhkoeZ0Rks
         ZY48moS3+AJjR/g2GEEUv5bHltHNhhpt25Q2fwxcMPB7vXm9fG0XHtN0IH+mQkJiRCn2
         lki5+JFG2er/Poio0/GB8A2p9NqlayoY7HwEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632430; x=1788237230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oxe4lxlNlfZyQDAPdCLYOQIha/yPu61CBjEM7zjIg/A=;
        b=D8w5bZVCgdzfvuZbmKoySgDbSG+BA+9TRVtAaTsxB3n8nPHMxImmsf4nG+V4w+V40l
         Bhv/i+k1K/HbdoIpQz91sEtaFO4RmHd01/799u8AiMdTfr9u3ypdkx36ukS4TnMDWm4T
         0P/9Fn2zekc/bJq/l4Ur1SQcQh4zUnfx3lhUSbAE+bWAHpfLkVSag9Eh684fvfIaOolN
         xqtKFZdmcTp4YGhoEiLx08UAAQh2L2MFqpBlIcjHIVS0uCuWkg6KDmGWfE5Rbe5ZPIO6
         3kbh4+0gKUwakVkddLGYquyQ9U1tQdp4mFAxWhpwJo52am6dyBEj4gQtNiJz5tpEno8U
         4wZg==
X-Forwarded-Encrypted: i=1; AHgh+Roik23Ib0R3laTopWB834v2lUaGNoxtGhGxyrrNXSwo1sXJt1fhVCIcKOSMMATQ9tXssDc9+nON5v5PQtL1Qw==@lists.infradead.org
X-Gm-Message-State: AFuF++nb4yB2eN4R5B56VXYcPsETPkqSqDn36YT8ol8a1c1Yrzw6FIP+
	vtsYmZ88kFK3id2rbtTgsz5H+h6lrFZrDe4LjiHntjUxiwbtdsHEsEqVfn7Fcub7hA==
X-Gm-Gg: AR+sD10+9xGtkLyB8HCuphPgNxxKLSMTh9htruJ6tC4WUpqG3j2HfvlGrZWQgonRw83
	XIy1TSI2co/CQQO7KpLCnKkROxIskQvly1vx6IYTSb1+yeZv/saZIfIjZTVQX+Xy+Og24AAdVKL
	8pjrdYLNbb156vGs0HDXoX5LFHMOByGf/UmsGbBNzXds8/JCgh5lzwPfaycWqqeFNBcmSd+Wr9o
	HAijjnDEG0fk0AzzvRFzkMzihjiUmsaOava/pFV0QXXyu4yOLbLtnh+RI+xEa4WSyWSQs3p6ZzR
	Zh/3UoELvkpK/oMibFAjHo1roz1U+OSA281JtrSERKnqO8wyKxyjOrP0V2gjbZJ/7FIRNJCGPdw
	GVI8UkPBHox6Hhy5PW84TY/bZn3OdIdeSh8ynRrcOOWgp3k6n2hDhd5OgNoOKiCU+54IWGb6HpR
	PrrGRiTs8T/RRaJSwR/hQ8EvMcj/wg4xz2BuJKRLeb9ETselAOBT5DF8DHFoa39sacCv0IqTmOq
	VlDSoTJAcOy7FkuguFWDME/1W301AUQ3QgitQaGat5FsD8=
X-Received: by 2002:a17:90b:280a:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-395dee56103mr48478004a91.1.1787632429764;
        Mon, 24 Aug 2026 21:33:49 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:49 -0700 (PDT)
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
Subject: [PATCH v5 5/7] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue, 25 Aug 2026 12:16:23 +0800
Message-ID: <20260825041628.988369-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213350_476291_56350EE4 
X-CRM114-Status: GOOD (  21.19  )
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

When a I2C component is found, it's device node is immediately enabled.
This triggers device creation and driver binding. The prober will hold
the regulator enable reference across this part. If the driver probes
synchronously, then it happens within this window. On the other hand,
if the driver probes asynchronously, there is high chance that it
happens after the prober's cleanup function was called, in which case
the regulator would have been disabled when the driver's probe function
is called. This would then require the driver to wait 100 ms for the
hardware to reinitialize, even if the probe function was just a split
second late and the regulator was disabled a few milliseconds ago.

Recently, some of the drivers for the component that are targeted by the
I2C OF component prober gained the ability to skip waiting for hardware
initialization if the regulator was left enabled. This happens when the
PMIC has them on by default, or if the component prober left them on
after probing the component.

Tests on the Hana Chromebook showed that if the prober and trackpad
drivers are both builtin, then the time between the prober enabling the
device node and the trackpad driver asynchronously probing is between
5 ms and 30 ms, though sometimes there are outliers exceeding 100 ms.

Wait 100 ms before dropping the enable refcount on our end so that the
actual driver has the opportunity to catch and increase the refcount on
their end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Added commit message section showing average delay needed
---
 drivers/i2c/i2c-core-of-prober.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f9f3c0ef93ff..68c929b16b06 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -235,11 +235,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 	return 0;
 }
 
-static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+static void i2c_of_probe_simple_disable_regulator(struct device *dev,
+						  struct i2c_of_probe_simple_ctx *ctx,
+						  bool defer_disable)
 {
 	if (!ctx->supply)
 		return;
 
+	/*
+	 * Wait a bit of time for async drivers to probe and increase the
+	 * regulator enable count. This allows the drivers to check and
+	 * skip waiting for re-initialization.
+	 */
+	if (defer_disable) {
+		dev_dbg(dev, "Deferring regulator disable\n");
+		msleep(100);
+	}
+
 	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
 	regulator_disable(ctx->supply);
@@ -356,7 +368,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -401,7 +413,7 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, true);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.55.0.860.g4b6b3295ed-goog


