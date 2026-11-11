Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6896F60A6F41
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 18:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jc2M7D7A;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+ePxpUx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=; b=Jc2M7D7A0YLMHH
	atVOvRnqrNg+BL2nKykxTRE2Tbn9YbbNHK7Q7CFAOC3KD5znYKVwqNTEajuDhlquDwJL/nR4k45Y5
	2RY5awlh+zt5jSlc9fR74wyCsunjgr6i/AeA8pnPRb9DvWJHwcSq9kS9XVFgaf3L+AkMOCXM6QUzQ
	mVGJMYcs4aAsCmkf6KiqWfNQnBE74hxngJLzRD80OqHyzV5ZGn727Ufnazh1bX6DW9SgLHawwOFLj
	M4cIpnDuW6Qndh4yw7X11ILHPjzDcPz3FEiW5xqEknDoP+2Fg0uwzUpydMHHEql2qHNuCDPedFBBX
	9LOTgIfRjIhyNAuamORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCva-00000007OEI-3vmi;
	Wed, 11 Nov 2026 18:20:10 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvX-00000007O9y-0xkr
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 18:20:08 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-8458555b6a8so1059226a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 10:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421206; x=1795026006; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=;
        b=k+ePxpUxmgvw9QjVVc4E4eTNSC1ThMUcOq9EtwvIRTsbDAlv5OJGOF03P9z+FQGOnL
         CJPZrCBA21AOAXGC0bD6Y7ycnLf3dJ/2QQezGfgEOQth/hvjPYRE9OGcrSWLP113bp+w
         1wyxxBxtpTC0JwN9Gangpt8vxdLB/68fjjwEw4Mg9YWlc1PU7X3eEB6K6cpQCL/Cpygd
         RAPRYAP1hBdQDQn3glwqTbaVlWz7uRHlhmW2eS/Jv/j6i4RQC2OXrFSzMfdOsxCcmk2B
         Jg2i7Zfn182ku54dSWQ3MGttHs6e2AfG7ZNU9fqGrXKYK45/faMBm/bK+Ha8fEPCHQl0
         mPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421206; x=1795026006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=;
        b=IdIfjTBdHQQAOzzRD6K9F7Flv0rKpgwd1ZKCjkuaTl2Da+Aq5s6AP9b4m/QAqf2PAI
         RVNGUPMbxGz3cMNR4fltZsFuy7JoHHVJsNyEoLvpwTljO9BhZiAEVe8yGydYcbVKxA5w
         +uR6z3V9cNRwFk/phoBnZDhDeLkML+6q1Y86/urQsAbiuWFmQaaJp3j2MURuAfhA2rMm
         7aRaMbQplbCqTnpy2uNjG2PmviLLWv8IUpRENYcBLBh15EQDxewmgu4oFr1Iu59YwpfD
         nVg1K6ZIt1pCuIho5weZOjQV798UM8kha91fcDDbtTGSjI+tFSWKDIP7DctFfg4Qt12F
         Didg==
X-Forwarded-Encrypted: i=1; AL+hErFmhIBu5SfxZ8yc4Ypr0HPmmve/eo56WdSJp4s4R5Zq+CucgNbmC2eBiejvgLU2BagaHMITM7liBMZRucuSbA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9XOBWnm6MjRDUIvMeHiBwyq+jF/lqLqxoCZd4BiqebPp9/se5a
	BwDYTFsNQfrm7Zgv9KKgevm/lmBJwr4MLG7gTH3r3i0KC+LttINw5Rhc
X-Gm-Gg: AYBFou1GngKg06Gify65EuF/WnnxmvS6x8p7fzJEv6BRzquo8W3c5ztoBy+aB0Z0yVA
	sAt9QMMRMuSMSQHFuIrVuuWaJWwV7138PCXQJ9P6jT81iTqNVGYAFBYdrbSwYaGH62Z5mqaydtz
	6xyRm8QezhVq8/2wSEpO4LQHlrJn5TGd/a0eWxzjlUn59C6tg34OLjj2D6BundnCKgqslLbEv/I
	z4iqG+7wb5p9x28Xj1GNurJMvVxy2BatwmJkYYni/wXLTrGp88hNz3SKX7I8aQZtuEf6l9EUfL4
	J2kbEPPG/fIxNRC4UEPEJZDVnBrEpsluUDA/B6CjQOUGvk7dr++LvW16xZjn1DJDJItFovsFolz
	gUa7p5h2Z1RUsy3dhe0fy7Fl0yc7IrCLW6+dj++mVRHsJKetTmBTfAK9GL8a7A4paDiLJkn3TKX
	bqgq9Y4H0FrAUYSB8Ta6oVSrd9wh714EaMqzxxC3D67ETVbLiYNAMod8Ar1Q7QSPYks6q4DYEFe
	RcWhQ6jg7t/q2v/I6tCkPDAYEvsIlM/ZQv/30Jgn4ypbpXwKHZlmHTMrOTVFFYSi/UHbFMghXwv
	Ldx7g1KMPEMtqMrHC5ztWerhs1So6P0gyCsWOooQlqwFqtMIh6ByCkx83YKDsJJJWcOP7p5rIzq
	RW0sYrdZfX/3r0O0He0Y=
X-Received: by 2002:a05:6830:410b:b0:822:527e:f653 with SMTP id 46e09a7af769-860f2873418mr3497542a34.13.1794421206253;
        Wed, 11 Nov 2026 10:20:06 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:05 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:54 -0600
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8173-amazon-suez: Add the PMIC
 AUXADC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-5-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1624;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=HdWvFN0Bi8Q0rbvoIQxbOy8Qqy9TBXeblCz/hYCaNOc=;
 b=UvFfe+0GNgf41aG/dgO1cAx/OHNQZPN8YTQnRZRWrp3VGqS+hjyqshurUxvY6rTsopRdJ36hE
 4HIPzTzo7G3Bhra+u2cvMi769b+xIiRwgt/1s3ljGRKqqhzOF5zEQTN
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102007_280079_8246605B 
X-CRM114-Status: GOOD (  10.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the MT6397's AUXADC and the battery pack's thermistor on it.
The SoC's AUXADC only has the board thermistors, and the charger has no
ADC, so this is the only way to measure the battery.

The thermistor is a 47 kOhm NTC behind a 24 kOhm pull-up to 1.2 V.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
The thermistor numbers were referenced from the vendor kernel.
---
 arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
index 7dc0d818a44d..07a1ba7539a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/adc/mediatek,mt6397-auxadc.h>
 #include <dt-bindings/input/input.h>
 #include "mt8173.dtsi"
 
@@ -87,6 +88,15 @@ thermistor-2 {
 		pullup-ohm = <39000>;
 		pulldown-ohm = <0>;
 	};
+
+	/* The battery pack's thermistor */
+	thermistor-battery {
+		compatible = "murata,ncp15wb473";
+		io-channels = <&pmic_auxadc MT6397_AUXADC_BAT_TEMP>;
+		pullup-uv = <1200000>;
+		pullup-ohm = <24000>;
+		pulldown-ohm = <0>;
+	};
 };
 
 &cpu0 {
@@ -471,6 +481,11 @@ mt6397clk: clocks {
 			#clock-cells = <1>;
 		};
 
+		pmic_auxadc: adc {
+			compatible = "mediatek,mt6397-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6397pin: pinctrl {
 			compatible = "mediatek,mt6397-pinctrl";
 			gpio-controller;

-- 
2.56.0


