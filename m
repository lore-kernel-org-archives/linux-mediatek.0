Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38283C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gA3EusZCOhK627Wk0FirSH/GwKNGmUqwf4ijzEsCNuk=; b=Ujuwum3L3jX+Tz
	LbqRcWp3yGbWAFk5i/ET04RvRRMab6hPMdcYvEcEN5lBFm3fMwhtLkprPQM7kiGMGG1XwtMJuD9y0
	EniA7LAcCgt0Nr4xtqazdaiziLLbNf62Zuml7onVkGi9H7cU5W9AefXsPUSIOHwdMR+q3RzGhNYOj
	WOExG0E7TRdptJverYZySbVCbeAYMwcWmbI/wK2x+FerJSif32CdKTDWFvE17uBaJyMbWGiecA9Q4
	wlCH7PWCj8dI3AHylxdAbPMWuI+OQp1qwRmnzXVms0aAGSQuzZ1KZk5bWWLMw24+fxrXcKcwB8+UQ
	R50L6qjnQMY6GJRLGXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpSg-007qoj-Ss; Mon, 13 Mar 2023 21:12:07 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpHh-007l67-Vh; Mon, 13 Mar 2023 21:00:47 +0000
Received: by mail-ed1-x52e.google.com with SMTP id h8so10271783ede.8;
        Mon, 13 Mar 2023 14:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gA3EusZCOhK627Wk0FirSH/GwKNGmUqwf4ijzEsCNuk=;
        b=DiOQ7LpQ9BueYA5S5WwnImfMJeB+W428SPYWHW2VPcXaBWdV53EPgkhu8Uunn2HLDX
         H3l+hmiEN6HwBhf+Bk80dRnMkuOp2Dd+bZwsDGFGfZiYxBqzAIpJf7yPEQHIsA+yoSNp
         Mj6SHaJJs4wlgjhEdiWuol833lJWGTgED9Nri7CGIr1cYgeicyOw/FDN+oYemLy52Zhj
         WGTVC2Td3pK4CBvNPuXlNv+7rbvTM8kAP/pJufiN6g4LQ2Y63kzC/A2V3IX1DIqkvrM/
         KWoG/vb/GelWeH5k1uP5n60zzE8pPCe8SQQgyKAGOQFjwkhG7KLB3GZM6yYfHW9Tc8NI
         gS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gA3EusZCOhK627Wk0FirSH/GwKNGmUqwf4ijzEsCNuk=;
        b=rAwmwymCNa/iUTjjuqXv1f5+EaDnVFPTtyQQCk7SrPg61+eKxSnNn23dZr0HZplfD1
         nYxX2twlSlDyVcS6IF2WEfrJbltSeVn/c+B7g67QdpKUBGIIGSLV7/5RitFtaEFJ2eYm
         5kV/KDQkfN45Tuu9/jtjNiN30/UCWJwfxb4Dc0Lo5XF1QnV29LTGeLnyuwxsPFzS0XrP
         v3XrObL+pPNm4LuPlwHLGqOlJxsjaUB4wMuaT0+QKyAGNSCFYWwezbNDv9stAmkrH1UN
         9CFb0+kw3Eyc2r5KrcE5dQKaYw805MLLP61hM8yLDmzexCfhNhOXwKg8yAYM/zInh7qI
         4xHQ==
X-Gm-Message-State: AO0yUKV5/WtdbiKWy5EerYs/B5qHzd1fR2JQyEGQFZg4IvC7RVbaa3ew
	3eCittDkVXy59cSkWe801sQ=
X-Google-Smtp-Source: AK7set+xc/A2AUsEpnkeSAPo/NefGhegXt8FflrkGyYZI98MGsPQwOInyI7rwtArMe68neAJkvQ48A==
X-Received: by 2002:a17:907:7241:b0:884:fd73:8053 with SMTP id ds1-20020a170907724100b00884fd738053mr46136247ejc.9.1678741244643;
        Mon, 13 Mar 2023 14:00:44 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:44 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 21/21] MAINTAINERS: move ralink pinctrl to mediatek mips pinctrl
Date: Mon, 13 Mar 2023 23:59:21 +0300
Message-Id: <20230313205921.35342-22-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140046_108182_00FCE975 
X-CRM114-Status: GOOD (  10.71  )
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

The Ralink pinctrl driver is now under the name of MediaTek MIPS pin
controller. Move the maintainer information accordingly. Add dt-binding
schema files. Add linux-mediatek@lists.infradead.org as an associated
mailing list.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 MAINTAINERS | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6048bbe0e672..f4ee11dab1ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16521,6 +16521,28 @@ F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
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
@@ -17496,13 +17518,6 @@ L:	linux-mips@vger.kernel.org
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


