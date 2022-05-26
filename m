Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDEBC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 01:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UoVWZcU81DsS6uEusFzu604/W4CfKFU1DprqjTERJrY=; b=uOqhUtN5cpyoVo
	xN8uLGwtwezZU/cUyHfnxHJN1wgQcraIKjge4Uk7tcHAcsufxPNsVvgZysR2TMUcsGiml4cNFJspW
	BUfypjX9dUlkyjzZmseTRt8vrWDtsnSOJmM9RyE3kBkUex3r9m5Mmj/Zc78qDNBKsgshJY3W+wwZE
	JLORpBTRoij95YBZtnLNAJ1FayLaNKyasSTOWieQ4NNwra/AKlQpw2tZ8lH62cQpD7My42HyNUaRo
	leQYkHzl02j0zvFAcx2Pf9Cr7MTnu/GY/N4kSonikrpP5qtXTCkI5MZuGuqIN19qULZUR8czQiM60
	VPrNiyPKTfGV53rlimZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2kw-00DF3Z-CA; Thu, 26 May 2022 01:57:42 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2kt-00DF1Q-Rn; Thu, 26 May 2022 01:57:41 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-f2a4c51c45so661327fac.9;
        Wed, 25 May 2022 18:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fBooorBUc9TiuuZP7V/CE0nVyIQJLuFcFSmL3ukgr+0=;
        b=lKsr3FFVgq4FgyRCz7fH884agZ3hfzUCabpe9S3vV7OyEaeyU+DKbD87EksQFNEskg
         f/PfyRz38XAwoTsaX/FVdNeFF6WHFUfBA7B8QyaQ7FJW9l504Hrd1wv/hQra6Zbnwxct
         adlYwHebJgRLCZEGZquEqQ6ymE2IXOoJXTTYTAQjqKAeZ/o4DXHZK9cwgh5x/h7XCaTn
         NwNHAdZfdvlyRigoYaCCnF6DHvOKeV3BWKrFo1N7JYJULWuhAUuhWlfoZ2W5hYwpgrYp
         Y+vU2zocgwOo/tRFsg5V+BGAz+a0dSFhDDN/UMSTMOKqZ+PDuo2FKy+rQ17hA36tMAl/
         MkWQ==
X-Gm-Message-State: AOAM532UIdyl1yg1kHZNvvJCKZQ7P3XNB3uUw1TC3D5qjmcaTcx1S9v1
	G0KNK1RajuW/3DWo1XeK2A==
X-Google-Smtp-Source: ABdhPJxUeqloFyZQmwKt5j7Tji4hIdlUPLrqi9TrK0/U1U2+xqrrho6dVSvMuYpjlY4QrOa42I+OCA==
X-Received: by 2002:a05:6870:b68a:b0:f1:8001:1182 with SMTP id cy10-20020a056870b68a00b000f180011182mr37728oab.30.1653530257854;
        Wed, 25 May 2022 18:57:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w27-20020a9d5a9b000000b0060603221240sm134732oth.16.2022.05.25.18.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 18:57:37 -0700 (PDT)
Received: (nullmailer pid 2896334 invoked by uid 1000);
	Thu, 26 May 2022 01:57:36 -0000
Date: Wed, 25 May 2022 20:57:36 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, kernel@collabora.com
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: mt8192: Add
 drive-strength-microamp
Message-ID: <20220526015736.GA2896280-robh@kernel.org>
References: <20220525155714.1837360-1-nfraprado@collabora.com>
 <20220525155714.1837360-2-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220525155714.1837360-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_185739_933944_4FD7227A 
X-CRM114-Status: GOOD (  12.60  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 25 May 2022 11:57:13 -0400, N=EDcolas F. R. A. Prado wrote:
> Commit e5fabbe43f3f ("pinctrl: mediatek: paris: Support generic
> PIN_CONFIG_DRIVE_STRENGTH_UA") added support for using
> drive-strength-microamp instead of mediatek,drive-strength-adv.
> =

> Since there aren't any users of mediatek,drive-strength-adv on mt8192
> yet, remove this property and add drive-strength-microamp in its place,
> which has a clearer meaning.
> =

> Fixes: 4ac68333ff6d ("dt-bindings: pinctrl: mt8192: Add mediatek,drive-st=
rength-adv property")
> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> =

> ---
> =

>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 27 ++-----------------
>  1 file changed, 2 insertions(+), 25 deletions(-)
> =


Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
