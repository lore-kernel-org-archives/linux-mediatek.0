Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C80C63708
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6+ABKaCFT5+1C0Y5clbHMJQa6kjF8TIULfr4cCgl3o=; b=Q86gB3IHqAbxJ8ylzOsDqdO76f
	zfUGgHa1UOyBxjxp6G6U9wFbI+b0AzZUmsVzGLh7kvyrH/Vj7JgozdZV/wT3aha9zMT/iY3fQUm00
	aMzHI3FFnTK9SvT53FQeLVzSzULsoqCoQw6cJQdbRX+p8wrCwyD8rvu/IjA8atyRGuU4PJf+YoEim
	UXkV053E2DG/Mn00JXQSwcVCujx+w6K71oex1+jk6fQp+B/cjfyz2XIMC/4jgIW2JnGGjgESTdlSE
	sFR3K+xaC1dGoNaSMYHxu9XqY4thp4GM+D5JQNLGstnjSOw+dO77TiPZY7I5QjXlYZWguh4xmc4xc
	orJvK6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Jon-005FqH-8O; Thu, 08 Dec 2022 16:32:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IrJ-003Uiy-5N
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 15:30:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id y16so2048943wrm.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 07:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6+ABKaCFT5+1C0Y5clbHMJQa6kjF8TIULfr4cCgl3o=;
        b=LCM7oOJmoRy3wGsCUMZoYwr4aV/73j1pYFhJO1iyfzfdj3blRZvKZ9A7suusfQN3IK
         HVhZRy+PL2X0cNNsC5KQp5DgCNKpAttJ396X3I4R8ldvQdKBGe3fJ1ik2epMa1x7tqao
         qDET9+GWyGzE+IFBrTufBYCQDV9QFNzm0R84bD3/QDUSfHpjgKHT6PileWavmSptJc2n
         7vc/NwPAJQFmaeiZh1ightM1l2fYFyRF4SPdvA2O63R1QabasL939xMxgR1e7hDJHTII
         xZ5a8x3tumNJhtq92nPdzh9DyWPqH3fQ6puB38waQgqaZOWPPFmBcfhremrScaTkRTS3
         4BnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6+ABKaCFT5+1C0Y5clbHMJQa6kjF8TIULfr4cCgl3o=;
        b=XxjwIZSGarwkND8g5g7ifUEKeyZ4TyLdTOsRPz/pkrZJymgnlZivpkzNegEoFChJNi
         tZ84tgF5ucBeP+CpKgQfXYjSQP0KzrMr6oXs5Xr8+nsALwNIIocg6VObWhlbFNLRIC5v
         DKJLlJyJtQiXuaLx0gwvS+bfFXIfV3wCdtcTxhDBhs6RFU5fuQd7D/drnvjJugUTEMbk
         ybvx1GUjSGz8uapki4lQVfFpqKHetmNuQkr4moQvQxXsRkeOg916Mvk2leQu/wDNC6Wp
         xD5kKwDk+gA0qxCzop9EjOWF2qBFWUMRky6s5QeBRUmmKUhKt6bmYZwr9UcvqK5WokmT
         Qf1w==
X-Gm-Message-State: ANoB5pkbKT15d9LUjiC9aH9cO6eLmumByPzGEOS3eESqjUMhhWySudK7
	0FQeL73QmmpEstDn5xM1VlAvfaXlkPq3Y7LcpP22dw==
X-Google-Smtp-Source: AA0mqf5FOPXltuZLPneEbB5VngzDKQGwN6thrtAgUY/6DvNUrqLQncoLNWjNWmFSiUbzrk74ARetEQ==
X-Received: by 2002:a5d:6407:0:b0:242:2cb4:6fa2 with SMTP id z7-20020a5d6407000000b002422cb46fa2mr1703001wru.31.1670513447701;
        Thu, 08 Dec 2022 07:30:47 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b002366553eca7sm10673239wrt.83.2022.12.08.07.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 07:30:47 -0800 (PST)
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
Subject: [PATCH v4 6/7] dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
Date: Thu,  8 Dec 2022 16:30:39 +0100
Message-Id: <20221208153041.3965378-7-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208153041.3965378-1-bero@baylibre.com>
References: <20221208153041.3965378-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_073049_232642_0EE34D61 
X-CRM114-Status: UNSURE (   8.06  )
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
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 939623867a646..3b92725bbc99b 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -34,6 +34,7 @@ properties:
           - mediatek,mt8188-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
+          - mediatek,mt8365-xhci
       - const: mediatek,mtk-xhci
 
   reg:
-- 
2.38.1


