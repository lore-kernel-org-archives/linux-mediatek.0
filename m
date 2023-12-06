Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF0FC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 03:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJIWxQKQmoNjd89AOA5RvXC8o59/K2/mf5I5lOAD10o=; b=nH7WCsYhT3ngnlc421UPnPSEhy
	p4KDrGWNSmZl2Jpj57K8r9ZxlL4+edE0FHBcsPY8uUi0yaJ/idZw2nUsO25FAqD7PN8qRkLLPatVl
	TrmRdcgPNgKfG1byoQQSOqh66Ej5jvK0P2B1YP+AdalGQ+zZymDMEvCZhjUWFp89ZD4bj5jF4LmF6
	ctTINkc5dF4SWEgul88LSi5IFFE8Y1kt6D01JEGGUWQMgmL25SCyT0hv6AF9PMvwhtAb3AVeLuF4H
	mnhGr8tFLQeBt/+P7196Mrd39Yl6opm2mIhjmehWT+iqvCUXjPqajl0VtVf+mrlZwmMKVDodUPRkY
	y93kgXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAilR-008ycl-0A;
	Wed, 06 Dec 2023 03:39:57 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAilN-008yZE-0z;
	Wed, 06 Dec 2023 03:39:54 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-58dc434442dso234908eaf.0;
        Tue, 05 Dec 2023 19:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701833991; x=1702438791;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eJIWxQKQmoNjd89AOA5RvXC8o59/K2/mf5I5lOAD10o=;
        b=ftEhgROVNrhVM8AYo11x7iYwhipEo71QXdDfarIBk+bILTv9c9VBWrcdwF1qw+Vq8G
         yqJVd9Q3wTGYXb1IHUPGRVB6lcTPOLREv1Vzt1Ao/RgKQ7nJqUeOJKO69PtmSFQp//Ti
         JbSl7Yh+ZTcnk9kN3+H3A2Bc888F/+dpqNoZpMwlUkN2RL6iMHOURlfoY1sJO8V/1Vp0
         wnAElpvlEEIAXUXLmbZqQotTj048fvkzbHNW+pk5h0teHp0a+2srTqG/CEHwY8/bdURF
         wuLLvYPd4vTnsUfCKihTuHudzzH/x86yYa+eXBO1JIR2KQCGzmUH1JeTyVSbcQBRefiI
         H5XQ==
X-Gm-Message-State: AOJu0YwQ7hueXHWEvZfZlXB/HyTR1z9OxAg+ec8YWkhcE4f1i8o+U9Al
	xwoDaixtDZwKMEvmTC34PRIk0n4NgA==
X-Google-Smtp-Source: AGHT+IHKIuDZkUJdhycFI25RBd55iQTufoFG0amrVDo68Zz7yH3kYl4TC99m4aOnfpMln9254UTV5w==
X-Received: by 2002:a05:6871:4087:b0:1fb:75a:678c with SMTP id kz7-20020a056871408700b001fb075a678cmr145094oab.51.1701833991728;
        Tue, 05 Dec 2023 19:39:51 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id on7-20020a0568715a0700b001fb42001fa7sm1462872oac.36.2023.12.05.19.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 19:39:50 -0800 (PST)
Received: (nullmailer pid 463139 invoked by uid 1000);
	Wed, 06 Dec 2023 03:39:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Felix Fietkau <nbd@nbd.name>, 
	Eric Dumazet <edumazet@google.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, linux-phy@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Qingfang Deng <dqfext@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, 
	John Crispin <john@phrozen.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Alexander Couzens <lynxis@fe80.eu>
In-Reply-To: <3cd8af5e44554c2db2d7898494ee813967206bd9.1701826319.git.daniel@makrotopia.org>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <3cd8af5e44554c2db2d7898494ee813967206bd9.1701826319.git.daniel@makrotopia.org>
Message-Id: <170183397446.463049.17564721561503446292.robh@kernel.org>
Subject: Re: [RFC PATCH v2 5/8] net: pcs: add driver for MediaTek USXGMII
 PCS
Date: Tue, 05 Dec 2023 21:39:36 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_193953_359293_DD8B43BC 
X-CRM114-Status: GOOD (  14.72  )
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


On Wed, 06 Dec 2023 01:44:38 +0000, Daniel Golle wrote:
> Add driver for USXGMII PCS found in the MediaTek MT7988 SoC and supporting
> USXGMII, 10GBase-R and 5GBase-R interface modes. In order to support
> Cisco SGMII, 1000Base-X and 2500Base-X via the also present LynxI PCS
> create a wrapped PCS taking care of the components shared between the
> new USXGMII PCS and the legacy LynxI PCS.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/net/pcs/mediatek,usxgmii.yaml    |  46 +-
>  MAINTAINERS                                   |   2 +
>  drivers/net/pcs/Kconfig                       |  11 +
>  drivers/net/pcs/Makefile                      |   1 +
>  drivers/net/pcs/pcs-mtk-usxgmii.c             | 413 ++++++++++++++++++
>  include/linux/pcs/pcs-mtk-usxgmii.h           |  26 ++
>  6 files changed, 456 insertions(+), 43 deletions(-)
>  create mode 100644 drivers/net/pcs/pcs-mtk-usxgmii.c
>  create mode 100644 include/linux/pcs/pcs-mtk-usxgmii.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/3cd8af5e44554c2db2d7898494ee813967206bd9.1701826319.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


