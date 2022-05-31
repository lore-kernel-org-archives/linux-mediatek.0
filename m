Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DC6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZY9TKprAcpYKzgyX4N2L1z46ed3dS3y/N6c8bEqYD+8=; b=yAnZzAZgefqeeH
	9Yn4tZ7l5c5sNiDcMBrLlOBZefHsgiBUhAMWO7EYXNfsXy5umQSz0xYvnQt/8Uyh1tptgpVb9jJvK
	Uy2reBww5bxcg/UJcyne+J9v97e1+xU229jZjYDbNg9SVAuA3KY7Bvr3A6vpcsYEDIZQi8Tj+rszU
	wNECqkkAGlnRVwJFVxh3+fllRNOevOHrjwcpahy/ajajvZ9s19hEjO9B8ksy5IJ3d+tifhW7oFVWp
	l/0n0gQYmZQFCXUSy21ws9MSoirK3nIUyXPOeY453DTSt45xOdpopykNuILBtgNxxjxscmRRMGoQd
	p8A4t4FkwlCQ3tPHzUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3Oo-00BQFT-IW; Tue, 31 May 2022 15:03:10 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2H1-00B9xy-9i
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:51:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id u3so18782377wrg.3
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3wGkmcChS3N6J5I1U5dOklUlfdbKJPPT1/iNxESisgg=;
        b=fikIkFwWuhYcaTcEmINCMiakOznAvwOTyoARO2Ked0fxXRKlokFWxS4v+L3ZHkVXNE
         KJo6JQRplqeWtr7bcHSDaD9wimVN6J5/aFLVwkOlxuupl3wfaWdmJLh5kAYbdtTckmjS
         7ZGd0V7af7yBcvxj28ftOe7vntKmkUDl58co3QLQMh7EDttwJw6VIn65mWVSUtVSY17w
         C+pC6wz1nhlOvs9cYDgkL55ay0oOBepTQ5OOmFShvRgJzHHRi41+K+1jqITOGGjVGPtn
         sjkv7Mviq+G4VnQO6P1IU33v5RSiZUvtdFZ0EWYtGwnjrF0dBp7r7qRY6vrkRwHkHUXK
         npvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3wGkmcChS3N6J5I1U5dOklUlfdbKJPPT1/iNxESisgg=;
        b=gMtRF5l/5T1hmHpNXxO3U44TV7EEaZbTHXZHOhSv4SYnz5HgPNHRoDbJzHNDy16ZZH
         dyh+/URfGA4SKnSIDxqGE/NwldB+9ZgLuXaqbYuSM5Y+ORo2yWdlqK8rbPj8P++vZeh0
         /3kM2HRt7LUHhgEitBRKgu8SJKg67VTRCGFMjtG0o/nUcDQhWU2HqNGKqEdmu5nyDbDD
         3+Xz5fwSthu6am3DAFYGPJ6SkxAHw03jjNUGogoa7tDvntmPGcsLdVLs5dzKSDV/nyTm
         MuBaHIvlt8ZWoJ8sGUGCYTLqgUXgTiqbuLFuQKWAwiOhqx3AcZBu3D41+2OBgkg0mIuo
         82yA==
X-Gm-Message-State: AOAM532R/c7uau0hB9eq5wv0GCBOvvE94deQs6HHPsbpR3/9abfw+g+G
	lNuI7/pKDd00qxC3PVxNOx2gfQ==
X-Google-Smtp-Source: ABdhPJxcPkJR1D9vj54qvl0alyjM+fo9L7Ht5RN1swDsTiyvQa4xekfb3jUiJKdRl+jEckFF9F7nug==
X-Received: by 2002:adf:e0c5:0:b0:206:1ba3:26aa with SMTP id m5-20020adfe0c5000000b002061ba326aamr50251741wri.645.1654005062859;
        Tue, 31 May 2022 06:51:02 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:51:02 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	qii.wang@mediatek.com,
	matthias.bgg@gmail.com,
	jic23@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	srinivas.kandagatla@linaro.org,
	chunfeng.yun@mediatek.com,
	broonie@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 13/17] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
Date: Tue, 31 May 2022 15:50:22 +0200
Message-Id: <20220531135026.238475-14-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_065103_367811_D203E108 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index df766f8de872..9ede6069d9e6 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8173-mtu3
           - mediatek,mt8183-mtu3
           - mediatek,mt8192-mtu3
+          - mediatek,mt8365-mtu3
       - const: mediatek,mtu3
 
   reg:
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
