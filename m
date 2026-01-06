Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C8FCE9D45
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jan 2026 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLUdw3G1Oa8h+gUfTU4WhFpXDYDSf42qjb0ihw6v2cM=; b=mE/+Siu8JSQvTstoTlDEuM+2wj
	tQ7hoH8EQp7gFYoKPDQAZcgqg1C8gSW0cuVB7FjZ9d8kI5hCQf01n/75BpiNWO5Qh8d2m/C2/y5HI
	8jX/HvB5+yzPd6AkV8pD2/PCSDhXyTmu4BqVpHDy/d+MoLpwPcnh8w5M38uFRntp+d1/0GSebps9v
	yJVktXikBGI63uVaz9c0UgdGWN4hUVZSn6eJY3wDiyYQegsDXapOypv7694oxYdClt7pWuBa4EjBR
	Qj/8FiicywmnUVC82KJYXPuGfnm74A26/LdiE+BXVciUriC4ko5oedeQTYbn5woNzWry2DWuMmDnS
	RMLMTUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8sK-0000000DOUb-36Tt;
	Tue, 06 Jan 2026 15:21:36 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8s9-0000000DOPh-3POK
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jan 2026 15:21:29 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-45391956bfcso829927b6e.3
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jan 2026 07:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767712883; x=1768317683; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLUdw3G1Oa8h+gUfTU4WhFpXDYDSf42qjb0ihw6v2cM=;
        b=gRqtxNyry1rUjBhr0NKCxJOHt3XXhtzdup5sxErIsr7iz57qA/0+ChJkAjrzOzyPMG
         4ColKU6Q0BWoCJZVY7wvjPin8dmy353m2KM4N+ecj7AC7jJ+U5/5E49z3OqIfJyYG13J
         VoWXQTgfRTWDjUL86jglipD6/WEPThByVWs2z5Fgm46fY2e4Zy1Bp1pjT14oNKs1cj86
         cssDIPkbApSyP/dvVZarhpvJImAbAkJY6xV9FhTu5wA4fZMKtMiQLxwj72NIugOfVmA0
         UG9x1HRtijXhtlIXpJGjZCeOJK5+TeJ7hPqdlkXkTXy4/pW/MsXrtfql8eX4IVYBcQwc
         /YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767712883; x=1768317683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLUdw3G1Oa8h+gUfTU4WhFpXDYDSf42qjb0ihw6v2cM=;
        b=fZfi5QW/5+2DqzZ5qjIPH5Zm0VVPZunmMkkBCZ6LikW56pdziMvztpwlAyPtMj1D6X
         +faOnjAiVuHmf7d72Rk4CQ5hD/dgg6owmwroZ7KAM+by5MLuDnQXm6UBt7MT1PKXJF/p
         ZVhomBTIsVAUJvy5dbQLyeSFYdJ05tmfbkoo3cRQQeHH4T3G3lCnI2iWi3vQRna0MVtN
         0qOKjFvcj0qvphVXqwZfLAE5W/X0Z9l6OiEiRKAeoGUbMNX7eH1HUEQl+IPPMlSsbCOw
         PObM/UNTrdge/002tkRvJoq3AElgLbi4sKV4pvKTklFx1TUhQVP1DcxUhttDv9VY1n4u
         BnXg==
X-Forwarded-Encrypted: i=1; AJvYcCUubuwT5tMXRTobz/zWOSSS2wygUDOCjXknCxp3HVM7V41VUt5a2Ri55nnsyLFC0KVHAC2ZRE/Ax6SAzhEV5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwARbIi7atocbZNMkk0mzuDCBXovyTRzRBmPew+HJqEMTPCgQw0
	Bc+FdPW9RT/9ehEs0ocoxggsH6Pk63Q1SUz+r32RIgih1+wPBMgrUyDwZGk4omyJkso=
