Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQRBlLsvTMBMdKqQxWnqZTvcEiVqTaD1RTkgMjjX4Os=; b=N8ZnoKu/13pycX
	LwwmPkiwWSLHKQPhxWEnzDlbuJgROJdHTlvLbPOKvDblABKKvRZQTCyberqMtukJSkj6+QJ+lBAsx
	naTgyiXbD8VHFpEaflVNivrzldRM9YXyuxApyxUdAbkdIDlBcnMmaJKDplFb0b3+siQq9P02oxVPZ
	JrWu5z5k9ejRRyyG4CvvDHrE/2oCp6gOPMdFQAe5N5iWWj5XTHxORh1GNTn4OYGoh7zvklcrMcw17
	i52EKjgG6aJSIalcwKJ0JWQD5kIA2DGoJ0qZkoxQKf7SGudv4gRwUhNYRU2HhE/mg3EGk2bmHQmIh
	sEJBaQYSW8sO2Ay5OGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nExKB-00DGP4-7m; Tue, 01 Feb 2022 17:52:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nExJz-00DGMs-JX; Tue, 01 Feb 2022 17:52:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 6E13A1F42650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643737922;
 bh=vjUzehLvDCyX+ZuEqZcFwP2Vc1ndAwr7dPV8FPY5mOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QObNmog3dVAUNgUeT+YmFBheaj1ZgBvbYmTanGwngouXuYFnTF4WHlX6+73fY8G4n
 y3rBcPrlPZphgsd6tQyHXVw2XMvhp4w6aqzIO5gTmlB859DSMP7LjF1iE+DyLFCOlL
 aSmKNRUrNmywsY956sn74tS5vAmR0SlMZzDys4Rugy+4VGd8deIPjEYT5tV6bblUcY
 S1T1/Z8O4kom9w0mFj6i2Vl3nc6ZyAA2lMRuJ926rD19e4acK9K+8ZIl7bDbcrGTgx
 FeMvu2DYLCQdwGbDW4pYA3vzxs9bHABp0IyqtV1Q4RDM6mDfuTCfU5mh9b6Ti9TaCb
 Aap954XKr3V7A==
Date: Tue, 1 Feb 2022 12:51:57 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Robert Foss <robert.foss@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: mt8183: jacuzzi: Fix bus properties in
 anx's DSI endpoint
Message-ID: <20220201175157.nhjbspw7kfz7gwyy@notapiano>
References: <20220201174643.843102-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201174643.843102-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_095203_796918_5819C541 
X-CRM114-Status: GOOD (  21.11  )
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

Sorry, I forgot to add the reviewed-by from v1. Added below.

On Tue, Feb 01, 2022 at 12:46:43PM -0500, N=EDcolas F. R. A. Prado wrote:
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
> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>

> =

> ---
> v1: https://lore.kernel.org/all/20220120224204.773117-1-nfraprado@collabo=
ra.com
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
