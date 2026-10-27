Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C84606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2026 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WzsbxfV1;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HKgk+BPu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=; b=WzsbxfV1ZLWr8MemO3mCY6FxD/
	mpJnCGMYxXcXrMbPjGGWOK7U7VKrWTJL4Z9PnFv0NL95zOaEGz9VsXL1P77uCzmwBbvXOqRVjVSUn
	IOdi8P7pqRNcm4tj9l+UkMxpKoN9tdFafFcOVvv18WSEAmvWlkBndPYmZ2nhdqfv3lzGH/wyvm0On
	2KrW9NaHW13yG1wA7KDJWwvA8T8Kg7m0tUw1kbZuVXHspPL933rYVxwbY4Siv/ESClDtJjcHgrVbN
	0r72J/qI+bblW3+rrJeJxHGRxamXLcQmygtzA1Q8fiYN6b878a89rZKWmddDv6Ppo8IdVt2fT0lH4
	TPGrD83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdgv-00000004C1H-00N3;
	Tue, 27 Oct 2026 09:42:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdgq-00000004BzO-2Ejg
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Oct 2026 09:41:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso21057395e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2026 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793094115; x=1793698915; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
        b=HKgk+BPumeIy5w1i5x1hgeHbFo3eDjDl3v3pP4KXOEfeKEHqlngjHr/LynWF+BvNJ3
         ICNw9h342nXSPI1gPazIWvD5YD+WfzJtIRkRzxhfou/znErFqoV3yre3kFrIW1IMfdk9
         m6mfNbuGkJv/2AiVaeUeDXNHUYwPQyACtHxiONCeW7jYIS7qivh1nq1SUjmG2zAFGkA1
         5jdTmZppk1k4Q/XIQOSqzNcINXaEyEutyiuPeA65TMiWLKkSShPcG555kagEissjHnTf
         Dj9jHF0PPRLkuxtHZ9E6kWXVpEBcbn67urDZMZtksaF73FPsirC0+7dlb8A4GqeUTxY4
         KtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094115; x=1793698915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
        b=CjxFl6oCJcxzLedjzRTwRZuCRY6nGyLuOTOLHXKOX7xGumBmgmpos32hw74SfLMFa6
         I0UtFhBzhjOMx7ENzPKi5f9zlWaj1y/Q6PMIX7wSfSRIFSuL+X3739P7XwbykRwrM8Z4
         uA13iyBklJPe+NeAOWLaiSlZmKrAUBvnAfp1ehmANJ45FNZ9WAaEy9vIS2Sfz4qhsVhS
         m0flJZ0DOVfcewcw/p7SI7JHTObCIU38BsuMllArdvJuaLQdSQ6NbLKR5H2UHAU1bLPU
         Cfqq1wQR7Q0Dgify7T9TYYQpGTK8lm8aOxoETbDihhK/v7qEFUTXSo+AaoSy85bsBQdI
         w8qw==
X-Forwarded-Encrypted: i=1; AKwUvBzVYBAFEKD71elXebPh75jlQf9V1R6gB+ilk3jIfg3MOLFhiLqU26aC+jA5/HU+qWDZdjIcWQwgLVL43WWoEg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKv9gYLAdwrpNgdMww9guAJzogAB43xiWHr2jS2S1mcfjOy3vub
	vBGCqmVovzCD+8GYyTs5L8SJJloH7QABFH60SSHeuY+v+MPPbLNb7g7U/n+8noHs8cM=
X-Gm-Gg: AYBFou3Lq0GkrXHB13oqMjILKtLXRwAjs2nlD4bg4ekdu5gpKRGiMn9yvnvfOJb1yr8
	4N/IYvxR8Vsm6VBXABQE+oKYPBB9jO0sQ+9WcRZGsona5pbxcrZt61p7g4Kv6mpfix3es4bSoZZ
	e/6oyIYwStA1ftjbVmdOtqOnXKRwB3O1mFXyOt/4sxiY3sw+OdfJmp+3ga9zEuQ/jCbg+iXyNaj
	7frYIUVkp0wsX3+ZIXxW+r/D7rFuDFigp6uVZVEDBN3NMdzDShv4pzLHjXuFgDPAGQd9PVx4X5t
	G99J6txRJHgAXwVROivYQMA/+HiDlMeS9DcJN6UbQkk/stk4rSS7k7V0iNADcanIkx/Wpibe/9h
	h5PGpmHvjkQNtXUV8ztQxd6gf9rn+oGahpDZjpeDAfznDi4O1hqA8epLifGkMMLuCr5sta6SyQF
	mgCcorR8y7iw4cXQSEA8Ehud4aLU5N8/yl6q2dDJgLAZxIComSC4oWglDzfJCTnyhtQKgOSR1c/
	jOv64WbzAqpTnpsI7DrQNmrOLTrKDdwnBlu/aafAisJ42EXC5c4uan6w9zkEUUs2x8VdN192VDs
	1dVCHbs/UDN5PRZwY9TsTyPIZoreKxU+ejyGzJPNuPA=
X-Received: by 2002:a05:600c:8a08:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4a47a8dc93bmr110335135e9.9.1793094114509;
        Tue, 27 Oct 2026 02:41:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a59d998sm263939065e9.15.2026.10.27.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:41:53 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:41:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, 
	Viresh Kumar <vireshk@kernel.org>, virtualization@lists.linux.dev, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-aspeed@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Michael Buesch <m@bues.ch>, William Breathitt Gray <wbg@kernel.org>, 
	Robert Richter <rric@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 00/22] gpio: Improvements around device-id arrays
Message-ID: <auBxfVzkveb7KlEk@monoceros>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <at-CGVq5jVsMQief@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlk6jmpzfns64bdk"
Content-Disposition: inline
In-Reply-To: <at-CGVq5jVsMQief@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_024156_596546_069210E8 
X-CRM114-Status: GOOD (  11.65  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--qlk6jmpzfns64bdk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/22] gpio: Improvements around device-id arrays
MIME-Version: 1.0

Hello,

On Mon, Oct 26, 2026 at 11:38:49AM -0500, Frank Li wrote:
> On Mon, Oct 26, 2026 at 05:28:11PM +0100, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > [...]
> >  drivers/gpio/gpio-imx-scu.c         |  1 +
> > [...]
> >  drivers/gpio/gpio-mxc.c             |  2 +-
> >  drivers/gpio/gpio-mxs.c             |  4 ++--
>=20
> For all imx part:
>=20
> Acked-by: Frank Li <Frank.Li@nxp.com>

I'll apply this to all patches touching the three files left in my
quote.

Best regards
Uwe

--qlk6jmpzfns64bdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrgcd0ACgkQj4D7WH0S
/k4RSwf+IK0Zg4d+0uYc5szRXc18DV2GOQKuWytvc6Mb7rb8wBUlhLcCzHXfHJw5
GKyFFUIrW1GHu/p4aSlsaOLm8RjGYbgR1RTnxQySdf79td9IxG/EXqQcp6FcxSH5
30Ema9IFNIy1Z1fLQlqcQWR4FaujBuohFx12psbgjzkhMn3OY0x3w6FsZddRxBu6
hjb1B8M89jP2R7VcM2CC+KYKqlxNoQYiS/XOiE7oyKj9CqBRDIrGPNwKtLxUelaD
kKhTCJUSL4uTa26RZDC42xIr79ip8u0RW/+hzEwjtlicpsH0uFemsO1TO74xS/ol
PbKbBRoQJlRhoDMBJ7sTb6K4gJHPEA==
=KSfn
-----END PGP SIGNATURE-----

--qlk6jmpzfns64bdk--