X-Gm-Gg: AY/fxX6U8/qlz1xURc3Ne+xO5e240TQv9ysPU3lLWOQaeY9h2fD5uwZtMG3W+YscNaZ
	B4Hylzm72tWCJ76QjnaEd+BiH0Z/5H5P43e1MFUs3PdWrZGPKsoVNHxEyrPSa2CjqnBm5QUyv0m
	aMYNYJXSKe3Pe64qRJ3empGn3Fr4LIQlPR5ap7OG9ypmaemJhZgwuZFoMKSWPm6Pm+sA6tIorBG
	pCd+rHaxduG5b8cckQr8uVKHV/nHXhAn5gJQxkZDVxqqd/t8PmuR7IZizySEicidd8P1jB2mwGT
	cxBfC56hJomg0iTuvy0+YhrAL1D7F1B8qH8uvZ4RTX4r29arykS8bysL8jctJ+p0iAev4DssXiP
	8HPKDAtjx8nQKEAOF2njLPhIT4EEl40509KUZGZtuyqaIr1mWN9Ztok0MpULuIz6Wl/58JoHJCI
	qdKlwTKEyqqkxbkrw=
X-Google-Smtp-Source: AGHT+IGup1AjpsgEeM6td0S+GkAIxXyYXzINH73dTVDxFtfVdWjCyqWoDbH0jNu3XakXCV9kxL+hzQ==
X-Received: by 2002:a05:6808:2393:b0:459:9961:5114 with SMTP id 5614622812f47-45a5b0326a1mr2002013b6e.16.1767712882948;
        Tue, 06 Jan 2026 07:21:22 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7f98:2205:4ba4:3e65])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e17cd81sm1041992b6e.2.2026.01.06.07.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:21:22 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Jan 2026 09:20:56 -0600
Subject: [PATCH 2/2] arm: dts: mediatek: mt8135: fix pinctrl node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-mtk-fix-mt7623-pinctl-name-v1-2-33817c7f78ee@baylibre.com>
References: <20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com>
In-Reply-To: <20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=853; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=/r4SI0+l+6elgaFXyZuBmLqw3XZThStXnYZaeAp4zQ8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpXShqRYtO7Y/t+spHv4BW7bgN+6A//HOuBgp4E
 HzT+WaCxgKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaV0oagAKCRDCzCAB/wGP
 wMXjB/47mtvPI+cDCbmMMGZhiz/J8R7kY1W5YrlWURnb37g533eh2nPklEmdwNJ7W9bfuovn+6y
 8J+V+GFuA/oXsstge/NYuB4OFPzPv7VVLZK5jQvIqS7grLwTX1ghJW7L84Xv5IHPl6iWkYMMvOy
 Om7ghHzt+7BYMfJWt/T7VqxcAqOq5W4D9hhSnIFqApiu+pCskNV6Eu4MJ/eml8y7kpB0iACoGiv
 Z1A3bKfyjj7le0YNc5efuHLqrqpkDiRZZSU+FSWQ4LEaYZU7KCAiTlt45bq4j6IwisjvL80aU0S
 9FAiOQX5axA8Gb4VTM1NZVnSa7J7NwISmc15RsHIERiV0nfj
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_072125_899060_86DB40D9 
X-CRM114-Status: GOOD (  12.21  )
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

Correct the pinctrl node name to use the same address as the reg
property.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm/boot/dts/mediatek/mt8135.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt8135.dtsi b/arch/arm/boot/dts/mediatek/mt8135.dtsi
index 0f291ad22d3a..b03bd980ec37 100644
--- a/arch/arm/boot/dts/mediatek/mt8135.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt8135.dtsi
@@ -148,7 +148,7 @@ pericfg: pericfg@10003000 {
 		 * Pinctrl access register at 0x10005000 and 0x1020c000 through
 		 * regmap. Register 0x1000b000 is used by EINT.
 		 */
-		pio: pinctrl@10005000 {
+		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8135-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl_a &syscfg_pctl_b>;

-- 
2.43.0


