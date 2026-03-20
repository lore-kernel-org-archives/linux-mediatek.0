Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3514D1093190
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTU2TMlRUybrUic/FwbykBhoe+23VKaHqHh1ixkwW9M=; b=qzuepO0b3NG3roFkBS/qeCaysS
	716hR/u12WrkXAzZLQe5K3wZ1pPAGc1pf4atV7RNZ8xEBlXO8I3hUm186I3S1em8suXruDu1Rkhlc
	3kzAjcUY1YYfTAIY1D6MODhCppgqlJhbEzNa9EVfBbKi4FF+eLdLZluah/I9uSKDa4Mw6S2r3c6QA
	Q20/s2nET71Qz7s0t1peEXDpKSNNkywLBqFxszcx74qzYRfsN9pYOK8EZ5ZQKwvgypm/WDE5jCUHB
	xWNEvLEDZGjYrVNtmTSwhYakMUTbp7prp4ihzsDTX0uRbAzqweSBMIgZNoM9yaVU5+Ejd1qH0t0o7
	ZoF+ir3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VTR-0000000COSc-1cv4;
	Fri, 20 Mar 2026 08:44:53 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VT1-0000000CNyo-3OTV
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:31 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c742882d2a4so162159a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996267; x=1774601067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTU2TMlRUybrUic/FwbykBhoe+23VKaHqHh1ixkwW9M=;
        b=CM/KzJpBQ+YuB6EFjpJ0m8QHRzEk3ipPAKT/V/wzgcYnLObb2dWngLlA8S61o4F/UZ
         FEOKYbLFoGOtY2Sh7hENzFLMyYNw5107iZDY0X5fJ3TlLp92IB4GaLbsHqbqu27XRgs5
         N+ex6lD2Ksgw/GQjx5HAgn9D0ILaaCXpcrRRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996267; x=1774601067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTU2TMlRUybrUic/FwbykBhoe+23VKaHqHh1ixkwW9M=;
        b=bgKmsrcX127cpRGJo6r/2/zuC2ZSY3mDx1klixz+4fVkM52w1PfrmxUSQbphRxOjaM
         gf/52l3l8gMtdLUzc7X5HhKE800SnSOOj+Y+9jTOI6a5nGgd7fmT1azGlOfQLUTCgLZp
         uGGf00JpTMD3wlEmoxqWDjGFuhEf3OqvlAo7vdhfAK2gyHCt4tKGkjswPtfbRuOvfCiL
         KMT/4fZBaskCBLZXO6hAzOURVKdB1HvY2I9hfhPz1EzMB9+QwwujnEBHUJTiVlIIqYIg
         m/OncI86jvEyk7uVJwnP2wfPWKaXPaTWywAKfeCgdKZ5xGiY2ZCPXYD08MpgQJD/OK3i
         uj+w==
X-Forwarded-Encrypted: i=1; AJvYcCWEuNjhR+iLwFt8ij8jWgPYWRli6qa2LRM7N1GO4ltVJ+abqWbo1XaCrLE8QKJOlcLXrLcrUO5eEE3GggUm5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzA63agKaLKAOu/NNyw7gv+zzdZqgWj+ZAJbflqTpKVXEn+Q3jM
	hcLF+npbJ6HLt2WKCrxlJjk4BoUGlLqb9nLM/FJ0MYug6ye2k37LPJ2vvbh5rSrsbA==
X-Gm-Gg: ATEYQzx6J04aWdslSp3+mtjs23DAJFVyFg4g2L1nIUI/8cYJV6dgrWRRBbYU2evL6o/
	TU0wW5s4IlFwWGOgAKHTg+9jyRExPZvGSejHOBulj1OCO0VCdAZ2ka7BC05L2oja2hhUtI3oRcM
	KXA76U89qWQ4wlbM+geT4mXDYzwlkqFLqla86LJLWqA6KufCNAdoIv0DoPDBEQVkNxLop3w0BUJ
	yHKeo1hCGncFjhllyZp5E2epRZhF6WaDkdOXQ7YuVsXUyuahcjmqXI/xyFA94g6M024rFVLylug
	IynXUacBX1YKVGmkQSEy6waSLZtc/TQDwRxMn+wiYxA7lxBugJmcSl+qPcQbFeoOmHOKJr2bPig
	zPbwF/Te/e0V159WNzeHIVI/BNU0o0A6IjCRZSx2hfUzImE3tPnfg1Y5r3TkQsVpWMoY4QjDy66
	IIi5WNRQ2oEQCruM+U+4KhNbneYnGuGdKV/9QMJvr+tPxKirRnhLuAZpoiwPb0JUxQCc7paPh0I
	JkKHrBN
X-Received: by 2002:a17:902:ccd2:b0:2b0:5682:6973 with SMTP id d9443c01a7336-2b08273d0d4mr19970415ad.19.1773996266943;
        Fri, 20 Mar 2026 01:44:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
Date: Fri, 20 Mar 2026 16:43:44 +0800
Message-ID: <20260320084351.2461060-13-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014430_017019_0AC167FD 
X-CRM114-Status: UNSURE (   9.21  )
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

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 8e423504ec05..fc84dfedab03 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -544,6 +544,27 @@ &mt6359codec {
 	mediatek,mic-type-2 = <2>; /* DMIC */
 };
 
+&mt6359regulators {
+	vsys-smps-supply = <&pp4200_s5>;
+	vsys-vcore-supply = <&pp4200_s5>;
+	vsys-vgpu11-supply = <&pp4200_s5>;
+	vsys-vgpu12-supply = <&pp4200_s5>;
+	vsys-vpa-supply = <&pp4200_s5>;
+	vsys-vproc1-supply = <&pp4200_s5>;
+	vsys-vproc2-supply = <&pp4200_s5>;
+	vsys-vpu-supply = <&pp4200_s5>;
+	vsys-vs1-supply = <&pp4200_s5>;
+	vsys-vs2-supply = <&pp4200_s5>;
+	vsys-vmodem-supply = <&pp4200_s5>;
+	vsys-ldo1-supply = <&pp4200_s5>;
+	vsys-ldo2-supply = <&pp4200_s5>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
+	vio18-supply = <&mt6359_vio18_ldo_reg>;
+};
+
 &mt6359_vcore_buck_reg {
 	regulator-always-on;
 };
-- 
2.53.0.959.g497ff81fa9-goog


