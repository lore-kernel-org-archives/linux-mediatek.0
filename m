Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CCAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pzcsoh18jFM8shBmJGHXVBG5PuevpwREsKTmQ92Py8c=; b=kR+V3240ABRxUG
	7cgGeSS+O3Ax1V1ZG7PjNSTmPwzfiwsJLv/hL9ymu39eXSPh8dJQceF7nzMpIT0eOVKrWXe7eVDiB
	z5Xf2xuEGQMBAfnxu/k7PQCgrryrw57kV/QrAzhGOb5QHFW3vTY0EwPdCnYvxRihJ8t2IyjkR7xBc
	zsdIrt7qWqF+nDQXpoh+goJGXPsA5IMkhkleCQgmXgH2efpiUYL5NDG9paPIOAqQhVMtkeNM271EU
	R47K9dZAMb3jOuQY+VDvDJX8gpLeFirxKgauAtypNTgyp6+6MPC4NF91FY7BEw7ILan5KLVu+WREx
	27KNeZpAivEwSF3khwoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMuIn-00FG8J-Hc; Wed, 23 Feb 2022 16:15:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMuIb-00FG4t-L0; Wed, 23 Feb 2022 16:15:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 4B6071F448A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645632927;
 bh=uLwakwP+7QKWR8eipFTI5+MziZSsq1n0V6y5bky0dvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h6zrFVPJcIENISvUjbXHuF7gKBP62jAgL+effeVsGwYOpsdezSb7QRZjZ797ouJP/
 6HI9BYeoiHlyaQ671tzSITXcM47cStd2R7vwp7sOIbBAM8IYyY6QiqYVa539q0FAez
 V7w9irMFCiolbqvs1p4s7LEz/hUV5EA8sSTBjM8Gy2BAIZA5n2FrlqFDQd6ilRqZgD
 LQfNAi81d6QEofNqYsRAnvkLXBNZGbXgiKiCkTtLQVXL4eUVUwhKU+YV0ULIc5Siy/
 CUpgnjYOKT//3K0EfX/ZC1eulWw+WvksKLaCXnRfBFZRyECXQVeHyfaa/5WUnEK+Am
 LFPZEhN8AIsdQ==
Date: Wed, 23 Feb 2022 11:15:22 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Robert Foss <robert.foss@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: mt8183: jacuzzi: Fix bus properties in
 anx's DSI endpoint
Message-ID: <20220223161522.522ps5jmwizpgqij@notapiano>
References: <20220214200507.2500693-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214200507.2500693-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_081530_043287_7B931E9B 
X-CRM114-Status: GOOD (  21.71  )
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

Gentle ping for this patch :). It's an important fix to get the display wor=
king
again on mt8183-kukui-jacuzzi, and also one of the requirements for us to g=
et
IGT running on that platform in KernelCI :).

Thanks,
N=EDcolas

On Mon, Feb 14, 2022 at 03:05:07PM -0500, N=EDcolas F. R. A. Prado wrote:
> mt8183-kukui-jacuzzi has an anx7625 bridge connected to the output of
> its DSI host. However, after commit fd0310b6fe7d ("drm/bridge: anx7625:
> add MIPI DPI input feature"), a bus-type property started being required
> in the endpoint node by the driver to indicate whether it is DSI or DPI.
> =

> Add the missing bus-type property and set it to 5
> (V4L2_FWNODE_BUS_TYPE_PARALLEL) so that the driver has its input
> configured to DSI and the display pipeline can probe correctly.
> =

> While at it, also set the data-lanes property that was also introduced
> in that same commit, so that we don't rely on the default value.
> =

> Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> =

> ---
> v2: https://lore.kernel.org/all/20220201174643.843102-1-nfraprado@collabo=
ra.com
> v1: https://lore.kernel.org/all/20220120224204.773117-1-nfraprado@collabo=
ra.com
> =

> Changes in v3:
> - Added missing Reviewed-by
> =

> Changes in v2:
> - (thanks Rob) Use proper format when refering to commit in commit
>   message as pointed out by checkpatch
> =

>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 8f7bf33f607d..e8f133dc96b9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -171,6 +171,8 @@ port@0 {
>  =

>  			anx7625_in: endpoint {
>  				remote-endpoint =3D <&dsi_out>;
> +				bus-type =3D <5>;
> +				data-lanes =3D <0 1 2 3>;
>  			};
>  		};
>  =

> -- =

> 2.35.1
> =

> =

> -- =

> To unsubscribe, send mail to kernel-unsubscribe@lists.collabora.co.uk.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
