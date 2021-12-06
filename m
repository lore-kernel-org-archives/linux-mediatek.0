Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD240C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 17:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+rqZICFA8EcTUY5/GtJ/ENDwxYJj2ZF0T3y+HdwGX8=; b=j6poHLBDpEUR40
	eChvu0s71i3O+vzcqMYpxFE0V/UWmqPvVvKSLymCzRz3bDT2izb7ixt5kkRrizTuXmfQEaer9u/Om
	JNjeeDWKIc4u3/mp9CDUIgKVuit4qQ+22NbBrs8P+yTq52NLBxWia0bdeni/ZbuhFwJleYec6t4Cc
	L47GHuSBnOgmC+86SySdFX538FmhZh8bXq/XK07lscLpu4WAEWJaI0WSLerF051H0b+8sFxhVQddk
	nberapZ3S16UyRfKNoV4Hi4GKIwJ1pQ5eI7I7US9WgWn1WgGJ+8yFT0Kd/FAWTwtOslqk2+tCKLFh
	B2wogMWGeOffua7oBIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muHMl-004wGy-V3; Mon, 06 Dec 2021 17:01:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muH9u-004qun-5G; Mon, 06 Dec 2021 16:48:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 94E241F44A9A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638809289; bh=0znrmtZMATzeX3bJhBrLbdzjRWYzL2nWzFbmGEZ2jtE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nHdKCDuptPO2LMCs+HGvSeo4sLWl0QHF9laW5NDccVgF/ihRStFRdBx4qiV0Ah7Ix
 +cXf4iHe1xT7EEx9wXjtRb/C+x2JlJSEdyLuTQuLS5x/a+J0FeNHeX/HjiaTP13/4B
 f7u06psjW+bgOySr+9YLazQZ0BKOrSXP7fSaT5aRp2D3dVieOQikgz0CaPjbSvDfqC
 IzeoZooYrZIWJDcy2uxAiYT1MzeCY6PsPcLPwkqP4ZN/DAal09+btfg4WUot8UvBGQ
 PP+HAZpmTL2ZbE1qG+/JEp2iWp/V4wTA+fr23YFeUu8Bm/VcXlUFcgReeE8ImgD13n
 IwDSctGieUaFQ==
Date: Mon, 6 Dec 2021 11:48:02 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v1 4/5] arm64: dts: mediatek: Correct Nor Flash clock of MT8192
Message-ID: <20211206164802.33ygybxt2bi2wom6@notapiano>
References: <20210825011120.30481-1-chun-jie.chen@mediatek.com>
 <20210825011120.30481-5-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825011120.30481-5-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_084810_429410_193825F5 
X-CRM114-Status: GOOD (  13.09  )
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

Hi,

On Wed, Aug 25, 2021 at 09:11:19AM +0800, Chun-Jie Chen wrote:
> update nor flash clock to the real one.

Same comment from patch 1.

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

> =

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index d1c85d3e152b..db6f4c6dc404 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -464,9 +464,9 @@
>  			compatible =3D "mediatek,mt8192-nor";
>  			reg =3D <0 0x11234000 0 0xe0>;
>  			interrupts =3D <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>,
> -				 <&clk26m>,
> -				 <&clk26m>;
> +			clocks =3D <&topckgen CLK_TOP_SFLASH_SEL>,
> +				 <&infracfg CLK_INFRA_FLASHIF_SFLASH>,
> +				 <&infracfg CLK_INFRA_FLASHIF_TOP_H_133M>;
>  			clock-names =3D "spi", "sf", "axi";
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
