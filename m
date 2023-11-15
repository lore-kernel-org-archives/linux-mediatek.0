Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA98C072A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrrnyZWXKRYwxEi6KzPQsaUn7ssz3ZkVcCNWua0g1gk=; b=ZkHA/AnwvVhjq5NUup4Z2UtqFU
	yNAk1nD2rY3kzHSiyGyDSMsdm+DvzU5f2u+T687APy7ezIcW0lgWUj9gHmmKEkI9M7fjLn9D5v8Wj
	/jDYNu22PqtYK41HUO4E5S7JGoH62Wx1H6zRRQHfvMWZ8MXpZkz+kmUkG+1OLHvacwzSB1UN3I5b7
	9pJ7QAoOJ/alkUw/46enbsAYtWoXF+XYMacr71+nHI0IL+mCyEGWKIGX2Ec5DshMQFdEvclNgDsgI
	B31BFnzmFDuMaU6BElXnz5Go68SHwhGhCFjBDMhIxnmzlwQqeXI9s4k/l1VNSRwbtiBH5gNOB/Z5y
	7Za7iohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3JNd-001Osi-21;
	Wed, 15 Nov 2023 17:08:45 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3JNZ-001OqU-2y;
	Wed, 15 Nov 2023 17:08:43 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507a3b8b113so9890800e87.0;
        Wed, 15 Nov 2023 09:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700068117; x=1700672917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrrnyZWXKRYwxEi6KzPQsaUn7ssz3ZkVcCNWua0g1gk=;
        b=Livv0izGWJJt9QApSgpvpPtLeuy7VDNGD547oQEfd6V9C9ZUA18OvFXuFg9oMmGjn9
         +fsUZ4U0BJi+3qSaTQsTojtficXQF84rtnFGuyQCidJ2Zk7tprYI2wUYNXJVbAFCy/a5
         qHJlkqwJiba5JMwxGvy0NVLGh9is39Hc2Ow7oNOwB/Dp+BJYzptJ9RT/8NKGeRYZfWEJ
         X47gPHNz6MNEVwL6HQ3+S//+EK0EWqPPnIukMo6fHax75BLC1ZWvoNe779UworCb2poX
         uDUmrw68rGfbCBTrfAnj95gyoCsbcBeIx8i3ICsPIH3lzeRbqrtegi2kbk5L07Yk/7/A
         O47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700068117; x=1700672917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrrnyZWXKRYwxEi6KzPQsaUn7ssz3ZkVcCNWua0g1gk=;
        b=wv/ZpMKDkvcflV0r3ATced0qjTciP17ZuuhaK/84eq+xL0zy9NGE3h8oK02SM4IDM7
         BxoTeEaeLcwJXVZ5ce7yl19VLGrpetyOhU6JjDQTnCeZmoaORqRrqOSR9bHFprZWQqlf
         4f+JK8KiRqkOzUbA6J/9khOuR+EXRnMSAzV8UG10KOdFClDTFlIqsLTxKAjAcopUD6PW
         28CFEl2QUsaJLE/EYVABfSW+PgxgHRYzHo5zIAEfm87Bq+/u7NA6A+UIPEhX//j/5IyY
         HuT4INzFk6uxsI2Zc7Jp+m82EWCn9yNNLhhR+PbaLAHeEqfBU/TYc5zMzh7QmiiT0ofy
         84UQ==
X-Gm-Message-State: AOJu0Yyz3vPIAI2AAAywSo8P7xs2DlsZm6vurZsU1SaOK0NikTasafIk
	JNnoG2rtcdaUn0z6Q6pcXtQ=
X-Google-Smtp-Source: AGHT+IHjYmYAyWSklZ6ETDi2sPgxaQ6mYTB3sSCXAji4FRfCH+gnQeBjUJaOorAg8+7gl6sydUVAhg==
X-Received: by 2002:a05:6512:6d5:b0:507:b19e:90cc with SMTP id u21-20020a05651206d500b00507b19e90ccmr11643551lff.40.1700068116383;
        Wed, 15 Nov 2023 09:08:36 -0800 (PST)
Received: from ALPER-PC.. ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id o1-20020adfeac1000000b0032dab20e773sm11077833wrn.69.2023.11.15.09.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 09:08:35 -0800 (PST)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8173: Fix timer 13 MHz clock description
Date: Wed, 15 Nov 2023 20:06:25 +0300
Message-ID: <20231115170825.908640-2-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115170825.908640-1-alpernebiyasak@gmail.com>
References: <20231115170825.908640-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_090841_961451_48EF7D36 
X-CRM114-Status: GOOD (  16.62  )
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

A previous patch fixes an issue with the mt8173-infracfg clock driver
when working as a module, but has the side effect of skipping set up of
CLK_INFRA_CLK_13M in that case. This clock is used by the timer device.

Similar to the MT8183, MT8192, MT8195 and MT8186 cases [1], change the
input clock of the timer block a fixed factor divide-by-2 clock that
takes the 26 MHz oscillator as its input.

Also remove the RTC clock from the timer node while we're here. According
to commit 59311b19d7f63 ("clocksource/drivers/timer-mediatek: Add system
timer bindings") it is no longer used.

[1] https://lore.kernel.org/all/20221201084229.3464449-1-wenst@chromium.org/

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Tested on a MT8173 Chromebook. But I'm not sure I understand all of
this, so review with a pinch of salt.

Do we need to remove CLK_INFRA_CLK_13M from mt8173-infracfg after this?

Changes in v2:
- Add this patch

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index c47d7d900f28..9062ca124d69 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -244,6 +244,15 @@ psci {
 		cpu_on	 = <0x84000003>;
 	};
 
+	clk13m: fixed-factor-clock-13m {
+		compatible = "fixed-factor-clock";
+		#clock-cells = <0>;
+		clocks = <&clk26m>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "clk13m";
+	};
+
 	clk26m: oscillator0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -530,8 +539,7 @@ timer: timer@10008000 {
 				     "mediatek,mt6577-timer";
 			reg = <0 0x10008000 0 0x1000>;
 			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&infracfg CLK_INFRA_CLK_13M>,
-				 <&topckgen CLK_TOP_RTC_SEL>;
+			clocks = <&clk13m>;
 		};
 
 		pwrap: pwrap@1000d000 {
-- 
2.42.0


