Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEF0C47073
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jan 2024 18:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WN7lb14KPF1jcY+S5H9uyOeC9EUq5Bw6nAEJovrtnGA=; b=rUkUeh1O3GH6IK
	dcc+j0Lj6D8b1B2sHJi9I084F/lo+VUqCZoP1iSeKVA8f3CzJVf+E9a4aKQfl7WKw1/a89PZfOxcv
	susIppJ9RzVvGarEW/buRTMb+zqWJyP97X7lTQBeEfyF2OueVD1/rqfZ/MaMTl9lSEekA/fH1qyCr
	TxrS36hCT6hTUERB+AaXXAHAu4zFPPo86mDyUgEzpU7w+AdpM6MUQ1IZormhWsNV3o9yKhRny1Ajj
	d3SAODnFEFXD6J+oSvplW/wZ06tRpLo7On1qLyuuwoJKy/anrpjMEossb6pT1JU8PhSOIVKB/qxdN
	tHxmp0kMDA/tjMK4bdjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKMuU-006ciD-0n;
	Mon, 01 Jan 2024 18:21:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKMuP-006chD-2Y;
	Mon, 01 Jan 2024 18:21:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40d899205c7so5929485e9.2;
        Mon, 01 Jan 2024 10:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704133263; x=1704738063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WN7lb14KPF1jcY+S5H9uyOeC9EUq5Bw6nAEJovrtnGA=;
        b=BK5IbCUhliQGeL3gzM4vGeF58r2M6VyeQQDLteHZ5DwHNoHk/rgZzwWjfY0IVYdDy9
         bm/dIAWAWQYEWjFyfDafdjxFEDhUOTJk2QRXorvIGqp47RN4rk3ElMk+zrSc27PfjHMS
         3vK/PkxXsmsEWApoiOaNidHRuGC0UN6euPO73Vds/C9+BVjPcfQ36oKgzLtFQJtlG54v
         BGxgAN7RuYLFLdpfZkhSoBHb4FM33hpMf2+i5SeNmM71v4evMEmSZAz3tEh8iSwzKUBE
         BlqlB+U0Pb5IvC5sQSfM+SZDC9HoZDCSXk8JnoGvXytAsnMAgokLCt8eI4+GTXG8y9eJ
         r4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704133263; x=1704738063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN7lb14KPF1jcY+S5H9uyOeC9EUq5Bw6nAEJovrtnGA=;
        b=AuFdGX753W9IAseObPNgGQXKj3YYCO02+FpajD2IduZMJMnYfv2enDp/pM+Zq/DHbR
         P2W5f7hvCt9iuE2ughEUvei+kKXC1TGAPtTAO6Z0FMKv7U2irOBk7RP3aFG4kEFPpBAP
         JpSmgJru7iWGKPF5DGufMoGwaVfS2cf5Ccs15Q4+hN4zKx0CekjWs6mz3DhSesT0xvGP
         NOlx6uzxrvdMDcWXdez70jkNOW3O+D5jaf3+rLYpvs7ABIK/1aU5N0CltwpVCK1uil5T
         aOKUlXsIHtG+ufKo7cCOgGU0IjSDzL3LYx5HELkDY8y+lovaPJ40Le+67NI8G0wCxy0L
         FX2g==
X-Gm-Message-State: AOJu0YykExHyTPSESFX/N94U2rs6Nr4WD/HuIa38lxfJiN+DNvRIct9X
	GAElmtCyyZrlDrkn/dBZZNE=
X-Google-Smtp-Source: AGHT+IFbNNwNCK9LDY1srSnGLyUQneeU4/f8818QnoX31Dxz9FOc5qZnuXXb2otpzNudIQj9HADs8w==
X-Received: by 2002:a05:600c:19d1:b0:40d:5f46:2e26 with SMTP id u17-20020a05600c19d100b0040d5f462e26mr3853830wmq.164.1704133262982;
        Mon, 01 Jan 2024 10:21:02 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id fp21-20020a1709069e1500b00a26ade46619sm10297441ejc.121.2024.01.01.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 10:21:02 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7986: add "#reset-cells" to infracfg
Date: Mon,  1 Jan 2024 19:20:40 +0100
Message-Id: <20240101182040.28538-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240101182040.28538-1-zajec5@gmail.com>
References: <20240101182040.28538-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_102105_851207_FFA35F10 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

MT7986's Infrastructure System Configuration Controller includes reset
controller. It can reset blocks as specified in the
include/dt-bindings/reset/mt7986-resets.h . Add #reset-cells so it can
be referenced properly.

This fixes:
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: infracfg@10001000: '#reset-cells' is a required property
        from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#

Fixes: 1f9986b258c2 ("arm64: dts: mediatek: add clock support for mt7986a")
Cc: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 8a64d1027c46..b3f416b9a7a4 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -144,6 +144,7 @@ infracfg: infracfg@10001000 {
 			compatible = "mediatek,mt7986-infracfg", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		wed_pcie: wed-pcie@10003000 {
-- 
2.35.3


