Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D120C25B48
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKO2g208XzCfOsORI6ZMG1mCYRoaMgItfO0wExwA+14=; b=hlLLyxXPNAQ8GTG3Pvw1K4XjbA
	5WOc9gcsmcfmrscvuvmwmTsV0uGnXf4FLwwSpTILgLENppGXEbjQDBw2f73Q9mvBL/SjteiH/Fr+L
	p4dQ7TdJfYM9DYtq4yWyWO25mJ23ymK1c/ZFENS1xkbuMRlHyiP/P7A3e/M5VLug5rZQZ2LRbnang
	khh9Hx47Z6nYln/xkNegFRk3k3lYFDGkkYNR+99U+E17ktOSBt78OgW15Db/Zqdj7IbDoVfCt9oBh
	ZAQ8cyp+qFPWyu1L5KnIQDS8PUa2FYQ69A0EBF7II68olEaXwOTP161FVZ/FelqnARaN8UWReMzxC
	gypP6Nxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5oQ-00F2SV-37;
	Thu, 26 Oct 2023 19:14:34 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5np-00F29B-0k
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Oct 2023 19:13:59 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5aa7fdd1420so1046221a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Oct 2023 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698347634; x=1698952434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKO2g208XzCfOsORI6ZMG1mCYRoaMgItfO0wExwA+14=;
        b=FYXlrJmnryJZS8pe7HR1umJOYvrIOpV5Vu572IImiumh7A5mQaNcbv7XPEG5Klz5bA
         fknx7pNDh+x/NKYMB909fzESb6BIfopoqRGD/vFYFBVbkLJFHVxmVDvL78Cni12XUScD
         r7Vu+evnbTX0Jk2hPOTFCndv6tE+fE+0WJOko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698347634; x=1698952434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKO2g208XzCfOsORI6ZMG1mCYRoaMgItfO0wExwA+14=;
        b=wtS7UlInFlxhagMnEEKdkgC0rJHwbwBOJUKxND91WFiKTOd0bP3ykVJwkSXAzRlRjZ
         SvWoDZ1vv3NwT+ETSwYBSmA5Vps//MIN3J57+Wc+BVQd2fWlhQy2RDiRvWF+WiSAHar+
         Hq9cCRC2kSyHqCXAuE6+ueAP+wY+g79hnJpPSdfY669L6pSlT1IK0qui5Do3JuLtp1Or
         knBO8bZysy8Dm8OU6JaTINGoJBKSsthaYXgvE8LLPyWJIyL8AHeCLVrUZX3NO9UGdnn3
         nL2RZvgk0n9QKXgpSlEzFPo2sd3G84w0kRDs9JMBo3XJQ8C1Htp07oUFg7twONQLEQR1
         hLsQ==
X-Gm-Message-State: AOJu0Yxom1pVRymq4atz90evsUe0m0mR07DVcBcuNLbb/E0JNSIBxzRr
	N+1Yjc3mEuarRGwWNsNcpnPQ2A==
X-Google-Smtp-Source: AGHT+IEmsklJ5EWfVQVMeGYaB6B6U1UOfAuEgiqRe/EIB/KFs8EkGHLZUt6Yhm9lhheQgYiVB6Lw/Q==
X-Received: by 2002:a17:90b:f0a:b0:27d:37bb:12c0 with SMTP id br10-20020a17090b0f0a00b0027d37bb12c0mr449838pjb.36.1698347634291;
        Thu, 26 Oct 2023 12:13:54 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a031600b0027476c68cc3sm2183639pje.22.2023.10.26.12.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 12:13:54 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 6/7] dt-bindings: arm64: mediatek: Add mt8183-kukui-jacuzzi-pico
Date: Thu, 26 Oct 2023 12:09:15 -0700
Message-ID: <20231026191343.3345279-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231026191343.3345279-1-hsinyi@chromium.org>
References: <20231026191343.3345279-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_121357_311396_BAF3733A 
X-CRM114-Status: UNSURE (   8.80  )
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

Add pico (sku1) and pico6 (sku2).

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index c937f49ba3b4..f133d9673803 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -258,6 +258,13 @@ properties:
               - google,makomo-sku1
           - const: google,makomo
           - const: mediatek,mt8183
+      - description: Google Pico (Acer Chromebook Spin 311)
+        items:
+          - enum:
+              - google,pico-sku1
+              - google,pico-sku2
+          - const: google,pico
+          - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
-- 
2.42.0.820.g83a721a137-goog


