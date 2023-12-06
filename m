Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAADFC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 03:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Cp6B76RfEovozKgFZOSkZEc0z4IdQhSv0EPMVtgG3c=; b=bBfoYl5wlpxKJBikLypUp/9652
	AU9xR07H9wvxMfnZm5Nuv/RlPZYpI2JkUTtfpppfV1jEpDRcHRCf4A3lzqdjGz0lGyOJZ/Hyks+BY
	LfPxaxUa1DYqnp1J3l4A+0SQl7HgUuHGp10rqus/IlnwHSR7uB0HIZSa/klFY8mEPLhQrv4bJ3dBW
	srrlp4yxdRf8wQ8y93OfK0TVea2Asul+V46R2xW6W1CP/mkBnsM0VQhvGbQvm91BlPT45vvvj3PyX
	CDrHGD4Uiie6ToIvc/KHnsuPrz3KSoPpDHXh0hsqLBiNjft2GqPd+KU0SgoODqRl0XWNQ8gYUXX2A
	Lv79O3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAilM-008yZK-1C;
	Wed, 06 Dec 2023 03:39:52 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAilK-008yYJ-0T;
	Wed, 06 Dec 2023 03:39:51 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-58d52e0065fso233408eaf.0;
        Tue, 05 Dec 2023 19:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701833989; x=1702438789;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Cp6B76RfEovozKgFZOSkZEc0z4IdQhSv0EPMVtgG3c=;
        b=oCcc9+aQ1RZTpiwMV+nrMkgHu3uga/snkSQp63ZXrqNSmhDDRSc2iFv6Qb6DQZmp9Z
         06uhopIla70CHECkZVWDwFAs7UIt3ErmWWRWumlWcG53W57m+g5W5SzqarYNXZ9lum+U
         V5VBK+zb3m/xAe0NBGOlVVFkAjMvk7Xfv89rSkcNBJk/dCooWMV+pZ8WtgNt0vC9G2gW
         fDhj19l+ZT2CtVM6sYsmueuZcFHLB0gJVikTVT37G69prgNgArp2/P85CN4XY27DX7lh
         gZCSPqDIlNE8lgvgDgmmX53hnPtSnS1S3DShtHpRhnsq3/SsrZr+mU7Z+A35VB+LVZfm
         h8DA==
X-Gm-Message-State: AOJu0YzSHooTKGtGaOw3MvYU1O5C/HtjWwxp0VRdnltXue2MParwdMkL
	XfQbYBEMm6dQVpkRHJIsxQ==
X-Google-Smtp-Source: AGHT+IGHF5dD63okkY1uvYpYaFlmCqd+PhAofHIUKjCT14hyHnztdFSRU2uuzJg0QPWdJ+poKIuuKw==
X-Received: by 2002:a05:6820:2c08:b0:58e:1ca4:cb7d with SMTP id dw8-20020a0568202c0800b0058e1ca4cb7dmr992708oob.9.1701833988882;
        Tue, 05 Dec 2023 19:39:48 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id br6-20020a0568201a4600b0058a0d3fb333sm2492975oob.37.2023.12.05.19.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 19:39:48 -0800 (PST)
Received: (nullmailer pid 463143 invoked by uid 1000);
	Wed, 06 Dec 2023 03:39:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Eric Dumazet <edumazet@google.com>, Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexander Couzens <lynxis@fe80.eu>, Qingfang Deng <dqfext@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	devicetree@vger.kernel.org, John Crispin <john@phrozen.org>
In-Reply-To: <567c6aaa64ecb4872056bc0105c70153fd9d9b50.1701826319.git.daniel@makrotopia.org>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <567c6aaa64ecb4872056bc0105c70153fd9d9b50.1701826319.git.daniel@makrotopia.org>
Message-Id: <170183397601.463117.12810951410156171210.robh@kernel.org>
Subject: Re: [RFC PATCH v2 7/8] dt-bindings: net: mediatek,net: fix and
 complete mt7988-eth binding
Date: Tue, 05 Dec 2023 21:39:36 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_193950_185088_618CE20C 
X-CRM114-Status: GOOD (  13.61  )
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


On Wed, 06 Dec 2023 01:45:02 +0000, Daniel Golle wrote:
> Complete support for MT7988 which comes with 3 MACs, SRAM for DMA
> descriptors and uses a dedicated PCS for the SerDes units.
> 
> Fixes: c94a9aabec36 ("dt-bindings: net: mediatek,net: add mt7988-eth binding")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 148 +++++++++++++++++-
>  1 file changed, 146 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/mediatek,net.example.dts:231:18: fatal error: dt-bindings/clock/mediatek,mt7988-clk.h: No such file or directory
  231 |         #include <dt-bindings/clock/mediatek,mt7988-clk.h>
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/net/mediatek,net.example.dtb] Error 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/567c6aaa64ecb4872056bc0105c70153fd9d9b50.1701826319.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


