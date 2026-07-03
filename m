Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AA4C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzs61HZr2e08vLjlcHcnU81Qx3P3Xyhgqf6PYo21bZc=; b=bw8mdXN5LB2HLTub0cUdj2Zn8z
	SHV90MqfC9tbL2uOmBkWPGfMyxQTFRo/Wn8500uLYzh/gv4Pz3MvXoZcnWrh4d/rfayoovqIY1fqs
	DhcNhD7C0pcRaNBbPdJetCO5+fb0xh/L1vLDKEDugkKZsBlqTU0fUeqAGfiposd8FDWh70wEM4vJ8
	A0sqBrDDFaRG4np3HCuReHDn+C/DnJ2Y9J2k0z65zVBQjYNsAF4hFhj6zNJByu6POWoMAA9AlYRx4
	qFZOxY9u9yy4W/anDvII5Bd/bad+df3OjHPwPMqhZZ6GTz2g2GUd9SCDk9hHR/AYTnAqyUoScEjqZ
	2ZCDiMeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVT-00000006rwS-47Vq;
	Fri, 03 Jul 2026 11:56:31 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVQ-00000006rs6-3L06
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:31 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c88cc025f54so322797a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079788; x=1783684588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzs61HZr2e08vLjlcHcnU81Qx3P3Xyhgqf6PYo21bZc=;
        b=MLzp7V0FkR/aiioqiRw/RhTtPfVNJ3AavyeXzhvM0xbrkJpwmDqjJTIWITNlOJhXO7
         3okSdzylaZjvSR1Cw+NAEIPGm5AVCAs/DjP7JrHbl9dU3MHv2yJ+I/jt+RRfE+Tl4pua
         r7H7mRGm0PibBTiIu8yJLXRpGTkG6+n2Ieju0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079788; x=1783684588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzs61HZr2e08vLjlcHcnU81Qx3P3Xyhgqf6PYo21bZc=;
        b=fZOeXU3R1jwJcmmE4t954A5UYQp6uFyMmW938hXpDFq/aDP2epq9W+YGxUbAtfTsLI
         41XHk7N4ZQY5KM6F+etmVRMI0TpgcILRHmRVxbIz8ytpP5Ppek1U7dgaYypBgLRiPe5H
         jcg5L0vXFCmvU9yoqD3YwpZqd2dC4FIFabb40hMWNdRu6mQwGfdmH14omeC2lq+naGNW
         6RQqWoshrjZtxvgbF1WMQgq81kE73ekXwXHzg+BL2Mw5LmG/QZb/czcIGxfXEFPsk3Hd
         b03Leu1i+DRJrBIZ1YTVZJpdjnRuGnPVsXaEQRG8vYyMM7n4auP3TYA167s5dmVhvEUq
         zLvA==
X-Forwarded-Encrypted: i=1; AFNElJ8z3Q+FPd4l9eTQAa4yzhxbp61fqJKOZujN8790Kwg9/ZVg5YhEFE0rHlM8pcS3DwjfJrJMCzRPoxDm1sDcgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDjehuF+nW2r7MMClmVrXykVfW17MBZDnS9ueRrMB2A27Lf1iA
	ZWIz9M7waF+QmQyKtx172zhvHfbdtBW7CHe+ZZqeQWss/ivKB2vNJckJmKnQzwHp5g==
X-Gm-Gg: AfdE7cnaoeNwaoySLogTTxlEJu8CjTyQ+RzVYjmsVcZSjUzZReKe3b1RJLrnBZ39/Tx
	g3DesOQGyNeMPGFqr0e/u7VdMQ356jcFWnlXEn2Tj+7NHDr9k1xRlIHpkNJW/LfuCHrGtpjGKKF
	3LFsMOif+3iwnHg7kBm4eHZ5zDUYqXeCYYHUktvhDesUzl1SgA2byck/CVkosdcFfl9WUFLpwfg
	nRuxlEb7o2W+NDUkpYd67kgLR4cqVQ+l193qoPc2aVzk/8s933YqD9CkmVHy7He3OZdOGq8WK2v
	2DXGFmYSbWQ9pD0DTZCNcdnJLWSbJdb6NPzB3zHzs22n4MUFSSL0g/yS+KCAFaeLXLfnj2mi2um
	XjXrqirJ+2uHNBCwPyiT4qKGoR4Wrk3GruDOcraGKtOpsoHGw11Vv8Ijf2wgSA5SXs9RHvk/niU
	GMFaF80JkmE+3JQZpYzJijw8+XmJtZgmg4TKeNyZdZT3fDWvVdoQuUxiVV23Bk6Lh64Wk1DQ==
X-Received: by 2002:a05:6a21:1f84:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3bfed47019dmr11801134637.28.1783079787514;
        Fri, 03 Jul 2026 04:56:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:27 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
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
Subject: [PATCH v2 5/7] platform/chrome: of_hw_prober: Add delay for hana trackpads
Date: Fri,  3 Jul 2026 19:55:58 +0800
Message-ID: <20260703115601.1323491-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045628_837566_F7DBFA7D 
X-CRM114-Status: GOOD (  16.76  )
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power-up, with
adaptive skipping of the delay if the regulator was originally
on. The I2C HID driver and I2C OF component prober library gained
similar adaptive delay skipping. The device tree will be fixed to have
the regulator not be always on, and proper post-power-on delay time
added to the I2C HID device.

Also add the post-power-on delay to the ChromeOS OF component prober,
so that if the regulator is off at the time of probing, the prober knows
to wait for the hardware to initialize.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 8562a0e89dc6..54d8941617e2 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -70,10 +70,8 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 		/*
 		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
 		 * Synaptics trackpad needs 100 ms.
-		 * However, the regulator is set to "always-on", presumably to
-		 * avoid this delay. The ELAN driver is also missing delays.
 		 */
-		.post_power_on_delay_ms = 0,
+		.post_power_on_delay_ms = 110,
 	},
 };
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


