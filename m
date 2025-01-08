Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98461E77188
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hfaIU/yPmRs9H27LP1GQSu+5nTkg84M2KD+Fv53tNQ=; b=hXjdTfWoJhWNFT9R3HAtNtPbIE
	GlZoDdQpal6BaVwqxFN8FrWKATM2IQrTMaXjwRL+UefhDPFFDlf9p9XYVEKdyfbN1f+HevvbaC5fL
	ANiRv3yne6l0C2FykauTRsa9M51A61GIQ0F/h41deUNVBhAJVawvapjVNGMntgh42ZATJB8OzenYM
	Uwvo649AgnRMGXO/En/jzyCjt4DbwpPfp6V1vQTR3t1ByIA9bRcgeufyZG3RAXxGyKLRzlwnD+UMY
	Itm6wW6FsAyKOhcVOFONgmzjrNMp/uJO2RS+lwME4BJZpIeKe64hnYLFzf2t3cU3OeOPwP0NsE4Zp
	hxKKOiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRYh-00000007aYI-32yx;
	Wed, 08 Jan 2025 08:36:59 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRWK-00000007ZgG-0il4
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 08:34:33 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so939410a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jan 2025 00:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736325271; x=1736930071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hfaIU/yPmRs9H27LP1GQSu+5nTkg84M2KD+Fv53tNQ=;
        b=Muv0luNP15mtRNC83ydUQ5OPxi38FZMzZfLlR4NdA0+Jvgdu+X2PI42aY10odD8Q/A
         bMv8/lXHboVYo8LaB2sEI7NRV+SrtKqSxD3VQGpVqlIblVlDJFOgrMBQ3MYHIzr3MomJ
         X7Pqzo04slHPwTdhWfDg/fMUb1+15lhkaVN18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325271; x=1736930071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hfaIU/yPmRs9H27LP1GQSu+5nTkg84M2KD+Fv53tNQ=;
        b=o7PKHBN7JPe/Qi+NmeceMaX7Cb1+kDOwmU6No0IPSqUz4JN6XQSSlwgJ2QfbOMH7GM
         F/sOQ1Saqg9VjgtP3a3lhZVTVx9l7FNe3fhiBTbPf57yLNCtFAf2/aP0QD8CygsfDJ+R
         y0n6NNOtGV8HGs2rJmOtQSaTpcEzbM9hGswzwcIlh49DDGgDC2zwi/4EcG/rqiOBJcMw
         EjirtHYigTMTNkosYKTtczvwfqqHlKoFe6KyczqyH0mZlrOb3VGE27iYPa8IDgKR01Sw
         yl8EQ655HYYb29u0l0ddjbLWq1kYhMHR6WLI0vrvQ/uE/24+bqysWTy2TTvZ9y/0Q1hO
         LsdA==
X-Forwarded-Encrypted: i=1; AJvYcCXYkx/PZew4q85hgUbzdUd2COw0tHVeFpbgGtFs57SWZ6A+N0Xu8nQQQUQsujS9tVvqPrEEG5C0FqJjwe0owQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0kyVVBN2i2Z1H0oxnoElnLWF/8GI45JRr5UckAUBumRr38jHL
	bNek0TAHaQJ/IQpwAQXQWR6eHlGuPNJNSQdpjOC6VGkmiFv3BzD5gngs7pPvGQ==
X-Gm-Gg: ASbGnctx9aA3RFD5fdBp4JpTpTw8mE8TCFHKq1Zyh0VSP48RrTW1XKo64FsvGGGISdR
	eJqlrq+QSFmHZqhfA26qZT5W34vapjhAPd9NWX8P2PoT3xg3v9m5K50SjMHSCzFDcOgxADFvnPp
	RuawJ7WP1mMWxS85R1MzOFnaE75rbwXC6BFv+Wz38Lf8LfAmzpe3/ljfehT7RoI00Gh93P5d5Sm
	NaubQ3jSE8yA1bKDTjh4AkYE1b7p/Cx2ThhaZpkp0V296pfl4x7z6YPUUWfdpC1k3jA4DH6T58=
X-Google-Smtp-Source: AGHT+IHh5Ox0Chj79W0aML3FVEC2y3iYMrkJc9FjsPLlxqd39yrbKX0TlyMbXPcw3G6R3PveYRKL4A==
X-Received: by 2002:a05:6a00:aa05:b0:724:db17:f975 with SMTP id d2e1a72fcca58-72d2174e8a3mr3807524b3a.12.1736325271398;
        Wed, 08 Jan 2025 00:34:31 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:511d:2d5f:1021:f78f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8361b7sm34602275b3a.74.2025.01.08.00.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:34:31 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	YH Huang <yh.huang@mediatek.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8173: Fix disp-pwm compatible string
Date: Wed,  8 Jan 2025 16:34:22 +0800
Message-ID: <20250108083424.2732375-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250108083424.2732375-1-wenst@chromium.org>
References: <20250108083424.2732375-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_003432_209923_DEE97140 
X-CRM114-Status: GOOD (  10.97  )
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

The MT8173 disp-pwm device should have only one compatible string, based
on the following DT validation error:

    arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pwm@1401e000: compatible: 'oneOf' conditional failed, one must be fixed:
	    ['mediatek,mt8173-disp-pwm', 'mediatek,mt6595-disp-pwm'] is too long
	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm', 'mediatek,mt8365-disp-pwm']
	    'mediatek,mt8173-disp-pwm' was expected
	    'mediatek,mt8183-disp-pwm' was expected
	    from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
    arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pwm@1401f000: compatible: 'oneOf' conditional failed, one must be fixed:
	    ['mediatek,mt8173-disp-pwm', 'mediatek,mt6595-disp-pwm'] is too long
	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm', 'mediatek,mt8365-disp-pwm']
	    'mediatek,mt8173-disp-pwm' was expected
	    'mediatek,mt8183-disp-pwm' was expected
	    from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#

Drop the extra "mediatek,mt6595-disp-pwm" compatible string.

Fixes: 61aee9342514 ("arm64: dts: mt8173: add MT8173 display PWM driver support node")
Cc: YH Huang <yh.huang@mediatek.com>
Cc: <stable@vger.kernel.org> # v4.5+
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 3458be7f7f61..f49ec7495906 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1255,8 +1255,7 @@ dpi0_out: endpoint {
 		};
 
 		pwm0: pwm@1401e000 {
-			compatible = "mediatek,mt8173-disp-pwm",
-				     "mediatek,mt6595-disp-pwm";
+			compatible = "mediatek,mt8173-disp-pwm";
 			reg = <0 0x1401e000 0 0x1000>;
 			#pwm-cells = <2>;
 			clocks = <&mmsys CLK_MM_DISP_PWM026M>,
@@ -1266,8 +1265,7 @@ pwm0: pwm@1401e000 {
 		};
 
 		pwm1: pwm@1401f000 {
-			compatible = "mediatek,mt8173-disp-pwm",
-				     "mediatek,mt6595-disp-pwm";
+			compatible = "mediatek,mt8173-disp-pwm";
 			reg = <0 0x1401f000 0 0x1000>;
 			#pwm-cells = <2>;
 			clocks = <&mmsys CLK_MM_DISP_PWM126M>,
-- 
2.47.1.613.gc27f4b7a9f-goog


