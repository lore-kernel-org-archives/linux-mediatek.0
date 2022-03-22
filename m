Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EDDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+Mzz1UdtX3hJptZYEzDysXkgVYTOY/uC0+f4o5BQf0=; b=xYsxHf90kVX12w
	04jJj3mjccA7GgoCT/DSO1J9oj93IjJA/lzUoMAwpkQ/e++NTMxDXwEaAVLHpP4oCWobvJWmENHwM
	WK3hnIlYkQWMrvsZl4KQDD08S3vul627cGhg2fMM5oVTzNhdyvqbdOPjLl4an17Rpb5dRtDgdC2Z0
	sX758K0+AvhdIlYEs2FsO8FSBuaCwOeDfjdwVbT4HJY9l7Bo01dE4O7uRT8u1Dr/x3IJJSUcSCwS0
	cHIvxW9tYf6QlZupkRPRhQonz7f/cT1td7WEFGN8aY3xd1N9LgM+MTel0qj/ut4Fi3y4eUbUAA7Fe
	dl+y0UfWkE05GTwtoieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWg9R-00BUae-K9; Tue, 22 Mar 2022 15:10:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWg9D-00BUVm-8J; Tue, 22 Mar 2022 15:10:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 724ED1F42FC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647961809;
 bh=AfZObamYsAzgBjwGBzLZ0dMwyLg8Ugk6+Wn+Vyfh5fY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ceo3dxSOv/deDhh5BPmr3PA2Tm03KXBlilTS+pYcFXk5wdjPCkC2cquG2U1uGelti
 A+EDtqQBJ3d3+QFRBdmpQvaxMR/JJ8V3Bt/9/POutBQxkVz9Vdcbyzaf0a0e8jRKYC
 t/bGUDtW9HpyU0KpvqvB8zwc18QhCY6eyMThMOBXuy0uNCxuUI0WhfNBI0ZkWTo/EF
 b5ANXVeGlmR5o5buMsLti2/E+LxnyOrMvb2onsbgNdaav0FxZVgI5VxjytyVIua6F2
 f2HqFLuEdXrP8QUT0RfmPhuqdgsBF6WB+GvO3zyuZt1iSFzfj605gSHW7OAxsOaSV/
 T4it3pd62qz1A==
Date: Tue, 22 Mar 2022 11:10:05 -0400
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
Subject: Re: [PATCH v4 11/22] arm64: dts: mt8192: Add efuse node
Message-ID: <20220322151005.vdds2i7qdi5mbcig@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-12-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-12-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_081011_453186_A4BAE41B 
X-CRM114-Status: GOOD (  13.81  )
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

On Fri, Mar 18, 2022 at 10:45:23PM +0800, Allen-KH Cheng wrote:
> Add efuse node for mt8192 SoC
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 75c21edccf85..6220d6962f58 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -937,6 +937,21 @@
>  			status =3D "disabled";
>  		};
>  =

> +		efuse: efuse@11c10000 {
> +			compatible =3D "mediatek,efuse";
> +			reg =3D <0 0x11c10000 0 0x1000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			lvts_e_data1: data1@1c0 {
> +				reg =3D <0x1c0 0x58>;
> +			};
> +
> +			svs_calibration: calib@580 {
> +				reg =3D <0x580 0x68>;
> +			};
> +		};
> +
>  		i2c3: i2c@11cb0000 {
>  			compatible =3D "mediatek,mt8192-i2c";
>  			reg =3D <0 0x11cb0000 0 0x1000>,
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
