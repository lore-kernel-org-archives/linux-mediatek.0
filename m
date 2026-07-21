Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4FEC4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwE3F1d5K76sODY+n24O04o43zDEBUUtH4OGbkRqhTY=; b=fhfeU2td0llqAM5g09D8mUUmv5
	EGEpZ7rhPcakAYelVMmua7kBMFdzpPw7oNheQ0gRBXQJUZiYw9MdgN9xxS1QujTyYLikDdpkLiCxY
	6hvrG52T/8roAS2gzeZy0lOg62JS1M6q/a6vfzqPzoxzzOdoqAozv6NsgiGxALZI4h/ZnDKu1Ivpz
	g1E+edV4gPYb4a7qktXAKVTNZTUiSbE84Yd9VJafbtdatfZwOHyiVsETOkWqd6OZI0AdTxyfUxuC/
	jG9pXwPrnHe1IRigvGXG8BJkHrVevsQAcslVk/poo8xHj27xSvkys2erEhMTuGEnOQINdVTzqTjUF
	hygYaO0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5J7-00000008i4H-3h7M;
	Tue, 21 Jul 2026 07:54:29 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ix-00000008hsb-26FY
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2caea3f742bso131331255ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 00:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620459; x=1785225259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwE3F1d5K76sODY+n24O04o43zDEBUUtH4OGbkRqhTY=;
        b=V5hwaXfHf9L1EeVYk70KYSG3Xr9NDOw+dXSQNSU4E7GxmUS+6n4XOoHi10BmDlxA4k
         r6X9BBzjM4RqRK4uHPNYcLX/UwXzUB5ohQd+AkOkNtmo8XI46cdicwCtsHsDtoY8W7kF
         OU1QYS4JstHE/EB+EPAww66/rKOA0YAD60TVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620459; x=1785225259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fwE3F1d5K76sODY+n24O04o43zDEBUUtH4OGbkRqhTY=;
        b=DkVvZnRv9stvA+wAA3LZLl/VABua+PuSIX9+IXkvM7H4PegcV4YZ0WA5RV9ZlPp9rL
         G5Xkj7fN++/ASH+mxTk3jfJZR8EBz0LktiJ/CD9dVHlc2WBPjWLVUoj9M1BQXw0Xv/7n
         N2TKo2p2VhDNJfAlz97om3G0grI3phgIps+aT76bd4qkHFXAi2b2kWlqof80tk4Q9krF
         p2WF8Pi2Zl4uVLQP+fW9a2t74W3xKOle9+YL9q0cpMzZ4OumuJRmjb4zVH9+0g8C3nS2
         +LhjzarRCyU3+8ZpgOKZe5t3OD0D3dNxbHL96XGRy9c4+bsGL2dmXUuI46gX/n4FT0l7
         QnDg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7rxPaWLjiCqj0sRc4GpSfdf+tIKC43NQqXT8WqYH+YOLaGO4nC7wUynwo1za+n3X5MRZiAbiTOZAri9k4pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWe7UkyHL7SY+Okde90A1/EY2EdLI1Sv3zThV1SyxgPuER1axd
	JrTnOShBOi41oUhbdeXbAmPzZW7X3mhRpYczJJIdISsT2doWWX30hj8Lx6usF6u+Hg==
X-Gm-Gg: AR+sD12KIzgNP/QdShSbpNM/+yjwhNBFUXsF6FCFclnIsK0ZsVl5sWC0rvc9yFh05Ey
	8ECYXc9KdnXnA1BzPumK71i1j/7DYA4aqTcY14AgUP6xFR6rOBxRWjse+dPm0d65LMlfbfKVH/m
	9PG4gAOSwj3QoQuvINNWmV7K0tssSeRv+HigRY4WANEUJD7qges5xIy3hWl4s0/mjaP16BpCove
	okYiTggPPBa97eV32ijOphfDcNzNPrpYe1r/n9LWo96qfosjAV7OZKFYZdgWNJKMQzuEet1epwD
	hVFFyB/+AfFu+mtlF9ok8KuR5AAu1oYId3WE0zNlfuM0B/6NIp+9YPaVoVA4zREyn/tIheQdH3r
	SAxypaL2s+6PzGHVb2nGFoqJCzVO0IDA3IrmFjeMG/PhEs5JZyjTCMYw9MHyLi9O3YPgZW9/wft
	/goAJC+kOVfQpo8kJJy70ZhB4VFHmQv1xXTCVwok6dvcNjXeZUjhU/crW7onA=
X-Received: by 2002:a17:903:1ae7:b0:2c0:e5ee:f554 with SMTP id d9443c01a7336-2cf34895672mr185287855ad.8.1784620458954;
        Tue, 21 Jul 2026 00:54:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue, 21 Jul 2026 15:52:19 +0800
Message-ID: <20260721075226.2347933-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005419_548559_D0DB3A98 
X-CRM114-Status: GOOD (  17.15  )
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
2.55.0.229.g6434b31f56-goog


