Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC349C4167B
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Jan 2023 22:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQFWSjnAmXGCxMB5DVpOmGczTzlI1ebWvjBAsrHPlS4=; b=5AQA5bUADHmAyhWD8RtzRwNFUx
	Kevqa/q7iRyt/aJhf00aFxmoXHDod0wWcEZytIJpqbBLIjHSwuntNAzmSEU2bNsmD1xlU48rATLev
	ghpPg6pbXnBeV1p8RvhMSVcx7/qvHBeUfDhUWBfdoEPpGUFzkiIyE+qt8S/S5mA2zLI9BQsAhW4kO
	25aGLanr9a0ovh06YQxK9l4LTY7Hp/UCYu7WAAtLVKjd5uIuzuRjQG0rGxFyIzINhQCnnAp7ZCIsE
	xfcpu4W36hy79AeprRbEkqXMzF6XJC5xTgDImmNZ+ugrMjrKQ02T1DT6E/R34JfZ8O7XQlvjnK0EX
	puKhK7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6WM-005jrC-6f; Sun, 01 Jan 2023 22:09:34 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6P2-005f6p-01
	for linux-mediatek@lists.infradead.org; Sun, 01 Jan 2023 22:02:06 +0000
Received: by mail-ej1-x62f.google.com with SMTP id tz12so62972456ejc.9
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Jan 2023 14:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQFWSjnAmXGCxMB5DVpOmGczTzlI1ebWvjBAsrHPlS4=;
        b=HPB4QYzmfLrrNaQyHlmIsiq0AfayG31cj5XucwJY1CBnCzU8OGoBaoSLhcmH3yCg9U
         ZqG51G/2VGKGfJY5MXUQ2C5cZFVJ8AmAf19MNh8TySS1cvC38sz1bcHXLF3+/M4itWy4
         YwgkPhLYDsUBEjmm9bJhrqZ6oFt/cYFU5t/Eh3kbHCceR+8E2lXpHqNjkNs90DNxeq0Q
         3+g6oVA6XfYyIQzJkFmEYLk61CNImaif0BjPSlLCfuXzPa0UxVzuiNpLY8dB/E8Q+u8C
         2i/hv26/34dj9OMKyJIwjwR08lV/rcwj1vY5UGmUYNCLUQD0/xoGLlFJrVQt2LSriDUi
         NVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQFWSjnAmXGCxMB5DVpOmGczTzlI1ebWvjBAsrHPlS4=;
        b=xTF1t9BjVn+sGfjXKBkvFfTC5thJbmhFLL8KZ/38KTVAmYZrTT+ZIq5C3LdFV7eVDy
         dSwjYAiWZxAkxgTqh41eJ9wXFc2kafhzfw/NHki/Lxd0kcA/nbYG+CHaFFdqI3SjpwbL
         0sSTqhzIDub5LR0uCOZtZT1uuw0pucsjI3+2ToAJZOC59J5/tgPyQjbE4aLwuIb+96QI
         G7pEmvr7KXPlzNkvDtHEnMsuqLCc7xPLDwdWKMAgFtz7/gU3RRt33yBhk/wa/h5W2MSp
         Bluc6T6B4FLvS3ENrKKRi0FIVpzdokln7s55ahzp2s9o1DlurUgyCzkQlyp8XIS9ncDg
         VltQ==
X-Gm-Message-State: AFqh2kohh7L8RPHLbciOR3lESbXa+xVaig638Jca59XdOAmeUjDnGsV+
	h97ChTX03USQm75kdH6wOrYsBw==
X-Google-Smtp-Source: AMrXdXv0rMjq/yUVJ/swTJts7JE6YfwbMUkTB0fsEIfuWBc9Yg2cDSYNeys21c057DPQOdC76+6IIw==
X-Received: by 2002:a17:906:9f28:b0:7c1:5b5e:4d85 with SMTP id fy40-20020a1709069f2800b007c15b5e4d85mr32057444ejc.51.1672610518175;
        Sun, 01 Jan 2023 14:01:58 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c23-7c55-d800-0fbe-25d2-487e-ae5c.c23.pool.telefonica.de. [2a01:c23:7c55:d800:fbe:25d2:487e:ae5c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170906304c00b007c17b3a4163sm12486807ejd.15.2023.01.01.14.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 14:01:57 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	nfraprado@collabora.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v7 5/7] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
Date: Sun,  1 Jan 2023 23:01:47 +0100
Message-Id: <20230101220149.3035048-6-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101220149.3035048-1-bero@baylibre.com>
References: <20230101220149.3035048-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230101_140200_670051_6D26F5A2 
X-CRM114-Status: UNSURE (   8.57  )
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
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
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
2.39.0


