Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9433C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 08:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSdVb9WkVAcLLB328/AwLa8n+Mc8MUqDvR1kwUfBlcI=; b=umlieKgEd3if9p
	yTe7U9l+CxcLLZoW02aLGHQBQkG5bWRngxzFNLekk75FIh71Ab7B+pghoPbYPGX/FWXU/wrQj9Ha3
	a4kxj7i7M+w+HLNGUDjT+OUwsssQ3cA57pbvXoZHDHwDbKY0ygDo0FEyk0cyUQZOrNRz6E1qU3guv
	ADOqn9kI4crodVCFOjBM0TgyoJDRMYQFFcJnGapLTtOBYxhXR5nUt9vEoVaNR8Cj5TXcFWWDcchdI
	vRDmiFphFG2Fqi8I7sI3Zmlu8DHUUf4YQB1Q3I+MEe4vrp5gqHj2i75+dCf/1O9g6GyuLBjBX0v1C
	RDyFG1w5bJUWpuejXxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWpp-00Dxet-2S; Mon, 14 Feb 2022 08:35:49 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWaT-00DrAv-Br
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 08:19:59 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C0ABB407E1
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 08:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826795;
 bh=23CQAl/07AaN2dxN1TfTdDj5so/NCdWTbjb57ZtNLwo=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Ah1UupAoINeRCa+UtdPXztTePkYfs2ooX5tQRF6YqDHLCj4fOsLrLszYyo1SzXCyq
 axMRDOzHIudG+Pqc0ec6ebKh4zmyKcerOvHSWvpFsbPW1YBYwnjGWpY7zVcRZHWhNe
 OaNIWiFdGgZPeE5n3cjNx1f3goxIl7Fp2KpN8B9BniBYhXMv4Ferp1VQhCznIrLVdy
 LE2uktIzvLNe2G04mkiN0IDujzL7SkBspAqMUePvKEv2g0zqb9XiwMEpvmQDavRPyO
 +4WpWvTRdL15qFsiBc1D+9I87h2YPFqisEBAeWqc7GlVwK6qDLc1rhee4/NHUBylnn
 nRJ1FYkb1mKAg==
Received: by mail-ej1-f72.google.com with SMTP id
 r18-20020a17090609d200b006a6e943d09eso5479780eje.20
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 00:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=23CQAl/07AaN2dxN1TfTdDj5so/NCdWTbjb57ZtNLwo=;
 b=mNAPlHqCdNTQi1UaP1giOt0mtM211Yh4GRBS2d+wb66EizzMiTkofXYHLYhMNLa9f+
 uJ7ei3CWmjocZm/NgrAOShkIODWCR/HV/sOw172pwk/PA3cBTOBsuyU5s/tURT2OVQzu
 Mu742/lHwEbStKKSPd034U2xyG6jvBA3VYendP6wVGfPaYU6pifSkSLk1Y3heJqbsj84
 tq1Pako6BpryAAUX2g9TsgTV/Xz6TpRj8CEexF0dq7GAzlrh8hIfgtb+fmUFc0XyXMHb
 mmdPoXvTb3uH2FY4MTy6W6i7ufYaWsdHVFTGB8duH/RcD4JPjGBU9jxPnLwptJv4Q1Xm
 qB7g==
X-Gm-Message-State: AOAM531BxOf9Jj27vvqEZWv95i1hQIcFNmeW2+5Jkftf0N0I6YomEJHU
 EbQksbbxkfcb719vOMO5WcJ9M1d9LwcNjzTdsDRxNYtLhFTQiqU43eTiSlQPiZhdr3C14aU8EPK
 yUiSxNzNI3zmiYFIDrhZlm6iVEBWR036dEhFRVrFXp8U/vDRnrQ==
X-Received: by 2002:a17:907:3d01:: with SMTP id
 gm1mr10671196ejc.695.1644826795042; 
 Mon, 14 Feb 2022 00:19:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyduVMGZqiqcBn+5NbYVmKbo23S2Kx2GnaG0uOcebe1lzeD4dxVvKdv5SiQHDzJAeAj67dMnw==
X-Received: by 2002:a17:907:3d01:: with SMTP id
 gm1mr10671188ejc.695.1644826794896; 
 Mon, 14 Feb 2022 00:19:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id b20sm2022941ede.23.2022.02.14.00.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:19:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 2/4] arm64: dts: mt8183: align Google CROS EC PWM node name
 with dtschema
Date: Mon, 14 Feb 2022 09:19:14 +0100
Message-Id: <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001957_572184_FF878317 
X-CRM114-Status: GOOD (  13.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

dtschema expects PWM node name to be a generic "pwm".  This also matches
Devicetree specification requirements about generic node names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 8f7bf33f607d..2d7a193272ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -92,7 +92,7 @@ volume_up {
 };
 
 &cros_ec {
-	cros_ec_pwm: ec-pwm {
+	cros_ec_pwm: pwm {
 		compatible = "google,cros-ec-pwm";
 		#pwm-cells = <1>;
 		status = "disabled";
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
