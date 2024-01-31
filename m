Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A57EC47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2wqRnRIGXiLCSvzJZLYjMcTKthyhOO5v4D4vqmcQVvU=; b=IL2Xv9BcARM7iS2F5RrMFJ7ukK
	3DvdYrWK+Trd77pEaRX+Xyh0Iy/8TLHVTXBsQrdfqw2//Acf9jsLTIhwcxDQudjeNyOrHRxRIlUuJ
	rOTuPFZ9aoUy8C1JT5zgY2upZDOrz6dmTM1FbQZtle93x+jtL0PfT5gJudFPD9wG/vy9mnrGYHxne
	c/BdpYtdJDDyW4/0QV7MzVAtF8cFpgb5VKq+Z40fyn0evgoVWetjH0xrLw4mvi7PEcJCAp88XYAe3
	GhOa8RCYNczDCmSCV0830eCVbbg8tHKv3m19x1RHFeU9Stmz34J6cch8y4Lg6XuQWg9przYPjtupz
	xWwdDkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV4sT-00000001mAJ-0udU;
	Wed, 31 Jan 2024 07:19:21 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV4sQ-00000001m90-1wUl
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 07:19:19 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-59a8b9b327aso279431eaf.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jan 2024 23:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706685556; x=1707290356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wqRnRIGXiLCSvzJZLYjMcTKthyhOO5v4D4vqmcQVvU=;
        b=b+x/9P9Kc4huqnnrbUiY1jcfsjDhozf4UnKZrGnbphGTCmpMpYSvuQnJhYtOEjBkHc
         PZr8n/YhQSirSm69FkohGX3LRBwbVLuPSLztoWtna1K3YuhDNM0C7/S8iTHXZouUhWXV
         VbSCcpapdq7wMl4U/npOjcW+MsX5WkPIa7pSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706685556; x=1707290356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wqRnRIGXiLCSvzJZLYjMcTKthyhOO5v4D4vqmcQVvU=;
        b=pX+hROcTcBrJFYZ33ij85tdH2mTP1A0zbqTZI1S+otKE0DQQKzb3dBhxnhvyerHGkU
         3TZXqND7phdHHk34fpf+onaXhXx3NO/tmM4TK2lC14CUorRfsn4/qM4k0kmnqA7vENBF
         QXCWVOAvnGCjX/cVxHZZllPc/aAZJi1wnGur4e5XB9JIU3FmwtcixwzNWzUPPOsbHcAO
         tx+c2OAHiWHySglZjXLxoeql9yp12KRk9NI2giariQ+5xA5gbi1iOplwhKwoN6dcKWPO
         R4HvwkXhIY+tkfh0IVL8QiYIRV10qjrahrtC4VDdcWZl/cYPteLkHIbOJZZzwM+Hc38u
         ccsQ==
X-Gm-Message-State: AOJu0YyPaijy2t7OPLCF2PPa+P6AUuo3iO7vkkmmktRpP4M6C7tDzAGA
	YDfDxhbnua2mAJjy+M0JFT8k1xnp/hRIUmtGe9DNJBYhiEiEifNvHU+o54FuHA==
X-Google-Smtp-Source: AGHT+IF6hDfOWd8Jvsh/0B4DrXgvbzPeIc9dpxLSCGCQ44hmQpNs836JCIa0j3ZmA5ktz5abA8uT2Q==
X-Received: by 2002:a05:6358:7245:b0:178:63a0:b795 with SMTP id i5-20020a056358724500b0017863a0b795mr686144rwa.29.1706685556269;
        Tue, 30 Jan 2024 23:19:16 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74d3:dadd:270b:194a])
        by smtp.gmail.com with ESMTPSA id y9-20020aa79e09000000b006ddc7af02c1sm9049919pfq.9.2024.01.30.23.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:19:14 -0800 (PST)
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
Subject: [PATCH 1/2] pinctrl: mediatek: Drop bogus slew rate register range for MT8186
Date: Wed, 31 Jan 2024 15:19:07 +0800
Message-ID: <20240131071910.3950450-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_231918_550911_724C159A 
X-CRM114-Status: GOOD (  10.99  )
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

The MT8186 does not support configuring pin slew rate. This is evident
from both the datasheet, and the fact that the driver points the slew
rate register range at the GPIO direction register range.

Drop the bogus setting.

Fixes: 8b483bda1e46 ("pinctrl: add pinctrl driver on mt8186")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt8186.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8186.c b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
index 7be591591cce..dd19e74856a9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8186.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
@@ -1198,7 +1198,6 @@ static const struct mtk_pin_reg_calc mt8186_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8186_pin_dir_range),
 	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt8186_pin_di_range),
 	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt8186_pin_do_range),
-	[PINCTRL_PIN_REG_SR] = MTK_RANGE(mt8186_pin_dir_range),
 	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt8186_pin_smt_range),
 	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt8186_pin_ies_range),
 	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt8186_pin_pu_range),
-- 
2.43.0.429.g432eaa2c6b-goog


