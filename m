Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CFFC54EAA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5xBfE/ZGOPJTnop+MEy0u8c1qaCOncm13Ltk1p/JL4=; b=aKkc8QfGn3pOG9wYWj9a327Bd5
	wcHDfRcc4Us6k5MObwr/YL8XTz6blfjkbnSmGcL1aV8K/l0KPo7CpogYXOt3KmspmGb1uuYAQeTmJ
	3ZLuaQZay4y0pOzdEwwlSK2xYXq7WyUNLEaa+Y77Cfd6qPZAqVx07mvUll11rSbPs4QVCJ7XRzHvN
	nKMfEPbfuRyXPSNubp74+owa4wEIyGxxMW6Yxr4EJePsJrJWwOVJSvvOXqMDlUJ0xuQdssCU7AuH/
	L0BwfhNxuerSb+qvfemCodbsFj+sOhXyzuGxB+8i0uQpROCuXVG0AKEsfH7evMeDSlwU2o3bHt9Ji
	lfLQbg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgvZ-007bSk-UT; Wed, 25 Jan 2023 14:39:05 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrt-007ZUy-Eu
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 14:35:20 +0000
Received: by mail-ej1-x62c.google.com with SMTP id az20so48236249ejc.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 06:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5xBfE/ZGOPJTnop+MEy0u8c1qaCOncm13Ltk1p/JL4=;
        b=RCcY4EJr7DH2OZHGreyGRn7U8BeObsCO7+xpPYJ3pKfVd6rljsaPpdjEIhr+OW4kBr
         WOwmN5BBww/4oDETxVCE47sQrY3R9E4AAv3cBQWWAPApk+d0hczKbUdenY+NV2SUbGLJ
         oBTdyw7zTPFg3MUlCDTol+WhJglkv8o3/WA4FtPvA03NVl/wQ3BjBCjnvEM9Z3JpOjhq
         gujPyVFd5wwQlCvCPYC6G7tnGOxEvItCEW/ya7suORjREvdxL2FIXES9yyYmbpqk4i6g
         csOvUnMEay4pAJQDYKuom/jjCO4naJpOicO0AHlwWeI240cJnNh02fZhvFJ7QK7dzeSD
         4LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5xBfE/ZGOPJTnop+MEy0u8c1qaCOncm13Ltk1p/JL4=;
        b=QWKcTMH78mICrOd7FCjr+WFc7AOcQU1etMchpNxse29Ix8t1MwZqbhseH8E6mSQmdm
         hjpw7jpDtBGrmjjwe9GjUU75EePc7mrhlvGa1l+WQmz+somp1ds4C2CLwdSy9Jvuw1T7
         AqKYs7J0Q7VVqtbDQ8FIAeRzqcV//JJQSRO2AY2WzFY/rJoTcG9GKrwjpihAMJKPMfoX
         IRyh+wNrn2LgS/9OhDknIdRsHfn2i5jufUTjWVvkreOOYR2R4Km7byHtK03vKWOZeOak
         b1Aq5yUIdiLM5G2UMOGBGvuV+uoAnxemwi4//Rd/5rPZjNKoiGpOo+TJ0dcB+o4GlEnI
         IUpg==
X-Gm-Message-State: AFqh2kqc8/RisJH05ARfSX1SJqEKcwkMI/0Slzp4ZGiSY7NakbdS6MGj
	eYO8qzyC9jpqP6aNqsuJTsHk6WXMNNZ83RAv
X-Google-Smtp-Source: AMrXdXv3P6+YtNux80G5HQOCQm6qla2fel2TtE0oSEz8Qv8aX1zImaVTVApIjkTYGEXQd0inEr4zzQ==
X-Received: by 2002:a17:907:b9da:b0:872:21b2:9a1f with SMTP id xa26-20020a170907b9da00b0087221b29a1fmr33800112ejc.58.1674657313338;
        Wed, 25 Jan 2023 06:35:13 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:12 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v9 6/9] dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
Date: Wed, 25 Jan 2023 15:35:00 +0100
Message-Id: <20230125143503.1015424-7-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125143503.1015424-1-bero@baylibre.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063517_534876_520037C5 
X-CRM114-Status: UNSURE (   8.32  )
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
[bero@baylibre.com: Cleanups suggested by reviewers]
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index a3c37944c6305..c119caa9ad168 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -35,6 +35,7 @@ properties:
           - mediatek,mt8188-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
+          - mediatek,mt8365-xhci
       - const: mediatek,mtk-xhci
 
   reg:
-- 
2.39.1


