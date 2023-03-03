Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B165EC678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WT6hzu0DmgFDhxzzLNhQjlkkdnwsxET9D8SPDLbHKjA=; b=LoLYDjsRGFwUPx
	guq9Qb2JXDxTziyjuwfTLW3InKRCnZ4Krh6Pv/ooVNrqCMOFocL0Z9HJn0WW4L074uv4c7HIhl6Ul
	M2KR/uIC7534sncvexRm23Ef0DUmcVywk03jzlK1/m4Zw5jkURDB2Dieqsek8qpC4CcxJL6JZ4YbB
	VOZgm+KepIw9YgUergdfFIKTQfbDZt9+PrxBbR/ITmGBpaaietV8ZyrCaM5d1h+HtW1+ZzI1emM8u
	2Ds1avm+dHS95HPb/Okw8hT0q+nXp73vxVpqGewlYRxUjSQys9ZBgg8Gp9kSi7qVlH719yVs7kT+5
	MAH4XIZ232XVpnWLpTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtMZ-003shn-2o; Fri, 03 Mar 2023 00:33:31 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJR-003qjL-3C; Fri, 03 Mar 2023 00:30:18 +0000
Received: by mail-lj1-x22b.google.com with SMTP id x6so782908ljq.1;
        Thu, 02 Mar 2023 16:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT6hzu0DmgFDhxzzLNhQjlkkdnwsxET9D8SPDLbHKjA=;
        b=FUCkHFzYk6uA1qpDe0K69On13PRuhL+cHZ03RX2YCH+418wxuPSORlL521C5p3W3lR
         T3A2nlspl0f4MC1Blmfs5VUHKEQgJcOAYD/KCiaL/SheRk9HKod3lXkO3KbE3r79o4Ye
         0HWcugVUcIR1x80xH+QW1/YtU8+VAAdc+/zoDnpHdfJzv+BxSvGbpLG/wYvmwFTZ/7ru
         tRKp4b3YuYWrdYgSVzXKVYgu/r2ObnKGwyVUMsHj0ngFBtgiwR6vAapRoiuyiYqw/I9O
         nU5zCt9CDd9YYwfOBkb34MXJAkNr6B4Ndg60T6orug/zJ821MkVmDUZ0MXxIW+ySeHwp
         Gn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT6hzu0DmgFDhxzzLNhQjlkkdnwsxET9D8SPDLbHKjA=;
        b=grrR1l3bRFzwBWD6j+FRUZx+ha9N+Badcg6usUlhjAkgSTSB4M6OAIdIUMBkOEz9PZ
         JEXxuLLrRnMtzpeZtX/iuDEFITZ+L6oWtjvHl6uAwqixC+dfzWpFKRHAPRmZS9Z1diAI
         ni7d1MN3n6fVniWyHtCAeUwgLXTLcETedKEb9MGvgOt/lDigAICgZacngrSDUaefZyHj
         PbG4EdQ2iVTFGUQf28uWsfmF+kD2U9pAuxWbe33y60hZy5odSWsjGXbyt9FouH8QDwuW
         Vnuub2aOpi5zerZVLLD1x8D/DM29znbQGtAADKc5s0oa9D/VQ8YaE5e+sb+506quyRwy
         ox5Q==
X-Gm-Message-State: AO0yUKWfuC0t5V/KcRvTvmj6qL6SC2nUVyEvhjw+ZuyW84RcqEsT46nQ
	g8436WpDD37IS4KeQ1MSZuE=
X-Google-Smtp-Source: AK7set/7b3ronXMGDdX5jtEOBuC1OZlspMiNXDaIFPdv0MAWmDGsS4nx/Dsm3gop63oqDdwkrf++rQ==
X-Received: by 2002:a2e:bc0c:0:b0:292:f882:95ee with SMTP id b12-20020a2ebc0c000000b00292f88295eemr1301300ljf.9.1677803416604;
        Thu, 02 Mar 2023 16:30:16 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:16 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 10/20] dt-bindings: pinctrl: mediatek: mt6795: rename to mediatek,mt6795-pinctrl
Date: Fri,  3 Mar 2023 03:28:39 +0300
Message-Id: <20230303002850.51858-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163017_158204_FF36C2F9 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: Rob Herring <robh@kernel.org>, Sean Wang <sean.wang@kernel.org>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, devicetree@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Rename mediatek,pinctrl-mt6795.yaml to mediatek,mt6795-pinctrl.yaml to be
on par with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...ediatek,pinctrl-mt6795.yaml => mediatek,mt6795-pinctrl.yaml} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/pinctrl/{mediatek,pinctrl-mt6795.yaml => mediatek,mt6795-pinctrl.yaml} (98%)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index 9399e0215526..c5131f053b61 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/mediatek,pinctrl-mt6795.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6795-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek MT6795 Pin Controller
-- 
2.37.2


