Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6B9C001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jul 2023 07:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EMrmpU0dWa8Mwjz50d/l0emxjMG8G1dTCZtvgJ0j9Y=; b=mDo68YAmYec1Ie3bARNggzyT25
	oU9DL+8Ax4f0cpgaRua0qMTCSChHozXTj+I586F+iHWMjhkCRsQbCgeiIVEIlfEUvDDrp5A18ALpW
	aSfgAmCi7cr2/UBG0fc8YEue1St2OEEwTB1azh65fgAlmiTJ+bjt407hPQtiS5O/Rg/kCGAkA/xWQ
	6OnB+qpsRzjtSIbQ3Rj/eY/3gC28tbjyw/pw75H/6ycNq5G61M+0XRC0PzhJtYPkfbpuAwT88skFM
	SIILcMgI4q6WhBLYYTigS9WPNWNcriYJwmYX06acQ2iDvEjgUIUg+vEs6MSeC7NbeKN5e7/v/0thg
	ZwLLd2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIUt-003I6W-0A;
	Mon, 17 Jul 2023 07:18:19 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIUn-003I3W-0w;
	Mon, 17 Jul 2023 07:18:15 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51e566b1774so5364008a12.1;
        Mon, 17 Jul 2023 00:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689578289; x=1692170289;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EMrmpU0dWa8Mwjz50d/l0emxjMG8G1dTCZtvgJ0j9Y=;
        b=JKSa5/p5A0TvX+LWBpC9OCela2Bv81r6IfZJLvQc5r5llp1ubDmRhjgWU9+77sKlCX
         rMl6Xwia9PE4/yrZdZr2sg0Y6/f3/Ww4mcgz3Q5DuxKmnRx+q8socsImWHwjideALIpB
         Dp9MzBAQw2h8MiJpzKAOhxbRNXcuAhXWKuNsSbAb3vkt9EUXMCaW87I53CRW+SqZAXJ+
         4q1KvlsSyWt5juPuU5q8fc1wHAd9fZBZxnFaBpmltoC+O4ub/d1E6eY9YatD4ul7Sha5
         HnTUsVUG1MANjxewjksqD178Bfc90iEYuG+0e32Ok1AHqSl+z8WESwr23NfFPumy1vRt
         oGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578289; x=1692170289;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EMrmpU0dWa8Mwjz50d/l0emxjMG8G1dTCZtvgJ0j9Y=;
        b=iFPCP5K7JRbKzNYkEt4mqr8HXQYILHafb0wGmyK6oW4PnCKEVN0HoYF1hDma2t5Wfo
         BMpf0I+LQDJBL5K//ZwapHpK3MylmhHrm0VwTLw0kJD/8uCV+OROkQIG5GlZ+o1B5wqa
         hy9+8egEojBbNd8NsDg6ZQuQ+AkT2VKr9cL1X3w27zWAc95q7158nnOejTvwkidMD11S
         WgqGKxu3YsZ9JTlpXsdzOLUIfXgzutxJ5xbejaFtdjL0cKRJWwKe/w2Gh6+aMJgS0S16
         A+S49a7n4BVpfSzd6GyoHyEgvD2JnAPO5m2UVmbKRanu3HAhZNDn/Vz0Sa0vmv/Ee9Cb
         nyxw==
X-Gm-Message-State: ABy/qLaKXHGnsjvCqDJISrNHvlUTbAt7oOdYA2CwBc9wKHMyjPmP2Y7D
	3kpKpcoyjpYvbdxg8BMK6yU=
X-Google-Smtp-Source: APBJJlGnytOxsxnbz2kkKo9AqAcNbbvErgBRMa6XbXN7rJv/6UVj68JzoNxDlvkBS7Ex7WLynhtMKQ==
X-Received: by 2002:aa7:dd09:0:b0:521:7181:e8b7 with SMTP id i9-20020aa7dd09000000b005217181e8b7mr4484671edv.40.1689578288608;
        Mon, 17 Jul 2023 00:18:08 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t3-20020aa7d4c3000000b0051d87e72159sm9471778edr.13.2023.07.17.00.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 00:18:08 -0700 (PDT)
Date: Mon, 17 Jul 2023 09:18:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] firmware: Explicitly include correct DT includes
Message-ID: <ZLTrLq5Hp1sHckMJ@orome>
References: <20230714174438.4054854-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TiNl3sY2kGGAUSEk"
Content-Disposition: inline
In-Reply-To: <20230714174438.4054854-1-robh@kernel.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_001813_354041_8167E646 
X-CRM114-Status: GOOD (  14.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--TiNl3sY2kGGAUSEk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:44:37AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/firmware/arm_scmi/driver.c | 4 ++--
>  drivers/firmware/imx/imx-dsp.c     | 1 -
>  drivers/firmware/imx/imx-scu-irq.c | 1 +
>  drivers/firmware/imx/imx-scu.c     | 1 +
>  drivers/firmware/mtk-adsp-ipc.c    | 1 -
>  drivers/firmware/raspberrypi.c     | 1 +
>  drivers/firmware/scpi_pm_domain.c  | 3 ++-
>  drivers/firmware/stratix10-rsu.c   | 1 -
>  drivers/firmware/tegra/bpmp.c      | 3 +--
>  drivers/firmware/xilinx/zynqmp.c   | 1 +
>  10 files changed, 9 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--TiNl3sY2kGGAUSEk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS06y4ACgkQ3SOs138+
s6H3vxAAt+q3FQ+MBS2z+u74V8zvjMkyymL79TZvk56JPufzsPYsS6gvjgQeEJg8
R/slJzQCTxr3jPo3Z+wNWyfyEfE/1M58LbOBii5LVVxiQadLFmzqS/x9Zhy+LOVq
LI1xBxmIE7fiC98G8rS5E0F/N8PPUm2KiNOtAelj0xeiy3TkG+kdNeTDQlt+yuHx
tSTz992PllOwY2WSlYhXGwKJXZmibO5zmb6z1gWXYZZnzzIuyL2KeIuF0pRw/4Y9
HoWX10J/985/8uaeWWci4ucp87WAYX0Z1/DfLBVjVFXA7rDcw5To/JwvwR8JkgXo
2iF65qla1iOdqpq8KzWf485wdHISrWNwSiTLmhzeMNW3SagUNlsGtQCyCmDhIXD5
A2nj+9NUWQmVlhkEbEMcJug9GUNtluuFCyWz6F7ipkz+l6r0hxFAUVDlntgWDt7w
xRdCGvohvX3squFZ2NxeU0AX7NGxBRyEVlnmExUYjsdlYRrNFATYrV0Xyu1GKTjt
QcaBe5bhIx9anBIZCfbb2OjHXYguN9LGABN0CepVZEJQ+92CHsS9o5fAMasquHTg
BKnkPKO9/hwB+oY/kV6DgMCReLLL9Xl1CCKW1IktCempLLX+M7oTpXSR1Gt4Iolj
CUo463ao93rGLkBXs7nlXnzDf1iykUqesITmjzEcbV9NwI1AxFw=
=lAG5
-----END PGP SIGNATURE-----

--TiNl3sY2kGGAUSEk--

