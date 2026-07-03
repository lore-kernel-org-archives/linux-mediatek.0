Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC62C43602
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZuI6x0GxmbjrjyvyYJDyx48WMW5UeshcsiZCb+EBSg=; b=ZTDxa1B+wrc3b0STI1XT0r31Y9
	Z4jTdHBqTsXyyzoOSpCPYeZouST+SfiIHs2Y5PCtuG/NUZJoEINBwTToZ1bZBoxsEzUYvt2VJqoyW
	KKcecnQAj9iDj9TW2G4PJ+U85YpwzLtDBbqbog+oPeE2VzGugOixf2b0B1U+Dmwr8s5twZpS1uwfG
	B/TShl/GUOcevN+B+Vyeu6u8ttRtwKWDGpeRaCGqbM0+boQHEZo7FzsPvOuj4p91YrZBwMVNRHe+6
	awNM8w/suWtPpUqPCdT1Gj5TS/Vc7IPZspuEpUofE9HEmfSo9Q85ndMvAoc4HNkHw0ZjlWYK9VMjA
	+xx2WFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVL-00000006rlu-0N64;
	Fri, 03 Jul 2026 11:56:23 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVJ-00000006rj4-153h
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:22 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8453427d3f4so353989b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079781; x=1783684581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZuI6x0GxmbjrjyvyYJDyx48WMW5UeshcsiZCb+EBSg=;
        b=ZPI+JUko5FIkUuuXUXUFArsaoOqogx7xWgXky0iY53Lxh/re/tZ2O+7WPk45GxgWol
         VVdqO10eP/G4bHn+o225jZtWNu0sBktNmqApEJPYnzxmwStwCTPoSoN/HVIrvIil/21c
         W9RSN4ci8NTpW8OxLMxI5vLWJo/cbyRMlg27c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079781; x=1783684581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FZuI6x0GxmbjrjyvyYJDyx48WMW5UeshcsiZCb+EBSg=;
        b=iog0sYBbewOq4SQw8Rbf/d+PMJGyaAGJwvDozcW9eCUc0WMoEcyTnuVoGyLZnjt/xt
         MQlweLormeg8qbNaMQQrdq1VG4PFr75SzoTgNxM+S1TNI77TGhalOEE9HbobLBmu/Hmz
         kb1sg/kiXApbbrml4mb8hgUWvuSgzQS82pab1/gR6f9Wcz9VALg4HYIpvT9pVyw28vCR
         p5Vpt3vHqLGSmmUkigLiIU/eYA0WPranEmTtF7P3rqMaH+QSwlS0Vnnv71wg4SAEW3T9
         +jOtrj4K9J20edvX4tWr1dXehQEoK0ReD5iQMchHmReXFlEMCuJLgFy1UAxNTihhaPVC
         OvgA==
X-Forwarded-Encrypted: i=1; AHgh+Rrilit+3wkT6csmzfEwuw2E/D2MjsHMz4CFhhrF4rtfr+s/lN/XaL4O74bS5s90GXcXdrgSc79muiM6jLORYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9r++z0snU5Do8zdLZLn7RLPAWaYF8LnCGJlLmC4To9HYHPrAz
	4hPYStct41NN7ilcZduGkVMoUKXw7gKjZepbVv1GpqGAKhwhoSGOObMmnT7WpGOYFQ==
X-Gm-Gg: AfdE7clsiwPH14i7mKMvWhZnDROPlJ5zbNRNR5JXG7XU+BdsNREvmKpT95QOpNYmW7O
	oqHJKcUtarA2hTxapE4Jvw1xO+NjPes3uVj5mw2to3KFXhKCDund8MHxrepLBvgONamaODpt0xU
	4qFdVq92zM8IkE8BERk9Vow9x7oM9VscKrp0YRDfsdLymw7jIAF2x3lQOHXnS9ZH7q4lfQzgkzK
	6TmbS4rcphbum+8RA2UjLN6Vj/FEWu5tlMFFAcWp/IYRxNwWNtvtPiMGQB70tjprIY+tZuqREIW
	QyLWO9iTYiGVqv9bM7hR5yFg09xfl0Crre9yqfPO5T2i0GniMiWFLLq39B1e88HeDlVIobXtQB9
	0dZft94fv7ZYzBCLN1gfNatOWEh4OLHCbLILV+1a3V1OkrwD6lFEvo6W4v1PrK6aKLN/NN5JVVw
	YZixLvPvyelhHpzJP7AG87qimrxQ11BRHAM3d/Mpi9aNhVEAI8V/FwHGcmGRvTU4GAsf+FKg==
X-Received: by 2002:a05:6a00:94c6:b0:847:902a:57c1 with SMTP id d2e1a72fcca58-847c0ab579bmr10089691b3a.57.1783079780697;
        Fri, 03 Jul 2026 04:56:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:20 -0700 (PDT)
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
Subject: [PATCH v2 3/7] i2c: of-prober: skip post-power-on delay if already powered on
Date: Fri,  3 Jul 2026 19:55:56 +0800
Message-ID: <20260703115601.1323491-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045621_298668_0C56A325 
X-CRM114-Status: GOOD (  16.93  )
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

Instead, check if the regulator supplies are all enabled, and skip
the post-power-on delay if that is the case.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/i2c/i2c-core-of-prober.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f274e260353c 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/string_choices.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -219,19 +220,25 @@ static void i2c_of_probe_simple_put_supply(struct i2c_of_probe_simple_ctx *ctx)
 
 static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
 {
+	bool supply_was_on;
 	int ret;
 
 	if (!ctx->supply)
 		return 0;
 
-	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
+	supply_was_on = regulator_is_enabled(ctx->supply);
+
+	dev_dbg(dev, "Enabling regulator supply \"%s\" (was %s)\n", ctx->opts->supply_name,
+		str_on_off(supply_was_on));
 
 	ret = regulator_enable(ctx->supply);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
+	if (!supply_was_on && ctx->opts->post_power_on_delay_ms) {
+		dev_dbg(dev, "Waiting after enabling regulator\n");
 		msleep(ctx->opts->post_power_on_delay_ms);
+	}
 
 	return 0;
 }
-- 
2.55.0.rc0.799.gd6f94ed593-goog


