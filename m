Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFDAC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 23:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyLi6iA5QFbrZuLEeQFr7qfmVlBeS8MD2efPde1AiOw=; b=IaSjuFnMvAZpqtGAPOD3cW2ibm
	3RgMq3bXqIxzT0qMjXJWJPjlwJwpkYZKAGyYYCqYX7cD5j6eKVMOZXZNxNsm3vUZ8vtzpXLTWEYno
	AFu/iWRRKt/OLnh7Dm1bvcLcKfS/5vtEGT1PPdka1ZD9sOCOUoUwXoieCgSjClmBCx/olxG5QgoLn
	xwVM6XjyYzAogHXu7DDc9N2VER1moLDEHsbVs6hdEiKLYmTuogoTjEoxawcMsnpBI3i+P6hJP8FuV
	/AaXazsJUeyFTr3CxNYt+whR5sSqYrG21ZcX5LkI3ce75sxOrcgmizfVl3rcLlpKPy+j3ASk3vj8d
	cWyrPp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Ewd-008BB8-6U; Tue, 13 Dec 2022 23:44:19 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5EwF-008B0E-5G
	for linux-mediatek@lists.infradead.org; Tue, 13 Dec 2022 23:43:57 +0000
Received: by mail-ed1-x536.google.com with SMTP id d20so20267520edn.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Dec 2022 15:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TyLi6iA5QFbrZuLEeQFr7qfmVlBeS8MD2efPde1AiOw=;
        b=xCguJJPaZEjMzGujNfSpsGHOF24EbRn3Blw4RFAU6A1N96sJQxF9GOtFOS7pLu97Pt
         yaVSQlU3rrKnjqEN3y/OlqKWGPUFlkrNmQnJCbtUdZ2WmMDeP8Oqv/Ej6Zin5oz5CdTh
         0cj3DsTDBuj3TcfBJfwFTKnq32HFP25sPusoxE9S4hjEpHRTeEHNhzr6hAp4j8tWhuI/
         h7HrJClZcRnR5gK36OCk6rSkzuOYSlRodgxXepUHNgam72gDdO/UQvEk8glHhIXBYRgd
         W++69kt6vnhtQ2EHDA9OSHbfSsuzmxjqtRFAYShCnhFiZd5nbRwJY8A3f+4Y3hCknzSv
         76FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyLi6iA5QFbrZuLEeQFr7qfmVlBeS8MD2efPde1AiOw=;
        b=haE3pcuATZbzalutD5AuJQNZyDScW1/GjIT+6kI9ginqfaxkIW4OAar7tTetaFv2Yf
         b6OmnqxY604zuf7xQq09W44waJPfNfSRDkFDxOKFOAf9C2e04qMUUtaFL4bBgoU4YXSA
         swWeRqE4BvY8AWFPC03m+gcEPOeC7KWu12WSLDEqnPW28gVBmRxNdEuFJW/93S/ubzd1
         gdl2Gfdwg3WEx36Ri4GCIG5bA/pWk6NDSLsAfW3aXmbzd4Oro6TGMiw2aIgRCZ7cj8pq
         QszaFQTAD1+UsuqwYj6YP+EcQ+etxvCCv3qg97q2lglJQg6/Dep360vaGxoCnDdr64Jl
         Zb2Q==
X-Gm-Message-State: ANoB5pn8Hjcru+iq92W42Rf6aKfsC6YGphiP71HL8iADLA3JxGflXGhA
	gau+GOJ6Tnu3BkDGbqRNIxG1Efc22zvxEeeZRT4=
X-Google-Smtp-Source: AA0mqf6Z1k1vCSwJWdeOCOWRZIb7unYzNGZhFgwCvPgtqpxtk3N+bmmDBUibzZdHGGxxWSSHS1dSrg==
X-Received: by 2002:a05:6402:12c9:b0:46c:55ef:8d50 with SMTP id k9-20020a05640212c900b0046c55ef8d50mr19150778edx.24.1670975033781;
        Tue, 13 Dec 2022 15:43:53 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-093-129-109-038.93.129.pool.telefonica.de. [93.129.109.38])
        by smtp.gmail.com with ESMTPSA id f5-20020a05640214c500b00458b41d9460sm5407498edx.92.2022.12.13.15.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 15:43:53 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v5 5/7] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
Date: Wed, 14 Dec 2022 00:43:44 +0100
Message-Id: <20221213234346.2868828-6-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213234346.2868828-1-bero@baylibre.com>
References: <20221213234346.2868828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_154355_226319_CC6745BB 
X-CRM114-Status: UNSURE (   7.71  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 7168110e2f9de..d2655173e108c 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -28,6 +28,7 @@ properties:
           - mediatek,mt8188-mtu3
           - mediatek,mt8192-mtu3
           - mediatek,mt8195-mtu3
+          - mediatek,mt8365-mtu3
       - const: mediatek,mtu3
 
   reg:
-- 
2.39.0


