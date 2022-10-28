Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65291C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z06pdfS003dG+bMsKoEr4GgY+rFAIFspiXbdk/yaqow=; b=v6+0uzjHITyf0hw6B8LlKNU1Ux
	euzpmmmGZLKi5LbzqoiRCsPTcgdXVyIKyM2brIqKrNd/nRPCSkU6Ou6khbXRaeXOOO2MqnvUPtMz/
	Ipax5vackLiO0WIENL1zGSW73/R85x5KZttsQzkz4h/nprXw+C/2Fu9FzLUBeSoyLwzUDkC+UM+Lv
	215+LSQxDnLcNJodMKjbapr5uKVA/QTJzvlK8E/Yb1LYgDdLoZfatRu7YnxFo6eTzGtUG9H9AUEw2
	BZyjGbzohdDSJ8zpKnvHgUI8lHl4m3x0lt2SttawwJlad0UNfOwXJNJaIfPufqQZWVZhGw3KZ2iPZ
	kYTJWwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROi-000YIP-2j; Fri, 28 Oct 2022 15:35:52 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRON-000Y3v-Nn; Fri, 28 Oct 2022 15:35:33 +0000
Received: by mail-ej1-x636.google.com with SMTP id f27so13827507eje.1;
        Fri, 28 Oct 2022 08:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z06pdfS003dG+bMsKoEr4GgY+rFAIFspiXbdk/yaqow=;
        b=dO+awnftpXtAIMQBIJ9FXtRxhAOZkhM4J2BxrYKZCmESb+oA+lj3C059YZ3Ex6aAYn
         4DQ4nELnVmjeJgceXYI7+Bx6WaFkiuWVMRdzE7NWX4Sgxf2PTOc6gmVr54Pj+c2Cr+t6
         i7BmANBSI8m3clsoYZo0BC9nyb599H1+KXmJxXdY43PFdIZgvFSM+qAsdgARQ309CkK/
         eyq+/x9Nm1eNEr2KrkEl8Ncb9zIBcIwpsX1NqCmdSs8h2G7d9Ubv8LBstk4GCfb7l/Cb
         AUm7/CzQx+KpvQRVeUqXyIUT17sXNj93aLBRwk8hyf5DnALzGjTM/0GTEjjd2vzbgKuk
         4EZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z06pdfS003dG+bMsKoEr4GgY+rFAIFspiXbdk/yaqow=;
        b=7PiUdQRDiVoXrgY7Isv7pZYB2Lu0j8auo0UR982j7UnTv8M8gEZbyGwxRxhHZ0UomJ
         mUEy5bQLg3jPCwiWsrkfquHU3mVCg0EPVjn2h3O2yGWnA1j5feGsXRijrN9UDbJU6Gof
         LtrDfmmKSlmhnAVEV3I59t78NYwKWsZSPV14Ar+ONaLkv1VWv8sLUu1595kX0j1iJ/Nn
         xwBTQgW8BGXOkRidXPlEpnLdi4khQzC3ziyLLltoP8jexlxgGSKFT2pd70bsZamNfAjy
         oHMx4Il2NL/BWbbEdEwQEQSlJ9bjN7n5Cc5RERP3RcYZSOVvr5zjBmRpvX/aV+2Vc05T
         R8/w==
X-Gm-Message-State: ACrzQf0Gregf0xdG43gVWbuNhNumnhb2egw9VfJgu4N+1tbwuzz141yQ
	SMX3D2NQeUJIcEFlx4p0RhQ=
X-Google-Smtp-Source: AMsMyM665PDwpDa6biS24HSeKGo722HnC3egF6m8MyhVTIv0AxIMuc/D0YFhO2N4MItjPvG6qP8BVg==
X-Received: by 2002:a17:907:948f:b0:7a7:5fc8:909 with SMTP id dm15-20020a170907948f00b007a75fc80909mr25445458ejc.658.1666971324992;
        Fri, 28 Oct 2022 08:35:24 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:24 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 02/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve description
Date: Fri, 28 Oct 2022 18:34:54 +0300
Message-Id: <20221028153505.23741-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083531_808657_5C362E15 
X-CRM114-Status: GOOD (  12.33  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

The current description mentions having to put the pin controller
node under a syscon node, but this is not the case in the current
MT6779 device tree. This is not actually needed, so replace the
current description with something more generic that describes
the use of the hardware block.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 8c79fcef7c52..c6290bcdded6 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -9,10 +9,9 @@ title: Mediatek MT6779 Pin Controller
 maintainers:
   - Andy Teng <andy.teng@mediatek.com>
 
-description: |+
-  The pin controller node should be the child of a syscon node with the
-  required property:
-  - compatible: "syscon"
+description:
+  The MediaTek pin controller on MT6779 is used to control pin
+  functions, pull up/down resistance and drive strength options.
 
 properties:
   compatible:
-- 
2.38.1


