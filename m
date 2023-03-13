Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B640C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1EO681NLLyGQFHGfJf2gv1cVQUWKJ2bHIXepwv2glw=; b=2Nmr45/Iy3Vk7V
	A6ZuSeW5/AFmZzS7hfXKBefRbvgCkGCtEZuL3/cy346B4yPq8opsGqWUunh3IOYjucwQER5TKyJYW
	PzlvML753f5WsU7+p5ajuLgk0pCPDmle7mkQdPJr+OMwRHRFJU08q7nzwR7X8f0lkKMjvp/Pyps29
	3DdMWxaXYP+VjQ/EBYJOQuaeH95DKRTCmNMMRMP/v+UZIHrUXFrpryqUr7zRfMz5Ann6pfDhOLa4g
	fDcUUmcjb+A58U7hEaVYHqaVKbsuGwE/O3i4S3nIHE6FZ8pxG7cn08nLRlbv5UAhw2x9iK2EHnOje
	0+R1OD8jpvkeuhZs+dfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpNq-007oUU-0C; Mon, 13 Mar 2023 21:07:06 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpHQ-007kvG-Vm; Mon, 13 Mar 2023 21:00:30 +0000
Received: by mail-ed1-x52e.google.com with SMTP id r11so2410144edd.5;
        Mon, 13 Mar 2023 14:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1EO681NLLyGQFHGfJf2gv1cVQUWKJ2bHIXepwv2glw=;
        b=p+Ht8kEwWQVBWrm7LbVKZZP1kAizcIUyIo0vjcuRnquV3lDbYV2dVfhZaeR0PYG+dl
         aOTM3J1qVO6QVjKAQv9yRE5OwQoKzrneZmL2gl8dgGIrKwJV3VkeyP80//StuFRKkJel
         LJNbbaHUXg15eKrSRqiXtV4xtCnMOwpO/1tFBFqVp7G6DkDESTodgxC7E5ABl2KYnJOd
         66fauggi47slQOAZLeaL9gRcVbgF30l8GuP/3gMOVbJHSQGCpY+4+62nZ0LLeCUTKH4L
         euM86uk5LXRM0oVNA5tAEUQ7cRw5d+hyAEwNK09F8g5TLNriU/DpiLZ9cCJSGnMlpFI1
         bo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1EO681NLLyGQFHGfJf2gv1cVQUWKJ2bHIXepwv2glw=;
        b=GWpVcfQerCpD4QbFInYLP/AsWSTkAMo6tGfE2DSZrpOLflNqTP3v5Z6ZdWzqsyKmSw
         xMF3fo7EF3LoUT0bn6Tk2LEG9EUXK5BtEOfyalaFW+BpbGMCViVOwonZrwQELuTpWn8X
         q0ntxE19xKXZzlFexoo4z8ZUTJ/GKxmsfLdKn/WWUGo7sNwCG02CSWlrFBI44cRNPeJS
         Vs0G5V6P++G0RSZ1zFt2rZivbkYIAo0uO6edMzbpKosiAlD2l4ETtWO45cAUJPqNx0SW
         ZwR0OUWGCwzWEBPO4a9g1TrCLdu+CNbOY2eSPX46TkyLsg26sJlHi02+DxK1l7cYJN+D
         74Yg==
X-Gm-Message-State: AO0yUKWQn7kFgj6yg1UrqbKCW8l4jwIRajjR7csyrMa/xBp/0oGty0Kb
	D2LOXgtTn8OuJiTJ2CDGaG8=
X-Google-Smtp-Source: AK7set/NwnCMVaKCHebK0llGSJTd79DjIqPgRgqeEVRZgG2AZ6tsRTFCH9D4B9Nd/al8H2T0Fvi8LQ==
X-Received: by 2002:a17:906:7c0b:b0:92a:b78a:8fb8 with SMTP id t11-20020a1709067c0b00b0092ab78a8fb8mr4426489ejo.37.1678741224361;
        Mon, 13 Mar 2023 14:00:24 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:24 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 13/21] dt-bindings: pinctrl: mediatek: mt8195: rename to mediatek,mt8195-pinctrl
Date: Mon, 13 Mar 2023 23:59:13 +0300
Message-Id: <20230313205921.35342-14-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140029_074692_58F94C9F 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Rename pinctrl-mt8195.yaml to mediatek,mt8195-pinctrl.yaml to be on par
with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../{pinctrl-mt8195.yaml => mediatek,mt8195-pinctrl.yaml}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/pinctrl/{pinctrl-mt8195.yaml => mediatek,mt8195-pinctrl.yaml} (99%)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
index 66fe17e9e4d3..7b3dfc14eedc 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8195.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek MT8195 Pin Controller
-- 
2.37.2


