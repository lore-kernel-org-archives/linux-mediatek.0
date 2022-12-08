Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD9DC3A5A7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDJr0JNgTCOMxRZclskMbEi5U/4ZKMcH67crmF1PMpE=; b=bmTUVFTIGYRtk03iYz8w09V6Bs
	zitPXW4/OU2W3a1b3rRem3D1RrpMIppe9zrp5rJBEiDigpDLskG69mNr6i+tP+kKRDCK5oBVGmfFt
	Fj2z0hmdvh3uNFG6iMxv0JtUlr78Uy52MFzZ/4VAZDU5y6+TBFRTYnmnI3NscheJged5+ImAbMt32
	chQnaheov/0K1Rl+hqepGyvVpd0y6w/cLttVia3HKL6XaI4cUm1/aJpovFi5PhjNcGMnAKgBXWdnW
	Y+rIsC9CwR3+s66hZZvw8ypmCkKlhUA5NFlWKGdsC25L27+gfqws70L42QI6xogUkycLbmuIRLVjb
	+4nMGvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Jol-005FoX-DY; Thu, 08 Dec 2022 16:32:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IrI-003UiC-PJ
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 15:30:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id m14so2031318wrh.7
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 07:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDJr0JNgTCOMxRZclskMbEi5U/4ZKMcH67crmF1PMpE=;
        b=Mt3jE+le0MGXv1iAIXnoBBkc8fokd+3aEZfOC8Y5+nYh4svi/5AdVqugjdtnDHx/Ji
         kOFhOEUJZpWyWlDMjzMNKuBXk9tFLiGhJXuToi277b2mLN0wbceaZag4n8+WGDOR0TFd
         bTNIhnQsyP59x0v9Dt7Pvgf1U+hUNg+CgO7ystvtFnZJSGn2MgKYOZy9qLt8Zr/gPzut
         Aw85CksnFGjOYp+imRxuPsXUEH7T5CMiAlf3bzsuR2GVdow0V9V9WzCZIATGL8BFNs6U
         wxOzwpFBY4gwrY2cFdshm6gByS91YY/iEO8QOITzzmWd0lNs/vxeuWtC24fPrT9SptFQ
         Ms9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDJr0JNgTCOMxRZclskMbEi5U/4ZKMcH67crmF1PMpE=;
        b=UI2UJhVgH3iIMIXafTDkbdAzP1SwxE6uyxawr6ERMiRmqE+abkIx7WB5qkHjqeDlmT
         fDH5+7cjcI7AZVkhTXEBlVE4qDTRJkPWKkRH9xKiKXsogNl2FVOFyzY0X/i9mUhKqXZC
         6hOSl+BgOdKQjD58XG5xxPPQYKAxce7H36MB9VlJQkecd+B2oGJi1Wj+wlTq1l8ymrDu
         Yi6B+QM3uuUdtY4ZJQtBuDlbgu7GSy6OndD+ZMRjNd5W+/KtUUu00Uh6e+E2zwtw3n9g
         VfvjAWJj9UaUEMZAwElSkwnaClnljn8gb0mr2veZOCvEIeKIWk0eMohYbb9uF5Tcjoc2
         m86A==
X-Gm-Message-State: ANoB5pnpXXVQONSreP6bvPJ+6PhFWqNtidt12AezkEiI2XuCRXyCCWlP
	DefdYsDZ1pG6vlpHgtMSjIxR3xvLT7SZzJlR2xGXww==
X-Google-Smtp-Source: AA0mqf67lfHIJwHfsORr5HkhkFVrVxVhlkCojfRkbwd4ml08Xz+iO8ncJ9VcfWf+AbAx+sSMtIcRRA==
X-Received: by 2002:adf:efc8:0:b0:242:f3f:28df with SMTP id i8-20020adfefc8000000b002420f3f28dfmr1434570wrp.58.1670513446920;
        Thu, 08 Dec 2022 07:30:46 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b002366553eca7sm10673239wrt.83.2022.12.08.07.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 07:30:46 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v4 5/7] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
Date: Thu,  8 Dec 2022 16:30:38 +0100
Message-Id: <20221208153041.3965378-6-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208153041.3965378-1-bero@baylibre.com>
References: <20221208153041.3965378-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_073048_823748_337AF5A3 
X-CRM114-Status: UNSURE (   8.15  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 7168110e2f9de..d2655173e108c 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -28,6 +28,7 @@ properties:
           - mediatek,mt8188-mtu3
           - mediatek,mt8192-mtu3
           - mediatek,mt8195-mtu3
+          - mediatek,mt8365-mtu3
       - const: mediatek,mtu3
 
   reg:
-- 
2.38.1


