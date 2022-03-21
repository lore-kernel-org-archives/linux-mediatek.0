Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF6EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 22:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzNiBD+K59/keXWuWvtQ8fjaCrsJGL6djltbQP1xdAs=; b=SCGHNED4i9b/VL
	2X+js6P4WTjEJvWchL4ckAvlkG8xJt2wCG+thivqxo8fVWTrElqqljy5Lyf+SJgx98Dgueu2OmYMp
	1WZPn0Tt+v/xMhQwSbvfZDS1nqsK65n4yUkZplAyjMhBxputL4jR+2ZGMEEUyKPen4fimalE4VIV6
	Xxu+bF9tIrGsesG/0diBD+mipvTDjxohiWrQb7YhvasQW+/yl2GZG68/oqkTT311Hbk1DXVEFB7kG
	qZ1W4BJqeUls0EyvO6VMOYDaaJ6IQH9UqVmIXwquAXjhj8lrXrjTouVmw8MSLuttWywpalg0c+DLg
	DPrFvmnbbxdwtr1X4ZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWQPx-009E6f-4r; Mon, 21 Mar 2022 22:22:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWQPm-009E4s-7x; Mon, 21 Mar 2022 22:22:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 31F8B1F43C7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647901332;
 bh=zmphMdXTXzFGFa0RwIuHWJdT3xA7jKGE/mpq9uJmF1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VBJO/faZVdYkkZW7S6S1XBPPR6LKRRmTGoo2qAVAZN5qBGUXg/qfPG/sf5xVZxJVf
 zdXS7BcU4jnJ5wZus5dlf5vSgLisAgoRvKAgoBArhq5L7/Xwe5AdVO6tpHQFjfcngO
 nk0gCB7WdXH492QfW1beWbLGjFlwYNcXMkdXPlwykVa+PGWJWOgb7sV3pFnhriOmly
 aucxvkej8FdSPm20Pk/zcDm2Tm8wpTkJLTeMS6HgWYYRx223zXe/452MFBYt+yNb9y
 OilADcAb7fgrHVmGOerNagLpbdwMOV0FM3YAwOKAsPF2jIKMqWPVoQZGjpgs2qHw2d
 erX5bBrvddeiA==
Date: Mon, 21 Mar 2022 18:22:07 -0400
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
Subject: Re: [PATCH v4 05/22] arm64: dts: mt8192: Add usb-phy node
Message-ID: <20220321222207.ylfv2wznxayepjr5@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-6-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-6-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_152214_441929_F8C642C6 
X-CRM114-Status: GOOD (  13.56  )
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

On Fri, Mar 18, 2022 at 10:45:17PM +0800, Allen-KH Cheng wrote:
> Add xhci node for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 195d50894df4..28b93b76fe17 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -875,6 +875,28 @@
>  			#clock-cells =3D <1>;
>  		};
>  =

> +		u3phy0: t-phy@11e40000 {
> +			compatible =3D "mediatek,mt8192-tphy",
> +				     "mediatek,generic-tphy-v2";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges =3D <0x0 0x0 0x11e40000 0x1000>;
> +
> +			u2port0: usb-phy@0 {
> +				reg =3D <0x0 0x700>;
> +				clocks =3D <&clk26m>;
> +				clock-names =3D "ref";
> +				#phy-cells =3D <1>;
> +			};
> +
> +			u3port0: usb-phy@700 {
> +				reg =3D <0x700 0x900>;
> +				clocks =3D <&clk26m>;
> +				clock-names =3D "ref";
> +				#phy-cells =3D <1>;
> +			};
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
