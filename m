Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04089606A32D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OsuMamn7;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NkQk4K3S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LOaUcszBeFc4BBZTn5mnxjNejVuuHalw0DHWazewRfk=; b=OsuMamn7KrH3JcsfH7yHaeVZO7
	bB7vMa4F+aqLi8cLr6LZ9EmITBzRB4Ct32MAaqT67zPuDF4gT+Hfzdj3eOYwhwkjKDg0wgKcu4myP
	ZjgwxA8+gt0mYCh/JXpZsSwLf7KUO6IQ6E3s/dgAPC/UGs2yCeDF/HzZ+QOQXA9ELa/OW1x9vkTmy
	aaHlmw9d9LpuDTAJwN8PVK286AxDXBSq9zsNVKqPyGaekVyvm8FxJFRme4MzPVgr/HwHDXdG2//z6
	g/T0O+Spx/RH4OHIzwQ6kbvcUz3FmU25yNjDGZEFq68V9ZzO/wGRVJuLjIXTgwgG83sYQNL54flpI
	bfSG13Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvIq-00000008ZBE-1rKu;
	Thu, 05 Nov 2026 11:06:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvIk-00000008Z6O-29yb
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 11:06:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-491971ac844so344632f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 03:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793876796; x=1794481596; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LOaUcszBeFc4BBZTn5mnxjNejVuuHalw0DHWazewRfk=;
        b=NkQk4K3S1bzjP6OL25vQxyft9i21ug9Kl+eyhwPG1NKzex/zh9RFSIC7V7TU7LiSDY
         wO6pWgG4GknEah+d9TSFs8irGAyAM3TDb6Ip/lvHFSwzbyk3oDClsXjc8LcT0k8WeYdr
         NSxsi+2bnImvNyc2dMzN9PQd9jXXlcrlOm8mzqOQfHEtne5h7M8tvIW6MLlwk6ROtUKE
         DUnCQzVkaDIoAQ2aCPWOttiDhdBBGo9d1cpkjRCBW/WJkSj9uNFyXxN+F/hcqJNdrZRY
         Pw9E24RqNY0l5oagrEb6WUJlPBSNbtQBdqgUN4c9Vd6FeucUqcU0PuskXY0oRAhLwI7R
         PpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876796; x=1794481596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOaUcszBeFc4BBZTn5mnxjNejVuuHalw0DHWazewRfk=;
        b=cZ4o66DkoLsQ5FA+chsdmFLZHaTCcce1TLW+Jl0y3fOFDGjWulH+zsgexYw71gkkb7
         HCwkk/0WTnheSkULUpB3y5yFJX3dgCi2Sti5qL5SFyNMFTjIG86R30Y23W/rLKllumN3
         aIX7JOMGTK6zBIxcH8kNo0VG2a9yj5vUtJZ0V4CRaNnlFvoGhzGgBFwP5J8oXjUoEdK1
         QuBmzX+84EDnlAxvaeYUrucVnE6jOkxgTKbFqoQx3yAnqbld6iWv9H21NvtEUl62t45N
         XBL5/ZpGVJwlDRdw/srX9JbPDI2GvrCzykz7h4ZPptW55SziI06NGmIG7W2B4VO6lhFi
         z99Q==
X-Forwarded-Encrypted: i=1; AKwUvBymQXKRhqW36e+X/6kF99LLdot+xJUPkbk0bM8RHweFvYwi4C1bkliv/NviKey/6zEimbcG+vgNdnOkqGT4cA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/kX8sHTvNZbzpuOT0Z952jEQNoaJ8R/6NLkrkRD6dydp0+pl/N
	e75b/w7scavq22SH4QymiZYsEHsOI6pwNCl8b3DeQ3tXlhmHRZMi01cqU84Me3pHpAU=
X-Gm-Gg: AYBFou3ab7RIoTqP8UUngS2wSCo3C2uz5s1u16Qj6/cjzTt7NsHH7xSzHd0VZz4hl9+
	D5Pw9rSOOcyd71O7Gq8NsHLHz6muMdC5DDPH71fh7NmHyiJnv61pd7twCyX1KQZw29r49SLMJMM
	pSMeDa1OdYTqL1kmtnyAwBTnrAJnDUnXjSSqsrL4NebKZAprOurqd7H09TOguIt3nLMx+f06+ER
	gySw0KUBvp4RIwy6tk4JphB5mQ+8dv5WAuDbls2ZEjP4+fIlelJKGJngZTxVFeXrnRiMFEmea+l
	p8kKxMsGjdPvlbF+NEwHm/c7QBT0277KmirCuflqbndePRDQ0p5Y7eUigtpvUsbLqZSOTkYGrgV
	ip4JqMcLctydIb1iRO2ttl8PwHS43b0Y64tQm62M8CWSkOESZn0C9PtiarvRVFM6YxeUuuHE6sO
	U26m35o6Bcs2PwXpPp1P5n0WN3iivFTb4qJT8uqACySnXSwNjtVjf2Qj7G8+ACXKXqvP7VtuBMq
	qJlf7nPzw10tqgROKPi95h3R0RZ0Ehi3U0pZ99mC/ZMy6J6S9qTPxfpSWoe6ybqU1glvSXrBu8N
	Lcy7LlPWPYOGLfuMrLExk5cS8GuMAYQdT5cT1OxoLRRcIWT5RXuIU/gJeM+NaB4PMkMMM7O5tiq
	xegEm7mPuKgZqGIwZ
