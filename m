Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8F3C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvyuBwDWjlua8KTa1tSkZYuhpwaN2g16l8i+kRkooGI=; b=p12vds15BKDdYQU2lShIJ7fEFj
	RCFUCSRxYVEzQ00xA2cs1xDzceq7lrHrHUhUktjsBgHaigY7dm8oMCCfGXqogCuIi69L2d+SwdhnA
	/1tx9HIzI/jYxhbhRCO08Akc0Vh+TH0bKt1FbzgiXYHmsajAwqb2IfWpGLccIY9L2dZ2hDFv/T6Sb
	yVogDafwDmKXoT2/Yg/OiGUMskfjpaDGwOsO/BbQOjifGlv+/1Zy6MiUgv1yo8grVZl5yIb+fnUAh
	2C0yiNYnQTb1UmyFQ+dSnThtsTuEysr0VElmblvGZzPvtFeo2u7Eht6JgorrODMQq1KChZOmGEjN0
	d45IwpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r55zi-00CXdM-1m;
	Mon, 20 Nov 2023 15:15:26 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r55ze-00CXP4-2G;
	Mon, 20 Nov 2023 15:15:24 +0000
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-35961c61ffaso13826995ab.3;
        Mon, 20 Nov 2023 07:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700493290; x=1701098090;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pvyuBwDWjlua8KTa1tSkZYuhpwaN2g16l8i+kRkooGI=;
        b=B/KtHe+J+rpPTuU17AfJsOlTQVwWIDTEy1o7fMXRSVrazRuWACT/htCQmTJV5PRoLe
         t4hso0nWw62qstL3WgioWxSLGBFY8+3ZdtByny35ZYAxG/XLgX5okfo1t+a+9MiAVD2l
         5l4ul8OOjFDXSwxOR0+hq4S0BxQIiZbSWrYz0fKYPm8GHrYkyzBJy8tuPXrpppe636mw
         BICR4qY6aE1cCj4UswrF653lXMgd9rmLTtyzZ8nzmmHMLp24kVeFbeYA7ZHRtn8gnHqY
         XqUcAtbDPJLoNyUnQTWVM3Dpj59oyqusgTHzXSvj958FWwgK+waq+9JM4AH7kTLtzr4F
         LmbQ==
X-Gm-Message-State: AOJu0YwZoLuEDkYr2q7MiRijk5IK5YTk+sgfabfQyRqUNl42g8QgtzFL
	mWoow8EEo1EWkW+9+kvn5Q==
X-Google-Smtp-Source: AGHT+IG7xvPwlp/b4aE9KUp1vczIEf4+6xwXP9on7fUf1y2nYNw0P+9020srGtfv0qnr6wMJ5vQlPQ==
X-Received: by 2002:a92:dd8f:0:b0:35b:380:88d2 with SMTP id g15-20020a92dd8f000000b0035b038088d2mr3993458iln.22.1700493290338;
        Mon, 20 Nov 2023 07:14:50 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j16-20020a056e02219000b0034fd4562accsm2484574ila.28.2023.11.20.07.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:14:30 -0800 (PST)
Received: (nullmailer pid 2026531 invoked by uid 1000);
	Mon, 20 Nov 2023 15:14:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Harini Katakam <harini.katakam@amd.com>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Paolo Abeni <pabeni@redhat.com>, 
	Qingfang Deng <dqfext@gmail.com>, Andy Gross <agross@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, 
	Russell King <linux@armlinux.org.uk>, 
	David Epping <david.epping@missinglinkelectronics.com>, 
	Vladimir Oltean <olteanv@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Robert Marko <robert.marko@sartura.hr>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Simon Horman <horms@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, linux-mediatek@lists.infradead.org, 
	"David S. Miller" <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20231120135041.15259-3-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-3-ansuelsmth@gmail.com>
Message-Id: <170049324201.2026498.15592956023583173731.robh@kernel.org>
Subject: Re: [net-next RFC PATCH 02/14] dt-bindings: net: move PHY modes to
 common PHY mode types definition
Date: Mon, 20 Nov 2023 08:14:02 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_071522_767500_58D68729 
X-CRM114-Status: GOOD (  13.77  )
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


On Mon, 20 Nov 2023 14:50:29 +0100, Christian Marangi wrote:
> Move PHY modes from ethernet-controller schema to dedicated common PHY
> mode types definition. This is needed to have a centralized place to
> define PHY interface mode and permit usage and reference of these modes
> in other schemas.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/ethernet-controller.yaml     |  47 +------
>  .../bindings/net/ethernet-phy-mode-types.yaml | 132 ++++++++++++++++++
>  2 files changed, 133 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml:21:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml: 'anyOf' conditional failed, one must be fixed:
	'properties' is a required property
	'patternProperties' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231120135041.15259-3-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


