Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C552C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 21:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WT6hzu0DmgFDhxzzLNhQjlkkdnwsxET9D8SPDLbHKjA=; b=KuM+9kdXOMTZKB
	QnqrTQ62e4L31//K6YS3BqHtVFIiJrhH3iPw3K3bxkPccDtOm6RyONYab4nPMlpgBeGaejp0+shpb
	+fSSGY5N81hoqw6HSqsqV7+sI+dcKztrymcMbvZaKLekP81ZdPQWkurQp2F1f9m8X51kliv9NEU28
	GvJf6LM0AyIsvopcEWrerK79JiJ7B7Ono1u84EsyI33Pqu1uP8G07XeHM87FXEKR5KOZ/5ejh8K1m
	TEJcMkgRQcJ+kulLyM1GF3slSqTmWKarxTVjHSIgr37GtilhVfpGaZsn9wMqj0xzAqTdnpMbIzPU3
	z0TOgxLtBxEa4ujKQpFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHfe-003SZK-2p;
	Fri, 17 Mar 2023 21:31:30 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHev-003S6c-1u;
	Fri, 17 Mar 2023 21:30:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id ek18so25430642edb.6;
        Fri, 17 Mar 2023 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT6hzu0DmgFDhxzzLNhQjlkkdnwsxET9D8SPDLbHKjA=;
        b=UEYfnjckvyeT4ff+QOXYlCo1x0vkS+97iJsTIz5oFMWcTba0RcyN4rXJ8vPaUYhG6l
         v67MSNk2sy7ml1YgGgv1ccNs9CY0pslZzfhAeBYfi0mUbOFP202jj3/QA2rLxgA05uwA
         6W6fiyoeyELDX67v47zpoeSYm+2fLsjeR2mYkcMEJJQGMMfeGV0XjFi9WnWq0P2JF7xE
         5DB+gaaBd/7M3h473Ea4Xhfp706z2NyX+9ILn3URTmuvJLpDGklt2+1tJINvH75aoSrO
         /yISzzEN6WNm33sDxOxS7JU6vm2Krh9bJ4ZtiAmznusxeIb61o60mMuNVsV6zT3Ki18M
         Hsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT6hzu0DmgFDhxzzLNhQjlkkdnwsxET9D8SPDLbHKjA=;
        b=I2ykLO9/PugcJrLGn5DKEmZ6Z5CnyNptAciJatFTqoe6ubRtwkEZ2klg7mcvKOYiDq
         5x4fhW4Owm8lul7IHUOhfFiDgwazR38qt9T4CSNUfz1k4d5MyHzjUwpPGuWGwQYPfxZ0
         NGLQLRxUvGr/2TzhKziZd/GE8E5v2pUioCdjFcBzdDOqKnLZmwsrIG4ECG1hziO91tJ1
         /uEguUdBzn+jVQa+VQyywsz4iU9bsYmz9vo4sJImppkX/76XsoZ1CiC0DQo+MofSWM9v
         SXBlYKs8+KRzkTTsaOu/fNw6Oup9TVPEvrCu3baWbThrVvikoQWLvwZ29+v5ACR9QyDO
         cNtg==
X-Gm-Message-State: AO0yUKUnZ69lM/caRmMq6SUNPOZMNHYnvezM/XNWgZPiuqimnLGkyrUz
	7ia79+/sOtsSOubm4/SP8ZY=
X-Google-Smtp-Source: AK7set9o7vfI9g2tW01l5H0yRVqz8bipCXXGTjL299vsol3YqeirzwA6JaKCs9+IdMWE6xdzPmV/5g==
X-Received: by 2002:a17:906:c2d5:b0:92f:d900:9c66 with SMTP id ch21-20020a170906c2d500b0092fd9009c66mr899947ejb.10.1679088641575;
        Fri, 17 Mar 2023 14:30:41 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:41 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 10/21] dt-bindings: pinctrl: mediatek: mt6795: rename to mediatek,mt6795-pinctrl
Date: Sat, 18 Mar 2023 00:30:00 +0300
Message-Id: <20230317213011.13656-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_143045_639617_0125F598 
X-CRM114-Status: UNSURE (   9.95  )
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


