Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E89C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q22B9e4AqGn4ANGF/h7CdR30XMlPsngwjkL2VZrpA2A=; b=JRZtD0/FAzCUUg
	miQ0FcRLuk7NDOqXqvZKW6lw0Itkh5vapb9Xe2XVxnxuLrkfV1cRJQopHjta1JJG/5l1SGyuzgOjW
	p5OWqVfqMhoHL8ObWxX5kBbji1fpN8hSDGHxnOVM749pbq05c7EX3tPOicukD3BniX2k6TdA+Mnu4
	KjQUumZDUfzTiR8IF62lbHaiFSVCHNw4I1Mw67Qmr6QsJ56W3mAjQHnb84r54PRqFzpTmiB+1uPBg
	dOBiyDfbJs1nLtzckgWMtrHf3AYONQOUtPgeoBRodChls+E7DYlc79Z2fbjKJeI8lE5Dk+parMEPv
	GLhswdDklKLq0UulOQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtUC-003wt5-OD; Fri, 03 Mar 2023 00:41:24 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJx-003r71-3M; Fri, 03 Mar 2023 00:30:51 +0000
Received: by mail-lj1-x230.google.com with SMTP id z5so744592ljc.8;
        Thu, 02 Mar 2023 16:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q22B9e4AqGn4ANGF/h7CdR30XMlPsngwjkL2VZrpA2A=;
        b=iTZYC1pHzt6hop7ZrN+oW7oTwwJQJiF+dFkFpN5vu/3aKsHaWel3EHdLG09y5nphIu
         uRUOnkF4wS5N+88RDJw0cVqLWnetxnh0jGe4wQXYKgsBiiz3KQza3H5s7Q3xZ3Ec5nnd
         Kt5BGDqDxP/hkjOEHEB4YRcHf8VDrU+X0CzUg4NSyZRluZ+0sKgrPZYH3ii1chXUB9An
         j/+mcHqGX8wUBJX9CL12leiAV9jL+ayEMFcPtQDjNfdpp8PqlIdEiuTUwWjiDcPkCpcf
         KCPTRgiEojYcW/N9KRfg175ODAp+7XxTncZsC0kXBSOupFOP93Nwe6Qor6pMW4mAsgOR
         zWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q22B9e4AqGn4ANGF/h7CdR30XMlPsngwjkL2VZrpA2A=;
        b=HyFkwMUEkls7xEhugkfvMNnYYrxIFHXwkx/X2zNa++Lq1k7Y80wavrO3OsGBHvvL3d
         tNDMDNQ/tHiJmQttZxg6SdNIEfEKNt7iDZbKP0y4L8nbYGPk21J5ffYyXWmwt39eFxlq
         PdZBwLskutb7FRemYQHhmgryE6qU9+M6XwLWj8dvJuKo9FoatsrSQWnkZ7mM1HubmD28
         QOxadh7SLxJnTS/7UmkZu3lNU3qEjPJeRd6wSkVSMchBVaxdypog/7+IeE8OPhk+M0pZ
         OsPnqAZJfyvtMe+SNdsTRA1VL/O6/hycVYa6ictClpGoMpovSAQDan1d4/JWztYxquy9
         ap5Q==
X-Gm-Message-State: AO0yUKUld9wl8HD5Quy4zMuSYPtYSXhRFJ8h9i1a8zSfb2SAsHSxM65s
	F78e1ovKduJkrggrMWN8Xnc=
X-Google-Smtp-Source: AK7set+iJs4ye68oj0zjVinNre8fXa8aH/Htsp9voOCx+O/PIEzx/7p22PjVOe1fKlfXS+hLPSg9gQ==
X-Received: by 2002:a2e:a0d4:0:b0:295:a8cc:f15a with SMTP id f20-20020a2ea0d4000000b00295a8ccf15amr3553070ljm.29.1677803442926;
        Thu, 02 Mar 2023 16:30:42 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:42 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 20/20] MAINTAINERS: move ralink pinctrl to mediatek mips pinctrl
Date: Fri,  3 Mar 2023 03:28:49 +0300
Message-Id: <20230303002850.51858-21-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163049_191041_B3592CF4 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The Ralink pinctrl driver is now under the name of MediaTek MIPS pin
controller. Move the maintainer information accordingly. Add dt-binding
schema files. Add linux-mediatek@lists.infradead.org as an associated
mailing list.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 MAINTAINERS | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a851eb053ca..83fa1e9651ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16541,6 +16541,28 @@ F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
 F:	drivers/pinctrl/mediatek/
 
+PIN CONTROLLER - MEDIATEK MIPS
+M:	Arınç ÜNAL <arinc.unal@arinc9.com>
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mips@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml
+F:	drivers/pinctrl/mediatek/pinctrl-mt7620.c
+F:	drivers/pinctrl/mediatek/pinctrl-mt7621.c
+F:	drivers/pinctrl/mediatek/pinctrl-mt76x8.c
+F:	drivers/pinctrl/mediatek/pinctrl-mtmips.*
+F:	drivers/pinctrl/mediatek/pinctrl-rt2880.c
+F:	drivers/pinctrl/mediatek/pinctrl-rt305x.c
+F:	drivers/pinctrl/mediatek/pinctrl-rt3883.c
+
 PIN CONTROLLER - MICROCHIP AT91
 M:	Ludovic Desroches <ludovic.desroches@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -17486,13 +17508,6 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/boot/dts/ralink/mt7621*
 
-RALINK PINCTRL DRIVER
-M:	Arınç ÜNAL <arinc.unal@arinc9.com>
-M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
-L:	linux-mips@vger.kernel.org
-S:	Maintained
-F:	drivers/pinctrl/ralink/
-
 RALINK RT2X00 WIRELESS LAN DRIVER
 M:	Stanislaw Gruszka <stf_xl@wp.pl>
 M:	Helmut Schaa <helmut.schaa@googlemail.com>
-- 
2.37.2


