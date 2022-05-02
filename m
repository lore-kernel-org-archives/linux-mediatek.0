Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D50C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MChUgeRo9xbOuXBdwTOssEnqOwwXAZe59EZz3LlzJ70=; b=K5Uj2lBiQWvKAB
	tuOdFGIJPB4VLbSoaBB/KDse9TVn5rQaFihnPxnRXAAY4CMb2FEXkvuJ9o3bt/9WJ4zcs2h6dxu98
	xXVc4ZxVl8iaOWu+NxNlsFVdrcc8B91EKdsTRP4GP/vYjkwN4jPu/2J74wnx4lsKjN0oDmA9FbcDM
	YhJpGdRYFy/VTFh/teoAW6weJuVAFQi1bs0BcLo3g4KI7b2wa9Dfo2ENd7bhYgNs2H6p2qzn7osdm
	7DbMi11IEwzMOoxZ/e9uke6eZIRSrsCFe1DbMBFQMlczf1Ja2sAudBdyTMQvZZO38b59zvxVquYnV
	8YQY3hyh6eYSRtfR+2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlYf2-001erD-UW; Mon, 02 May 2022 16:12:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlYel-001eje-Sm; Mon, 02 May 2022 16:12:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 34F4B1F42BC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651507928;
 bh=yFJOMKwuIhisyg/HTjYUfFFgojnjn1gaRe4MzlvPbJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WugItvxTkOGGNHaEeKBTDncAM3wUeRs3oShgHGf4GWeVrX/mMiT1QygpMU4x5j065
 Gt6pyaBHFSuQyXEAYYa28BgHWT2AFjZ8qhjXyFtxtQaQAgj1scf++bvYnN0LPsRNLi
 Nce9SmSI9VJi9VrUeXPTLEafQp1+wPzugsIy3ByqPyONYVqhh07PyqnzfKsbe/QdCG
 M96xm5UA5kIIdPqVzlfRRSV4yCAJ8jrFmk0njylohNyipmPCk2/FWxZxrQV8qDr8Iy
 LL96d6HWQYUl894lIIUIdjaj/+4WOzRgEiBtOgz52UELJWKVB3NbSFCGf44AUVzO6H
 Ua1OkdPiuO7ug==
Date: Mon, 2 May 2022 12:12:03 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: Add fallback compatible for
 mt8192's flash
Message-ID: <20220502161203.pfmjyep4escqwjix@notapiano>
References: <20220429195745.2203461-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429195745.2203461-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_091216_084722_A0979323 
X-CRM114-Status: GOOD (  21.63  )
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

On Fri, Apr 29, 2022 at 03:57:45PM -0400, N=EDcolas F. R. A. Prado wrote:
> The dt-binding for Mediatek's SPI NOR flash controller expects a mt8173
> fallback compatible for mt8192, so add it in mt8192.dtsi.
> =

> The driver already sets custom data based on the mt8192 compatible, so
> this fallback compatible won't be used and is added purely to suppress
> the dt-binding warning.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

By the way, I wonder if this patch should be accompanied by a patch adding =
the =

mediatek,mt8192-nor standalone compatible as deprecated in the dt-binding. I
feel like the answer is in theory yes, but in practice no.

The fact that the mediatek,mt8192-nor standalone compatible was accepted in=
 the
devicetree means that it should show in the dt-binding, since it's an accep=
table
binding. But since the binding already shows up there with a fallback bindi=
ng,
then this standalone binding should be considered deprecated.

But in practice, the mediatek,mt8192-nor is the more specific binding so
documenting its standalone use as deprecated wouldn't accomplish much.

What do you think?

Thanks,
N=EDcolas

> =

> ---
> =

>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 26dbe9ecc528..32a836105ea7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -896,7 +896,7 @@ pcie_intc0: interrupt-controller {
>  		};
>  =

>  		nor_flash: spi@11234000 {
> -			compatible =3D "mediatek,mt8192-nor";
> +			compatible =3D "mediatek,mt8192-nor", "mediatek,mt8173-nor";
>  			reg =3D <0 0x11234000 0 0xe0>;
>  			interrupts =3D <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH 0>;
>  			clocks =3D <&topckgen CLK_TOP_SFLASH_SEL>,
> -- =

> 2.36.0
> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
