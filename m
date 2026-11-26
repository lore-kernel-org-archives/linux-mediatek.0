Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065D0606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GQEZxl5X;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dMVxqZkF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=; b=GQEZxl5XQw2WEKXiKKs81XrJj4
	16+myiXcwUQFlusr5hKvoCFLyQPLJIM59DgHmnuE9rkLfNjthx3h9tWKXKnqNTbvIs+xEn/mGSPP2
	Juq3UtW8zScJRxti3QeMjXcmkqXV7a/GeV3tKDDbDiy3R+EPjCR7yQbhWsfUUGmYmKcfQttNqws8F
	L0C2kCPjQDL6RiA9pdGXwj898w2+5KhnUr3RLF59YMrqXm80aU4yOp92i4lbnNM4Y+nunYHZho2//
	R7QpG7BjvRyXiskk5vgzgryyVLo9pTXHRKY/CD50/zcFvtrzdkHO+7kKzQMJMLg1qGewlPhQwXxqo
	ZlCp+G9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZrW-0000000DRCm-21D4;
	Thu, 26 Nov 2026 13:50:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZrR-0000000DR9i-3R1K
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 13:50:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4a42b34e930so6164827f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 05:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795701004; x=1796305804; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=;
        b=dMVxqZkF8lOvwq1UG3FdrLqGBEO6VIIjbe7GDktjB9SCMwGUiDTCpGWreUEEMWtYiy
         M/pzEGYa55LQISKew4Q4+xS4h7AVXPGCCo3/QT2FKJQZ1OpXjorjzlNTA301So8DShrk
         rWBO8mvkXbzVVpxVVOKkNbRHqg8HHSZzp8l8WUKC4B2Fcy5PIsdBvNhv3WlAJWfDvSA3
         uXmeZoudMi7HBCV5+9TFMstCrKB+41XQ4ugfm87TlcuWRDr9HVuJEs30U+n7gy4IMRFj
         6NgtVR5wSf79OAdmKyPn2xHwIK7GSkc8NgOOukoAr2WqS0ynSGvOMbDA4aK4cqa+ac/n
         HFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701004; x=1796305804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=;
        b=A58uUnq/YZKVUnAZj3Pogwa0V11WZ366zKRadvtX1cvF3ACvVAIkbBDFtUZKhkd4pN
         kJiZg6d5QWn95cMg4O0+fbjHHgD0V5NVlw4yyrLY9U0NWE7aaXrxRXW8r7TtSgFS29SP
         fodMtnBfq6yppPJSCLEkMfjBSPqdsQhfDZq+0KN6rt8CDiFCiseyBoETk/SHyH7ufM0V
         t86ob0wHAfJUpHS43yyepesX3hJyTuk67ws8lZMGCtAn0GZXmEUNwDynq4UQBT7k8PCY
         QjnQBRMVDcMliAAx2c4rtvjg6OJ+peDQ4BC1kUZ313N/f/XguqKxgtiKcAVH6GEJHOAS
         mYIw==
X-Forwarded-Encrypted: i=1; AL+hErH0rV1Emol0dzKA/wHd7kc8gxGKiYe7LKvTyq51xQ4nCHCxizaDhETZojTnsTA1AGzgc3Ufo31KstmZRH8ABQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9kP1R9hPomN4YZgiBxjr8dyLKYwm5sCOO56uEbx3xO7XyrN6Oo
	U44ebPdVzZ2x8inAR3BTtJebHftklkhieuhKLW1dbEGW4NSN+4fOJ9iRdgrlkAzVHu0=
