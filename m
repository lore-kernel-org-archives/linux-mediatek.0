Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A517DC54E49
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 10:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcJb7bj0vF5Nl8yAX54/kA3qijtSrrqL2OLIzgs28DQ=; b=pZxqWCQtfD2RzWEVxctsPSQkfW
	ojZCAqb0B3arENqFfN0hGL5C3rExcBDHcbd+WROjW8ncHXvXMh33zc4nkJJCgsds50Of9AvV1ollJ
	zwzu/6dlo+rFvtKx2AUxqlm4Qs5015G6lderuJ/KAvr+fXS309i4DYRum+ScZZQTikBm4TnQeKJ2X
	NYTilwVPfGxndYNEUm6MZBCMouV7pmhAOEy+pnwWXb9oIpxqROLGqfWjNrK/IJfGwtFoz4KjDzNz0
	o532wFiWDK0OWGf1Faj4phDvVySemRkVIoHCkwJhanwaDt5WoKs4QWPxAmfrrQ74QAU0kPEZITfmJ
	E6YJB59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSdA-00000008rqH-3Q4m;
	Fri, 23 Feb 2024 10:18:12 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdScM-00000008rZV-37Fx;
	Fri, 23 Feb 2024 10:17:32 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a2a17f3217aso25378966b.2;
        Fri, 23 Feb 2024 02:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708683440; x=1709288240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcJb7bj0vF5Nl8yAX54/kA3qijtSrrqL2OLIzgs28DQ=;
        b=aJ7rCawlgOo7w0vQeWlUFOhmwoPCeVZSPU6sxSkU7N15QilhTCq5cpSB9fLKnOFGLG
         J4g4cEWc6W6c9uFwrn1d2wvMm59XuspSDDZYPSaZfa96+3x4qx/pHHqJ4gzQlSVYM97a
         sTM5EFPAgxef0NinOg2jFaUkkSCN+49QrNZ8ecP5gTjPf/p0P6mynKM2Yd+CD8zm/zlT
         ppVWYyPBQStngGCGzYU9MieZ3QEwHwRO1sk3CXtvdKrHIQUvT1Pk0zdgNd9cbeqwaDG1
         rbOTFSf+JvxMRGrjvnmMCvoY0Qtbc9iYPyzw69gXUCmP106BI1TObpYA3pnXh/IIeGiI
         AvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708683440; x=1709288240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcJb7bj0vF5Nl8yAX54/kA3qijtSrrqL2OLIzgs28DQ=;
        b=wm+rB0pnqZ5Yu9b+xvLL5CZeLuujy9uzmag44sC0q4MC29JaCPnlBkBPSkCI7xJajF
         U9FlXhV13q//WGAfG2QKal2K9TtvlPmNccOCHlEGincztz7qBVinYM45sMpePPFyf3Ic
         gFDeJSlT8ggwbyphseFWVKFiU3Q06G4RXu6vxlc0Mq/GIZXNUk5/HowIznti67EijeNW
         rr2eTJ42LDZKlPsbgzBOAINUJ2dUfdYqW6ddSj/+Jcup79j0Rz0+7XRfnTq43Am04ByB
         qRnrzVQvZo3ydibApFw98B80d50jnkI1vwc/nGEjJif0pInTwdfSowJtyQY59Rd0eQcW
         Nxng==
X-Forwarded-Encrypted: i=1; AJvYcCXNGMi35SGRZUV3otbcbHlaADI/RM+mGrlol6FUMCFsYNg7JR4o5cRW6IRFoCWPMxk5joRv5zWkDlofCXw0iZfRFvbAa2PEXSs3EeU/fG+XUctqp43KEM+wNZNxs8R1jmX/g9E574fm2F4vaRn5cFLotXCZk6fPAsw=
X-Gm-Message-State: AOJu0YzZhwtwsA4gEFbtfXblACmYvMioNiyLAVqj8Y+B9TC9TLEPkKFg
	bzQtyS4WoQrqM6etnaJO/DVpclNkG6p+PfD3Cl8J2sG7aIbbF+LI
X-Google-Smtp-Source: AGHT+IHvc1n+NKsk0Q17ghSiWK9ZF9+++tMXf6cANj0kAxJYepzSwkzporeZs5WUL6Npv0oRXc/ejg==
X-Received: by 2002:a17:906:b2d7:b0:a40:bff7:6e74 with SMTP id cf23-20020a170906b2d700b00a40bff76e74mr261771ejb.2.1708683439798;
        Fri, 23 Feb 2024 02:17:19 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ti7-20020a170907c20700b00a3d99dc3f3asm6667250ejc.67.2024.02.23.02.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 02:17:19 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 2/4] dt-bindings: arm64: dts: mediatek: Add Cudy WR3000 V1 router
Date: Fri, 23 Feb 2024 11:17:07 +0100
Message-Id: <20240223101709.30072-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223101709.30072-1-zajec5@gmail.com>
References: <20240223101709.30072-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_021723_033803_1BF53325 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Cudy WR3000 V1 is an MT7981B (AKA Filogic 820) based wireless router.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 09f9ffd3ff7b..1cf47db94c57 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -85,6 +85,7 @@ properties:
           - const: mediatek,mt7629
       - items:
           - enum:
+              - cudy,wr3000-v1
               - xiaomi,ax3000t
           - const: mediatek,mt7981b
       - items:
-- 
2.35.3


