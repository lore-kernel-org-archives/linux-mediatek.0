Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C668AEB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 15:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iInWzg4Aa37bAKJaNWT3bREiveHBzs5+RriIq+gc+lc=; b=iwAUZtUo0F7+zJe6ePoq8tC6PS
	LwGjLAQCHiYSF8d6Z6qqSfxtJt0xCv0kn2s2vKkH3KrncrPE5ieUzqn3cGdRQ47UD/mimRNWFa6jY
	U3e55pOXhT0BUD1uKQEKJJutbDD5CsXxRO2y/jTJxsiq4TJSFK16k2/JqvMvgcZl+1pDbTCyTETWE
	1dkZVDcL5qdvhMDeFHFlfiY7OwTOZUv7xmeSYXYKAoIpCMG5RjkjylmEqcvdLT+rpB5sl6uD/TUs3
	3Y29akgCcyiyPGZS1bgi0B5V9BniPndWYr8w0kj19wH5F8sCWvyuyb2gVhi9S91689IehKw1e4gge
	4cIEx/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrqT-00EPKS-1t;
	Fri, 21 Jul 2023 15:15:05 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrqP-00EPG0-27;
	Fri, 21 Jul 2023 15:15:03 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fdd7d09576so3330108e87.0;
        Fri, 21 Jul 2023 08:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689952489; x=1690557289;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iInWzg4Aa37bAKJaNWT3bREiveHBzs5+RriIq+gc+lc=;
        b=Qc9w+qM2LK7YpY+WDNtPCnIK3VFn/Icb98FXoofzbjUF6GhqHu40VZ/zJ4RmZzjJ24
         SdvCZ7Ig2a+VgOy5tHK5Ms8MndvOacEiSZOqwK2ybvMPHfA5cssapzYFNcqFzKaEucF8
         d+QfSsmnL0r3DlflL6qmQxouoRkvbDI5pQxkdqbRMzsreDGXb+FpYT2T3IuUMwLhOcE2
         /d87AUfmYcw37MsVvV8r4OJm8Y2NCsfIIvY02h7BThXnSCLVb5Qfz/fE2vRdB79JErNb
         zNTncv5nJe/c/b4LbKdbxeriFOXsxanzzm7qoXAL4qVEqbZ13lJ3m3zDpF2EEZ/FIFGT
         WPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952489; x=1690557289;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iInWzg4Aa37bAKJaNWT3bREiveHBzs5+RriIq+gc+lc=;
        b=a+q3zVqRAKX3p18znRG4PAkbK3rLg6RdAKq4aTpyFrC1dHLN40x+xuWqa58WLZ+M7j
         dKSuEyT+VdxwiaUiGQoCuuD9iA7SXAIAo8F29LEoLwenbDAmCXMHF+EU+d1xh33QEbWR
         Ogpu+FcsKC5XkYKBXz7ySjF4nQhTELSbCY4k34XK6UbSmM+SaN8Go5lh6kKAHTa7yKFi
         tdpnFYQQVGyfKAAl3Usts1GSVHzsxWNj2I7TktSFruWGUdj0mulMIkYfAmQDJ4BeCv1/
         fZt54Ebjq0UKz4Cju2bSuuI3XpEdhHqS2tF0881HoDMaxsOvIV+9NTaMG4bOMIXeMYSP
         VFTg==
X-Gm-Message-State: ABy/qLZAJuhXjmsIGGlhEZJuiukWwMHf5wi883FBs38cC2eSa4tLmRCY
	UdaJjMNVHAbjwLIj1YzBqO8=
X-Google-Smtp-Source: APBJJlGh0FZwd4kB6nvlAofXkj84MuWqZA0k4+R+PRVca34RmuYNsFTmOB/feQJ1iNWdY1WWAR5r9w==
X-Received: by 2002:a05:6512:3154:b0:4fb:8fe3:9266 with SMTP id s20-20020a056512315400b004fb8fe39266mr1371631lfi.0.1689952489300;
        Fri, 21 Jul 2023 08:14:49 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d2-20020a50fb02000000b0051e28d315a2sm2240569edq.78.2023.07.21.08.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:14:48 -0700 (PDT)
Date: Fri, 21 Jul 2023 17:14:46 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
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
Message-ID: <ZLqg5g5cmx8gX9E1@orome>
References: <20230714174438.4054854-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pZkSdwRWU+4W2YBg"
Content-Disposition: inline
In-Reply-To: <20230714174438.4054854-1-robh@kernel.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_081501_696962_AEA74BC4 
X-CRM114-Status: GOOD (  15.46  )
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


--pZkSdwRWU+4W2YBg
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

Not sure about the other maintainers, but I usually pick up
firmware/tegra patches up through the Tegra tree and then they
ultimately go through ARM SoC.

Arnd, Olof, does it make sense for you guys to pick this up directly?

Thierry

--pZkSdwRWU+4W2YBg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS6oOYACgkQ3SOs138+
s6G8XRAArwU2xjyoHeBc/G3KsTP4njY3K49dPk0+F+Cvpdb0ZrZHV0g7+S8cvJTA
J0ludetXwP0bhB0TYIoTEzMbJUIk9n7Lz4Y8LKWfKPNxQCp/IxRyac2O/gUaLFLL
8mUdi+yudTE9C7ur0utsrLqYr0XFlVf7MesTILteNiuSwynfaMR9Lf0eWO4iHHwO
dZiqJ8BJafMh9RYS+A1phmVMSg3S8fj9XGP0L/c7UhrH/7eY1qKJKfzbB1eUUDHV
Mb5Yhz909tafjnmxMB32ZgbjfGKczKwJh7aoQqZHeVWkwk3BG7UlhM7WAchsdHNN
NFQwXOBI42fmLQY7TeUN8TIds23X9LcxVH42iyze2xU/Vh/ypqu/6+OTsDSxnGMJ
Pbv7dEYG961lscfL2hUiKi9/2hnJQc8oBtfyQ68GKei4Ahmi7EAm5b16pi0GvEm0
YzCOghyrBkts+jPKPbhw4puYMlXa8S77h3tCM9j5S0i78TS6TSv4KeGjsD0ZJQeJ
qR9enoY89rtP7LPZ8zrORanG1HX3zqBGubiBy+5Ta41cZCNGRu0HUYQPl6tHHDrm
ziwX7+oCzr5BIoJZzLehl1Cs12QRTwoSzDC4M/BC3hWibyq7gi3wI1vLLr7uZkbo
coe6QabcbFkT9/+Ssaz2n0J983DpnISyMeaUp27ADlhEZ0+aYm4=
=hMKr
-----END PGP SIGNATURE-----

--pZkSdwRWU+4W2YBg--

