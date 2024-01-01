Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD65C4706F
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jan 2024 18:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DPm4c5DYT5Zmo2gaDoGeMn3Bu+iK5tjKX0Cq3z61PYE=; b=nr2YVOQXc0qREq
	cMlbPpK27waBMOUAySLoHqZJFAluYs8LqCn0ArMygdbcNke1UDs+w9XU7+6aETUqAeBbADZl0oDya
	UVYMrdkHPY0zzwBX4SKp8bAaL308ekLo720/swm6XEZw9Jd+8LqqJiCRe4aPz7nIXh0zJ7OTTGFhv
	exoBUgyXZrAN4HHrqEwt/nkt5Xl+6+c8hKMSoBESDXRMO6ArpMkGgBxiMtWZ5KXzpefxMrlaHxvxD
	LP0ajX4PARoCScQEIrPn7sAFPiWR288E8zwmtMNElS75FQtnVRH4VFWZPnPgTTr5sHMlPpk1qT20l
	urjDjasXlWe/nVVHxChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKMuS-006cht-1C;
	Mon, 01 Jan 2024 18:21:08 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKMuM-006cgU-3D;
	Mon, 01 Jan 2024 18:21:06 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-553ba2f0c8fso9834869a12.1;
        Mon, 01 Jan 2024 10:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704133260; x=1704738060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPm4c5DYT5Zmo2gaDoGeMn3Bu+iK5tjKX0Cq3z61PYE=;
        b=iY7dePN+Lxwohp/Zdi4WWptSYSEBbMLSy7mp6V8Ec+x2mdo8mzDRPRaXwF+CBmyCty
         ws0rcxOCkKp7U5iVh77lOglWrE9APj+I7fIklvUobkqC3dENZocEXTpabWvG4Y8SNKAm
         Ko3HzkPcfQuADZboxCijjnpntI9o6dtb9lL3KXL/28PDnLkefQhvJHcCOyYcjtZ64NYM
         ut6kOGFhck884HQcAVHMPfz8Z3IA2dOTz3lOX+bv16qIe8DCepIgc3KY9XYvAlkLo65R
         vmaYbyKmMJY02Gt4M4/xxN4aCuMFDDRU470q1gp6O2xdQeTD4Z8i3Z9vovxFAszHD0UH
         BUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704133260; x=1704738060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPm4c5DYT5Zmo2gaDoGeMn3Bu+iK5tjKX0Cq3z61PYE=;
        b=Wst8UI/PDXaA7ROgssbWElc/5LtaTp/1+6lK3lLPvwF2Qivu2i3od7lKQf+eaYGGWe
         T/uAHV33maSh7DLhtVwpFEj4VNyggUCzA3dnK0daTmfqbDxj9N3Fkkpmd9TsiGHFq7Jo
         uiD0+eksZ4fnbQxwb1aLX/A8XnhhCChrO7x69usxShZALEEEVWTPaGzcouxzKheB1sru
         t6A6VqtKAq82OoXUKELJQD5VoBcsphKlf2XFQCpMiyu0LZYTYbovIX2XU4Jlfyw08TOv
         bCQXszif7qw6f3FIISOUismrzOGMHJu9rUwnECHvqBTX06t/MYOao7BRWr++227hhPJB
         S36g==
X-Gm-Message-State: AOJu0YxKbsPWypcfwsP2fdzEA7QiYe0RowoTCSdnlsaEjnKvFpuguqyF
	nKL1L/tK9N+7V3ooHDG6i64=
X-Google-Smtp-Source: AGHT+IGyY9jxT5FqCqbXgI3vZSMoZINZcxNXlDUZJjQ6ZuEBYYskwIOImbwBCZqWCEK5QOXNZy/OfQ==
X-Received: by 2002:a50:d552:0:b0:554:94f1:bb03 with SMTP id f18-20020a50d552000000b0055494f1bb03mr6481550edj.154.1704133260175;
        Mon, 01 Jan 2024 10:21:00 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id fp21-20020a1709069e1500b00a26ade46619sm10297441ejc.121.2024.01.01.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 10:20:59 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] arm64: dts: mediatek: mt7986: drop "#clock-cells" from PWM
Date: Mon,  1 Jan 2024 19:20:39 +0100
Message-Id: <20240101182040.28538-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_102103_057712_DB2B2485 
X-CRM114-Status: GOOD (  11.73  )
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

PWM is not a clock provider and its binding doesn't specify
"#clock-cells" property.

This fixes:
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: pwm@10048000: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/pwm/mediatek,mt2712-pwm.yaml#

Fixes: eabb04df46c6 ("arm64: dts: mt7986: add PWM")
Cc: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 6caac6ebede4..8a64d1027c46 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -196,7 +196,6 @@ pio: pinctrl@1001f000 {
 		pwm: pwm@10048000 {
 			compatible = "mediatek,mt7986-pwm";
 			reg = <0 0x10048000 0 0x1000>;
-			#clock-cells = <1>;
 			#pwm-cells = <2>;
 			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&topckgen CLK_TOP_PWM_SEL>,
-- 
2.35.3


