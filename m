Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09ECC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzxkcoZRRL9rOm88Cmu3gObIZ4ByC/bqi9jRPQofGU0=; b=21wQjZhsTS2uGaJIE4Gdr4XFvE
	t8AlRqRyyujT/dsEudr/f4b/jvnHMXEmi9DKdgMGBJ2MvlSQQZ9oLbxUSRq+c16jGYkmEq2zm/szf
	G5oi7vej1TEvCGdXxr1QFRVsBGByAWE8bWZcybpu3e/tdz4voWN/dw0AilLsj1ghwQPusBAVwKHiD
	IjbJ4gZWBG2scMMwaAzkS3EFunM7JrlId5MOxqKziEzExXf234OgMD2d9svwe6f71Gpc/weHEG23w
	Z6C2HD3kvvgSmy3ogYAfQN1Dkt15FvqxgClNdaMWe4krii7PJ9WjcI3HUR5dNvmjJvm1mRsFlxNQl
	DRwtwcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH77G-00CWjd-KF; Thu, 28 Jul 2022 17:16:06 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH774-00CV6o-W6; Thu, 28 Jul 2022 17:15:56 +0000
Received: by mail-ed1-x52c.google.com with SMTP id o13so3035473edc.0;
        Thu, 28 Jul 2022 10:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kzxkcoZRRL9rOm88Cmu3gObIZ4ByC/bqi9jRPQofGU0=;
        b=mA1g9jERDTuXB6CIUzwheMHBNODiEGENbo+7PFcbstZJMzV1SVB6J7wTVUXl3AWB8j
         ivmIr18bObn8snEts21XSsJ9/9kR/j5mXowkVHf+dMo9acZzMjym03+syxKTqz/m9Kb6
         nuLIwdQfnydSj5ucudwy/eJEPu+GcAdOuDLksXUSan3Qav96jOBpMSYMw43A0ImCHRMU
         3HW2rOt2CTjjJzWItKRjE0soDz1xjLrLhoearwoY6gA9s8yZXS/lbe1uLRnTZGMzmMSA
         JnV6ANCvFAAAEUxvOKxd5c5x4m8VDwCWLjkCoGElzxv6bqkkxTZkkHcvgaOTNpsmIlJf
         GRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kzxkcoZRRL9rOm88Cmu3gObIZ4ByC/bqi9jRPQofGU0=;
        b=vcssXLQ/8W0QMaI389bjHLouPRibWYaocDp/V0g4rpgynlmO+e7BgXcOeBjptuUzP9
         3If/EEXmzh99yQyHlduzEGh2XsiUE6lcadM/crcdC2vp6OxT7jiASZkPuY9DRqn85rFs
         f0+gsX902qDBHb2mvIHWXRe5uyy6t7iMVtkcm8imtgXKYhgM8puGizy5BElJ68X8pdYs
         Hw5J3aeyIpipl/ZyZbaT3zEX23YkOpuvd2mE+VK44DHMkdpFYx17Br3WTDCLvquclb0R
         XNsu5O6FsVTqOlqMnfJkxp/448fM5GL0IP3UHkUoNXXUuVeBZkn+3So+8i9HEc42WT0m
         0LUA==
X-Gm-Message-State: AJIora8bVumUb9bhMA6yFmQIccl5NWQlInvM9MSoU9Q4J+ULopCmJL3p
	NPMW/pmF7T+3yy3szxjC7ek=
X-Google-Smtp-Source: AGRyM1sDiTz75TlHkXcEShLFlmR6ExyZ/xiXbbavvqsS7gF2u/acs7y8LRP86s4jS3LpUpQ3R7qwlw==
X-Received: by 2002:a05:6402:1859:b0:43c:b0db:3f9a with SMTP id v25-20020a056402185900b0043cb0db3f9amr9142788edy.120.1659028552917;
        Thu, 28 Jul 2022 10:15:52 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id o5-20020a056402038500b0043cfb6af49asm924040edv.16.2022.07.28.10.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 10:15:51 -0700 (PDT)
Date: Thu, 28 Jul 2022 19:15:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Fabien Parent <fparent@baylibre.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek: add pwm binding for
 MT8195
Message-ID: <YuLERvcbXvsMDf2u@orome>
References: <20220531114544.144785-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="syglkuQTbgvVyS97"
Content-Disposition: inline
In-Reply-To: <20220531114544.144785-1-fparent@baylibre.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_101555_095125_85063FA0 
X-CRM114-Status: GOOD (  12.74  )
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


--syglkuQTbgvVyS97
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 01:45:43PM +0200, Fabien Parent wrote:
> MT8195's PWM IP is compatible with the MT8183 PWM IP.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--syglkuQTbgvVyS97
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLixEUACgkQ3SOs138+
s6Gkrw//QwT81sw2csc+jMi4Ltarg0gFGzww9HzroGs9JY38usGngwiffJ2quEQ3
A58xi/nlafncbOJr8tOxv6xJ+QOWo8GBrysXJ3bPczuSf5wMddhYVJo0DLldtNlH
rT3YUELO6B8EhEqJY3alkr6fybxYVefwHn5oXmtK3O37MnD9Yh+WiSGFfGAMTdpo
W17Ue84+WQYk/pVR7NIN/CsevP/PejYeJAooA1+VxtLRAIeP/pHPe4AsDRb0Uuri
A8pPKmxBk+pcnhsISZDHTwS9BzpYCqcroy9qm4dQPHkycol7fMu4yZWfsKdPNEod
SvMORne+ZQnM9HeKOeA+7n9V/8HxQ4u54L6/c72+Zk7O6afWMBxhw6qNQWDibsFZ
Q/h0zSZDpSbr1fZ9zr/fjyGNu7NFZj9+1RgZGRZdyBHVs3KZMD3ZsTZ0k4gWpjgu
W/kzbvbMoX3No93uSA0/S1c5fuor2udWQrhu3Fe81KkWEXGJfptCOgR6yrKu7TNl
M2hWpcr7/78ayDMxBOkzWCxmqKLb4vq/QwJvHoQcSFJPaWq9FYPdrm+8rIe4Ls5e
ZGZZjQF25lYwRkXk5I/ZjXujAlhCGjN/qP+ifCNiy9ceFyoP9DqG83rSYOy8+eE/
Jj5DNH72fa/gPBjfFH+2VHoLHPglJffUyj1RvI9IuByhT8jO7zI=
=Ok+p
-----END PGP SIGNATURE-----

--syglkuQTbgvVyS97--