X-Gm-Gg: AZFdTZeJKPjiGg4XrR0hcoM4cogqIEgYztz9Nqw7uSHSibEeGkZwhIGp4qxvzokkStO
	ZFFhhuBAzkg82ivdPV29uyj0QsHZEx//D+LZaQMB7z6i/x/EfDE+x/kJLHxLw3Jw3J2CDy05VRX
	fDYd2fKDSVadYe3xzaqhKyjjU/GAOfKx8d5nzIJIHtJ/Ug0m9E3dnT6BOdQWd5Za5MysW6EnEbO
	VStSm87TU7yFfb3Lrq6e1Gk19QX7wC0WYBAGC4I8bjDy9eg/lKmbglui9u+P8pH6Z0EYCXAILji
	l8hLAaWmQCOyIaViZ4w5JLsqX8AnKmJZzFfM46pIZmk/o5ersmJ/igwUkgXadXOFc23kSoki65g
	pVugYMb/cxPbc3ku+J274g7Z5ZJAjMTuxhQMQ82ED8DpjAWQVIJ11UOV/vhLadygeMxIylZut5E
	lBgIaM/sy/4X1EjGoz+SKIOnc2sZbCpH99dCbgLWu3ziA7kuJcBdALIM7CwsP92NhTdCPIhaBHR
	8J+R8zkKs/c5iaEXEh4ts+kxfd79e2lgrM9Sg0dKT7vl9RgutAJwgIzFhlo52ZZcnAzY4bXYJMK
	viUmXZUcqwxBc8eWSmHzgWg0dkWHAVPZxJUTLYVQJL174TdSSvrWPyL9hyQ55Vsf0ICwlQv2ewK
	YAe6BXLgYg06hFRklIlZR2TmLQEikZcfqmh7c
X-Received: by 2002:a05:6000:4b17:b0:48e:f47:273c with SMTP id ffacd0b85a97d-4abaac57a40mr41489070f8f.8.1795701003612;
        Thu, 26 Nov 2026 05:50:03 -0800 (PST)
Received: from localhost (p200300f65f19a904aae808b8a2e91502.dip0.t-ipconnect.de. [2003:f6:5f19:a904:aae8:8b8:a2e9:1502])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm40247966f8f.32.2026.11.26.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:50:02 -0800 (PST)
Date: Thu, 26 Nov 2026 14:50:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Joern Engel <joern@lazybastard.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Michal Simek <michal.simek@amd.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Brian Norris <computersforpeace@gmail.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
Message-ID: <awg4ubbFu0FksThB@monoceros>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros>
 <87v75jyiw2.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fjhsfzw7maxs7oq6"
Content-Disposition: inline
In-Reply-To: <87v75jyiw2.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_055005_886033_DDFD1A07 
X-CRM114-Status: GOOD (  13.90  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--fjhsfzw7maxs7oq6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
MIME-Version: 1.0

Hey Miquel,

On Thu, Nov 26, 2026 at 11:41:33AM +0100, Miquel Raynal wrote:
> >> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> >
> > Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> >
> > with or without addressing the nitpick I had for one of the patches.
>=20
> Let me know what you intend to do.

Your mail was sent To: me, but that was directed to Pawel, right? (FTR:
I intend to do nothing here ;-)

Best regards
Uwe

--fjhsfzw7maxs7oq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsIOQcACgkQj4D7WH0S
/k7VGwf+JohDT6rUS7ETNio1M8Z7P9mW/dw41gur3gOUE8OBNxOfsasQ0n/riOvo
4sT4fsGJWgm+ezHKcYcrXNknVg5Hmfpk4HeA47K1y+P9G6LhwsBLtqRGMM/7dCMd
nWmBVR77ExMyThLv6M2Li7HrkLHKSnuq7/HXqOD93OrqD6YYrrRBvTsBklbEdhWB
wm40UJgQd+3R2Lwq+CSDVUYqVGj8LP+XGj2vNoHXEfGlk93ZED7JguilGU62561G
N5qNDGfQC+CzqYC7tQ2tj0TNnOK6kYXrK6jxThQovh4ubLadqtHT7mVLa3qbS36h
iO7uFgMsn6ww6nNgTXKWH62VZzkJPg==
=6HjX
-----END PGP SIGNATURE-----

--fjhsfzw7maxs7oq6--

