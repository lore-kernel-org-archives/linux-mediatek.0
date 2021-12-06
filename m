Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B0AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D87UPiJQYnEXkAYbJedjAlxU/nxieEhwFKUZfNDD788=; b=dvpT0wc/coGZvQ
	SydSDW/JN+6V0bSWVCya32RscFoerCKD8PV/qUcxd4aZIvOHfz/gNoNRnScHmMLPPGZSivBis8+zL
	/ZWJYLj9tiETcoplaVyxL/n7IWTRgIjN9IhRg4HslMDxn0HGZ79sbou2RFvSp00YExA9S2Uaou0nl
	whi6n0a1Tc3BP3POUinWZ/L5d+L4p4llFFIpk5tQsxwCKtWIBFDDQwteBLThlyylDEuL5S9mAqvt9
	k9vYDEC53fsRsFsKWqpJv0cDjedfG2UcJubke0DOBJH52VT/EJtNRywF2RcRyJ8r0tyI8TdmTBmRV
	Empo0CxdXJdNhXQUtrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muH4A-004pJC-8T; Mon, 06 Dec 2021 16:42:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muH3v-004pEr-FO; Mon, 06 Dec 2021 16:42:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id EDB251F44A85
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638808916; bh=M3hSCHW0hydix9hLEzH0Vi8aDVF0BRckDz30x5C/otc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FUmrqbTgbM7ViNCVOYPUNFgAwOKMfDYcV3caU+/NT+VSE0L94IjhC882xgvRXiSlh
 Xj8mjDujX0WAlz+LIeBN2a4XF36qKRXfZNJVtLAXb+2dsvcDbkDCjSMi5HZ8UMJaEI
 8oTagz5tVlppAgNaKsEQLJ7S1cvcmULer4Me8tRZTBHCvCByA/5f+vaQ/aKH9cBbBK
 Nx0Z1iz3EjOv51+yD+vvZAT/TgWvZVGZfCTqV4p/XhVVGGp+2cCQivtRib11vSACIX
 QAU4k+xNM+95FM9ec84q/WRGJFuZXsqDfhmmUvzZL977xn5GKmxgLUaDTR19SxFdEv
 QMDZuFp3X3M4w==
Date: Mon, 6 Dec 2021 11:41:50 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v1 1/5] arm64: dts: mediatek: Correct system timer clock of
 MT8192
Message-ID: <20211206164150.wigqbwo6kdkwi35r@notapiano>
References: <20210825011120.30481-1-chun-jie.chen@mediatek.com>
 <20210825011120.30481-2-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825011120.30481-2-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_084159_691813_086C74DE 
X-CRM114-Status: GOOD (  17.11  )
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

Hi Chun-Jie,

thanks for the patch! However, can you please improve the commit message? H=
ere's
a possible suggestion:

    When the initial devicetree for mt8192 was added in 48489980e27e ("arm6=
4:
    dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile"), t=
he
    clock driver for mt8192 was not yet upstream, so the clock property nod=
es
    were set to the clk26m clock as a placeholder.

    Given that the clock driver has since been added through 710573dee31b (=
"clk:
    mediatek: Add MT8192 basic clocks support"), as well as its dt-bindings
    through f35f1a23e0e1 ("clk: mediatek: Add dt-bindings of MT8192 clocks"=
) and
    devicetree nodes through 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192
    clock controllers"), fix the systimer clock property to point to the ac=
tual
    clock.

Then you could use the same message for the other commits, just updating wh=
ich
clock is being fixed in the last sentence there. With that improved commit
message:

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

> =

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index c7c7d4e017ae..2b63d2ea6cb6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -312,7 +312,7 @@
>  				     "mediatek,mt6765-timer";
>  			reg =3D <0 0x10017000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>;
> +			clocks =3D <&topckgen CLK_TOP_CSW_F26M_D2>;
>  			clock-names =3D "clk13m";
>  		};
>  =

> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
