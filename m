Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B671C67861
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wMGkaqW0zsEZBb0QXAO9E3nrh0bhvj+Vu7d85c8cRE8=; b=KcMipVrpaVrYemKErynQJxakmB
	ttxig5Dbwv2pMSIReb1TYOtD2+kK/GnrAjxjNhvQrILv9aCDvFyN14F/vQWknoKTpK1xIevMa/ifh
	x9Xcgf0nMGHswSAUnVToberFl3+YGT+d6xbPvvAl8hCkiRjeQFWk4DJcqetJpZ5Da65HJBoalTTRW
	q0oD3S+72Nbp7SvjMekku18R/25Aee+Ldey266ezqcuzm7tfB6YsOua13/J+eFZ9iKR7LcdLzWare
	RH0zeMvvABSr0j1/A9acJfzBPXFFaH+vYclck5iUO4+e/ax94R5qrubIjL1TSQcJrlBrXIKyPpoGV
	B/KZYmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj6J-000000073tI-0Kb7;
	Fri, 05 Apr 2024 12:55:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj6G-000000073sE-0T3O;
	Fri, 05 Apr 2024 12:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wMGkaqW0zsEZBb0QXAO9E3nrh0bhvj+Vu7d85c8cRE8=; b=GDBgCGDjJ7kTVHYJfmbRXb02BH
	AJYKYxDpGhQiYsQ21EW72UGmfOgt/kM3ub2H/yueyTIsRrwZY8PG07m+zTdyUyEgEyhcqJsDRL08H
	wUBQZe2w4BbdpyU5utPG4CGhPZirRE2kfNb9JyD69yXU4JSEkt2YSAY22YY4432lISEjaeaS5D/g4
	eJDn/j+RrArsXcPzzOvNB391eb9a1qCHNPtkaMkV40IPVmCBdwd/4kjuSfn1qpSWxqayoTR0piyxF
	J6f1x1SHyp5knWmvx4v0oQzdYQFtiRcqKjNRT57CWGvfZzU+xzWZMsHrI6VcGhvM2DcqLmSmxyAgj
	5NO+8XkQ==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj6C-00000005cPp-3Pcn;
	Fri, 05 Apr 2024 12:55:18 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a46a7208eedso301257566b.0;
        Fri, 05 Apr 2024 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712321715; x=1712926515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wMGkaqW0zsEZBb0QXAO9E3nrh0bhvj+Vu7d85c8cRE8=;
        b=KIcaUyUmX8I9q22Gho8RCd+EG533E9v7oyD92ARnHxm5zpY5eC8JamybxjxiCeC46I
         217FIcLEj/hT3RPJQPkaI9d5KNWkeZGSbk33bK7byYTpS4ZxGPRFrhmndcg3ToHj8Jmr
         FZlDTcXwi3zCxthY62vN/oFUQjTP6n2r7Jmgy86FBT1MwqFld+WCwdmAo0+5TMLwP9e3
         1YoXzPbZux0ED91ZJIl1XGxXOBoErgs6qebyi1RKZezZm1UrARyTxY2bt7BdNRPH/2+m
         Jq9dfQqkjFCXlE0H2r/NxUcNaJ1XmWRS4I0F5YniQRQkjcmx9WO3RLyJw+dZQXbRvYtI
         A9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712321715; x=1712926515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMGkaqW0zsEZBb0QXAO9E3nrh0bhvj+Vu7d85c8cRE8=;
        b=IlHrVnlxF+jbeYiZLkhAMTYTEDe4XMfHSFEv0/abEMXXUF5iOa8D7j7ifty+3Pm+5Y
         IFVxKX5OQnHMs7VbIp2A9SUGjG08eDuDTNMsIsBfq98nYDJe72WEouDOKt/n7cyG9DO2
         mB9WTUKlj/w66oFJKNb5xv8Sccg6ZT6wzI4rxuERd2iK60YtR4b9BIaa/Dw1z3bOtocT
         KwSMCdoqaK4W+FKgQJznRKhcEplCZp7cQDZMT524YpdUCzN1pdcPQQuuwthL4HPWVg22
         ETGNrHwfXGwdfqU2zM/mG6QZylLmefyaoWJfss2E33pX7kh17515DIRw5svRYP4LjrUB
         D8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXU9N5SF5FP1XYuRchrEOsAt+kM+rn3FMPpcTBCQu/KPmrhSUFywNiJ+FUdaLB2D/6ZccfD6XKc7p8ZbfOdicHqv+Zh0CJmDA0cTdhsPI05rIxijkGfrstjzCPmfBYWDsCvRODiEHSMSIzhAhcyTJG4X/9JDC2Vfpo=
X-Gm-Message-State: AOJu0YzpWrpTrJe+uGqmkJ9PH8H+rSd0Ns8mrdhN2jDDXtWK/JCfKKxj
	BwDNCnpSJy6d0ImNiV1slQj71dxT5dMOSSnGkncw5B0RYhhhtL/y
X-Google-Smtp-Source: AGHT+IFdUYG+ySoMDDUxApNdQt7x3SbDSjAuJR5giJgu03oOgXmZErEU9wejUpMsm8XGs61pQvMr1Q==
X-Received: by 2002:a17:906:4ecf:b0:a51:8250:2b52 with SMTP id i15-20020a1709064ecf00b00a5182502b52mr962825ejv.61.1712321714404;
        Fri, 05 Apr 2024 05:55:14 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id jy15-20020a170907762f00b00a4e26570581sm805434ejc.108.2024.04.05.05.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:55:13 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] arm64: dts: mediatek: mt7981: add I2C controller
Date: Fri,  5 Apr 2024 14:55:05 +0200
Message-Id: <20240405125505.11837-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_135517_030334_94E56E8A 
X-CRM114-Status: GOOD (  10.02  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7981 has one on-SoC I2C controller that differs from recent Mediatek
blocks by having a different SLAVE_ADDR register offset (thus a custom
binding compatible string).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 8a6263cc569c..2d7f91196e64 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -94,6 +94,23 @@ pwm@10048000 {
 			#pwm-cells = <2>;
 		};
 
+		i2c@11007000 {
+			compatible = "mediatek,mt7981-i2c";
+			reg = <0 0x11007000 0 0x1000>,
+			      <0 0x10217080 0 0x80>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_I2C0_CK>,
+				 <&infracfg CLK_INFRA_AP_DMA_CK>,
+				 <&infracfg CLK_INFRA_I2C_MCK_CK>,
+				 <&infracfg CLK_INFRA_I2C_PCK_CK>;
+			clock-names = "main", "dma", "arb", "pmic";
+			clock-div = <1>;
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@11d00000 {
 			compatible = "mediatek,mt7981-pinctrl";
 			reg = <0 0x11d00000 0 0x1000>,
-- 
2.35.3


