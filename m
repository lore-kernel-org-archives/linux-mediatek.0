Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81861C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 16:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHNMoKlC78WridTJcv3v+1lxKIkCMdqdxYwrnRtjGMk=; b=Ug+fjhJD6Zy8sz
	TsT5X/Y0x3NbcgzDpUJWnlJoeCXjHIvNoIENAxzUbkpu6wP00as3OSx1xYaLq9E88GCuWGPCOGrMx
	FkIbyrM4PpC4z1TnVv3ZOEeMvnZxLAucsnyu6MhKFoZQfGpJe+281cHdWSP9RKjiiZ3lN13GRvR21
	xpY5Kqs1Fm83XYsFpYeYVYkjvKSqEI+8PuwvwfFTNflkoZGFYW8mcA4qg1LQWwb7Gt7PnSXaoZoEx
	Ai1pMICQjb47GGyZfz0OdMZ87R5TxP5INgDhIevzhskp8bzQdfFy5s83wCSMXX2qZSfyrY4sIp1ar
	xXc/TCSQWUuXulUNFy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muH6L-004prI-HF; Mon, 06 Dec 2021 16:44:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muH67-004pnL-Qi; Mon, 06 Dec 2021 16:44:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 662451F44A89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638809054; bh=ufMGzqUKc1mGqbbGMtqGtAVoPTm0PrwEkwUigbsiWY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kGwUZsG9ZmN6Mrdube3jPYJgM7ujw1upKTTelviEXnpaNU7H5RobrlpF/PHOv3Ri9
 MshRGVw+rpAjAMaCO3iDXo6JQdKqGtReYineNQvDZ1DnqCfkpfDhxsjke720/vhRZq
 NR4kzR1ZUr9ZvNs17oQf7zICtoCMcVFLYZ+HVLyH8qs4BXBwkSdZ62okpUTgIisnKt
 paswEhNyF1T9Kjl57r5vGjOf4GPAoJywy9ammZLuxUVTyh/rg29n6JxK8dtuk9GP+q
 5GUUXC9qqp+ORk5C/wf7jkX7lTjRxCDQqWJFkygb3sWaCCMI39g6gF4oufPiPGUFOM
 Wz0hrLAE2KkrQ==
Date: Mon, 6 Dec 2021 11:44:09 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v1 2/5] arm64: dts: mediatek: Correct UART clock of MT8192
Message-ID: <20211206164409.oua5i77odmzmaqfs@notapiano>
References: <20210825011120.30481-1-chun-jie.chen@mediatek.com>
 <20210825011120.30481-3-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825011120.30481-3-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_084416_024845_00AC7FAA 
X-CRM114-Status: GOOD (  13.22  )
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

On Wed, Aug 25, 2021 at 09:11:17AM +0800, Chun-Jie Chen wrote:
> update uart0 and uart1 bus clock to the real one.

With the same commit message improvement from patch 1:

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

> =

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 2b63d2ea6cb6..31d135e18784 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -327,7 +327,7 @@
>  				     "mediatek,mt6577-uart";
>  			reg =3D <0 0x11002000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&clk26m>, <&infracfg CLK_INFRA_UART0>;
>  			clock-names =3D "baud", "bus";
>  			status =3D "disabled";
>  		};
> @@ -337,7 +337,7 @@
>  				     "mediatek,mt6577-uart";
>  			reg =3D <0 0x11003000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&clk26m>, <&infracfg CLK_INFRA_UART1>;
>  			clock-names =3D "baud", "bus";
>  			status =3D "disabled";
>  		};
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
