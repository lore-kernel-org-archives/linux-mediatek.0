Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF74C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 14:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5syVT5/fsryWBSyXJaffy++lhj/umvd+eCti/WD4s/Q=; b=x5MZ+nFnhR59EQ
	FZ1KBJ2E+WuI27o+PRvQ4ueM7BoQsusOkKQy8fk4IMkOgzGqWHcgM2OaMx6L6von5NIe1L537a1Eq
	9M4NhtxEbE2D2rf+qzIl869wu4G1gGuwOYlTb6UO65e9xrEnueqHe7KRvSvQJ8wIe0yetWxe6gJr+
	k6j1bkdEAgRwB5Wm7H974SrArkqcWW4YH1w3z70qcdXxTlhIKo3Ju0IuuhmpUe+s4gEvZ8p9YDXrU
	0hJkS199baOkcUCWq5boeD4tnvtYHYvD7ySVe9UvoqxX462zXg47XYtW/ArLM4+YiZTIT5trsP/Fd
	u0NwIqvsDlydW07d106Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncT1E-00CKia-Dk; Thu, 07 Apr 2022 14:21:52 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncT1C-00CKhB-Aa
 for linux-mediatek@lists.infradead.org; Thu, 07 Apr 2022 14:21:51 +0000
Received: by mail-ed1-x530.google.com with SMTP id f18so6605503edc.5
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Apr 2022 07:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3az0dsHhRbjAtvjLKgQFw2T2bUmh6TKysA+m1P0pGGU=;
 b=e+pjZBZ9Ab1nOqK9IYrgBwN04kNJAEfZChRyW+f/KTw428JVlN4vE3rBXrzyr6rvMu
 bf8trEZ0L+m94fGQBRWz+lx7RobDaVaGsJQMzdDsVS4NHM/+APAgsfNPWnLE3lpMQUaI
 6bd4C2NQfhABAM2tYlCdomWNIAmKSuxiMNBOAw48qKQh1DgO4BaZQqVZHpLEhpkIolJU
 imu0OrGekQiJIpOV5rHBT+3b4yOxPkoVN61TpGMAQQYpGZd+4QyvZiBDzmRKRTwwPmcq
 q02v+sb4n6rXuVCWfZiidtXzRb6OLCdPGXgRJcbzoIfrJTSNQ1hbE2+KQEMEWfeMJknW
 +XOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3az0dsHhRbjAtvjLKgQFw2T2bUmh6TKysA+m1P0pGGU=;
 b=0i/7rxfLRai0sSTgfCpi/amaS5DJe6HtKEYdCSKwZTbRuxWvu+q7JHskB+tJQoRjs1
 9Xy1UqMZ6VEJg9S7GEg+jR6Ao6Bkn7MjT5K8Qad8j+y2g9dKOoktxTlisc3I3ZCnbaip
 JPXIIYBCBO4uUbtK+r0Sq8WOOwkVAU3dtygslLtD4hbnsWjwkLW7lit/WqMLnFEcnSOT
 f8c+9QVhhpqK4Qh7yfWm8LmIELb8SmZUlTxOHHcZzuH4wZRgWPIH+nwQJRUbGDCJ3CBP
 MfCFuSr4ObSDKkiSSsoZU2DtoKATbCSfakZaYBnewkuLW2j9+T/jOZqUjBUYz+Uv9of6
 AGLQ==
X-Gm-Message-State: AOAM533KeqQp3YDxQAju8+hTR96G7o8AUgVrJ0lXQRZgrSDx7PGjAuci
 obwfoXqUSMvFclZgmGCL6TVYz1QykecZElh4
X-Google-Smtp-Source: ABdhPJxJ+Ro2BmvGVRNloYDOX+r7PLvVDALhZHY4o7bDgmr9/dXcIP9WmdJvA86P3pUy91cdIl4leg==
X-Received: by 2002:a50:e79b:0:b0:41c:dd2c:3e19 with SMTP id
 b27-20020a50e79b000000b0041cdd2c3e19mr14497675edn.291.1649341306706; 
 Thu, 07 Apr 2022 07:21:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 q15-20020a1709060e4f00b006cdf4535cf2sm7667869eji.67.2022.04.07.07.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 07:21:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: mt8183-kukui: align SPI NOR node name with
 dtschema
Date: Thu,  7 Apr 2022 16:21:43 +0200
Message-Id: <20220407142143.293740-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_072150_424858_6DD0F391 
X-CRM114-Status: GOOD (  10.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The node names should be generic and SPI NOR dtschema expects "flash".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 0f9480f91261..8d5bf73a9099 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -849,7 +849,7 @@ &spi1 {
 	mediatek,pad-select = <0>;
 	status = "okay";
 
-	w25q64dw: spi-flash@0 {
+	w25q64dw: flash@0 {
 		compatible = "winbond,w25q64dw", "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <25000000>;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
