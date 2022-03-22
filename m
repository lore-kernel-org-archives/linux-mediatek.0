Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 20:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3Uhj8ScqknpsLVVqLtCddC4NtPFIv3SZs6GdQkXM80=; b=CZ/+iDTSE9yJjE
	7bZZe3lOkFqkYu19PQw2bBQoSVZy6BZjfHxiGPEwb6QE0pCs/tNVyGGvGE94OF+QcLeV6q37PL5Pd
	PGjYWPceaR/5O39X+e7Rd2qzKIBbo4H1qvDFEJAmAs9/75RMx8pFV9LDWVYLRsfaJsdWkq32AUOa4
	680MitzN9zeA9nsx5KYpidjIRwBCaYyxZSFQ/Nl7XFWAx4DB1hPiyMxMvonLJucO91ZFx8pepZjRC
	mtlW7BlkMYDF9zEmmmAPWbRfPq0jr49PZUilnkqUkFXVt5nEo8PpcPQ7+W7ojhI1ALKWU6AsID+Xz
	03Rn7oUmnvjBsDkhlCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWl7U-00C71p-Pd; Tue, 22 Mar 2022 20:28:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWl7J-00C6zY-1S; Tue, 22 Mar 2022 20:28:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 89B281F431E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647980911;
 bh=1CkcBWcFLWap6uKtAh1dSlwHTFBzBqGJJwNqC1b53nE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PHjlpq/kg6OUyZsGSXY47+FiRpjGpYfOtwTS/cXDajteWi2DMGrrBKg6pE/7K3lit
 s9yP6YOd5Z4JxBuQVUJz+kAgLusobcFRv9lDwH28EGDMoA+7RN16Ix6MUdm58yNVHf
 Kp4mrq/U/GI837iIIhkn9SmYVZxWeYqFq5fKAn2FAU53c7oH1QMIBFK94w8MDS4MIN
 s80J5IKqlHe0us25z6HONWFDRaFRuc89AK082yO3eQY4EUGOObsSjOL4jGXZdFa1py
 aA7ig2syp6EBtOxAz1HJEdiv8M8P+S/6LSv4WOe+/3YrtpSHUfNU0j3vVPW2ksnoJi
 lq6cazoWPVLTQ==
Date: Tue, 22 Mar 2022 16:28:26 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
Subject: Re: [PATCH v4 04/22] arm64: dts: mt8192: Add SCP node
Message-ID: <20220322202826.64kwisnka5xq64vc@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-5-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-5-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_132833_236944_463EA637 
X-CRM114-Status: GOOD (  13.79  )
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

On Fri, Mar 18, 2022 at 10:45:16PM +0800, Allen-KH Cheng wrote:
> Add SCP node for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 9e1b563bebab..195d50894df4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -706,6 +706,18 @@
>  			status =3D "disabled";
>  		};
>  =

> +		scp: scp@10500000 {
> +			compatible =3D "mediatek,mt8192-scp";
> +			reg =3D <0 0x10500000 0 0x100000>,
> +			      <0 0x10700000 0 0x8000>,
> +			      <0 0x10720000 0 0xe0000>;
> +			reg-names =3D "sram", "l1tcm", "cfg";
> +			interrupts =3D <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&infracfg CLK_INFRA_SCPSYS>;
> +			clock-names =3D "main";
> +			status =3D "disabled";
> +		};
> +
>  		nor_flash: spi@11234000 {
>  			compatible =3D "mediatek,mt8192-nor";
>  			reg =3D <0 0x11234000 0 0xe0>;
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
