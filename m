Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAF6E7717D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 05:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsRd6GbIRJnWNHqT+PNa/aW5xM64tEdGNTQseKpNp3U=; b=mNG4u3ZzkdwDL0cJkZCqwoouI2
	RnQo3EVkotefpkjJhVBLecZhwyeU6fU7hyb81jIEvABJFNHrsXNFP5mVN8BbB6bA03v3PjCkaXvX4
	tQy0JE0NYY4n09H8ktHrtzurS3RONEkuslJO3CZG+vuFSGgT6kHu/EoJbBLwofTtaz+Y/gWTruwXB
	+zR1/1xRFYuKO61fkVwnpH1uxYW2inFX0zHdPSWOXx90SbL/xkZZctumdM1zrxKyDlmJKV4KOpXxN
	C1QN8zFd+IFlnEo0dw363NGb2ES+z3JNBFmTzQ83bjhFV6Z/4vS2SxsZWt1DYvLg47kp00Xd21AJ4
	sWDRFRFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFIK-0000000Dq2G-1qnz;
	Wed, 11 Dec 2024 05:29:56 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFDJ-0000000Dp5H-3jtj
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:47 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-728d1a2f180so252419b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 21:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894685; x=1734499485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsRd6GbIRJnWNHqT+PNa/aW5xM64tEdGNTQseKpNp3U=;
        b=RXqpltN/Dyk9HEzFHxsXck/kdbz8zBufKMawZQm3MpbnhlzonFuowaXVNDP4FjN8kW
         qUy72DjGbKCdYhNRQ6UVsUiU0oK7ru0E19n/PD1HWNKU0p+ory9nq2ieotuomZXzm34M
         mvX4ZXQXeAVirye7KmDMVkI5YX9CNGrzqCpms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894685; x=1734499485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsRd6GbIRJnWNHqT+PNa/aW5xM64tEdGNTQseKpNp3U=;
        b=Myq7u+kAB+ZL3OwduS+Wbak0G8b3C8z9mnzwRLM7VAZZAlmeFBRwfyoNw84uTxBVGo
         t6dKYacSEGzABksJ/HRTaH5d/2vZ2WPdVgTs633viXeFjUF0Gt08MdNImTVcp7VEZpkE
         EcYGyEh+OiTdUwWhPx734bDgGundXSCsRtSN4DX8Wc1GVyE3rtMYPkg0smkdtWj7FpVq
         d51NcXtfHcM2S089Z7lb8yrX/Qzyw8iGM9GEV/vPAucAArYYuLdw0Wf+71Bqj3nccseX
         jM2WIyfOcxAtO+sHtnBI4fZTnNIi9eDEhtgGtc9WJ1armN5RTAeC9S2xfAbmX/8sbRtM
         uQrg==
X-Forwarded-Encrypted: i=1; AJvYcCX1f4QHmJpIfAeHUoGgEQm0coTHfeP0qae95QLicBu5ytZ30tCgs+EraBo4SSsY2q/4cvXmc782Rl/VPlV+pA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5j0Rn5gE5yecI/pE9kn/cKHP9C6iZ8zVKf/6Jo6j/efaXR1kV
	heYSHuWXLC7xq8nwAE2YDYP+wps0uI9cytdf748KoPwhX4X/2GaMEYiZS4YFsA==
X-Gm-Gg: ASbGnctpB8vvR6qhSBYM2PmSS5gggVXq7/jy7w73BccUIiq3x/mRrtGz+/e9LlbCP4v
	sNnuTm2qTcohR1KC210Wn3sr0hWliI/lSDkHAMFLt/imtbKCwJOOkztIvSP2HB4UQhOdYYHpSjM
	S6bJspRyeWdPiEfFSu0WxI14DDqPlFviJl8prK/bWjjs+ah402khZrM79TsiLRHONouMv5a6X3J
	kctl7x6jMDYfBVPe+2yTvOlA1pU3FluWvePdeeJwELTv68TWCDYhLjFJVSt3PkQp5j14P/u
X-Google-Smtp-Source: AGHT+IFFxMXga6SeAVOQ7rY1CRuplpzUNVLLhXZiU0yZmrw4h4sktygVKCOPI2atcjtR3UsWVfl7nw==
X-Received: by 2002:a05:6a00:c92:b0:725:e3e5:624f with SMTP id d2e1a72fcca58-728eda6a3fbmr2265644b3a.0.1733894685041;
        Tue, 10 Dec 2024 21:24:45 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:44 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] arm64: dts: mediatek: mt8192-asurada: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:22 +0800
Message-ID: <20241211052427.4178367-5-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212445_926735_F07653F4 
X-CRM114-Status: GOOD (  10.57  )
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

The "regulator-compatible" property has been deprecated since 2012 in
commit 13511def87b9 ("regulator: deprecate regulator-compatible DT
property"), which is so old it's not even mentioned in the converted
regulator bindings YAML file. It should not have been used for new
submissions such as the MT6315.

Drop the "regulator-compatible" property from the board dts. The
property values are the same as the node name, so everything should
continue to work.

Fixes: 3183cb62b033 ("arm64: dts: mediatek: asurada: Add SPMI regulators")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 741af6a7f197..516fba9b3c6d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1580,7 +1580,6 @@ mt6315_6: pmic@6 {
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vbcpu";
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
@@ -1590,7 +1589,6 @@ mt6315_6_vbuck1: vbuck1 {
 			};
 
 			mt6315_6_vbuck3: vbuck3 {
-				regulator-compatible = "vbuck3";
 				regulator-name = "Vlcpu";
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
@@ -1607,7 +1605,6 @@ mt6315_7: pmic@7 {
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vgpu";
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <800000>;
-- 
2.47.0.338.g60cca15819-goog


