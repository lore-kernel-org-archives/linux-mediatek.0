Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91FFC197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/CmDRN4e/HQ0MmpQTQ9Amu51he+/R067td0lYeM4NG8=; b=h8X5uafyp5kxEe
	M2VXRKiW/CEpSzBmqyygr4vd0DHz/bYbTURXCuWTniGBRxBkgaBQNi3BX6zxCYpMyTyah8KkIDzjx
	WnWbM2U/B65wQZYMSwzqGv8RimHw/y9dO6jrdLKSKpvzOv82GKk6IhHhz+PFVXRUvZFH6i9pNVbFi
	wekp1rwDjLFBfVLnc5CS4eFmyB5pfAYlggBZHmUvyUV/0BoDuOKvFK+kNCXYPfzFwEabfF7NJBqiL
	n0CjnKMEZFWb4A75SZ+Cgz3ZXhvDefsu/y1y0xVLVSrjy0jfubAa41ruzI3aKRsDBJACJyZiJQW9E
	KxNfAYd5hr/DGGU0IxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3c8A-003YJ9-2d;
	Thu, 16 Nov 2023 13:10:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3c87-003YHk-1h;
	Thu, 16 Nov 2023 13:10:00 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9e623356d5dso114089166b.3;
        Thu, 16 Nov 2023 05:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700140197; x=1700744997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/CmDRN4e/HQ0MmpQTQ9Amu51he+/R067td0lYeM4NG8=;
        b=Hk7z13DfM1DXRekrz62KX9pXlfFByA7QgxIBg+C5Nyqw0u/UGayab5QBidRYWUDA2Q
         sLf0qopuO2gH+mBz04Mar6hji2nC4NwrWC+LaHHHIKN4afxLMs6gD3xf9CqwlX26ZzYP
         c7c5p6HVKAJ6EJ96+U5kc6Zww/X4jDXLVfto2pLsxLLJwC+Nf+Db8W3Kao2r4onp+vvU
         I0YIQJ3xfcYjAxLxFu5yHocfEuoI+aM/yy9oU4UdyV24jjipQDmUniY/W/HqJy9hsyrN
         ICmY37/FDLJTD1iKxMGT0Cnq4UNbEmy+roj7CR7/plq6RtPKU+SZ+OC2bLwPUQNzy/92
         y5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700140197; x=1700744997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CmDRN4e/HQ0MmpQTQ9Amu51he+/R067td0lYeM4NG8=;
        b=l8VFLhVMCo03a4/DNQmwou79rAUSv5JvR6QS4rL7KwDJ2r35Wzs12+PbfW80Hkug4s
         2hoTtYAv7mjiTqyW/b+Ek+3/IIqrb/V9hXoTVNldojFBtDASPBDL1LBOm3O5+xgwNa8e
         kIS0qQ6maPUrk8i4m1tlRMT688aXifdpvaVshyWRfa3hggEfGvV0wT4Fs3C4AiWQSUPY
         DsetUY9+qQp+zl9A0FTKtPoEJiEFbejzOfpQcpSkySCRe2CsxDt2iWi7gTbqkYhXFGh3
         xcwZjQhSwxKTFV0zTw/GHrxC/VBHj5va1oKsHhJVrCDZU3CWXMbxUhJoN4qSjHZbuOGA
         +Ibw==
X-Gm-Message-State: AOJu0YzDj23lDLAqoQ3VsA1lCdeNrX2fglcyrh4Pp/Hsj8gQ6riRcHRd
	Hl80yH3FchexLFueaLqfEpc=
X-Google-Smtp-Source: AGHT+IHicHcKzKBlDNseHjmXhJBxUOloYbBkiGJMT+T56kBgUZhVTDk3+bKnUOHZu6AG4mc9RVxzNg==
X-Received: by 2002:a17:906:ca5b:b0:9be:30c2:b8ff with SMTP id jx27-20020a170906ca5b00b009be30c2b8ffmr11765124ejb.61.1700140197010;
        Thu, 16 Nov 2023 05:09:57 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id cw18-20020a170906c79200b0099bd7b26639sm8390652ejb.6.2023.11.16.05.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 05:09:56 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/2] arm64: dts: mediatek: mt7986: fix SPI bus width properties
Date: Thu, 16 Nov 2023 14:09:51 +0100
Message-Id: <20231116130952.5099-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_050959_565301_E3554FEF 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

This fixes SPI setup and resolves following validation errors:
arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: spi_nand@0: Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
        from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: spi_nand@0: Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
        from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#

Fixes: 885e153ed7c1 ("arm64: dts: mt7986: add spi related device nodes")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 3ef371ca254e..bcb3ebb85d70 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -241,8 +241,8 @@ spi_nand: spi_nand@0 {
 		compatible = "spi-nand";
 		reg = <0>;
 		spi-max-frequency = <10000000>;
-		spi-tx-buswidth = <4>;
-		spi-rx-buswidth = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index dde190442e38..48fe50e67177 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -156,8 +156,8 @@ spi_nand: spi_nand@0 {
 		compatible = "spi-nand";
 		reg = <0>;
 		spi-max-frequency = <10000000>;
-		spi-tx-buswidth = <4>;
-		spi-rx-buswidth = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
 	};
 };
 
-- 
2.35.3


