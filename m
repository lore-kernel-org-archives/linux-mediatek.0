Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD9DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 20:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcBaKvKDAEkFmdjb5NnPKRqLWtwW3a9P27iN6Aa39/g=; b=TCxip0lJnGdAVO
	u2gbnW3oF8/nCdZKP0arHqIjRYpG+H3cd+CnVUxHiqizXBqiivVEbwcC9Hdd/4bsnoptdHm5/0Dfe
	wGBiOQY6g4+sOaynHfz+06LkIsXB3sLU5NQR+7Q37rmPZQkYxq6FWjXtQxEG7UaL0Y4KD0yiOId3e
	N5zUVw6YKWRE/v81HSZxmvHuIY2AdpEUP/PmVca3qwTzPcyTMXh1FDA9VKRJC5iC/HrY+Q1qv/2Ua
	gc587GRf5yzunn9Llg9CGvFVL22TCjNu39RjNCHT8Amu+M3e0SUMQOgPIuQeeEJYjaf+FcDrFUzNq
	5aI+UsGloSPmMd7WbE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlzL8-007bOy-8M; Tue, 03 May 2022 20:41:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlzKw-007bK8-H7; Tue, 03 May 2022 20:41:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 321911F400A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651610490;
 bh=6LlYKh046C6Z3Am//641lVVpWpuYaRN/WaDnK7FKMPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jq2n3gj2aIDxNSouNUQgKaOCvhCEGcMWOhu/x9UZgaU5fCvDTXJL0gIzEF3qN1+J2
 xYBwnPi72TT4R0uA+xJf3yAdRRUbPtKmLa0Be20hULZr/eIqCEa9VELb3/u2ToKL3m
 zeI/AoF3KTOT+3FCOXl16JABfhpRZlBudzc4pr8H2jhK3bCfGfjH5V9OO6SGaStLtZ
 s+C+IchA4wSnLgCbsleanjZ34/go6DvEUruGtSw4DTTpJrCNyKH0jUe1++SCfmSp8J
 Rxp7qbjoG8IujYBSJxxS4kUjsajdyfD09QrFSETDeLN7+B4KCU72ZpvCxq6HOGVeEu
 6DuToMHDjadeA==
Date: Tue, 3 May 2022 16:41:25 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Fix optional
 reg-names for mtk,scp
Message-ID: <20220503204125.a4xwd7a5e3fxf7et@notapiano>
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-2-nfraprado@collabora.com>
 <a95fc4a9-af6b-e2c2-ef41-df9742d393de@linaro.org>
 <4bf2343b-3760-6ebf-7463-0b25fe9d942e@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4bf2343b-3760-6ebf-7463-0b25fe9d942e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_134134_827938_124C0D0A 
X-CRM114-Status: GOOD (  29.04  )
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

On Tue, May 03, 2022 at 02:26:15PM +0200, AngeloGioacchino Del Regno wrote:
> Il 03/05/22 14:19, Krzysztof Kozlowski ha scritto:
> > On 29/04/2022 23:11, N=EDcolas F. R. A. Prado wrote:
> > > The SCP has three memory regions: sram, l1tcm and cfg. Only sram is
> > > required, the other two are optional. Fix the dt-binding so that the
> > > optional regions can be omitted and passed in any order.
> > =

> > No, cannot be passed in any order.
> > =

> > > =

> > > Also add the missing minItems to the reg property and update the
> > > description.
> > > =

> > > Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> > > =

> > > ---
> > > =

> > >   .../devicetree/bindings/remoteproc/mtk,scp.yaml      | 12 +++++++++=
---
> > >   1 file changed, 9 insertions(+), 3 deletions(-)
> > > =

> > > diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yam=
l b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > > index 823a236242de..ec9ddeb6ca2c 100644
> > > --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > > +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > > @@ -24,14 +24,20 @@ properties:
> > >     reg:
> > >       description:
> > >         Should contain the address ranges for memory regions SRAM, CF=
G, and
> > > -      L1TCM.
> > > +      L1TCM. Only SRAM is required, while CFG and L1TCM are optional.
> > > +    minItems: 1
> > >       maxItems: 3
> > >     reg-names:
> > > +    minItems: 1
> > >       items:
> > >         - const: sram
> > > -      - const: cfg
> > > -      - const: l1tcm
> > > +      - enum:
> > > +          - l1tcm
> > > +          - cfg
> > > +      - enum:
> > > +          - l1tcm
> > > +          - cfg
> > =

> > This allows them in any combination which is not what we want. If both
> > are optional and both can appear, then last should be a const:l1tcm.
> > =

> > Best regards,
> > Krzysztof
> =

> Nicolas, I think that you weren't clear about what you're trying to solve=
 with this
> commit in the description.
> =

> I remember you had this kind of instance, but I don't really remember if =
it was
> about mtk,scp or (and?) something else.... so.... are you trying to fix i=
ssues
> with devicetrees declaring
> =

> 	reg-names =3D "sram", "l1tcm"; ?
> =

> Was this giving dtbs_check errors?

Hi Angelo,

yes, some devicetrees (like mt8183) have

 	reg-names =3D "sram", "cfg";

I'll include mention of this in the commit description for v3.

This was also supposed to fix the warning for mt8192, where the order is
different: "sram", "l1tcm", "cfg". But since Krzysztof said that we want a =
fixed
order, then the mt8192 DT will need to be updated. (I also just noticed that
it's just l1tcm that is optional, I was just being blind, so I'll also fix =
that
in v3)

Thanks,
N=EDcolas

> =

> Cheers,
> Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
