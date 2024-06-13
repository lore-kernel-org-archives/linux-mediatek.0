Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C354C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xHqGzbGEnyXYOufhYAT+1jOvdAL9AF1EdfNf7hRahk=; b=LMsrVLAjsB7+YRM11ya5eUuWym
	6FTkSYW+kkG+I2Nmh8bf837n9YwStBj9lsED7QMbGc2rUx+fSyhKkMQoyaX3HvNPAi/pOiA8VxYPA
	oAGT/ALhHC282ZmX4hWlarz0mPOWumLuEqcMSj/8c78xAPO06WewzOdKd04YZ094HA+FlI685YVq8
	GHaa1UpVmJsxXQWSJOfMl2thvas5lVlAZS/vydfREgB5WXrwK7I/n9263uJ7FBi18mDRFOCc9TLqg
	gnxsj6vqw4TyDyE0IE4RY+gYWSxTg4oYzqPFRUbw29JIyNQ5kLUYPyWdvByfeQ2riL6e9ROKW7XfA
	dL8SppKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHj6r-0000000GPTT-0YhF;
	Thu, 13 Jun 2024 11:59:17 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHj6k-0000000GPNq-0Co7
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 11:59:12 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-6fd8506a0b2so755771a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jun 2024 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718279948; x=1718884748; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6xHqGzbGEnyXYOufhYAT+1jOvdAL9AF1EdfNf7hRahk=;
        b=Yo/9bBo4zKcdCyLoWn4uXbJ6EloLqN6GwMgvPilCsoE42mraVKQ5oRj6DsoYDzNUjE
         toagoyZ9LcHp18OiUthR4VXae73iZEQEfdbmMwNyvbf2JNYON1yP7TDUjgQXkw52hsbF
         yx9Ff+uxpCQ08GqXyqbI4/vovNF2g3uC6UxwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718279948; x=1718884748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xHqGzbGEnyXYOufhYAT+1jOvdAL9AF1EdfNf7hRahk=;
        b=cCKfOOwt9Sjco2nuwNocwFhLRzKJqO0ePt7+MneaFWG7rBRRQ4g7uL8M3fmzvxucgr
         hfby9wkL+WiGFraEv/HkJzi/ZY0KUUwy6iwaI6ajhIx0cLrLt/Bk5hv33QmuhSCe0zoV
         KP2+sc2f6RoBisIVF54K4m3lL+uZg/fTZzdKujf72T3c0oieeouDhBdeHeTJ09ZaIeoa
         wFZSEasxUnt1aiEWlIRTr2o2vi1ptSyJvhYI/eJgUSiySXF806UsQVQ9iy+qybS7uTER
         buJ8+P8xD5BDbm09qr8X6zS7g9NTqOAfnCIkspsK2X4Y6Sgc0c9eA4slpM73jWg4+v56
         cMdg==
X-Forwarded-Encrypted: i=1; AJvYcCUxisgW7l6ZqflJ76OyeYbe4NvwO0PWGuYPIvCHyhedY6U/GnNSc/QiQFZriWdxikhb932TqyygI4FESd0H1WVyR+wpUdy+sF7p0R0LrZjw9OFT
X-Gm-Message-State: AOJu0YxmhW2KwW3u0g4W82Elh4pL00CIxBgG52Hyth/3FsJ/9P2XIN1S
	Fv6z5I4mm4kM8juf9mp4aqdyVjDBYMNVzgzn8QmQ9Koh8W3MvgYEaiFo8+R2oQ==
X-Google-Smtp-Source: AGHT+IEUzLyoz7lt27fPBDlUwSbmLIUoS+0m0haC8TQCTmDUAzTepAUQd32xctUWuwr+KsV5RI+pwg==
X-Received: by 2002:a17:90a:5d98:b0:2c2:4107:1fc3 with SMTP id 98e67ed59e1d1-2c4a76d3777mr4729921a91.38.1718279948594;
        Thu, 13 Jun 2024 04:59:08 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (60.252.199.104.bc.googleusercontent.com. [104.199.252.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c466c3desm1453505a91.46.2024.06.13.04.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 04:59:08 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Thu, 13 Jun 2024 11:58:55 +0000
Subject: [PATCH v2 2/2] arm64: dts: rockchip: rk3399-gru: Fix the value of
 `dlg,jack-det-rate` mismatch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-jack-rate-v2-2-ebc5f9f37931@chromium.org>
References: <20240613-jack-rate-v2-0-ebc5f9f37931@chromium.org>
In-Reply-To: <20240613-jack-rate-v2-0-ebc5f9f37931@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_045910_172696_B27DA400 
X-CRM114-Status: GOOD (  11.40  )
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

According to Documentation/devicetree/bindings/sound/dialog,da7219.yaml,
the value of `dlg,jack-det-rate` property should be "32_64" instead of
"32ms_64ms".

Fixes: dc0ff0fa3a9b ("ASoC: da7219: Add Jack insertion detection polarity")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 789fd0dcc88b..3cd63d1e8f15 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -450,7 +450,7 @@ da7219_aad {
 			dlg,btn-cfg = <50>;
 			dlg,mic-det-thr = <500>;
 			dlg,jack-ins-deb = <20>;
-			dlg,jack-det-rate = "32ms_64ms";
+			dlg,jack-det-rate = "32_64";
 			dlg,jack-rem-deb = <1>;
 
 			dlg,a-d-btn-thr = <0xa>;

-- 
2.45.2.505.gda0bf45e8d-goog


