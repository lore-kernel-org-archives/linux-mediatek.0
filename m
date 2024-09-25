Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFC2C369CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OokQwblwx7XJowld2zR7LIeuJVeL+KfPUA3UT3AQXa8=; b=4etYtQ76kyUvKj
	dx7VaKl+xtVkUHsRDtlKMTfeq2Ar3u+xek56Cmh6Ymc7/fmkHkqUQgGHk8ueJFlpodQ5RoABf+EqP
	j77Vh1yjq530ipn3RF4j25IEljsQDMG5nihP/pZ9jgIyXIGvJ2PQVJGjbBJspm9iiz7pzWFmaquRY
	xPEFyyBYOgzUu2MLRboLOU6glRDdChTVFP9jL38JzBYFyTQI6dUei/lsa0QCeYCsJcaIaYVMSjwdD
	vs38SRIz/xNODCVMnmyVPQ70U+L7VrBYTraszegeeCeeH7/K8qBzWTk5KE6hW09amqT+1NJ89pDjc
	k8b4BgvKxx6zYqzcElIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPrc-00000004pek-0xj8;
	Wed, 25 Sep 2024 11:07:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPm6-00000004oQq-3r7O
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 11:01:41 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7191f58054aso4900361b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 04:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727262098; x=1727866898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OokQwblwx7XJowld2zR7LIeuJVeL+KfPUA3UT3AQXa8=;
        b=ANjwAaMPg7WqFzKgxgwb/ub4orFVkXES81TBdfE/OPuB+10STtH7US8mm+4+DqsEMF
         qnj5X2K8f7mWazrtS+fARdlhQtCfm9AjjN9+1oAXOvLDT8vx2RMegcIvN3y1I7khn1PL
         NwePOGs0eHyxGOpgk0cOoCsML6uDjVYebSEsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262098; x=1727866898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OokQwblwx7XJowld2zR7LIeuJVeL+KfPUA3UT3AQXa8=;
        b=cFLs9CwXGAIKZaOt9uEI9nEdASx+CBFVretLanFX0CFjO/5xYR0gQOYT8iCJXtSQIb
         roJVfPNvEsmdM/dHtv3KeVgQ4Yp/FCyVbq5WC4fXWNhnd6F1QEDaBehTZJHmEDe0JXra
         j8byKBtnxUyflAGFaG3d/CAXXASSwJ3xfM3X7nRx3U5jI5OblmzpsMBOOQWEV0/WgNFx
         K06X4GA2znszmXZGpLFNIjZ3Mjdo4AK2JfxaPpuYMyNzFOkrfX2DcbOlhcWJGHZBeot3
         gybF9+R8f+TjgDoMvAaps1WZn7GkWoICnJBtV9yfrLFtu112c0tIuso1NVh/CpnTFuSn
         w10A==
X-Forwarded-Encrypted: i=1; AJvYcCX4Z28D4KFjQ4/3fBBcaNvuv1QcwHktHPGCYjFT2iroJnIIaSZhnx9qJN/52P4OZqWft9u3PXk13SLQtRV+KA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4L24YXig+ZK+yvUKd0fDcnmtHoRdQXRmejYRHIj27tHzSqDKS
	F+bodVygsnX8e7Tabn3O5eJwz+gu3k3SoZeT7R9+vfWJvRh+uKRw7T34mPGxkw==
X-Google-Smtp-Source: AGHT+IG6lm5IWJgffa43W9/ClCHgkLMhnab6oiXEbKs+fknBPEtsb+qFj/6zqz2ZSq3SheDbWpmfMg==
X-Received: by 2002:a05:6a21:2986:b0:1cf:6c65:b736 with SMTP id adf61e73a8af0-1d4e0bed995mr2986583637.40.1727262098113;
        Wed, 25 Sep 2024 04:01:38 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:2b86:78b6:8ebc:e17a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73085sm2570298a12.59.2024.09.25.04.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:01:37 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 5/6] arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
Date: Wed, 25 Sep 2024 18:57:49 +0800
Message-ID: <20240925110044.3678055-6-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240925110044.3678055-1-fshao@chromium.org>
References: <20240925110044.3678055-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_040138_978666_6E23AB98 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are two hardware IP blocks in MT8188 video decoder pipeline:
vdec-lat and vdec-core, which are powered by vdec0 and vdec1 power
domains respectively.

We noticed that vdec-core needs to be powered down before vdec-lat
during suspend to prevent failures. It's unclear if it's an intended
hardware design or due to power isolation glitch. But in any case, we
observed a power-off sequence here, and it can be considered as an
indirect dependency implication between the vdec0 and vdec1 domains.

Given that, update vdec1 as a sub-domain of vdec0 to enforce the
sequence. Also, use more specific clock names for both power domains.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index ff5c8e0597f9..a6cd08ea74eb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1064,20 +1064,22 @@ power-domain@MT8188_POWER_DOMAIN_VPPSYS1 {
 							#power-domain-cells = <0>;
 						};
 
-						power-domain@MT8188_POWER_DOMAIN_VDEC1 {
-							reg = <MT8188_POWER_DOMAIN_VDEC1>;
-							clocks = <&vdecsys CLK_VDEC2_LARB1>;
-							clock-names = "ss-vdec";
-							mediatek,infracfg = <&infracfg_ao>;
-							#power-domain-cells = <0>;
-						};
-
 						power-domain@MT8188_POWER_DOMAIN_VDEC0 {
 							reg = <MT8188_POWER_DOMAIN_VDEC0>;
 							clocks = <&vdecsys_soc CLK_VDEC1_SOC_LARB1>;
-							clock-names = "ss-vdec";
+							clock-names = "ss-vdec1-soc-l1";
 							mediatek,infracfg = <&infracfg_ao>;
-							#power-domain-cells = <0>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#power-domain-cells = <1>;
+
+							power-domain@MT8188_POWER_DOMAIN_VDEC1 {
+								reg = <MT8188_POWER_DOMAIN_VDEC1>;
+								clocks = <&vdecsys CLK_VDEC2_LARB1>;
+								clock-names = "ss-vdec2-l1";
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
 						};
 
 						cam_vcore: power-domain@MT8188_POWER_DOMAIN_CAM_VCORE {
-- 
2.46.0.792.g87dc391469-goog


