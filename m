Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9970BC76188
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nbxb6pOBobAspVURmZV5qw9xso4MEJwnKnyDKhuf9Zk=; b=2tq+sZbE6c9pGf1wO0ZHzl2AOy
	VL8m+7/8HScdwVFYFQcPIZEZC+76IPe4fskDo1aV8LbIXUAajGSO+qBkvKg3OdpZoLYNSa4O7nDyp
	03lk0j0mFg7WuJYwvbs2HfngpSfmZL8etspoefwmRYGYcnLzfnhPJDQrIwUZYiL0fwfiuemu3OJGg
	FStg6ZVZbFfmJ2U7p2pOrupLRXVEZZgLAcqL4xf7PzTLB4ORbP1M8g4aO/CmoqZhiau5eCs8iyxxZ
	AC6DjnmDUd0yepwnq7ZsvpugovoTdaESoxnaPQA7xojDZ1gT9oclEZ7R7+V/v/EcWdwHWK3QPmsLX
	FE2u4uBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzQv-003wzv-14;
	Wed, 05 Apr 2023 09:28:01 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzQr-003wwp-2N
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 09:28:00 +0000
Received: by mail-wr1-x434.google.com with SMTP id h17so35480852wrt.8
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680686873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbxb6pOBobAspVURmZV5qw9xso4MEJwnKnyDKhuf9Zk=;
        b=OOAgHuCVOjJ1ff7sJbGp70M1TYsellJraMNNqALPTmQetFjYslPpiJGgMjg+i0Q1uS
         p2+UYnPbfi9udTNtUOZ1jUPDQS5kAR8sd5NrtSNm4GROMvpU3KxwMDb6zY7HadyoKZOs
         wlhWIyJoyqdmbeTXsjpsZxsjjxZjekgcVYAKGJ9qIZxDmUHTSpFscdwrCnBAS4qTTlUJ
         VGDcM+EW/dXt6zhL9ZhnH3lxniF8zlidAFd0DBk4lx046s7iVdcfNkhg0JIy6FKd6n0O
         wbVcBtv68/8QtEOlOGJaI19Yd0Bgs25xqhO2SN8TM/AhbQUVkZE96EFgn4hEbD0fi9Uh
         7GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680686873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nbxb6pOBobAspVURmZV5qw9xso4MEJwnKnyDKhuf9Zk=;
        b=hKdVIDxuZIAoM8I9ANY9Y2+lQ3XQSVTgVYvC/DgyuoL/eqUFnR/F0rJy4t+VmLwnsr
         ynR14c86oTnZlJdcKHK/IqxktC5+PTk6fSsESBfFr2viSBxTfHQqo6B0tvIK7JshhRKc
         ll2OCAT0snpnZxUCzBM0nFNQWvt537PFirXpCODPswGXOmBiIANZn76Jkendy9NHhhHu
         QWL9he998KZ00Xjv+N0kJP9tACn+jPeaXGUlef6+aZJmcKm3GCmRDBHP0g9mRjcssCn3
         U4F7wiRDqp1An0yXXstxtAVAMfXWn1mcgvOdJ4pkmYYNZ6EwQmvBr+EeG7pDccLW+D4Y
         rQuQ==
X-Gm-Message-State: AAQBX9cjR76rNq8JK6xuNxVnuaaP/TCK3Hn5F2FwKJhke3mUTBlb3irv
	t5EAUScOrgN2TSLvhTKLyGQqyA==
X-Google-Smtp-Source: AKy350ZTLUZ8C5oWQIqlnzLbcauR0nQz5678A9ppDmkWQi4Z5mSQP5i3id5jdUI4YRVmSOACLzI+Aw==
X-Received: by 2002:a5d:5262:0:b0:2ce:a30d:f764 with SMTP id l2-20020a5d5262000000b002cea30df764mr3274578wrc.21.1680686873617;
        Wed, 05 Apr 2023 02:27:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id ay8-20020a05600c1e0800b003edddae1068sm1606494wmb.9.2023.04.05.02.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 02:27:53 -0700 (PDT)
Date: Wed, 5 Apr 2023 11:27:53 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>, 
	Louis Kuo <louis.kuo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Andy Hsieh <andy.hsieh@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-mediatek@lists.infradead.org>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Message-ID: <ucoak3m7tlroscd2txdsbx5kr67sjvp342msva6rz5xwedub4q@xjb5kfdigxf5>
References: <20230403071929.360911-1-jstephan@baylibre.com>
 <20230403071929.360911-3-jstephan@baylibre.com>
 <6c9c74ee-b9ed-815f-dd92-37eb4c8f802a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c9c74ee-b9ed-815f-dd92-37eb4c8f802a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_022757_784128_A853688B 
X-CRM114-Status: GOOD (  24.21  )
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

On Mon, Apr 03, 2023 at 11:51:50AM +0200, Krzysztof Kozlowski wrote:
> On 03/04/2023 09:19, Julien Stephan wrote:
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> >
> > This is a new driver that supports the MIPI CSI CD-PHY for mediatek
> > mt8365 soc
> >
> > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > [Julien Stephan: use regmap]
> > [Julien Stephan: use GENMASK]
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  .../bindings/phy/mediatek,csi-phy.yaml        |   9 +-
> >  MAINTAINERS                                   |   1 +
> >  drivers/phy/mediatek/Kconfig                  |   8 +
> >  drivers/phy/mediatek/Makefile                 |   2 +
> >  .../phy/mediatek/phy-mtk-mipi-csi-rx-reg.h    | 435 ++++++++++++++++++
> >  drivers/phy/mediatek/phy-mtk-mipi-csi.c       | 392 ++++++++++++++++
> >  6 files changed, 845 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-rx-reg.h
> >  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi.c
> >
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
> > index c026e43f35fd..ad4ba1d93a68 100644
> > --- a/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
>
> NAK, bindings are always separate patches. It also does not make any
> sense - you just added it.
>
:( I messed up my rebase -i. This need to be moved and squashed with the
previous patch. I will fix it in v2. Thank you for reporting it

> > @@ -33,9 +33,14 @@ additionalProperties: false
> >
> >  examples:
> >    - |
> > -    phy@10011800 {
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      phy@11c10000 {
> >          compatible = "mediatek,mt8365-mipi-csi";
> > -        reg = <0 0x10011800 0 0x60>;
> > +        reg = <0 0x11c10000 0 0x4000>;
> >          #phy-cells = <1>;
> > +      };
> >      };
>
>
>
> k_mipi_dphy_of_match[] = {
> > +	{.compatible = "mediatek,mt8365-mipi-csi"},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match);
> > +
> > +static struct platform_driver mipi_dphy_pdrv = {
> > +	.probe = mtk_mipi_dphy_probe,
> > +	.remove = mtk_mipi_dphy_remove,
> > +	.driver	= {
> > +		.name	= "mtk-mipi-csi",
> > +		.of_match_table = of_match_ptr(mtk_mipi_dphy_of_match),
>
> Drop of_match_ptr(). You should see W=1 warnings when compile testing.
>
I do not not see any warnings when trying to compile with W=1. Am I
missing something? I will drop it in v2 anyway

Best
Julien
>
> Best regards,
> Krzysztof
>

