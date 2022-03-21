Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0774C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 22:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Eln7DL8t2S1Asbb369vKBE6f6nwtvIut6DLt8AvDpQ=; b=j96IurTTHyzlrr
	8LPP6mXiFXEFnuYdXLOZdJKn4whhHK7pxc746p6bSlrpWLC7m+bucImMyPHmcF270dowe4onzNdCX
	scowhXoAvs0/+pxiVzzhUuFgT+z3XJMi/O0OHIyOE/YIotfCIs1dYAZCes9sQCnQlwzUORRgBIBXY
	auB2CD3qqnEHClqqp4qF973iq/Kf+Z6tFlhXHJYqTP4Rhzqi9jc4bFQO6iQFfEAw3Syl2gLez1CMu
	AKqeIh/JUTuwKvjtWojxiVBiS3ywlzX4fYk06MdA7SblzLvX7jdGb5uGtxAAMbG03cGDNz3j3V0yU
	I2pvP1MVCA/qJlJd+QKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWQil-009HL8-Ef; Mon, 21 Mar 2022 22:41:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWQiZ-009HJA-H0; Mon, 21 Mar 2022 22:41:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 1CDC01F43824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647902498;
 bh=kI/wjHaSk0veo5TLOr3KNgxZeKIdR/WCP+DeGO3YYFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iS3YE/xkM6pS7zwzvrFBf/k+0phCo54uO8OLGHbzvfBi2CzRboZXCE7HUyOG3168o
 ZwQaigQV4XLRXSAOpGNFATX6kAg/ZPxusmhLLj5ScYifylmF/RRzF/u/JHRcs+1wc4
 yhQ93sTnljzF41D9nX/qBx7d7A3F9ghtiWsNPVQ4MaJtBKnYRTxS8k5Zxz3U8WggOp
 DtXFcYqTPIj44ETXfHk7vNJmubHcLkXJuKlyPLKKVJjAqswxoRX7aJtqLSLs0+NaTP
 dLlRVTDZ3wnrWty48KAhhNGG9jR1C/z3XJ9hQhF5TkUCqUHucYV3cJRnHyL/gLGKxS
 t044I3mz6MUbQ==
Date: Mon, 21 Mar 2022 18:41:33 -0400
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
Subject: Re: [PATCH v4 13/22] arm64: dts: mt8192: Add mipi_tx node
Message-ID: <20220321224133.jjodvrurv6kvrouf@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-14-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-14-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_154139_719178_B1A0FB8B 
X-CRM114-Status: GOOD (  13.84  )
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

On Fri, Mar 18, 2022 at 10:45:25PM +0800, Allen-KH Cheng wrote:
> Add mipi_tx node for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 2648f2847993..6b769fa5b427 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1110,6 +1110,16 @@
>  			};
>  		};
>  =

> +		mipi_tx0: dsi-dphy@11e50000 {

Typo here, should be dsi-phy, not dsi-dphy.

Other than that,

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> +			compatible =3D "mediatek,mt8183-mipi-tx";
> +			reg =3D <0 0x11e50000 0 0x1000>;
> +			clocks =3D <&apmixedsys CLK_APMIXED_MIPID26M>;
> +			#clock-cells =3D <0>;
> +			#phy-cells =3D <0>;
> +			clock-output-names =3D "mipi_tx0_pll";
> +			status =3D "disabled";
> +		};
> +
>  		i2c0: i2c@11f00000 {
>  			compatible =3D "mediatek,mt8192-i2c";
>  			reg =3D <0 0x11f00000 0 0x1000>,
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
