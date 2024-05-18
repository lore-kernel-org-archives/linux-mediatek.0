Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E316C25B74
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 May 2024 21:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTZvw3qn2Frxz4VlPUYhrX9Pfbol7sh+tfbuq/yEHo0=; b=10L+fYI1wS5uoEH6bONIvHVYFP
	b5eSqaURuYNttUF9BTFcD9AM9Wam3DgaIzrZQhGNUBhKXqoQ15xpivZSwzpezgTx/ZX243+3nn9NU
	EeMScu9pBKZm8xW5WxALQvq+rep5LJkbVhbRVXXNAZmAlCtTRR/Iwu2p0TuBkxVD4jBAjVlXeX8fj
	FWglS+A2iisxzrgdPxRL7hd0MSF/unXnpSVaxasj/LyIWT2iFjfZSvv/tRnsRNiMcuQAKLOssdwuR
	pemFM/hZyElC7LS9tiruvpM0rWIoGaXLvjcLeh2N3f2UNckng18gfR0LUT+pRbCRRHEaWsAJ+XlwC
	rsRtriZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8RLn-0000000AnNG-2NTT;
	Sat, 18 May 2024 21:12:19 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8RLh-0000000AnIy-3IQR
	for linux-mediatek@lists.infradead.org;
	Sat, 18 May 2024 21:12:16 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-572e8028e0cso5818619a12.3
        for <linux-mediatek@lists.infradead.org>; Sat, 18 May 2024 14:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716066726; x=1716671526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTZvw3qn2Frxz4VlPUYhrX9Pfbol7sh+tfbuq/yEHo0=;
        b=AzSc2ELR02Cc4EErAbNxLNZ4YfSGuF8Rcns2aPtmTTOmrBDQ5OKtpF4shXmxCk/ebM
         0HbKOzXvdu8pWNj2bX8M6inwlvBo7v/FNHpY6Pi33xh+5eER0vZnpZ8RQKc1rQL0iR6I
         kPQPKEoHjVK7BbemhtT3mnX2ln4znQIuZTLqfb9zfYyr4Wf6pc415g4y2EBLUd/J0O7v
         quP2vXIKY91u98pCijXOiIX/KnU41xlEMvIlGteMkwUzEU5YK6Q1nl1du2qmYS9iS3vs
         0F0She88G87YIz6Q6koylj4X+aSPTVHHKWWQWUwT6N+zWKc8AiMFnscrDkWCey0T/vy1
         eEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716066726; x=1716671526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTZvw3qn2Frxz4VlPUYhrX9Pfbol7sh+tfbuq/yEHo0=;
        b=rGoAvJsIE3Hor6n/9Utw9HUnsWWvxI+T6O8YD0vkedvZdJhuZipDZprIRsNLf03bPs
         J4L28DcRbBvt98xVdXashDPfA58L6HYj13AQXlU5/n5+15h3OLBcKgmImA6VOhEumZvD
         2ZD3i98+eFyeKCHA8PkdNtr/dWWb/objHFG9I2QyCrsOoodLP4FvUlzMuwuXQUESEQRl
         zfZ3pH95esK/+O41K/aKttnkW1qYX2d49X5nLSFoV+TTVEHFdCQ73kJ3vLPglLb8CMAh
         fxWfvmKYCpzNJYzlWxU4phCEkVBa9gFSswhAF4yEw89CmD0OVpD1jj9nruGLLHYiNeQg
         3Lmg==
X-Forwarded-Encrypted: i=1; AJvYcCXPhcdtNZAFqjcd4OCUwpS+U1uSY0ylp0gt3AfDQ6ukftH/sdmD4vH/5lRckSdHylEevY2n+FCVY+jofIlM0VkDFpUXYLTybvJVLZCUvggu3CI+
X-Gm-Message-State: AOJu0YyYLs2hNuc0TJFudwq5ZuCbL3uhSxNlJAD6cyhNtU67ZCcJM53W
	5sYU6FIYAVZdT1NEeWc94Iz0nAKO0ZBLqOWxfPaF9fnweyeu1QabFMAQTMzA2mEVDSLJ5/MES88
	s
X-Google-Smtp-Source: AGHT+IFo5u3guueI71r2jMppcT+wjcslXSGXNTnebOHuxXpsGhc2ZBnApheROEQ5Hrwarq+3P1YMxw==
X-Received: by 2002:aa7:d450:0:b0:572:72ff:da34 with SMTP id 4fb4d7f45d1cf-5735a1c68e9mr16324495a12.14.1716066726140;
        Sat, 18 May 2024 14:12:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c323d3asm13151340a12.90.2024.05.18.14.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 14:12:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8365: drop incorrect power-domain-cells
Date: Sat, 18 May 2024 23:11:58 +0200
Message-ID: <20240518211159.142920-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_141213_993102_C42F4629 
X-CRM114-Status: GOOD (  10.16  )
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

The top SCPSYS node is not a power domain provider.  It's child
"power-controller" is instead.  Fix dtbs_check warnings like:

  mt8365-evk.dtb: syscon@10006000: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index d3da5a22c2d2..eb449bfa8803 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -302,7 +302,6 @@ syscfg_pctl: syscfg-pctl@10005000 {
 		scpsys: syscon@10006000 {
 			compatible = "mediatek,mt8365-scpsys", "syscon", "simple-mfd";
 			reg = <0 0x10006000 0 0x1000>;
-			#power-domain-cells = <1>;
 
 			/* System Power Manager */
 			spm: power-controller {
-- 
2.43.0


