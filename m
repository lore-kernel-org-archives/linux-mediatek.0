Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB64C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pb3s2WfXtxyN5ca68ejOPubf8a8GMk5C8l935KnSJi4=; b=t0DtzS8gXJ00A7
	6hgjEAagC7W2gqO1iuTg7pgEzbngRxXBeBZWYjgEZeMuIZVn4VqrKCxhjhCNGQvfoNoLcmWFjP5Wm
	i12l1cu87l5RnUT6mc5qj5LBLaJrieNVYKEcdJ6hwSGt8Qk9MkgkdzrhfAbLd2XY0T8KnI0Ewi3c/
	gp0psjRXHIXGGrfObF1qvc6KHR8JbEJT8tQ3nVAxtt4sTKzaW8rOyuh0rP6ByazAO0oqqzPLBWqbR
	3BReutgTw11uHXU/rDWr00t59rYuZp2V+WrWXfxgBOqB8y5uuKgusTDKBbBSVItopnaaX/qV5C3xZ
	cLDq7uiumK00+FAySrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu7b-00DWr8-1m; Wed, 22 Feb 2023 18:45:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2Y-00DTvd-Rh; Wed, 22 Feb 2023 18:40:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id v3so8678490wrp.2;
        Wed, 22 Feb 2023 10:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pb3s2WfXtxyN5ca68ejOPubf8a8GMk5C8l935KnSJi4=;
        b=TH9c+7lDaHFNxfnvz2Yx+/7tDuONcI+e4TKhn+LtTzYBCJiRIQLyqgJ624+2fb4Cek
         3+ef2gBgyXu5sSaVqChdSshg8XsuQyuBFf+MfGkC/wRnTCJmf9SIKkosPOCnx9eBilT/
         FuIFuwwFma9/BmVEQir0VAlk7pT9OCU/rM2Iki4oeCJGXXm2FClwIVW8QQ2BQJLSS+GG
         s/W8RbUBhduSoG+MDAwGYlSFIcPuxKVc9fEuR97zdd5KyxFX/82D6iYogyLpXXnet56/
         2KiF4BE0DY2Jis6WBk6k2UCNnwTHnqnvYpk2ytgjENNlgLedc9vAFMRoS1Dt7t5XUMt9
         e9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pb3s2WfXtxyN5ca68ejOPubf8a8GMk5C8l935KnSJi4=;
        b=ssbKcOOKy12u5iIBZ4qOLGw4ynIA1lbGFHp6kTBv1FYuqpmpelpPA0D3wEUp/xIBSq
         8/F421OEJxzruBYJi0V6uaznbMxwHAVFh3ksIjogFveeQGrdu89HgJfO8bUBh05IyMRS
         ellvkw0fYmsKlsdzPDcRacWRJqzP7cGI/J0qkLu9mlVA93knhb9U4Q+D+4DGFW+PGGGS
         jgkdkt9NL4Mz75Y3ebo1lp6EKMAvOxUAHYUqFfmu78yUatWdRjThaSQN/v3CgWRWO5e3
         ERh+IwJ1WngrwEXMr99DBLGHY0Vw9a8fGmnuG4I9tsmvErq22jYecsOXT6NKDj+HBX6Q
         C8UQ==
X-Gm-Message-State: AO0yUKWfTlZZZF5w0fhBzXP91bNdeQ/jwjaY85DKpg8An1zky+RvgQDo
	M1WXqhoLdKzXO1gdMuMsUuc=
X-Google-Smtp-Source: AK7set+IPymHO1XxqQ3hy1/GK0MeXI/BbYuMYgxuI9Cmu6brAd4AXFNhXCDcT9YwA2IVPhnbkAf+OA==
X-Received: by 2002:a05:6000:18c:b0:2c5:8d7d:baa3 with SMTP id p12-20020a056000018c00b002c58d7dbaa3mr6806434wrx.42.1677091229663;
        Wed, 22 Feb 2023 10:40:29 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:29 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 11/16] MAINTAINERS: move ralink pinctrl to mediatek mips pinctrl
Date: Wed, 22 Feb 2023 21:39:27 +0300
Message-Id: <20230222183932.33267-12-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104030_967560_5E96ACB5 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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
index 8a851eb053ca..a75e6ffc0866 100644
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
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,rt2880-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,rt3352-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,rt3883-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,rt5350-pinctrl.yaml
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


