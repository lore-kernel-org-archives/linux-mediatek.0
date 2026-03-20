Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127D51093180
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 07:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHXZ2trhp5lSa8MQcHknKZyidASSv/5MiJDJYVa844w=; b=wr2O+pAa22vpgDK4R9uoLr0+Pv
	OSoMzo0VRj3DLggaiZULiS/e1pnUfNV4FzemlNWvb5pzCk4Sa8GEligGgPukD7VM5OfnkSBfRxSjA
	X/GwQNLcp9GobesMTNDwIpK8UGVnF/2+60jPsNZXuZpvv154PzcMU98kMfp2v898tzWceifUdp+j+
	rOobPdTex42rUSs40kriFAhRSjyLchWDNjZXgdpvFA7PM1QpWJwVNsy6C4XpCFBScYUJolP1xMVDh
	i0Q/V9ceB1ofiJcdgIy5rtFPj2GGeuySxRewqZgevZ7Jp4w2YdijEFQB75/jXnycGgMmz9DTwLHKw
	CwEKmXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UEC-0000000CFYo-0q6P;
	Fri, 20 Mar 2026 07:25:04 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UE8-0000000CFTz-3z9L
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 07:25:02 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82735a41920so754145b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 00:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991500; x=1774596300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHXZ2trhp5lSa8MQcHknKZyidASSv/5MiJDJYVa844w=;
        b=PedBvYXntS28pO6X8rTzj7vt0WtAAwoiUERXttD+qMAoQTuuaNsMzKczjXNSg47mzi
         epvgLBvOe90Iq/GDE9ZLKFOVGQ8E/KgGPB94c9+LBZduIowFckHMTju4LY9M7n9ovLfY
         EUJhggyo5Fo6IpCF+NbF1wBhuNn13hrRzIQxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991500; x=1774596300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FHXZ2trhp5lSa8MQcHknKZyidASSv/5MiJDJYVa844w=;
        b=OtlR3mvoz0kxiH/UBpXdSi+W2N5gKooEInAI4Nl8D9mKmIkZbDugb67G5MwitF3ohJ
         2d/5me9WMLjAvDzizrp/aWiLNVOMM4tfplWRTcukemk4ZKYeNsmgR4iB1TELxNAbeHMB
         nrJxPSMkiwjphXyYQRrPpH683GI/3MWkK8O2Wnzx2hSTFBNQNeJYkU/Y/afyA2LgvkBM
         bRnqP+Z3i6EnoxZHEQ44bnCG2WlamSihQ36SUrNGhxm4d2qk7bE2PaCScLdhlc2xSe2X
         K9P91UVQVGZ1Lioe+t/R06SPVGvVF3X3iDXyWjTVrDADwCOqvnV4d0rKMzXSq19eHTqi
         jBRg==
X-Forwarded-Encrypted: i=1; AJvYcCVSuOGbP+GuleKh1sop3LzsNEg3L+wWBwAQg6EG8SthQHrtbIz5sbrAfTTTcfZlLv2hUeQKUFbz0QOQAY466Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiNugiLFUD5MZmdVkSrfPqepQdcT8C6DypxsL1I396SixJ1Oac
	OFWR1InCsQpPDcha7kgQUSCCsPw2fHcJucaycvqUd+Hs7neawBJqWLT5ziJ/jDSbqA==
X-Gm-Gg: ATEYQzx4404Rl7bVC5qJ6/JGLFOro2eyss10MAkE0XjuPK79kOuyLdfbfFpt5AvPV37
	+hx0v/o7ddEhmiHf/ETLyOdIoKZKg7LnHGaSrHanGlNmiw+ekQYqNlU1lhtCPP6MYfnJF2b8f1h
	RlLyzKfvUN2C2C3Wx2u9FW6ns6dohMvyeXGi+U2KKEejCpzvT6rqyyrAtMUBqdWE69yC/EjqKbB
	D0dQ5mYkVf/5572TTo8TGKtOSf22ZaPdVctC+Vl2M2sHZr5qLWAg97L45FZ7elO/0V1/DBWzAcl
	Xmd/km1rptm58EdDSsT0Pzjsnk1D5Q8xsFRh1FrpD9zYCi+KGqVtCp+aumMH0NMth3S31CmCw5q
	+bRliRoABlCC7STOO2CdGDXR+hGevNUoddz9dL/ySE7q29yGX6pqUSQwPrBYzX0q4SjhyAyUSwV
	TcoDwyxciEcOX3Xzre6n9VSAZRQWh8EtuQU5iEjVsD133sJAvhlV3LZ6/1cJ17WR9725RicA6/g
	wgI34OA
X-Received: by 2002:a05:6a00:b41:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-82a8c24817emr1789990b3a.6.1773991499918;
        Fri, 20 Mar 2026 00:24:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04222f42sm1452447b3a.61.2026.03.20.00.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:24:59 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] regulator: dt-bindings: mt6359: Drop bogus vcn33_[12]_* split regulators
Date: Fri, 20 Mar 2026 15:24:35 +0800
Message-ID: <20260320072440.2403318-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320072440.2403318-1-wenst@chromium.org>
References: <20260320072440.2403318-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002501_342866_9345F152 
X-CRM114-Status: GOOD (  11.40  )
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

vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
two enable bits in the registers so that BT and WiFi drivers can toggle
them separately without any coordination. If either bit is set, then the
regulator output is enabled.

Unfortunately some of them are already referenced by in-tree device
trees. To keep backward compatibility with them, keep the vcn33_*_bt
regulator. Also combine them for a shorten regular expression pattern.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6359-regulator.yaml         | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index ac925334ae83..f307a7ed30ac 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -30,7 +30,7 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
-  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+  "^ldo_vcn(18|13|33_[12]_bt)$":
     type: object
     $ref: regulator.yaml#
     unevaluatedProperties: false
@@ -208,11 +208,6 @@ examples:
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <3500000>;
         };
-        mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
-          regulator-name = "vcn33_1_wifi";
-          regulator-min-microvolt = <2800000>;
-          regulator-max-microvolt = <3500000>;
-        };
         mt6359_vaux18_ldo_reg: ldo_vaux18 {
           regulator-name = "vaux18";
           regulator-min-microvolt = <1800000>;
@@ -275,11 +270,6 @@ examples:
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <3500000>;
         };
-        mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
-          regulator-name = "vcn33_2_wifi";
-          regulator-min-microvolt = <2800000>;
-          regulator-max-microvolt = <3500000>;
-        };
         mt6359_va12_ldo_reg: ldo_va12 {
           regulator-name = "va12";
           regulator-min-microvolt = <1200000>;
-- 
2.53.0.959.g497ff81fa9-goog


