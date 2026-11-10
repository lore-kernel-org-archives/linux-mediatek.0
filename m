Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A067606A336
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 23:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MXwoTX3e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mHcGrFPS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=; b=MXwoTX3ecXR0VftII/NoznYbUe
	vjQEznqDx5P7fbROd+7sPbAILDQdA7s8U+lmdHfgpQAceX86gtS3EgzRd55XdQVsTXnmC5zOOrkHN
	2sY4vBuTeQGETG5CqRHxPR0Gfs5Aa2LhbiQTzIO7nZW+Hy9NlQA5sEZptpr2U1bbCcRSZ2sxLzyli
	g9hAsm5DHERmJTMw3NWMgylJ2uYfvYPhOEbpfukNOoqzDN0v9X9G/KddMzQERpaYLFVUCH0ozK3lV
	EXgJ2SeY7CKbNnq896v4ZLb5FZNlGOsCGc2mzTH1YlILkdEXTBHRgeWU893i6Leh+6gXDRPIYUE/0
	u1AJRZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuwf-00000005DRi-32IL;
	Tue, 10 Nov 2026 23:08:05 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuwb-00000005DQo-14V5
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 23:08:04 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8a594d313a3so1508266b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 15:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794352080; x=1794956880; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=;
        b=mHcGrFPSB3ePfuOzbSbR9HduXVGJg4HgErqgzU6sWC8xh63+YaNo69sK8izNUm1TbR
         D7jowuqp5z0Avt5PEkXeF3mU9V2eSJpzo9fQgXagFYD8GTbNlpLSj9Ny2zJSfLvz6lbU
         ucbs9m1hNohulOFMrSgYVOTClbvRqQqt9R9TTvKqdfz5UcWiJ6MtAym6mSYqoZFjpEoN
         JYYsikJhBxZRvdslDcwsJJlTt/twmsidcOritRLHUymbr1QIRp1caPFnMoNQC0IpfAT0
         l/ZZinYBJsukHHhUY2blVCsUQg9wT3rYYwbs8HaQdHm4Vr7pP2sF6Ih0nqEjm6y3ao8U
         GbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352080; x=1794956880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=;
        b=DUq96cvlO9IQMWA8y+w+UxV5/29Hcp6MmD/0KOaQag+Si97mdAbP1E64QHOC45pvNg
         59t70rvaw9jDZJjZUc5KIyEXxgfS+wfESxbmLaPwRNV0VUZV9NogY3NbDCriqt7Nhrxe
         gBjZfaiEwf6T3ciBl2UXM22KpAvyBfrLEY9SVrTIAgNRaYEW89htYuDPCdcif2Xyx+pq
         6Vnz9jY8BEFTqGvCkZwjgWbV7EdUlMjm8USs+gYoiBNWRQMtoBMZNGAhypmdk7oAbGf7
         AJ4+Tsmn7Dpf58eSOmJZDuMf868H2C+p2qI5A6Kdprcw10F2KgiSrnkz8Jno0FSi+ZWH
         zDBA==
X-Forwarded-Encrypted: i=1; AL+hErF+saQ4xAuFfrKB5SkCBqn1oTpPhkwRGfEeVjzg4htpdXMmhn0iE3SxQ34UxEvbtF8oDtWXsHP1oIJ6vvJjlQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9BaGkoIO/bbX7H4luYV1KxhJ0jA+roUqyVscf6eD7yXvVecEbS
	At/f3TrT39j349MJdoHxq1Pih9Kw4bM1fye9vddMQvQRHM/jl83grXC5oqwtya0b2Q==
