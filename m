Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7068C48285
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 07:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzwxVq7iqVCMh+o8QAYUgN6xht/KSR0a8sgxs8d65a8=; b=yytozqWOh6drGyOvNXsqtVwhSE
	oh4IC4KAoFjixwhF1ERS5un//fTa3K3kQTOaCwCttZQ1qxFNVbe7jUdDBzYUPzGzwaZKJSVVp4O4i
	zDu/Zuc2olkk/DEHZdLFvyCBPkyKgyP9N66DPs7MvCP7pAuO/7Vr0jJoCWf22VbN44lGajsiEE7wk
	NXEQPi/BMefw0uAU9lFyqPlNSRn5XiQyng15FYaDVUsO/+s0xR4E3X8p/YMmwMn33sq6j96NsPHZ9
	WwGFypqUwXDKNa0+cQN6/aLcOvb+1kv7K+yee/6pf2/CnTRKDmjPrkyVCYn9dxuGgzUzMbgJaZW1n
	YM97nTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV4sV-00000001mBO-1FTO;
	Wed, 31 Jan 2024 07:19:23 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV4sS-00000001mA1-3v4D
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 07:19:22 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3bb9d54575cso3535902b6e.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jan 2024 23:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706685560; x=1707290360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzwxVq7iqVCMh+o8QAYUgN6xht/KSR0a8sgxs8d65a8=;
        b=iP0Ii1b9nWiarPK0cnPn0OAxfJe6hPdl9r6m+GxGSR/UGV/g0/NUz/rj7isYej66py
         gddFA/D2ncUGEsHo0WBWDb/2gcIUkCS+akDLfA2p1zxOfhlbMVon2IEqBWD80hpbjjxe
         ecNhwoefJB904OEtKqRPq4aYU+cY5Ev2/DOEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706685560; x=1707290360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzwxVq7iqVCMh+o8QAYUgN6xht/KSR0a8sgxs8d65a8=;
        b=RrxDdiz73xOcsavuN/4g3RwJ9o5zeqNqXZHJN7JoII9loIlsUdQCeYnwDx4J62tiwI
         0SblXJJpSrJZwA8+zj95pnxujcNga4+JnftBfZuDUbPBLI2LIfCNW3cVGXggCCHu1w1w
         WnkL6ws23x7ftHxVFypu1qK6QLDWLwAR2q3zGV2n9qYIIHOiKZlbeuty2ul8OjfY+5/U
         kiwvPcE3WPOA3BxuQjAE0iye6LLpPpClINNGQHupT4wYFPqg4KpVqBH2UsDd8JfkPoP0
         MAe15c8y7kidqMoil6PeXL/r8/RbxZYexiC/d4FjW9OmmHR3ULtXqZ7MO0wuaPfkxGye
         8meg==
X-Gm-Message-State: AOJu0YxxcF9yKeh8ybp3EAMRgWGhMI2QAAJNJDX0Zx7EzH75ey3fyCik
	YaKKPZLJNhICsRetVc6iDmcwvUswQMujy0VJ3sOcCmOov6AvgjdUQJzNM6lyYg==
X-Google-Smtp-Source: AGHT+IHyEAJqaU+GNR8/XcG12RxxRrhWVX6OBK3RUeMhyMagSltWFxHBzffkIDrSozAjGcSeVL8BoA==
X-Received: by 2002:a05:6808:2e93:b0:3be:aafd:ce2 with SMTP id gt19-20020a0568082e9300b003beaafd0ce2mr1450707oib.2.1706685560063;
        Tue, 30 Jan 2024 23:19:20 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74d3:dadd:270b:194a])
        by smtp.gmail.com with ESMTPSA id y9-20020aa79e09000000b006ddc7af02c1sm9049919pfq.9.2024.01.30.23.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:19:18 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: mediatek: Drop bogus slew rate register range for MT8192
Date: Wed, 31 Jan 2024 15:19:08 +0800
Message-ID: <20240131071910.3950450-2-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240131071910.3950450-1-wenst@chromium.org>
References: <20240131071910.3950450-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_231920_994206_30BDA24D 
X-CRM114-Status: GOOD (  11.78  )
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

The MT8192 does not support configuring pin slew rate. This is evident
from both the datasheet, and the fact that the driver points the slew
rate register range at the GPIO direction register range.

Drop the bogus setting.

Fixes: d32f38f2a8fc ("pinctrl: mediatek: Add pinctrl driver for mt8192")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt8192.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
index e3a76381f7f4..3f8a9dbcb704 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
@@ -1379,7 +1379,6 @@ static const struct mtk_pin_reg_calc mt8192_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8192_pin_dir_range),
 	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt8192_pin_di_range),
 	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt8192_pin_do_range),
-	[PINCTRL_PIN_REG_SR] = MTK_RANGE(mt8192_pin_dir_range),
 	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt8192_pin_smt_range),
 	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt8192_pin_ies_range),
 	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt8192_pin_pu_range),
-- 
2.43.0.429.g432eaa2c6b-goog


