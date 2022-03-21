Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDB0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 22:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kB3vV0vtEsCrOFYjPypFmpCIK4zCDqJnkObEaXdvBHc=; b=YUfuQ3m8qPy9Fm
	OfzzDFuZ89b9Mnjznr7Kc0NB87TMPUDc0yFtLRJzXrtququt1xFSs8N/ZDXxFwXi+zG38hTBxGM5G
	FBm27RbgaMK4+lZZuRiu829qM4C/SY6cibs6w42r8pLml41cxq2QPr24ftDwvmPm83881RgYvzzBi
	MNLL8Yo1UZQqivoh2sqENsqzSOnZMu9ZsW1dpsTSVQpbQkTixjpwNE7y3xBUeTWI48HWldptap25V
	MI/N0GOlEkftO53wWAE2M6L/7I+JM6RIB1okr0pONkMt2+9FkTNHXexV26XA1DfcRVf0q2yb+01gg
	OExvLmPsos3BKEqJeSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWQMg-009Dc6-6N; Mon, 21 Mar 2022 22:19:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWQMS-009DYa-E4; Mon, 21 Mar 2022 22:18:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 20AC01F43C7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647901122;
 bh=1sqTrDjOkqq6nhvO+rMH2CwIada0wuStpXssjUi/8w0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V7gu6PM9fr515U684oxy99kT87ovDMMDzVviJOUWGtZQ/ekA5Ws0NebYVdCQmfR6y
 m1zvhh0mFqIgxa+hNYdeC0c4WfUo9YjmuTDDeO+QbxaAU5vqw7bFvkX7BVOG/uMT5m
 0HdaDl0bjsGj1kqtI8VbpfKFpaCMztjA+ydGI1mkkPnUfSY3YN0cT0XhT1Sd59wC15
 +MPledpN5JtzEFXCB4s+IKzwJbDqqo5PWm1bbPlON4yrmsF66q8b57fswO5JHokRQY
 3Hw/PfNHhgw+Ktgpbie2FAyL8zlCVfkt/VAseHPsMpfSrFBfq3L83otOidVALn5erT
 kiHwnCgJHEoBg==
Date: Mon, 21 Mar 2022 18:18:36 -0400
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
Subject: Re: [PATCH v4 22/22] arm64: dts: mt8192: Add pwm node
Message-ID: <20220321221836.li7ylxe2w3pbopk3@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-23-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-23-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_151848_715294_4A1754F6 
X-CRM114-Status: GOOD (  13.82  )
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

On Fri, Mar 18, 2022 at 10:45:34PM +0800, Allen-KH Cheng wrote:
> Add pwm node for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index f0f0f067c023..ea98b2230f18 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -625,6 +625,17 @@
>  			status =3D "disabled";
>  		};
>  =

> +		pwm0: pwm@1100e000 {
> +			compatible =3D "mediatek,mt8183-disp-pwm";
> +			reg =3D <0 0x1100e000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#pwm-cells =3D <2>;
> +			clocks =3D <&topckgen CLK_TOP_DISP_PWM_SEL>,
> +				 <&infracfg CLK_INFRA_DISP_PWM>;
> +			clock-names =3D "main", "mm";
> +			status =3D "disabled";
> +		};
> +
>  		spi1: spi@11010000 {
>  			compatible =3D "mediatek,mt8192-spi",
>  				     "mediatek,mt6765-spi";
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
