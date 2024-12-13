Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5674AE7717D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2024 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6t03VSo/NkHlsh+FX0CoPxMU4wWbqRd5I1nezIlvOp4=; b=xqKdVpyV/J1OQVyDirRoANvX7+
	WA9BXsylyYSmf/4+2cWQO2DmiegFQOwO1X43eAZ+iJig5fzCylCnr1Wt2b6ZGA2D61uDqEcagW0Qg
	v5gps2Embv9hriva21plvv6tclzA4CjuaQ1pJb3Mbf2wGFDzAt5CDA800LLcXTKqmxozCS1DeW3Xe
	BOuX/Oz4LcGja6v2VehWGS8qmmz7GdXPqOBPpz5LPitJ/thzgtB5/auctWs1V7/le81ZEbv/8QkTb
	zE8nMjhF7ETfzu+WL+d9w3Wt+UqKaWxyouQTr9EQjOOM0vJfglUCYiVfHrp4rac4C4o5/rNRHBLnZ
	liH+cl9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1zF-00000003GIB-1hwr;
	Fri, 13 Dec 2024 09:29:29 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1zD-00000003GHQ-19vs
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Dec 2024 09:29:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2efded08c79so1100536a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Dec 2024 01:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734082166; x=1734686966; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6t03VSo/NkHlsh+FX0CoPxMU4wWbqRd5I1nezIlvOp4=;
        b=RyO1qThkOyBnRtyQsZE5QvKU+qQIbMsZ+zunuGC/VhV02yrbdwjxgjH0HD2JSfinCc
         dRbECbC380eZXmCfn5v56Km7JkHppGvlxPxXX9ozT/sHXPvHnwIUxctnhauLSEIkLwtT
         0sUo9w0fwBWunHpRXBl+KV6XbR21q6TsaWTs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734082166; x=1734686966;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6t03VSo/NkHlsh+FX0CoPxMU4wWbqRd5I1nezIlvOp4=;
        b=RNlfj1KEih5M5KbT6nC/Te+YVEnYr1aRnh6mAAvet72gD6xnz8Ohw1YRln5iB72V4T
         lFmkaW1Fz+PcJx4+q2ZQ7JK5ZYz+Eo9ighPCqlgMbumnvBtjLdlJKEJYb+XrPnnkIyGZ
         D/iKYf3XFjNGzJ0JdvlWZ8eiB8EWQyOQlS5JONDmPbLKeytn+ktTyjiVP59MwtaBOhT2
         dUV3VttyHcE9L8KshsWxQX1Fbfz5yYsnM2ltBLYenIvs3dBJTk+2SZhVmxGPutAkviPd
         dDSlXmJs7IpkZ13kpawpqCG3ArXukAqs4Kn9kfgahZ7Ygd2jLWej6aVXH1MoGk/PtS8B
         lsYw==
X-Forwarded-Encrypted: i=1; AJvYcCV1ftbmMVii/Dpin8g30I05sy1qq2o+2JcaEJmrfexF/uAsOxuQVeINLGDpplr5rKMl3f89Nvh6gfKpBHcAKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWVPq2swIhFYJzIju5W1wyn68r9EKcfTy/3jIUz/2j/W5Ukx4K
	16PPnUQbfMfl0ZMr8bBtUDx3cyUQnzBoI1xCxX1RHxOMjKc1hQVs5Ixg0TaDfQ==
X-Gm-Gg: ASbGnctgzZ8YDcS/9nOLSOgeIs5cjdbaA7P/bu6RinsNLkn9bpLVocS1BUjQ8U8HzzG
	1rNHk2TYAgdldIZ0M/emV0nL8C2ysshVoUC4tkOk3RDjjtx9M6zTZeHBp4lXRMAQKqP5kxCnZUf
	VWkBXZ2rjrlbjdTcCv0yb2BgsiIu1mdZ9CeS+GvGMse7VyZrXg1hDYoFgzfFjVJ5/VUnIfV6QPX
	xTbH2sQmq3G8ei/Kq8eteN6G2Brf/H8rptmjHWGETTzKrOAmoRYB/dtowe0umPy1OzakGvqw5Ic
	pgkME5wNYKlukm9Tni84hYi/r2i2VqIEzIXCqj2uHvmg5bs=
X-Google-Smtp-Source: AGHT+IFVvckKPZkGAO6T5Pb8DWTggJU8BHRz85vU+mCYNsL0QexjIl0XaTItdT0xzRVlKw/f7tvSpw==
X-Received: by 2002:a17:90b:3b52:b0:2ee:9cd2:a589 with SMTP id 98e67ed59e1d1-2f28fd6b4b1mr3333710a91.20.1734082166620;
        Fri, 13 Dec 2024 01:29:26 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ac42sm2733070a91.36.2024.12.13.01.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 01:29:26 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 13 Dec 2024 09:29:22 +0000
Subject: [PATCH] arm64: dts: mediatek: mt8188: Add GPU speed bin NVMEM
 cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-speedbin-v1-1-a0053ead9477@chromium.org>
X-B4-Tracking: v=1; b=H4sIAHH+W2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Nj3eKC1NSUpMw83TRjY8tkIzMTi7Q0AyWg8oKi1LTMCrBR0bG1tQD
 317s+WgAAAA==
X-Change-ID: 20241213-speedbin-f339c2648ff0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_012927_346197_32278BAC 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

On the MT8188, the chip is binned for different GPU voltages at the
highest OPPs. The binning value is stored in the efuse.

Add the NVMEM cell, and tie it to the GPU.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index cd27966d2e3c05833f11294cfa8f6a984d4e0dbc..0e865f5083b475c6e33cf6a0ce51d2b615af7850 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1752,6 +1752,11 @@ efuse: efuse@11f20000 {
 			lvts_efuse_data1: lvts1-calib@1ac {
 				reg = <0x1ac 0x40>;
 			};
+
+			gpu_speedbin: gpu-speedbin@581 {
+				reg = <0x581 0x1>;
+				bits = <0 3>;
+			};
 		};
 
 		gpu: gpu@13000000 {
@@ -1763,6 +1768,8 @@ gpu: gpu@13000000 {
 				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
 				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "job", "mmu", "gpu";
+			nvmem-cells = <&gpu_speedbin>;
+			nvmem-cell-names = "speed-bin";
 			operating-points-v2 = <&gpu_opp_table>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
 					<&spm MT8188_POWER_DOMAIN_MFG3>,

---
base-commit: 1488143f901e04e132722cb093613e8d019a4ec6
change-id: 20241213-speedbin-f339c2648ff0

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


