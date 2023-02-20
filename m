Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70E6C636D6
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03mvMv3OBvjG3ElAvQ4qRAwM8DjYRN7O/uLbM3eCM4s=; b=QSf6+uF2KO5fFfG3HdFGOcRlYd
	WOhBDCLg8uEJWUi9HkUvgVtrUs6wsGx9sBh0eR3EJ9MjMDrVSo0ts+ZJ/W8qTXOsATKVZInJmUKF5
	4vnysotEDfu10wvndME6+XHwD3I/pHD9xAdAXx1pieG2x85kQO3EFeuldcs693X5pKqkKNETRsxbZ
	YdBItkNVCrrOKKu7INjxcsWiWsGzVtpQcxwkrymIeUNGGceiZetFvp3GrJa03Lipz4jyg/SMGUwDL
	oReRXeUyBVoZdaFh781kDUSdxXVVMWaS3aWZkZxolCpXROHSYeOvxmm1+K6RggKyEunVY5vj5EGEs
	C2dn56LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU9lt-00534Z-FT; Mon, 20 Feb 2023 17:16:13 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU9lg-005321-Jx; Mon, 20 Feb 2023 17:16:02 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1720600a5f0so2284609fac.11;
        Mon, 20 Feb 2023 09:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=03mvMv3OBvjG3ElAvQ4qRAwM8DjYRN7O/uLbM3eCM4s=;
        b=a68+gl/iAfqgzNYiYB3K2Z5WkMU5i2pS00CS+yoC+lmAly0SW1tFV9Vfkfv9u19EFn
         y1wPcJzRpHaEju/WkKfvgCr3EQTXQhyhxA77wWuJJEnzBzd2GhaFICeRSxqqCSuSUAla
         dotEFZ/qJomO+GbKuUDHPzaRgO2TVqe8BICJJqe51p0uPpj5f9uz7a6NKeC3RaOVAgfJ
         In7JXn2p7WbPGhGYaxyy9InNuWuEFth8rOsvvg54hMcnsR0Ikyb0/K2rW0GXgirw7jHb
         nzFsOkHyfTiOF6jGGg58If+HeHI8HAbeHuuj7b/4wuyXnku44wKKtd1/gL7E07cspxjw
         Rivg==
X-Gm-Message-State: AO0yUKVeZEBS756kU9EaP3VEBMu3RC2TjMKOowNT+ROj+G1V53fENSaq
	NGXo0UurfHZ71mNhbpaUKQ==
X-Google-Smtp-Source: AK7set8/7ONpY57pYHX9q0jBRtphSUDrp2r2g2sZBQkEX8p9zdLPkp5DBfMT0w2yng2j+2hTBvaInA==
X-Received: by 2002:a05:6870:d1d4:b0:16f:389a:d97b with SMTP id b20-20020a056870d1d400b0016f389ad97bmr6347136oac.46.1676913355649;
        Mon, 20 Feb 2023 09:15:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ec21-20020a0568708c1500b00143824af059sm4587738oab.7.2023.02.20.09.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 09:15:55 -0800 (PST)
Received: (nullmailer pid 3973202 invoked by uid 1000);
	Mon, 20 Feb 2023 17:15:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianhui Zhao <zhaojh329@gmail.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>, 
	"David S. Miller" <davem@davemloft.net>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
	Jakub Kicinski <kuba@kernel.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Vladimir Oltean <olteanv@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Felix Fietkau <nbd@nbd.name>, 
	Russell King <linux@armlinux.org.uk>, Landen Chao <Landen.Chao@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	John Crispin <john@phrozen.org>, Paolo Abeni <pabeni@redhat.com>, DENG Qingfang <dqfext@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org
In-Reply-To: <03f9d40849dd2d563a93b27732a7b5d7dd1defc5.1676910958.git.daniel@makrotopia.org>
References: <cover.1676910958.git.daniel@makrotopia.org>
 <03f9d40849dd2d563a93b27732a7b5d7dd1defc5.1676910958.git.daniel@makrotopia.org>
Message-Id: <167691325732.3971281.4378006887073697625.robh@kernel.org>
Subject: Re: [PATCH v9 03/12] dt-bindings: arm: mediatek: sgmiisys: Convert
 to DT schema
Date: Mon, 20 Feb 2023 11:15:53 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_091600_694978_DE804783 
X-CRM114-Status: GOOD (  17.83  )
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


On Mon, 20 Feb 2023 16:41:16 +0000, Daniel Golle wrote:
> Convert mediatek,sgmiiisys bindings to DT schema format.
> Add maintainer Matthias Brugger, no maintainers were listed in the
> original documentation.
> As this node is also referenced by the Ethernet controller and used
> as SGMII PCS add this fact to the description.
> Move the file to Documentation/devicetree/bindings/pcs/ which seems more
> appropriate given that the great majority of registers are related to
> SGMII PCS functionality and only one register represents clock bits.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../arm/mediatek/mediatek,sgmiisys.txt        | 25 ----------
>  .../bindings/net/pcs/mediatek,sgmiisys.yaml   | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
>  create mode 100644 Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/03f9d40849dd2d563a93b27732a7b5d7dd1defc5.1676910958.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


