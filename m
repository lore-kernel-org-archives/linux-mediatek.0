Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A00C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBoLaLgAfnzJMOco92w0PZhMXyCzsUA5lEBWwlGN0ao=; b=hNHVzXLlFup/Ga
	gp7Jy7ajwS1QK32i/gH/x82uhu1y76vuqkRiCV7UrkBAx72YY0Wl+Te9u/xQEpwHZ4Umtu87HqbJw
	AHl/ndEKIp/jSmPR40nbB6FO+4VcaHhddqiL3f6HnoqvAdFJBw5oxaAP26C/xfbAnuroUQWWWm000
	24rnm55OkJfSHkKItWenQpaj00woddQPRxST0KfdsrDtnYvaF/7+6sWaWii85h3mIhEDB4zpXiWLC
	0sMUFpnUM3XjjSKTzTFhFkPQhFOtyH+ZXc4Yu8V4FNgPce2spcsgOGcHKlC9MMdm4Zwyr8LlSx1+m
	WWuZuuO5jYqbBR3bvv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpLC-007n3W-K4; Mon, 13 Mar 2023 21:04:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpHL-007ktK-4H; Mon, 13 Mar 2023 21:00:24 +0000
Received: by mail-ed1-x529.google.com with SMTP id r11so2409729edd.5;
        Mon, 13 Mar 2023 14:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBoLaLgAfnzJMOco92w0PZhMXyCzsUA5lEBWwlGN0ao=;
        b=VNfvqJIbDAFzUx9F7DycqfH8zfRpONT1Ihmmg/fyvFUfxFgFAX/cFztP6SvhnJqwJ4
         sBT4tLa+r9HVfxbnZHOPY+sQ1CSJAmpbT6h2McS1ROw3st/F2r91QxXLD4XbfjjRcOA2
         VZzNxFdLdEgM/aXYoAvBPlghjmEp3SFgafqCsiBNBYEZLtbVqCecYjC7w03SWfDcbdzI
         PCJp3DuKJxnGeiT9GxoOhLihYKQZrfMVXNbIgOHMmzIOrZyGTInH2AkensX+P5M3Afpe
         qLxS/NPZLaZt19/K+Bf+/OwCDB9T3fvagwHyKY1k24zlRJK8O1JlXxvj4N80ossdbypr
         lR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBoLaLgAfnzJMOco92w0PZhMXyCzsUA5lEBWwlGN0ao=;
        b=ByY4vHo1Om4Ff/fa/+08vmbtePtubmVZOMmMfEv0PmTR8LJnV3YspHmA0+qY7T443i
         sVt9WULZWLDanITwZ5ncv5G5977ASR+LCM7otS+Db9CZFVc53clgOj/asj6/fQoHY89f
         RYxVPGPw4hwQRttYYvrQyfIu5+o08PbL+U7hGPSrmX3UyytRyWXrKpf3gwoh3hnLIt5t
         TDr2PU4oU6Utdb1NsUwj7zPYZ7CsmFpEurWDegDm7iPCwGbFA9NwHuEoet5gTu3Aa9ET
         U4UxR1tLI74dR7EX0v8micxVIiCPkd9TIoAg2u4Ou8lYsIfJS7q15J0krhwjcZ7hF/zw
         EMIw==
X-Gm-Message-State: AO0yUKXJsb2gyIG1swtcbBeetZEQqGTPCM1uH6uH7ADFtS3E2H+j8l9v
	QWVGfXKvwtxV/4WFXhx6VkI=
X-Google-Smtp-Source: AK7set/feasWEvok6GrjaSQ0x83hDxm7wz1LX07+/57jv2yOZVXy32aq/L4br0QtJEjm//Y7YH5NnQ==
X-Received: by 2002:a17:907:7d9f:b0:8b1:781d:f9a4 with SMTP id oz31-20020a1709077d9f00b008b1781df9a4mr44496356ejc.21.1678741221832;
        Mon, 13 Mar 2023 14:00:21 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:21 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 12/21] dt-bindings: pinctrl: mediatek: mt8192: rename to mediatek,mt8192-pinctrl
Date: Mon, 13 Mar 2023 23:59:12 +0300
Message-Id: <20230313205921.35342-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140023_314892_8AD22C3D 
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

Rename pinctrl-mt8192.yaml to mediatek,mt8192-pinctrl.yaml to be on par
with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../{pinctrl-mt8192.yaml => mediatek,mt8192-pinctrl.yaml}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/pinctrl/{pinctrl-mt8192.yaml => mediatek,mt8192-pinctrl.yaml} (98%)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
index e0e943e5b874..e764cb0f8c1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8192.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8192-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek MT8192 Pin Controller
-- 
2.37.2


