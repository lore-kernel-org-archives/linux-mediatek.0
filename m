Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB527C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 23:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMNPxHKAvQqtIXC8eg7NSqH15Zn3H4kaQKc7/rDMmrs=; b=xJ/+t2zfABy7t7I42FAUWpDI/p
	g4mqxmayxAePpXDdj1anlxbX4BHpSR2YHVZsqeswClGt6x2LYq/2+i4ohGyJC+VRDtIqaUwOQiBVI
	LNOqmoPJNpKwBlisVCt6R51p6SoJWbzTQEihOav+bZCL+lo8LYucP64/zQkbJDI1GK4TL8WVNIk+Y
	zLHe5ceGP9Abb0Ew6sOKG5sMQZ9wll930rFfL3wHEQjz8Qj64XNDUHAXWx4GvITcO5KEvNraKik4X
	DeXcY3yJwAcvj9uOMwBfwFCm+E796XxCYgR9mwmqGghycM+dNlBKz7VQCdQL/bjC3qhRhT1HhvJzS
	5U16ajtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvSTI-000Kqy-75; Thu, 09 Dec 2021 23:05:04 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvST6-000Kni-4W
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 23:04:53 +0000
Received: by mail-pg1-x532.google.com with SMTP id f125so6492541pgc.0
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Dec 2021 15:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AM7QLMUWHfMwmQDV/nARvLu6AUqKl6gTrIizSq8pCV0=;
 b=qCUTYflpJD3Ut8S3L9vAdsRCFkfP6S1UK/pYIcT6QfgUqj3IrkrCT4ezn3jaOsf3Cl
 QWXXPUZs+WxnhUjOZmGD3MD+yMr1uQ4MPnml+A3U6sVIr1NuDQjnxAVWqlzhj2iKBJ3v
 UVZc3vL3u8GPqVzXjH8o2LZKH9265/3UW1CVYplUB1MgkH9c5ybvjJIKVXYJvrcLh394
 P90V/cOnkBv/iNu+Q/0tn+tcZb57JKYcdbPJW+sK8l4beDVlSxBGGYj3kX/T4AxOqfIl
 UB/2KhtFPncq+0yKdb9T39Tq3TJiyLrFSDV3H0HYU7qUuLOVeojoQvZgvAswjkqck/q8
 PFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AM7QLMUWHfMwmQDV/nARvLu6AUqKl6gTrIizSq8pCV0=;
 b=Uc7pPqWmOx+VjiHpeYzL5/uqkzrUvhSt1cINxP8TItkkPprpTbdreNN02j+sJYIm/P
 VtTXqT6xp4Z/8oJx7aHbQGYqk+9Ygr897jvXY6cK03Joa5Wgom3vvsqL8h7PgDWxosnv
 YFPOCIq1Ojx3ia4TiZa3OC3h81o5bTUzdOfkKzntVzCQOMJGP2ru7NUVPxvu5uOl/ZK4
 3Ot6kle6qfmqfimYMx0TdNjmRf5I/5Q6FJbVXnny7bP1UBT9JHa8OEX+IzpoFSgYeHV8
 QiUmSfCVbH0YwHHNXcp6y1FI2xOk1XB/edeFK4ju+dxMPk5pvDTAAFlVeyxRSj+eLoaM
 A3PA==
X-Gm-Message-State: AOAM533JAYMcopHjYGvGnMr15OXjajMMKsfKe0ZbFVjnLSFmlbmZmkPC
 BdCOVR4ZuvHxQxET+ffEWenM5w==
X-Google-Smtp-Source: ABdhPJwv3BwHdZiLi1ZhC5t+Cp5jkK/HRMF9Ysg4XP1dLe3XT0E5UCPyHw6UtZFq3qUMnwim2AuqFw==
X-Received: by 2002:a63:6dcc:: with SMTP id i195mr35590826pgc.90.1639091089661; 
 Thu, 09 Dec 2021 15:04:49 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4686:81c:7840:3f2a])
 by smtp.gmail.com with ESMTPSA id o1sm10610131pjs.30.2021.12.09.15.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 15:04:48 -0800 (PST)
Date: Thu, 9 Dec 2021 15:04:42 -0800
From: Benson Leung <bleung@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandru M Stan <amstan@chromium.org>, Benson Leung <bleung@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: mt8183: kukui: Add Type C node
Message-ID: <YbKLiic12TTlCI5K@google.com>
References: <20211209195112.366176-1-pmalani@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20211209195112.366176-1-pmalani@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_150452_209362_0DD64C18 
X-CRM114-Status: GOOD (  16.46  )
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
Content-Type: multipart/mixed; boundary="===============3452228064763494794=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3452228064763494794==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h0DgCffirGSPqlD0"
Content-Disposition: inline


--h0DgCffirGSPqlD0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 11:51:12AM -0800, Prashant Malani wrote:
> Add a node describing the USB Type C connector, in order to utilize the
> Chromium OS USB Type-C driver that enumerates Type-C ports and connected
> cables/peripherals and makes them visible to userspace.
>=20
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v2:
> - Alexandru mentioned that HW specs suggest preferred power role for
>   devices like kukui to be sink, so changed try-power-role to "sink".
>=20
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 94c13c459194..0f9480f91261 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -886,6 +886,20 @@ usbc_extcon: extcon0 {
>  		cbas {
>  			compatible =3D "google,cros-cbas";
>  		};
> +
> +		typec {
> +			compatible =3D "google,cros-ec-typec";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			usb_c0: connector@0 {
> +				compatible =3D "usb-c-connector";
> +				reg =3D <0>;
> +				power-role =3D "dual";
> +				data-role =3D "host";
> +				try-power-role =3D "sink";
> +			};
> +		};
>  	};
>  };
> =20
> --=20
> 2.34.1.173.g76aa8bc2d0-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--h0DgCffirGSPqlD0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYbKLigAKCRBzbaomhzOw
wgTfAP0UKw0CIZnkq7XRxizWU1ISWsbA7Fg4wi8F3FRlEtjalgD/RnGrQZDBRr7E
LnQC2+PGRByTSZwMCNTeptgTOh+8IAA=
=fRVO
-----END PGP SIGNATURE-----

--h0DgCffirGSPqlD0--


--===============3452228064763494794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3452228064763494794==--

