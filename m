Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B7DCE7B0E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 08:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRtfnBP9AwX73M7WqRrv6j9K/SzoRky3umOfoZElyY0=; b=wE71Lv1MYelmFZbDzrsN1liTAM
	Z6gsVOwYSDK03tvWXxQGAKfib028oBCQa6bcXx1kLd6wES+TuJXHRvTi4xOIngmNfr86WjZmDOSke
	SGl0Frc3y7lthN6sFLPlIIrEWZPSWW0F9LjlGBzMHR2ZzJap7xCWPZBWzCQqduoM3svVDXjzxeCAN
	fSN1+SByZCmXiwfV69HXFCFTEX09sj4yRZLl6E9q2FpWePJQ8ZuAJCn/Zn9KWKcKAnIAl0qH8Htpg
	cxd86PFJ82dp/x5pLbRjKiF9WM0NgciHc5OjW/vlzSkokApfQQ1dlV+xLLOo1Ahf9QDdP26u5pZMJ
	lYPN1jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmoc-002fVW-2d;
	Thu, 28 Sep 2023 08:56:10 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmoR-002fNP-0V
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 08:56:00 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-69335ddbe16so2447509b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 01:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695891356; x=1696496156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRtfnBP9AwX73M7WqRrv6j9K/SzoRky3umOfoZElyY0=;
        b=LX+MZufPtbNizg/hyI7Lz6zkRr6JFX/Ihg9HPx0nOGRJfU6VJGsXvlTjjE3qa/M3KY
         beuBfUPSi8mDyiiuRpq7/2LIYUL6SngFMYKBp843w4qHxgqnlpFirEEgkwG8E6xnxuio
         oD3jUX4F4vV2XyhFqrM7R83iQXoc27wBiMQLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695891356; x=1696496156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRtfnBP9AwX73M7WqRrv6j9K/SzoRky3umOfoZElyY0=;
        b=Ucy+RVZBS3DZDVokNqCK/ht8JDIKJK6VcPSkG86Br4nEmBA+toIrhydD/2zfP2ITz4
         cl2Uk3qnRb22Zv5E9LvHewd80M6YkdaqnFBBnfjdaWVLE6Bh6L5m/uF3z5v+yt6yUhd4
         xpZ3WmHvjzz3hUF2bLWVbT1y89QaZMnEgArWNB0cwB6OFtRrjf6RIRzRdbbAmRBTHfI5
         /ABmtmkvBiLQLe7/PKgBl3JtP7t6ujSSOHKWZZPEtC1so2D+mF7a9IEfRkBK17Cqy8L2
         Ae+S6+mJe9roON/eoa4aLZDgIlhHSEGOTLfeMXAb9PhAwFlrpHAD2iShKEHzsNRFjMhg
         X6BA==
X-Gm-Message-State: AOJu0YxJqnM1gAuu2QTUhMuGrtMb9SYB0L5wiumHMOth9IKJwtckcrwr
	61s4ja3LydL/d91tEbxF9LlhwA==
X-Google-Smtp-Source: AGHT+IFM5vuqerQOsjNfjBDCVwTrMH1Xk0IlOBL7t8bM4NJqtTrVxCstFnITrUdBqIH6D1ZRG2/Aqg==
X-Received: by 2002:a05:6a00:14c9:b0:693:3783:4a29 with SMTP id w9-20020a056a0014c900b0069337834a29mr619701pfu.20.1695891356126;
        Thu, 28 Sep 2023 01:55:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6747:c12a:dbfd:2cc7])
        by smtp.gmail.com with ESMTPSA id y7-20020aa78047000000b006879493aca0sm1754016pfm.26.2023.09.28.01.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 01:55:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 01/12] dt-bindings: mfd: mt6397: Split out compatible for MediaTek MT6366 PMIC
Date: Thu, 28 Sep 2023 16:55:24 +0800
Message-ID: <20230928085537.3246669-2-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20230928085537.3246669-1-wenst@chromium.org>
References: <20230928085537.3246669-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_015559_201382_2DB7996F 
X-CRM114-Status: GOOD (  13.47  )
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

The MT6366 PMIC is mostly, but not fully, compatible with MT6358. It has
a different set of regulators. Specifically, it lacks the camera related
VCAM* LDOs and VLDO28, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.

The PMICs contain a chip ID register that can be used to detect which
exact model is preset, so it is possible to share a common base
compatible string.

Add a separate compatible for the MT6366 PMIC, with a fallback to the
MT6358 PMIC.

Fixes: 49be16305587 ("dt-bindings: mfd: Add compatible for the MediaTek MT6366 PMIC")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 294693a8906c..10540aa7afa1 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -22,8 +22,9 @@ compatible:
 	"mediatek,mt6323" for PMIC MT6323
 	"mediatek,mt6331" for PMIC MT6331 and MT6332
 	"mediatek,mt6357" for PMIC MT6357
-	"mediatek,mt6358" for PMIC MT6358 and MT6366
+	"mediatek,mt6358" for PMIC MT6358
 	"mediatek,mt6359" for PMIC MT6359
+	"mediatek,mt6366", "mediatek,mt6358" for PMIC MT6366
 	"mediatek,mt6397" for PMIC MT6397
 
 Optional subnodes:
@@ -40,6 +41,7 @@ Optional subnodes:
 		- compatible: "mediatek,mt6323-regulator"
 	see ../regulator/mt6323-regulator.txt
 		- compatible: "mediatek,mt6358-regulator"
+		- compatible: "mediatek,mt6366-regulator", "mediatek-mt6358-regulator"
 	see ../regulator/mt6358-regulator.txt
 		- compatible: "mediatek,mt6397-regulator"
 	see ../regulator/mt6397-regulator.txt
-- 
2.42.0.582.g8ccd20d70d-goog


