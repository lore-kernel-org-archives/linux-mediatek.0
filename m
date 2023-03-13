Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DA5C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAgVEaQ3wTWSM/roB3rZ4d22w+naU3QZ4J68IrDFTUw=; b=NllPHo52bmI3lN
	cg+Ljhzc5PwDj4QNuDQvnKH+WsduF9rl4hhHaak/R2DjAL3UpITD75b8jz22Rpj7GI0xTvJWpOBTg
	PvhEU78Ddc/Ojj6Z4RVIAIJqDjRue7Dov2wNGTB6+qeIp/lGoCxIIHhU62BUjC9EMfA1ucv11DzhD
	w8GPP59ixayiDmGWtnWZmgAb1f9V0we33lZtbfDybTEGGAVtZ1hjdFOFSG0heKvwM1757o1l34xC0
	tUSElONY4owm7NK3qQIXNPsNG7idneNxMqTAXITTOcWE0A8II51vv0ZjUkhYVTqqA4pCge6Zs1lbp
	QPhqeH3Nyvays5dt87Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpOU-007opy-1L; Mon, 13 Mar 2023 21:07:46 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpHU-007ktK-Mv; Mon, 13 Mar 2023 21:00:40 +0000
Received: by mail-ed1-x529.google.com with SMTP id r11so2411535edd.5;
        Mon, 13 Mar 2023 14:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAgVEaQ3wTWSM/roB3rZ4d22w+naU3QZ4J68IrDFTUw=;
        b=IalN9Q8RaXhjHjxH3l9HGeNjsyB3xTYsslGPKTz8tChbt/Iwdvm+yvjo0LZ8FH+mkZ
         /RPwdd8qZpyy77bbX3v2FxsP7Eqo2KVsBHDvx5E71n2i7nsQ7NCiIPkF3QvQGgcVn4xW
         wpnUR6TsFlPxV6ZDTT3oCcoM0UPzMoSK9CcNijBmmQowD6qkajRqmY5KF5pVa2B0L5XC
         2mBbap3IF2h8owmV8DQnPkeUWIjuYQczHNP5IS11/6FDOFmG8XzDDJ4nDWMAaO4kP66V
         AhCMQweebRzKoBC+vzrrc2BVZ5Ske7bMVmouggePpR26a+qFiSLFTZc09RQVcjscoLOL
         ORrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAgVEaQ3wTWSM/roB3rZ4d22w+naU3QZ4J68IrDFTUw=;
        b=IFqXI8m8qUdF8lnTtQBH+amw4E0EVCQj2rWT+40Mq524VpOn8r93OlNiTBf6iLPujQ
         3zq/4/4WO71nBkB4mmJJsRP6hWC4m0EmzMFXyt72JTQF9lU1vAsaWWM6JFaKDKv0aoM7
         QOVkPd3boQr8Zecj/qPak7j3Kw20ok6MWhFTm1YlK03EL8PSE7aSYFNnTaAVHdSAdtxY
         teXgWeZBM15wRPEJxA/1ZFgtBoMhfwsY+3QFL9BVacf7r02wHzrCYRHU/yaJWE9r8xdT
         L/ohnZesSiHv6k7gjOOcBTu0usyRD5rNFWLXuv7gG7PE3i5XJkRzqhpYN/osbSsuHH8q
         DQkQ==
X-Gm-Message-State: AO0yUKWLG3y/yQtG57IFnZXL1/EdKFume0HQXmJVCuxOCJRDxvdYsRyS
	gSDpnEyO06OvXONUQ9tlIFk=
X-Google-Smtp-Source: AK7set+G713ElsBQl+Y9N92iqgiMaNOa80KkfENVNuNDxxOqv9NftZuA9TMy3fMZJU5ZhXHZOLxb/Q==
X-Received: by 2002:a17:906:b007:b0:8aa:c038:974c with SMTP id v7-20020a170906b00700b008aac038974cmr36455676ejy.54.1678741232102;
        Mon, 13 Mar 2023 14:00:32 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:31 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 16/21] dt-bindings: pinctrl: mediatek: fix pinmux header location
Date: Mon, 13 Mar 2023 23:59:16 +0300
Message-Id: <20230313205921.35342-17-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140036_987587_B1B8F5B3 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Fix the location of the pinmux header files mentioned on the schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 5e80621800a9..3b3d59140073 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -90,7 +90,7 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and are
-              defined as macros in <soc>-pinfunc.h directly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
 
           bias-disable: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 1d038f6f8971..e5e7143674b5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -131,7 +131,7 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and are
-              defined as macros in boot/dts/<soc>-pinfunc.h directly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
 
           bias-disable: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
index 51b3d1247614..028146fb173f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
@@ -88,8 +88,8 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and are
-              defined as macros in dt-bindings/pinctrl/mediatek,<soc>-pinfunc.h
-              directly.
+              defined as macros in dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
+              directly, for this SoC.
 
           drive-strength:
             enum: [2, 4, 6, 8, 10, 12, 14, 16]
-- 
2.37.2


