Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F295BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Nov 2023 10:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EtGo2PbI4VhfFCzLF5CTcHmhJXxS0YiF4GH0b4RYzjc=; b=YrO3Jkxt9UBGkU+IvbYKweiQCW
	Vv1RojUhJglDzKfN++KtI7S88qDIzSE2Waz+ooUvb6BFLITaTpEinN7Rnsk6kDLuOZm+EBIkK974B
	4iFvmRt8zq96Jl94aAHZ7uOfTlEjJt/tW44OWng3Xbnh1/MrJlW8Rgb3ROMkczeKaMum4C/wm1zvK
	/Nz88F+c2QTmMLNHq/rJUUF+aeDg9VOOxKeXW7uDixPRoXPG1IKmh1dZvqABzs1y2k2W1wMFnnuOX
	/cbCxKS/5xkwyw2ooRJWXnL4fKMwPONsqhat+l1g6OFP4t6QdnWWCgXclFFTisYgcxFGinu6D8v4z
	J9kQc5kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qu3-00FbJ2-0B;
	Tue, 14 Nov 2023 10:44:19 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qu0-00FbI7-1M
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Nov 2023 10:44:17 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1ef9f1640a5so3307780fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Nov 2023 02:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699958652; x=1700563452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EtGo2PbI4VhfFCzLF5CTcHmhJXxS0YiF4GH0b4RYzjc=;
        b=hdvzgjnecqpZGq8FULs33AnAP0k5F+KPwy+b+/gFibZoGZjGSHvIPohC7oeteVl1GE
         1UXVFLURx1mPiQ2057yQenWk2CcxIXhc+zm8U8oqliSx+wueGC7S0fhVdFCKJwAT5dDB
         1zWE48ReDq8/+21MOMD9BttprF8CSDFfHX1o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699958652; x=1700563452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtGo2PbI4VhfFCzLF5CTcHmhJXxS0YiF4GH0b4RYzjc=;
        b=q+tEloV/lb+d8tVtoAvt5it70zEHxIHdQOZTO5hhvyEqTqyEE8I3YuXKeEA338hPP6
         af4cgkbw5OzOTA1O4eusNb3sIEJ1MlSVGBhE2r38SCA3b9n5W18Bh35+Ct5MbSnV8L+U
         kHMz6c5tljb06MZgD6Y+S5Ws++NJJwJvUZDw8Qhl1bjY4eth4czo6j34AT8Jep3MuCQa
         xh+lmjWgtIPnCNnnTOFw0brFNL2xt9DlC3X2l+e1c4B6xUqT5jydTb0+/3/AFQ+3+J2k
         EkC5zfEUkbF/jmIDYhK1rGaigOQkCVaC19QWYMLCc8yL9OGuwaw92J4EnYGXOOJDa3gw
         jySw==
X-Gm-Message-State: AOJu0YzciIFy0smtnevkcUnIBPpRUOmzdkUeeym25ZMw6C6OQxWXwi3x
	vqQi7x5YhTDH0D5TB695BtdX/A==
X-Google-Smtp-Source: AGHT+IHxmgUlMEBieMM61gtbnmLAhVuEAHgMl6ycbPU13IOxBVkaJ+NHHsqbyyZtI6i0GsUzVhD6Ig==
X-Received: by 2002:a05:6870:81b:b0:1e9:b550:c05a with SMTP id fw27-20020a056870081b00b001e9b550c05amr12708195oab.53.1699958652536;
        Tue, 14 Nov 2023 02:44:12 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:b51f:fb1c:5e29:cfc8])
        by smtp.gmail.com with ESMTPSA id m4-20020aa78a04000000b006c33311965esm926136pfa.68.2023.11.14.02.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:44:12 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] arm64: dts: mt8173: Add G2Touch touchscreen node
Date: Tue, 14 Nov 2023 18:43:23 +0800
Message-ID: <20231114104353.1693966-1-treapking@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_024416_794843_C281168D 
X-CRM114-Status: UNSURE (   8.90  )
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

Lenovo Ideapad C330 Chromebook (MTK) uses G2Touch touchscreen as a
second source component.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index bdcd35cecad9..0d6dbc36c352 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -29,6 +29,14 @@ touchscreen3: touchscreen@20 {
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	touchscreen4: touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+		hid-descr-addr = <0x0001>;
+		interrupt-parent = <&pio>;
+		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+	};
 };
 
 &i2c4 {
-- 
2.42.0.869.gea05f2083d-goog


