Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7132C10DC1
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 03:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCP5mpTiBzaf8jFDFoZFCrSL9wo9gfFxiw2IS3GAr+8=; b=TvMvP/9heYz8lkbZWwHuf/CQiG
	jEQYv4LQ4C+eoFGTjbE/Bj6z5+MXn4Wrs6jm9mDxD1iJwnB1gcdud9TVRqNOPpzeUeBhQrnICHp44
	XwJZtbk5DIbpMwupGlORfrP/rpceAF4Jx5iHo4K/W6GA5xtbk+WftKWOkXF6C4m50L7LEaaD8CCH/
	QthHmXWCIye/XorAGCfZI1GTE8EuOJa7+zIPxPvh5g1InsDT3O1OIYv2XWqGfl0IO9ZfI/Uw5q91V
	hAURNH5MoMQNzF0viztwkhBlrajS/QQgdndPPfENXcSrpHRmzUfqbeNSFGKYyek62N/C1klLNfJne
	/g7g9Zag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAilG-008yXG-1o;
	Wed, 06 Dec 2023 03:39:46 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAilC-008yWI-2o;
	Wed, 06 Dec 2023 03:39:44 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1fae0e518a4so237758fac.0;
        Tue, 05 Dec 2023 19:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701833981; x=1702438781;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zCP5mpTiBzaf8jFDFoZFCrSL9wo9gfFxiw2IS3GAr+8=;
        b=Xuz63zNfGkojedNLCGQytdV9C/5Dr47woZv+pBpY2SGdlPgeBjShG4RCZrkCz6jlAH
         +SbgKAnSvIb+I5vex47sXBgSVEMeKFrOobHNsigPnBz8wFEZwpwxfHgE1QO1C432pS4X
         mpPgwcTKr6Cez0kF8Gim37MhhjSnWtjJjtbvU2heawfyfNSZmEcpo4EZUiWYEw7gxnOM
         PqV8fXVOMzYGl9zRxIib8BXxSh/PF7CsdfbdJUXm5ERxUAvnx/oPkdnVRFQ3hW0f9TjG
         PfsWLemin7JT86ObbXrbLsVuyMAPvdC5PPjBUIXxJNNIis+I1JxLus0kwdv8L4hyrscE
         U5zQ==
X-Gm-Message-State: AOJu0YwW+3VNxpTGMq1OHXjHbBhvUZP9QPZwlPlLAXSCQ6zmoS560Z1M
	dFDKFuuZUUNmKt+VqA9dwLrLEUxHlw==
X-Google-Smtp-Source: AGHT+IE7s70cHQbbKsQE0BQI0Z4UASLK6+NWEiczcYe6y7LwvmpOenb1p+4+datAsAgiAHs9a5vYLg==
X-Received: by 2002:a05:6871:b10:b0:1fa:df5e:48be with SMTP id fq16-20020a0568710b1000b001fadf5e48bemr129989oab.15.1701833981515;
        Tue, 05 Dec 2023 19:39:41 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id js13-20020a056870bacd00b001fb2c8d6d05sm2097487oab.5.2023.12.05.19.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 19:39:40 -0800 (PST)
Received: (nullmailer pid 463134 invoked by uid 1000);
	Wed, 06 Dec 2023 03:39:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Eric Dumazet <edumazet@google.com>, Qingfang Deng <dqfext@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Alexander Couzens <lynxis@fe80.eu>, 
	Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Vinod Koul <vkoul@kernel.org>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-phy@lists.infradead.org, 
	Felix Fietkau <nbd@nbd.name>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Sean Wang <sean.wang@mediatek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, 
	John Crispin <john@phrozen.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, devicetree@vger.kernel.org
In-Reply-To: <f57cc2bfadca35219707a0af507ad6e2e354e311.1701826319.git.daniel@makrotopia.org>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <f57cc2bfadca35219707a0af507ad6e2e354e311.1701826319.git.daniel@makrotopia.org>
Message-Id: <170183397288.462976.3952343134089704927.robh@kernel.org>
Subject: Re: [RFC PATCH v2 1/8] dt-bindings: phy: mediatek,xfi-pextp: add
 new bindings
Date: Tue, 05 Dec 2023 21:39:36 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_193942_909275_2D881E05 
X-CRM114-Status: GOOD (  14.63  )
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


On Wed, 06 Dec 2023 01:43:55 +0000, Daniel Golle wrote:
> Add bindings for the MediaTek PEXTP Ethernet SerDes PHY found in the
> MediaTek MT7988 SoC which can operate at various interfaces modes:
> 
>  * USXGMII
>  * 10GBase-R
>  * 5GBase-R
>  * 2500Base-X
>  * 1000Base-X
>  * Cisco SGMII (MAC side)
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/phy/mediatek,xfi-pextp.yaml      | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.yaml:33:16: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.yaml:34:16: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.example.dts:18:18: fatal error: dt-bindings/clock/mediatek,mt7988-clk.h: No such file or directory
   18 |         #include <dt-bindings/clock/mediatek,mt7988-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/f57cc2bfadca35219707a0af507ad6e2e354e311.1701826319.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