X-Received: by 2002:a05:6000:40e0:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-48fbb86d828mr15698548f8f.11.1793876795617;
        Thu, 05 Nov 2026 03:06:35 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fece998absm10176189f8f.22.2026.11.05.03.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:06:34 -0800 (PST)
Date: Thu, 5 Nov 2026 12:06:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
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
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org, 
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
Subject: Re: [PATCH v4 00/23] gpio: Improvements around device-id arrays
Message-ID: <auxh9PxpJScFO3i2@monoceros>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
 <2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qsdpu7ny4ekdton4"
Content-Disposition: inline
In-Reply-To: <2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030638_595187_2BE7EBBD 
X-CRM114-Status: GOOD (  18.50  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--qsdpu7ny4ekdton4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 00/23] gpio: Improvements around device-id arrays
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 09:47:39AM +0100, Bartosz Golaszewski wrote:
> On Tue, Oct 27, 2026 at 11:48:37AM +0100, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> > Hello,
> >=20
> > the original motivation for this series are the patches that convert the
> > arrays to use named initializers, see
> > https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylib=
re.com/
> > for the idea behind it. Looking left and right a bit while implementing
> > that, the series grew a bit.
> >=20
>=20
> Hi Uwe!
>=20
> This no longer applies, can you rebase it on top of gpio/for-next and
> resend? I'll apply it right away before any additional conflicts.

Hmm:

	$ git fetch https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git=
 gpio/for-next
	From https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
	 * branch                      gpio/for-next -> FETCH_HEAD

	$ git checkout FETCH_HEAD
	HEAD is now at d66b6b86d5a6 gpio: 74x164: add support for 74lv164 shift re=
gister variant

	$ b4 am -3 2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe
	Looking up 2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe
	Analyzing 33 messages in the thread
	Looking for additional code-review trailers on lore.kernel.org
	Analyzing 99 code-review messages
	Checking attestation on all messages, may take a moment...
	---
	  =E2=9C=93 [PATCH v4 1/23] gpio: Remove __maybe_unused annotations from a=
cpi_device_id arrays
	    + Acked-by: Frank Li <Frank.Li@nxp.com> (=E2=9C=97 DKIM/nxp1.onmicroso=
ft.com)
	    + Acked-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com> (=
=E2=9C=93 DKIM/intel.com)
	  =E2=9C=93 [PATCH v4 2/23] gpio: fxl6408: Remove __maybe_unused annotatio=
ns from of_device_id array
	[...]
	 Link: https://patch.msgid.link/cover.1793097104.git.u.kleine-koenig@bayli=
bre.com
	       git checkout -b v4_20261027_u_kleine_koenig_baylibre_com 20a33c6b6c=
be7e4805dfb6cd68816937443aa148
	       git am -3 ./v4_20261027_u_kleine_koenig_gpio_improvements_around_de=
vice_id_arrays.mbx

	$ git am -3 ./v4_20261027_u_kleine_koenig_gpio_improvements_around_device_=
id_arrays.mbx
	Applying: gpio: Remove __maybe_unused annotations from acpi_device_id arra=
ys
	Applying: gpio: fxl6408: Remove __maybe_unused annotations from of_device_=
id array
	Applying: gpio: Drop unused assignment of acpi_device_id driver data
	...
	Applying: gpio: Unify style of pci_device_id arrays
	Applying: gpio: Unify style of various *_device_id arrays

	$ echo $?
	0

Maybe you just need to add `-3` to your workflow? ISTR this should be
the default for b4, but it seems if failed to mention the -3 in the git
am cmdline.

Should I still resend?

Best regards
Uwe

--qsdpu7ny4ekdton4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsYzcACgkQj4D7WH0S
/k6COAf+I352qHa+kMUOH9ETW9KNHC8dWhUfB6E/IB+8yoRbH4tQy5C0mLg76J11
sJdUuJGD2XjvAv2tgSWACC8Cq1A+CnMvgQXXDsLtC7JuQ0aQYwSFMTIEphdECYue
42itRdsMlxubgjyK4Ku9YeDItioMv2A2EX+InXlNcO6MoK9ty5ZgCfsCY3OyHGVT
OwfU948a3DowaasJORDv1w6dhDNg/sCysegJvjnBoz2vhmoeYeyxxNHTGIzcjxt/
CWYJqu4/QDxJQ9FDuS6d2VhmXYOGL2Dl/wntyyQZjatVXHe6I2wwFBNQoOWJvPaA
BRQb0uNoTqeBvO/Bc5+AYD34/xDKkg==
=tsLa
-----END PGP SIGNATURE-----

--qsdpu7ny4ekdton4--

