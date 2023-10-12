Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2CFCDB474
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 23:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qE2xuZH+agCjBR7PCdArWMNvITRMyBp9lywkci3iPfo=; b=i8DdHOJeQVxe/4SkR1xDEo0Ev7
	fQdvej/aecq/Es5yTLmUxphSYgebHPwaKBa5SfmD9fPyDSiAmgDVlYCvENPDaP7AOMmMiZ2mtaLaf
	wHqwQ90rq6AMkRCB/FJrHK8Ub9e1JdkYzT5vH2cR8xvg9ZdHdSaCefL/BRFdwS+QcP6JGKOuujBJt
	UbfjFbNTDhhwQCpwTh4yvDw0iz5MGNVCaeBZiXERJb0nh6EmyvEd8ucDNQ/CjggPkAeXtG3NWfggd
	X2QYiPlGHK6SZWPwNB68gdGlWmdtn6+SIfFURwYKiQWCu8pI9W0c/i0mBeluQmGJ+AvgfEhUxV4o8
	9+xcMNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4hv-0022uA-2N;
	Thu, 12 Oct 2023 23:03:07 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4ho-0022kp-25
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 23:03:02 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1126738a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 16:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697151776; x=1697756576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE2xuZH+agCjBR7PCdArWMNvITRMyBp9lywkci3iPfo=;
        b=XJvuCk/G0N949h5bQuusKfMv/FyUdriiYiMNGm1RDFsD8zXAb/fuajylvVQ/+H5+Dz
         Nj3N71ai/OklJM4h0JBZrvGJA850arbB24D7oG0jLkdTcjiMKLpDd9Prks5cWpsNc6MK
         5bg1gGeHFQMHFTMIsGSckz/vt4pop0dDBOy2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697151776; x=1697756576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qE2xuZH+agCjBR7PCdArWMNvITRMyBp9lywkci3iPfo=;
        b=Glzpudo/cMJffSCWbQPJit/kU06X5XbwqcysPDoYxG2yU/CQrAIGup5XiPG/5Ek96G
         j4MZDtTFCcGS916cpzJEMknuxhoxo2uQp9o6THmjCEvKPH6t+1AvDvsRZdcky+Ur/o6Y
         TN9H331WKcdbFqchvytrGpjlbunsvoMEx6g6yFJ3ISjLdhyIAfvWg4XvxyNS2If67r0q
         lX/190agHUjqz9E2SVG0dXMpvtuFnI3o/pUOpoypaYZfAg/+sFCh1yY/SMxzBVSX8Jeb
         xQ0fUx1WWNhhnxcN6EknOd+20hTmSFtyyd+QeehmL6jU8m75i2kr2CvTtBbn7pgSOiro
         htQw==
X-Gm-Message-State: AOJu0YxeyodxmqGHt5Pia38IdWJg5UEYqQuOsJzlcfNDV43jY1ouF+KQ
	YWo23Z3f6IzKDS7C8d0FlpXg6g==
X-Google-Smtp-Source: AGHT+IH82x0sce06pOgWdTOBXT/0/9Qeyys0giYi3PeU9VJRdoN88a47OlyJF9OWRAjbgB1qKDskbA==
X-Received: by 2002:a17:902:dac9:b0:1bf:4582:90d with SMTP id q9-20020a170902dac900b001bf4582090dmr31465372plx.46.1697151776154;
        Thu, 12 Oct 2023 16:02:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7397:2561:ed13:bac8])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001c613091aeasm2494390plt.297.2023.10.12.16.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 16:02:55 -0700 (PDT)
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
Subject: [PATCH 3/9] dt-bindings: arm: mediatek: Add MT8186 Steelix Chromebook
Date: Fri, 13 Oct 2023 07:02:29 +0800
Message-ID: <20231012230237.2676469-4-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231012230237.2676469-1-wenst@chromium.org>
References: <20231012230237.2676469-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_160300_758963_38879FF8 
X-CRM114-Status: UNSURE (   9.48  )
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

Add an entry for the MT8186 based Steelix Chromebook, also known as the
Lenovo 300e Yoga Chromebook Gen 4.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index aa7e6734b336..fafd5e18f640 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,13 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
+        items:
+          - enum:
+              - google,steelix-sku131072
+              - google,steelix-sku131073
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402F)
         items:
           - const: google,tentacruel-sku262144
-- 
2.42.0.655.g421f12c284-goog