X-Gm-Gg: AYBFou2XXyhzK7ipIMrleE/AzbacXVdS/2evwOeez8fJW+uFqFKKhIIPBFK0e78eZQC
	C0R6fyenzc2UOxzXCxLgHiazf67NUxmklaccFBOi+G5mnHLLwnAkCQp2ZMcURBRFI4dnN4Crn7n
	PUaKk4h44hUSBKKTsDThaxBqki8qKl9ESmV3rVttLaysYCMIguvQdN30oxcoGZ+kZExk2FSWUr9
	rAtHHU3SSuE2jmhfhAssrDBZfTCWSDcuEw/DDVvNgzXWlYZuxDVV14uzlqCfi99sr6Y/PPygywE
	QSz46H0zXK5Qu4mlN97eneQJ4Nb5lC5rzhCyn3/imnR9fzABYyUpTAyTxYwDwiMPaZdBQI1gLwR
	j81zUKNSigYpgB0oNZDxjVat8WPTWCFLP8InV1SwSJyM7RpvcySVO0aB+qyND9qDYiUedCF0AvZ
	cCob2mVSLgLOVyH83vJeQVTwdDtg68QHQv6caGPgSYDSqdAP+YA5BEEfKfiUJSYo/TW8pacvXGc
	jho2IfBOHe+pySpPESqUq2xl4pcby7TyID6HtGDMZ1B+sRDFM0HxruWl6pGdU+YA5g24knwXQxB
	DNw/fKxKHa9TNggx0f3XHtkNJO/gGJiCjDZVAyhk3X3hT04uqCY3Zu2NZJoZLrpctk2Hc5nh76Q
	DcfK3yehO6JmOCofjIWLuBV6xP+JHyVnqhqaumN3vL4oOMgRFRCEqBLsuJlwjYbcSfeV10ecjq5
	59BmLv0YCEBETPiA==
X-Received: by 2002:a05:6a00:2290:b0:891:3e34:e06f with SMTP id d2e1a72fcca58-8bc1c2a9279mr528151b3a.44.1794352079387;
        Tue, 10 Nov 2026 15:07:59 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa506bca4sm1426781b3a.0.2026.11.10.15.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:07:58 -0800 (PST)
Date: Tue, 10 Nov 2026 23:07:55 +0000
From: Benson Leung <bleung@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 15/20] mfd: Use named initializers for
 platform_device_id array
Message-ID: <avOjy_fN7YtF3qfm@google.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="19MCwox2Lta4/77f"
Content-Disposition: inline
In-Reply-To: <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_150802_938372_8D96AC0B 
X-CRM114-Status: GOOD (  23.60  )
X-Spam-Score: -8.4 (--------)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--19MCwox2Lta4/77f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:54:40PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> platform_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Also drop a tailing comma after a list terminator to match the common
> style for these device-id arrays.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/mfd/ab8500-core.c | 8 ++++----
>  drivers/mfd/cros_ec_dev.c | 2 +-
>  drivers/mfd/mt6397-core.c | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> index d5602b2f4a0e..8638fc8472f7 100644
> --- a/drivers/mfd/ab8500-core.c
> +++ b/drivers/mfd/ab8500-core.c
> @@ -1252,10 +1252,10 @@ static int ab8500_probe(struct platform_device *p=
dev)
>  }
> =20
>  static const struct platform_device_id ab8500_id[] =3D {
> -	{ "ab8500-core", AB8500_VERSION_AB8500 },
> -	{ "ab8505-core", AB8500_VERSION_AB8505 },
> -	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
> -	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
> +	{ .name =3D "ab8500-core", .driver_data =3D AB8500_VERSION_AB8500 },
> +	{ .name =3D "ab8505-core", .driver_data =3D AB8500_VERSION_AB8505 },
> +	{ .name =3D "ab9540-i2c", .driver_data =3D AB8500_VERSION_AB9540 },
> +	{ .name =3D "ab8540-i2c", .driver_data =3D AB8500_VERSION_AB8540 },
>  	{ }
>  };
> =20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 96aac158fd8b..3c7e7f1efd0f 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct platform_device_id cros_ec_id[] =3D {
> -	{ DRV_NAME },
> +	{ .name =3D DRV_NAME },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_id);
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index e74936ac206f..385121867da5 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -435,8 +435,8 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
> =20
>  static const struct platform_device_id mt6397_id[] =3D {
> -	{ "mt6397" },
> -	{ },
> +	{ .name =3D "mt6397" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, mt6397_id);
> =20
> --=20
> 2.56.0.rc1
>=20

--19MCwox2Lta4/77f
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCavOjygAKCRBzbaomhzOw
wvFsAQC87smEjajHkfFGbCeGY6Cj/9mvC0xw3nuIrtpr77YwHgEA6ablXqCzLa70
BlcM4GE7l2ZF2r9VzxPGW7WUD7O+TgI=
=nN+Y
-----END PGP SIGNATURE-----

--19MCwox2Lta4/77f--

