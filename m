Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACFACDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 23:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBvy7lbYwOwBhn+AJIxwjjdhBjxul9CUNWBOFs/FosQ=; b=4Xcm1I2cn/Pe9D7PphJepAqFjf
	LwDaVAMCrH8ntStVj9i29onoKH8ypEEvI+zyNtfc7mwQjyRlvX+D9NRY9bfIzrDf4Om0/T1Upg7wN
	O5QMfbERVnbrXpKiegkRqw5MHEMtoDzvntmrqzkKv7OLSg+/oXb/0tkjdiT/j0yntYPHTCn21LrTm
	xdXFV2kLnb0V0qC2OtOlD0BmNoX7/mjqc0poZyEeU1ESl2NWspicQ9pUAxHew2P7giCXKKEbDX7mF
	axoQXCJU8XEqo6LkN/Woq7/7PJslkfPmfbLOXGCKwLfrCPRTf37Nm8Qeyd00+eLL33TvtSy6ckb6k
	Np7mrIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4hz-0022xg-24;
	Thu, 12 Oct 2023 23:03:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4hp-0022mC-16
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 23:03:04 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c87a85332bso13351045ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697151778; x=1697756578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBvy7lbYwOwBhn+AJIxwjjdhBjxul9CUNWBOFs/FosQ=;
        b=Cye2fi6rV/T0qrFWHAo7VYf80wGzVTm4/M10fnLuB9Z9kM+/m7kuVXRI5qU2/f4Xph
         JSixgl88sYRVAxHysG79Zz7EIqOnfJ8WVHUEIBRyrTaxCDIIxvbhWCnFiYO7/kCeCLC0
         pMEIF0G5+/FcDWJtCEug6SxLrqU/Ol+Xy74jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697151778; x=1697756578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBvy7lbYwOwBhn+AJIxwjjdhBjxul9CUNWBOFs/FosQ=;
        b=tGh+JR0wO4yvI5cfS+zGybAOiBmihyviLk9j730H2+vF/wG84f/ypbTlS06+u721dn
         XaZekGe61vpQMDmHmyUr5AE1zzxyAF8EgTSEbOBh9PXHS7CeeSSH83DKsMM39ldz1x3s
         c8Hw3D3qjXTEXAljI86vZ7TdA25NIv3Ct6FwvTDfJ649urCo5sqmuVpBtThJvQlzu1tl
         0AoVxfEa8Qiu2KCCi0ZkkoIRKHOrolEMxIdLnpksL1dRSp3NEKb7742by36V/WlavkcB
         c/3oTYOAFctX+FAdyC0Av2KswGA9yyBcXCFHW5T1dRg9BhZDfN9XCbNLiZ1n9C1KYsk1
         D3+Q==
X-Gm-Message-State: AOJu0Yyx5E703DIQ6zsrvFSdkEjqB/eBXPI1ofVv3gsXXbK8nm7TOzXD
	uWT5SVv+Hlne+5Dc4djeh0020w==
X-Google-Smtp-Source: AGHT+IGXznJ4hIrXPd2v4LG0qd7GDuqFPhe4DtqE9+/RvasogqCkxgRRCfWmbESl1PyoeLxvWTeJjA==
X-Received: by 2002:a17:902:f14c:b0:1c9:e0f9:a668 with SMTP id d12-20020a170902f14c00b001c9e0f9a668mr2179774plb.18.1697151778356;
        Thu, 12 Oct 2023 16:02:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7397:2561:ed13:bac8])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001c613091aeasm2494390plt.297.2023.10.12.16.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 16:02:58 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] dt-bindings: arm: mediatek: Add MT8186 Rusty Chromebook
Date: Fri, 13 Oct 2023 07:02:30 +0800
Message-ID: <20231012230237.2676469-5-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231012230237.2676469-1-wenst@chromium.org>
References: <20231012230237.2676469-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_160301_395579_D41979F5 
X-CRM114-Status: UNSURE (   8.96  )
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

Add an entry for the MT8186 based Rusty Chromebook, also known as the
Lenovo 100e Chromebook Gen 4.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index fafd5e18f640..5e5834d9865f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,12 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
+        items:
+          - const: google,steelix-sku196608
+          - const: google,steelix-sku196609
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.42.0.655.g421f12c284-goog


