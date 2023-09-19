Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80011CD54AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roMXUVdcRuUMZfWgJQHOy3KXiY94dTO1sbgsCPHuaMo=; b=XwgT6LMmUsatbRPJo9e4cjI50H
	IX0xgqTQSuZWAOgkUZ26/tk/4JwuiaaNfPkt6E/2MpGL8NMNx5ihsXYvQ0bGfgKX4mI3OldSz6LqA
	LnbRUDriTP3V2uldaLHOCmehj+EolMDRHAQsJqwoNJPgRG3z5NULMkPEiIFwHiA3ZKR8irW5GYqqK
	nZl0K5NWxHJ3ERH3RFdrTMSxnRFIMmGvZfCp7i5BmtNU4ZZJbZjaOxE6NBxyRQHw8SNsE91oaGlWD
	xDhuX2Q+tzHmwoPIudk4NOxSNYOEzGUT+3WCYumqThnmASzbU3TSBFtP8RguwtXwmu5afgvK700n0
	AIKT0pEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYGU-0004XH-3D;
	Tue, 19 Sep 2023 10:47:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYGR-0004Pb-0Z
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 10:47:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c44c7dbaf9so29529795ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 03:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695120446; x=1695725246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roMXUVdcRuUMZfWgJQHOy3KXiY94dTO1sbgsCPHuaMo=;
        b=L9ngn2REtaw1IlEy4JU7S5A4QLPbj/2mhCRBOE4F61JwpHkpdvTdF9Pi2CSPw+aCER
         DFEEup3J9w25brOQbKRvshGDPA6VIYFGrzqVa84kfypeMUyZZF0m1Ycr5j3joQomjPML
         fS6FchH+SSNInDMJMA+Dtw0Aj1cDXvr3Pbkzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695120446; x=1695725246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roMXUVdcRuUMZfWgJQHOy3KXiY94dTO1sbgsCPHuaMo=;
        b=WqrgdRfeuoNZWIVFPMOlrmq5XXdqgPteejXWz0RDeIw5regvHZBoV+QX36O66go5uB
         i25VyPxSeK/WZ19Rr/SaevZEwxJUjy2UHK4EHcykZSzCMsLfjl4ocomaZCDojyqdT806
         nJYfhcaVk3o0xQU3gaSdDuBIanapDNdwDP34me9VhxCTT8/H1LkVikW3n5WKnuO/cX2d
         D6aOJvuJguaQ4cK4pZPW4GVKWdKJ0s3bmbBxxdIbSQY3vJcCF7djYIOWlAxjyeeBgAVA
         07FYPJvhFo4Xew4Nd+YZlf6SU+3sJTm+soSHrI+epXQhjxHU2tpWxqoMdK1kG6bsi92b
         I5wQ==
X-Gm-Message-State: AOJu0YyYccrogmXPRp/S4q5rrOJmOfwdZeUt1vMwq9jWoFBBYRo1sjZp
	wgkJsMZ+kKKSsSnN/sa80v1rfw==
X-Google-Smtp-Source: AGHT+IHByD4aXAEIfJqjVdUWt5nQ2XSTSmvOVgjkqXc4jrpM+uK3fZO6JsrMom+d02up4tdOT4JZyA==
X-Received: by 2002:a17:902:ea0a:b0:1c0:9b7c:f82a with SMTP id s10-20020a170902ea0a00b001c09b7cf82amr14897917plg.53.1695120446625;
        Tue, 19 Sep 2023 03:47:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:40a:900d:e731:5a43])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902d48a00b001bc445e249asm6719578plg.124.2023.09.19.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 03:47:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/12] dt-bindings: mfd: mt6397: Split out compatible for MediaTek MT6366 PMIC
Date: Tue, 19 Sep 2023 18:43:44 +0800
Message-ID: <20230919104357.3971512-2-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
In-Reply-To: <20230919104357.3971512-1-wenst@chromium.org>
References: <20230919104357.3971512-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_034731_230771_DA275F89 
X-CRM114-Status: GOOD (  14.13  )
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
2.42.0.459.ge4e396fd5e-goog


