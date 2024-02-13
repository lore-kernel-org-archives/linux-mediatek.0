Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2A0C4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 05:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y6whheju3NN4BqY6LFcpmmPqXluoagcef/LFMHep7Sw=; b=XgzXKQFS2Sx2FC
	LLFNcLZLFAM61wIgIUa52lEtKnFe72R3KbGBV3Kg17+8AkTHi9LB7esAbXE1sSH0Eoix6qVscoJ9w
	IpiLxDkvKHiwkntdTnJTedviiZ+5aJiKD1zBi4vJVt1y6lL1qVg038jFsparovzSU6YTuthQOTswD
	SvuIJ7t/5CdjIYT4Dlwu1MuvAzgTxhAGH5xBZreiNQ8cF/0Dv8lc7SyIauzN95CsL6SBuVsfeZNoB
	IeEsoAJQmhWi6GOjioKYLj8e7o6ERz7qeKLEWjl787usgkHOiloIniyzHOX60mcA2RM84VVhqUZ90
	lvXczXL9LydiAOTU+tDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZlUe-000000080ex-0PEE;
	Tue, 13 Feb 2024 05:38:08 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZlUa-000000080dq-0HTM;
	Tue, 13 Feb 2024 05:38:05 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d0f1ec376bso24337911fa.1;
        Mon, 12 Feb 2024 21:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707802681; x=1708407481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y6whheju3NN4BqY6LFcpmmPqXluoagcef/LFMHep7Sw=;
        b=FL/Yjid846NAV0OftY/ropeI3PMEshZDDfUVT2VePc5iLnC8CJz/qlZ4/5ubOJuA74
         TU8QxPsrlF/mHge9KPaxLKE0jvWG+NG45cOW9CQzbHGCTA/NE0D+EyWqDcectvf2kgsW
         L4ujV15ou6Gq+LWAEt3YVkPvDiTXounKKx40jc6ytXPdCqNGHpmMT+uYVoXNxLyICKet
         SI3inyYMv4fXDh3qXOQR2JpxE6+ON1hDzmFBBPQvPuwTnj8Ky6Tcmvwi8bM4LdGr3nkt
         d0YX82rnmC/VQri+y1myKjWIeTxEe6chPJU4r7QSahpfNoku7e2jPmtm5lwxeIVqcwbT
         vOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707802681; x=1708407481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6whheju3NN4BqY6LFcpmmPqXluoagcef/LFMHep7Sw=;
        b=gXa/ahXsI1juCvPmMY/QwgtPaM7OWqM3B5YP0aZSWHNuTQ5Z+e2YobX1ISrOGA1De3
         qDCcztB3XZ1hHT0wqtu2Bi0bmK/NumjigG4wFulG90GHSB8aHxaY+bzaRWRkbIvj83cg
         3RVa7eX+uxxSWIFrf1RrghFHuj7Ecn9jITJpwSGUGnNVgySgLVyPnLlM3lB0Zdza8j5F
         WkQn7D6ac0xciDSWrA6XHpuZWPDvwR7QR4aGlxK+5LhBcSHKsXukzai/LIezxZxZnhPa
         ggCLOolxZ3N6+IP2K8yF5N4HXK6APRLiqfVC+oEAO0ldDxGZHNKOiEnTAQtHHS4is+Uh
         qt8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeOGl5y+bfeWwyk1aZv1Xxgms3AuOkRvOvm53+/WOLicHxUslssob6h4/EdISqELWq7WaCdoQu07uxEMfgc4NneUOYDKr8lruQAVrY0QWuXyPeNW0Ey7znZ+W5C9ssqPFAgVJYvluyGePXnTnQ79MiHs1kJCZM1JI=
X-Gm-Message-State: AOJu0YwyzmR9t0AZ5Ev9Ex4OxTaedJdl5ynQ4p6tPjZ1I6jGa3ZIP+VO
	jMMP6lJObXbCyVVeV8pScm3hQ2Gp7McaZu58HU3gT3uNbL8HGByN
X-Google-Smtp-Source: AGHT+IEYv4/4ALvGa72xiNOOaY7e3dOG1YKfoXOw/ZHT+6/YMgv2cMGO57rgfPdiN9NDpTVQDjxNeQ==
X-Received: by 2002:a05:6512:ac2:b0:511:4a01:2faa with SMTP id n2-20020a0565120ac200b005114a012faamr6840591lfu.32.1707802681119;
        Mon, 12 Feb 2024 21:38:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2tGrtBOg8KcRwmQRPgHXd6qJA+pLVnJmF6/vU3yx1sVl0gNb0EESWJdYs5iEbETyMYMJBl6Al6rNlTUDRqhCxcJjy5Cl6u7RBSbr2avovnwBm56c4ec/Qm1b9mfEwYlUwwR6hZaac86g914HXwvV/3/nIZPVB9Y0gK46QVRH0/893u5tjOCudcyilGfAwfVktFhGV51sLOJntmdksuIut8aNbUu6V1k2oyr3ljjz9kQzDLmNVc2zWFQqipiODhNpV+LrUiQJz5PB7rGqxCEjbpBqG+/YQ7pB4V1zk+KTR8lZZv3g9Nh8vpaP8GYhHgVAudqydYEcoXgKD03duxB5NCMJStAF1SKZMyK9gTko2J+Kfq6ehhk0HRpqhkYLTI+ZvGY0Fo3Ri1eoppMJeWKoLGcmfgcye/7mbGltoZ98aken7lT24sao6c4Rm9UjXSnjL8YGRpmQ07fZcXtZ4cO7tfSw6I7hGi9RmcDPIbnd/PlEeh4YKPlMxuOt41fXCTJ5sXBXdkrsT1KDsMHFcKNE=
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a3d125b9c0asm16659ejc.81.2024.02.12.21.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 21:38:00 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/3] arm64: dts: mediatek: mt7986: drop invalid properties from ethsys
Date: Tue, 13 Feb 2024 06:37:37 +0100
Message-Id: <20240213053739.14387-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_213804_149936_9A08E3F2 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

Mediatek ethsys controller / syscon binding doesn't allow any subnodes
so "#address-cells" and "#size-cells" are redundant (actually:
disallowed).

This fixes:
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: syscon@15000000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/clock/mediatek,ethsys.yaml#

Fixes: 1f9986b258c2 ("arm64: dts: mediatek: add clock support for mt7986a")
Cc: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index b3f416b9a7a4..228e02954e85 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -492,8 +492,6 @@ ethsys: syscon@15000000 {
 			 compatible = "mediatek,mt7986-ethsys",
 				      "syscon";
 			 reg = <0 0x15000000 0 0x1000>;
-			 #address-cells = <1>;
-			 #size-cells = <1>;
 			 #clock-cells = <1>;
 			 #reset-cells = <1>;
 		};
-- 
2.35.3


