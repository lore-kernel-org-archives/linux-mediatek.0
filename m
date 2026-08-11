Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033B4C5CFC1
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dA0DiMJYo6Co7ip9aLY71U3LlTdqy5LziCnokKFtcGE=; b=I3y9AXiUN+DCuHBuVDVkXzsTjZ
	j9pfR9n91yzuKFzqdc+3+XdTHjKU0SHWxVmJXvFBFilkl7eCwckmRQmPGWEjw+ItXurgtsDse0NVR
	37Ni+2R4zWbbfpNjiJR9nSJUUltUCZTRpd3rL+xAusjSHX0oty0spoLis7v/KRHhgWZEfGrbOocp5
	8aj4DIzubfxULAh8CkpFMvFzlfrSKb9Te0C1Ozghqmkdt8pcbqvcULM+6Z3yIvPnMSEs7cr4MHIJj
	o0hj0GdZerrCRVFBhTBxkhiDLhC/3m+ngrYIkvMynu6PovMt/Dzax/PGQTcRdIs1p7/bDhSidzcjT
	hrhhB+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTv-0000000E0Xb-2bZW;
	Tue, 11 Aug 2026 12:21:23 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTf-0000000E0Lz-1LKr
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 12:21:15 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so2737697b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450866; x=1787055666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dA0DiMJYo6Co7ip9aLY71U3LlTdqy5LziCnokKFtcGE=;
        b=TCtCV5gjHeXquJqn2tIvJGLvg4yHdSmFc8lzIYgqgfTvsZQmr+QeakWTjH4hHwwYed
         /FD0MyTvs3DqiyurA5hZP3PJ2pgJJNT5op3ZsbjUxesNdH7GKJkmNLKZUtiW9zykjy+A
         ofoTnnsVJvgfp2LSmgMfLC3bNbiwrtWwsLquA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450866; x=1787055666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dA0DiMJYo6Co7ip9aLY71U3LlTdqy5LziCnokKFtcGE=;
        b=RHp3D2snkdt0FjXGSS8/fDcX4B8IrV+OwYhD6/3qaBivvUaLy0RIUX6FdQBFb+jSNr
         cdsi0lwkAHPaEBGt4IeFNZp0XtqrxjgaxsPOtOkebsoKJGzIJJ9strCXQyg+5p//2ddj
         UIzj1+ZoMH8gTmxlFebGsCdLGO52OPIHIhqJFBDlM/WAqHePn8CHJXGykkmsyYxhZxJB
         70McRw1L/6jOQz/VTRbzxxBl4b+wLs2sTj7HF9fIh3uxwkthEnYKtxTOi2tkUK+nQgTw
         /JRf6ek2dhsscB1QW3KZCssqxbU+d1SHxAhqB1hTN5QHRmUwHJkEbU/O5MtSt89pAnFq
         KcNA==
X-Forwarded-Encrypted: i=1; AHgh+RpgVVJPA8JaVflkMYTphSmyPaL6zrjcH+htz/8xQgZOh7qhUMxPPVLrHf6npHoluXRqmhWPU5eKq10MsGv6zA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmq3SzPrKwHJ5vIVGbEl4MEGiE5JbvXIYgHk3uL1jV6pjEVaEF
	fg9ysy3oISgVKLntBS7gfASK93YPumWV9HHPg/P9c0jnXJLTdaQDxZhMcIq6lszo9w==
X-Gm-Gg: AR+sD131OILkjxxEk2NHrco4rSiglgD85J6ySHXpj9fd872MbtAFQnGvn9/F4IcZJfl
	Et9xlCi0gAGpaLz926PSZE06/lHbSZbrk1pPWUa/Q6L8Wbjjuc1jetFFcwRXNDFlS3vb1ZajCGy
	LR6gr89ttZ00PCGv/Fq5kMHDT8Lk4XUZjVGwh37cpQrwy33PIE7EuLcM6AZ5oIyeibmJFwD8v7p
	NAIOTgJYBPwYB9uJoU3wqfJWSgtfaaCYcUhMZ+6AyMG1V9yykM9yRkkJKd3IUEtx/M54+8Docok
	DSG1gr1hFEjUzPIhgXlJmq5mFqRyjYBreqFwOTLgkQu/huo3jft8H4Qiz3tB0XU2GET4Z4QkPPB
	wbAytGojfGGUq2FdqfsPXVXXQjlaC+FLUn983zJY0Tf1xgLNMCHHo5J4AtUixV946p0Tluf3X7K
	tgFAYjfTywcmoDOkzHeXw/zczSSzPOfYNRFGsuA2CLA/Y7+Aj1lOxzQ8NXkEpIxlsr2Bk7OZz1X
	bvUFyeLs5iobvm6kkdoHzXUvAo8ACQVA1uYKIpyzqxvaA==
X-Received: by 2002:a05:6a00:181b:b0:847:8504:9946 with SMTP id d2e1a72fcca58-84fa882d05emr2571459b3a.25.1786450866341;
        Tue, 11 Aug 2026 05:21:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:05 -0700 (PDT)
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
Subject: [PATCH v4 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
Date: Tue, 11 Aug 2026 20:20:07 +0800
Message-ID: <20260811122011.3539250-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052110_802007_C600411C 
X-CRM114-Status: GOOD (  17.10  )
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
2.55.0.679.g6767b8d81c-goog


