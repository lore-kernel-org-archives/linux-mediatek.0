Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3530CEE49BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcMX/bqTdupL750gbpR+dTL3DKvin6dl5vwknoD/GKo=; b=N3qUv9tjDre3b1
	HkR9qawE01P2D2y/RqFGCtdDEN3byAuH2jePNqwpMe3pPcqWHlRZHNXhEU6K51syGQlClXpUh2riC
	MUF1YOpA3Z/CskFPQuooOB9pMyJs9ctOkau3bdhi6sIoMh877UJ1OAc2MpPKcQ5ZbiRMCGEpEuSXw
	u219Oge7Wd5+++sSePqjLAhIKDNIfZmdn5y+EDGqy8A0ogCCaqrh7ipME6e19WJ60Mfmf0EcRC846
	LVN7NHYqSvuJUSW8xQ2tU+u0b8VXMzK7EXdtiECVZyalrNqo+u4B5xxNlKHOC6jXu6YKqAxuHceF5
	2qHe0h0dXgPoALNMm7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOhH-0000000A1Jl-3MIW;
	Wed, 11 Sep 2024 14:51:55 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soORH-00000009wAL-0hRO
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 14:35:25 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-27806115eafso3290769fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726065322; x=1726670122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcMX/bqTdupL750gbpR+dTL3DKvin6dl5vwknoD/GKo=;
        b=gvfFu3LHeCcq7VCRrctyO+fZzGaR1jJ8U+xs/3hEl7ABfuAWChDH8s7l+UslvRBib8
         6HJqyG3rn8N5lr4KTBodrcmJY+5MVKi0Qv1VdQ4BURlp39hco1V0qesNnpmoEaIN7IBV
         tzfCs5e8qQBdT2R57WcOS9gNYWMb+ev9vOG5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726065322; x=1726670122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcMX/bqTdupL750gbpR+dTL3DKvin6dl5vwknoD/GKo=;
        b=qzQAl47AWhHF9AsYimztKoClJy5Wx9ZBx/81WuoYhf9F6qeMy/G5NKbADmn5Ap8GgY
         43gOF8C6d/9qtAk4aUthEuQk1svjU5/AsCSi2P1E8amMFPgjhrlEwEPloPDiL3OCo6Mm
         O/N3bYLxHiNqy8ttndf3T3IQJKpkq4iaTXD8Sj2c03v3AGGlNnpaVYMCtSDLwh2g6906
         DT/m5iV71l+IKplv15LQ2dDW57O+6a0QqcVLNv1BNvauz7GhfaXAe35JCBggqppQweSx
         aaVkP2LSsk5ZJ1TP5j/atHozFnDKcBsNkLPb6wyixIZhyPdEbbdF88rMx2UOKhAA0wjM
         7MaA==
X-Forwarded-Encrypted: i=1; AJvYcCWUQHOStSHJyvQ4Mglx1ArEwfPmAcJpuskA+MR9Sdeuq+YlezqgHeyQlbqh/D7o6Cx14FFxrGhMq9xjwlQouQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkqz2iRcyHvsQ8Z+cTe+DBXDYb2tW7GqfFci0++vteIWRtsLKy
	AXVLsGG9Dm2a5PEoiylLeLm9NChEh231MmqP/2/WmCf6rHoWHKLrsaqRwM+3Ww==
X-Google-Smtp-Source: AGHT+IHDFd+1Qao0x/djh7BnAl9fxiCea616EBUFpEIvtWPidor0dGilr+S0MNN3z9ITAlHbdxzKew==
X-Received: by 2002:a05:6870:b28c:b0:278:1c68:9c0b with SMTP id 586e51a60fabf-27b9db07830mr10994291fac.22.1726065321905;
        Wed, 11 Sep 2024 07:35:21 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fbb5901sm46620a12.24.2024.09.11.07.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:35:21 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 5/8] arm64: dts: mediatek: mt8188: Add PWM nodes for display backlight
Date: Wed, 11 Sep 2024 22:33:58 +0800
Message-ID: <20240911143429.850071-6-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911143429.850071-1-fshao@chromium.org>
References: <20240911143429.850071-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_073523_237310_0FAD46A1 
X-CRM114-Status: UNSURE (   8.93  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add two hardware PWM nodes for display backlight usage on MT8188 SoC,
and mark them as disabled by default.
Boards can enable the necessary PWM node as needed.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index f746b89c1ec6..61530f8c5599 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1418,6 +1418,28 @@ lvts_ap: thermal-sensor@1100b000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		disp_pwm0: pwm@1100e000 {
+			compatible = "mediatek,mt8188-disp-pwm", "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100e000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_DISP_PWM0>,
+				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM>;
+			clock-names = "main", "mm";
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		disp_pwm1: pwm@1100f000 {
+			compatible = "mediatek,mt8188-disp-pwm", "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100f000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_DISP_PWM1>,
+				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM1>;
+			clock-names = "main", "mm";
+			interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		spi1: spi@11010000 {
 			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
 			#address-cells = <1>;
-- 
2.46.0.598.g6f2099f65c-goog


