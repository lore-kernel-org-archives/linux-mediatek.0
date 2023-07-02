Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65170EB64D9
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jul 2023 18:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyV6oi4lj9PnIcMxtyZNpUOpRAMhM3ImTjgURE61yCc=; b=ZII8HoiwgH0KCVANb0hN+2Wv9I
	WnK9dz6Q89ah+2cnl+R3UtMwmwNIk3eUz3DBQ9ZHqG5xJmzw1yXTc2UPK4AxtuWnfdpTqXKB2bQ0y
	V0Hq7yjcwcVPApQmoj1GznGM83iwfF9Umhys/l58NG4o1VoQpp1ihglMthlYSBWRFt98GYKkh/8xh
	Ejn9/tD5cu/aBKc80lcmIVDQXeCzhI21whkrExT2ELhPbqTg/MmC6qop0FrBdd8qnD77ChY29uzwo
	FKICGYkTCp6bfr9ChJI45dN8W6W7ebiU+N1uChnXQH6PZjZYj07CjwAa56DAMlmWd9UnyIXcIgdqP
	vdxzCNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2Ab-008Nwl-13;
	Sun, 02 Jul 2023 18:51:37 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2AW-008Nt0-2h
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Jul 2023 18:51:35 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98e109525d6so671543166b.0
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Jul 2023 11:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688323891; x=1690915891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyV6oi4lj9PnIcMxtyZNpUOpRAMhM3ImTjgURE61yCc=;
        b=AEK5VgOKmMcuNpIERsFeIZ//0kU1e/RK8BqEGVhbaSd6l0OjeJGIOGjC6DCI+1mjRS
         /yILn9cl9F7+82uxSRhzj0HGmwZCKAyU1Th0UVuyyCsFLYfVs64ngHImzPAlK7TcKPC3
         5r7Ny50XfoQrYJjYwWmsMoCuaXk212Bk2p50b6lL58F/Dz09taPg4SE6AtxgM7cnZl0D
         4zGcxXUkLNbtQXmPLENz7uoHxChocsvEdWEM7+qOZ0PDZuh/qyMn6sduuBGJJSud9EFD
         Q4zEXNDsVzJm7hzyGrdXmZ1KnmX08LOlQwzooKkeh0syrJ98V1t261ajIW9VFmdLSbbn
         zXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688323891; x=1690915891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyV6oi4lj9PnIcMxtyZNpUOpRAMhM3ImTjgURE61yCc=;
        b=ZRUPjqzCvZslHa5nulbzHqV8AgWvDFVGcoONiL18kVhy8EIGn2+j0KQ9aZhbsDP45W
         5SCeRouTKKm09bOEPRAA/7j2WPdRpnCV/GauC5A4fejt8euNrw5DKQUMAQgoAIgKSS41
         GwDFD5l8JpEEeaL5wfjAtT6ZGsBQfBsn22hKvewFM/5isemnBpVzyEXV0RAOKQPhEBWX
         DVqufojKW2xrUbKJIwFR/q/QQHTaHz8VebyAw0jqxPXHmgwVZseyKd5pQbvFKlalZcAs
         5QxGh9nG70WYiDItA34SOfj6q1qVpTXkec9n/7O57F/azpehQlC1F30iuHd+lHQmDOo3
         +VHQ==
X-Gm-Message-State: ABy/qLZiIKkAjCAzOBQOjwQ896n4fTJkVO00fqTvl3AKWhuyF1iRr/zR
	SgoXXjPuzlMfi28S+COFS3F6Dw==
X-Google-Smtp-Source: APBJJlEhd6z8agOBibXRo3Dy6Bq5NMd874Up4DuglQ2keR4klQKJDsECi6EU6l1awkuvU2gwEx9/QQ==
X-Received: by 2002:a17:907:212a:b0:992:6d73:5696 with SMTP id qo10-20020a170907212a00b009926d735696mr6867049ejb.5.1688323891729;
        Sun, 02 Jul 2023 11:51:31 -0700 (PDT)
Received: from krzk-bin.. ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id gy18-20020a170906f25200b0099297782aa9sm5343084ejb.49.2023.07.02.11.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 11:51:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: mediatek: minor whitespace cleanup around '='
Date: Sun,  2 Jul 2023 20:51:28 +0200
Message-Id: <20230702185128.44052-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702185128.44052-1-krzysztof.kozlowski@linaro.org>
References: <20230702185128.44052-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_115132_895044_CA8029CC 
X-CRM114-Status: GOOD (  12.27  )
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

The DTS code coding style expects exactly one space before and after '='
sign.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/mediatek/mt7623n.dtsi   | 4 ++--
 arch/arm/boot/dts/mediatek/mt7629-rfb.dts | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623n.dtsi b/arch/arm/boot/dts/mediatek/mt7623n.dtsi
index 3adab5cd1fef..3e5cabf19cde 100644
--- a/arch/arm/boot/dts/mediatek/mt7623n.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623n.dtsi
@@ -116,8 +116,8 @@ jpegdec: jpegdec@15004000 {
 			     "mediatek,mt2701-jpgdec";
 		reg = <0 0x15004000 0 0x1000>;
 		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
-		clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
-			  <&imgsys CLK_IMG_JPGDEC>;
+		clocks = <&imgsys CLK_IMG_JPGDEC_SMI>,
+			 <&imgsys CLK_IMG_JPGDEC>;
 		clock-names = "jpgdec-smi",
 			      "jpgdec";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
diff --git a/arch/arm/boot/dts/mediatek/mt7629-rfb.dts b/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
index 84e14bee7235..f24ebc20732a 100644
--- a/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
+++ b/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
@@ -168,7 +168,7 @@ mux {
 	i2c_pins: i2c-pins {
 		mux {
 			function = "i2c";
-			groups =  "i2c_0";
+			groups = "i2c_0";
 		};
 
 		conf {
-- 
2.34.1


