Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 18:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqu4aaE3btCIKDdFb8A7/ahgWcEYNuCViYv0e0GNaT4=; b=JJt2NFVcJxW138
	wmwt++AdZi3MBP2yXpWsjXzOuTqG3EBRF4wKNrVKzOTIVZ0Wckpj/mUypNwwXrI6AVIZcEl9+xgA/
	Tn+V6FszXsKgkDAQ8AWi4FLiuu//UvpNCzYbr017LdzSZlfIdauRvg15O6h96aPW+yde3le9jufkG
	n3ctIQhgUEbfugYgTJk+S6NPYQeSJet/LyHT4tJK2Z/UqWxQDqtN3+HwJNEVNaiZWDwvAc9rNTONc
	x/ITx+6fCJHrC18pj4+pDmrFNHfJh0dY/YgD1FKbLfTUFDracOZjldGEuhSKT/i4OXXWu0v6EpaF1
	wob+94FnH7kvIw4s8bBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlarG-002DCi-5p; Mon, 02 May 2022 18:33:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlar0-002D6K-VJ; Mon, 02 May 2022 18:33:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 06AA31F42817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651516379;
 bh=dKN4ju/bbXDAUouowRwoVB4iWM1AzKPnXRrkmI1NJjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=efhPJidgcFGegYu1ZY05ABw0Si1mNWIAWya2bP0OsaFzSdbsiPhWaR+Am8PfD5kh9
 M1T4AlAb0QFKqpS0kEEWvfDQdEucaGhuQkiIeEaIrPTFZhIASTRFEcxlxWwWxtz9gp
 Pg70/qGpFx4kiiZJPuJaSMyd1f/I51VyFPFWHDlorNA98f57zGktln3LSU9DO0owSg
 cEt0VRj/JblrydGpYhl2LXT6uOKcrGGSGKoOoGGYd26PAIdKzeI7NGkDs1o4dDEOKg
 QspKV2hQTY03EOEZkSRapY+1AFZnZOZUWpSLuCzzyqGmWadSVgEAYDcpPimYIAgN0m
 bdJZNaGTR3z0g==
Date: Mon, 2 May 2022 14:32:54 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Fix optional
 reg-names for mtk,scp
Message-ID: <20220502183254.qb2paehrlkmhbhf6@notapiano>
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-2-nfraprado@collabora.com>
 <1651505609.475123.1161772.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1651505609.475123.1161772.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_113303_311584_AFB3D498 
X-CRM114-Status: GOOD (  19.90  )
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

On Mon, May 02, 2022 at 10:33:29AM -0500, Rob Herring wrote:
> On Fri, 29 Apr 2022 17:11:09 -0400, N=EDcolas F. R. A. Prado wrote:
> > The SCP has three memory regions: sram, l1tcm and cfg. Only sram is
> > required, the other two are optional. Fix the dt-binding so that the
> > optional regions can be omitted and passed in any order.
> > =

> > Also add the missing minItems to the reg property and update the
> > description.
> > =

> > Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> > =

> > ---
> > =

> >  .../devicetree/bindings/remoteproc/mtk,scp.yaml      | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > =

> =

> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.

Hi Rob,

These indeed aren't new warnings. But in any case, the fix for the interrup=
ts
one is already on its way to mainline [1]. And the memory-region one is wha=
t is
fixed by patch 2 in this series.

Thanks,
N=EDcolas

[1] https://lore.kernel.org/all/165066838719.2742284.7900096409445311556.b4=
-ty@linaro.org/

> =

> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> =

> Full log is available here: https://patchwork.ozlabs.org/patch/
> =

> =

> scp@10500000: interrupts: [[0, 174, 4]] is not of type 'object'
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb
> =

> scp@10500000: memory-region: [[25]] is not of type 'object'
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dtb
> =

> scp@10500000: memory-region: [[27]] is not of type 'object'
> 	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb
> =

> scp@10500000: memory-region: [[28]] is not of type 'object'
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> =

> =

> -- =

> To unsubscribe, send mail to kernel-unsubscribe@lists.collabora.co.uk.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
