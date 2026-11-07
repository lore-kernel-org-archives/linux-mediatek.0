Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C98606A32C
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 22:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pleOHVMx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lr6VX3aI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xFgpOeXIhWE4x1O0Mu4ZGy/Nw4WbClkm6HsJcdNwT+A=; b=pleOHVMx9J6IWNdBKz5vre6aNH
	IysFcsc/pL/xUbwAUXIRQFta7M2ajCJ7KT+sFO9MeBJte324NeTBoxu97TXmwoI0GmtcNfRU+IB5h
	Yqt9zy2gKozSsBi3glyTUYZNrIvsbdfKcPVLuoTN9KQcGnMzgxF8y/kB63/OCZ0q2bv3p9PFTbuwV
	ivS1Q/QCpi6hn8/rDy6bQppP7Lb8wx2fjbguKBF3wmoaawpv1PF18+u98aRAKBklAaOW1p9iBzZSI
	ylqnY3tOOdv/4o2jCEUxZ45i1iQLclVXFy6AlOIXKfWLUoMJ6SQQ6TUeu82P8is1BSxlNLq3VZIBi
	At60SvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPp7F-0000000FTkC-3qby;
	Sat, 07 Nov 2026 22:42:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPp7E-0000000FTjw-29KT;
	Sat, 07 Nov 2026 22:42:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2131A61213;
	Sat,  7 Nov 2026 22:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0904A1F0089F;
	Sat,  7 Nov 2026 22:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794091345;
	bh=xFgpOeXIhWE4x1O0Mu4ZGy/Nw4WbClkm6HsJcdNwT+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lr6VX3aIKAkiZddAWqS8pV015LkPa8GXTxKUW7KAqMyOsjAauvuuoEijtfedO0dxi
	 /G+QtmVoCH4tXfKy05k7PClFBhNKZgskEWrsrp5rlF9GMHEHsvVPKdCARiLcnzkloh
	 ve7ys7z9J/3x9bHJluwP2bkqgFwSRsVIa5DBitC4IKl9fVb8B618op80Ka/POHwpqG
	 6GCUsOdhl3sxt4sUzrylP1o5xzKVeMyFWCIQQhCwKsSHqO4GcOAZtuoXSA+XcsmYTt
	 gY/vBVFy4Ri7SqLPXXDtZrEd/PaiqdO4gbhPIR1jSzLJdgjcqeegkdUiiqk5Lt7mnT
	 Y2pTNJbks5bbA==
Date: Sat, 7 Nov 2026 16:42:19 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Use DP AltMode defines
Message-ID: <au-pMBoYrUn89Zhy@zenbook>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 17, 2026 at 09:59:33PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++--
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts  | 9 +++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index d6af679abe1a..d21b94e872ce 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1508,8 +1508,12 @@ PDO_FIXED_USB_COMM |
>  
>  		altmodes {
>  			displayport {
> -				svid = /bits/ 16 <0xff01>;
> -				vdo = <0x00001c46>;
> +				svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
> +				vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> +					      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +					      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +					      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +					      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
>  			};
>  		};
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> index cdced5c848d3..3d83dd305954 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> @@ -581,8 +581,13 @@ PDO_FIXED_USB_COMM |
>  
>  		altmodes {
>  			displayport {
> -				svid = /bits/ 16 <0xff01>;
> -				vdo = <0x00001c46>;
> +				svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
> +				vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> +					      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +					      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +					      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +					      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
> +
>  			};
>  		};
>  
> 
> -- 
> 2.53.0
> 

