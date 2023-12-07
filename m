Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15244C10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 08:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVFpYtqEexLfydhqoFIxA/jZIztn7bZ/TEnG+oaDfrk=; b=H0bWBw2Uqm2UIimwaZz2U62j+O
	Qj5TiUY+qEJfinJYSyt7GnG2tZc5WHAq7nDHX4KTUJGJTIdZELakH+2wSjeuKDeSaFiAVfyE7Dmvw
	XepTCqA3oXaxOw9Celrf22zToqF8E809bH/U+pihvXJfirB+9Yb5Y7gsEMt/uqseNu8jE1dNlz25m
	n13Vv/Td1IIIiMMXARWnqTfk52x5XoPBQ7z2NV0+ebKS/ja0YDn2SOXTECyMYkv1evmhQbFfMxCXz
	cXfjsFMJmOtUUm4gmlGKGlONUL6MB+G/945yAkdYmGGKLyg+/ryPhhk/49Ajei86fmbBzHQUhNbKw
	9+WGhlHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9O9-00CA4i-09;
	Thu, 07 Dec 2023 08:05:41 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9O5-00CA1h-1F;
	Thu, 07 Dec 2023 08:05:38 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54c74b3cd4cso1372778a12.1;
        Thu, 07 Dec 2023 00:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701936330; x=1702541130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVFpYtqEexLfydhqoFIxA/jZIztn7bZ/TEnG+oaDfrk=;
        b=LUjpb4xUudMG8MsquYWtOUWX3EBA5BLwGnd21uxGhI4S6C2zTnZOwgNWfFQ3HCDk9N
         shQTu44p4ACf7+lQ2KPOlHz+RF8GSujJD8gOTJYuVKaaLi1NyRgIjYpDXbWTQwCq8J9g
         ZSdfS+DuozlZo3i2OwY4j0rBAcsH0DapHkInqr282F5O9tjGN4SjIM1Ll1nNZjihJVhV
         c7REFcQU+04dZAyulw1f2/hip/sSDvax43VTfMvqAEjXqnISOXNx0lQesALcPyxLZ7mG
         nvFRw/F0H6JUqCW00/pdBSs+HwaI+ll9dsryo5QCjUEaEE0n2AKzZipXUcjCX5gpUPV0
         mjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701936330; x=1702541130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVFpYtqEexLfydhqoFIxA/jZIztn7bZ/TEnG+oaDfrk=;
        b=Ph9Gb7yN5q5nEHkG1RXWihXPYhimOhuz6UPdZ/7w3Z5OH3nvH4m+nHnCFjq9L/O/MA
         xqQ05/ensKENQjstiDHY/U+aOLVZwRmvtuQNR6CnY+ENFtQsYQjEqT/5Sot2/aNVswXT
         qJPhw1F1ILU3hnxnGxBANBPuFfHfyG00W8R1pF6n3S7vJy8nz9qTxhecCriybyyOQrvJ
         EkHqc7hWkqaxOPx8hUSuQL7WbkJDR0bsUDughwag7kEZ1hvnJCTBPtoB6I/z7gngms9h
         A5M4Iu7O+S3Fk6r8WaEP7ez898D9I/ciNwMxXHadsOU/B38tm8THtwLpMC6JKYS8j/ny
         wspA==
X-Gm-Message-State: AOJu0Yz7Z3CcDg3fRDs6SScmyIX1QPx+RdP2aUc1P85mVLaUATgMDoyp
	H9SSN4uLj38ejHDKK/D46qQ=
X-Google-Smtp-Source: AGHT+IHWoFYMqcJhcmYgtVDlw8D3OrKJaR4c+NyOnEdcqKZ/gqAr3e+8ORStjXLNbDPa5Qc0J6Ggiw==
X-Received: by 2002:a50:8e5c:0:b0:54c:b72b:93 with SMTP id 28-20020a508e5c000000b0054cb72b0093mr2302564edx.25.1701936330275;
        Thu, 07 Dec 2023 00:05:30 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a28-20020a509b5c000000b0054db2b5cd30sm480133edj.38.2023.12.07.00.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 00:05:29 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V3 2/3] dt-bindings: arm64: dts: mediatek: Add Acelink EW-7886CAX access point
Date: Thu,  7 Dec 2023 09:05:11 +0100
Message-Id: <20231207080512.3688-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231207080512.3688-1-zajec5@gmail.com>
References: <20231207080512.3688-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_000537_420207_88A2E947 
X-CRM114-Status: GOOD (  10.40  )
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

Acelink EW-7886CAX is an MT7986A (AKA Filogic 830) based access point.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a5999b3afc35..cfdd3317edda 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -84,6 +84,7 @@ properties:
           - const: mediatek,mt7629
       - items:
           - enum:
+              - acelink,ew-7886cax
               - bananapi,bpi-r3
               - mediatek,mt7986a-rfb
           - const: mediatek,mt7986a
-- 
2.35.3


