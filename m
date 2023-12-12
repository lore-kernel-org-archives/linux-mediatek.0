Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D50EC41535
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 05:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlNXDh7i+xuUPez0jMtT71+3pJcqu/L3WLkyBQcQido=; b=TOqVgjBT9Y7dhCRwn8SLlpYjny
	vLPE4AmMYUHpCo8FiOrsgqaSFsIqEB6E+MjRJqkKc/yyKqGL3yzEGt0BrNnqroUm6lNQDHJqAyKrb
	CimxYC3VYLML/soiMYg7aZjYh0CExUJI8Yj6CU5ampPSO8GD5g2x21nVZqqWfXDxafIfxEaTbv16Z
	JljBgPRYeP9LjQerD5EoLt3K20uxFYMSSy18IeSawW+xsScSDgDvImQFd7y0YsGAYb04F/b5YuhEN
	1+jJ+GDwp2UIHl/frR2gWffzR6Y7a4LEE7qXPKOtQaK10NLN+rYCleAeg/e61TG3JCEybmWWn+k7l
	gCECIk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCvYV-00AoaQ-0W;
	Tue, 12 Dec 2023 05:43:43 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCvYR-00AoZD-16;
	Tue, 12 Dec 2023 05:43:40 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1fb9a22b4a7so3176368fac.3;
        Mon, 11 Dec 2023 21:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702359818; x=1702964618;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xlNXDh7i+xuUPez0jMtT71+3pJcqu/L3WLkyBQcQido=;
        b=vrDBh08BNArfftjshOX2AiouDptI/inT8O1fS5fTuTUuNclfaNRv2aoJiL3mPL6zIx
         J+1iDywmzOv7IPvHUMcYrk0EJHKo3VAseDQdK8nwAr8AOgADQ2aY70BwsmpatK+xn8HS
         tC9WCkbuB1iHDaREGmzEYHkkvCCptlXoMlo3KC5NO8SuW/lpTZTVlZL1rUf+NDkW+UTn
         /2b8zokEk0dQFdTpeioYL8D84vYG3HlwYP38vadorPy2r//F0rO9ROQcX6mUI8LeQneO
         VINJcfIxZQO51aiEr2cr0NKGuePu2EjzfAV9+kHviRtqU0nK+3P4ROxdkgkBlvngrIYz
         rHNg==
X-Gm-Message-State: AOJu0YzJrGMPCdn5gCCNgWXaNtpyyWYQCP00T7pEWoMz2cbZWbbbkCkF
	6biLOw1Nt+GMlCQh7d7rsw==
X-Google-Smtp-Source: AGHT+IGoPIIkORhBOT+o92RHO+zrp9Iw9PWqvFVCTy8m9aKCvVQGCSO56hbPo+pUhcKvSm6k4S8Kgg==
X-Received: by 2002:a05:6871:7391:b0:1fa:fc32:f081 with SMTP id na17-20020a056871739100b001fafc32f081mr6938652oac.25.1702359817776;
        Mon, 11 Dec 2023 21:43:37 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id hi7-20020a056870c98700b001faef8bb534sm2930685oab.22.2023.12.11.21.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:43:37 -0800 (PST)
Received: (nullmailer pid 39728 invoked by uid 1000);
	Tue, 12 Dec 2023 05:43:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, Qingfang Deng <dqfext@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Eric Dumazet <edumazet@google.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew@lunn.ch>, linux-mediatek@lists.infradead.org, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>, linux-phy@lists.infradead.org, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>
In-Reply-To: <b875f693f6d4367a610a12ef324584f3bf3a1c1c.1702352117.git.daniel@makrotopia.org>
References: <cover.1702352117.git.daniel@makrotopia.org>
 <b875f693f6d4367a610a12ef324584f3bf3a1c1c.1702352117.git.daniel@makrotopia.org>
Message-Id: <170235981390.39579.3867728590010297335.robh@kernel.org>
Subject: Re: [RFC PATCH net-next v3 1/8] dt-bindings: phy:
 mediatek,xfi-pextp: add new bindings
Date: Mon, 11 Dec 2023 23:43:35 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_214339_384918_BD3EFD1C 
X-CRM114-Status: GOOD (  14.60  )
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


On Tue, 12 Dec 2023 03:46:26 +0000, Daniel Golle wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/b875f693f6d4367a610a12ef324584f3bf3a1c1c.1702352117.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


