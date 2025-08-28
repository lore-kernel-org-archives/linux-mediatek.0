Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDCCC8303F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3VuByd6TpXp1woUbPf4Xz104wlSdpf9S97PbQir7pU=; b=kaCOo2br5B60EKlvgJYZlZN2Vr
	Clf5qbWrvl+oeE6FsVGrKyXxNsju0RbBohH2RJJ7kL2tteRJ5jAGabnY7a+tDXz9n/1MNu2LJYeab
	SGkFUk41ZwUrmBvKku9Bn60wDqWxeHsFgY4jFfPOxuW0aT/LH579cY9mSoAFpugFq+uthCLlUyf0W
	UsFrlJviu5c9aM+Td8FZF/dHpLX3g/vE+/3gF7pyfn3eZsflhrRDxd3qrZlg1skTw+J0d7Emoir1W
	B8Rj8xOBY/Y7auCdCPVye4jKj5CCc5YgYoe6ibrg8jnwho4f4Eil2YAj6GzmubUSwltLCp/Iylnnu
	xX3SFH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWR-00000002oKM-0C6c;
	Thu, 28 Aug 2025 18:38:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urd94-00000001oCa-16Ig;
	Thu, 28 Aug 2025 13:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 532DE40A4A;
	Thu, 28 Aug 2025 13:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8348AC4CEEB;
	Thu, 28 Aug 2025 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756389509;
	bh=iz346w1pfi50rQscMVqR3cBscGG9b/CJpfDF1KlI9pQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WrfsVLpIbrUkGgAu+200k/PsHzJAQOdhV7UtqX4U+r7efW+IZ3Lnx2YIzXWD3ehCr
	 FShLiemmKjyveYW7Y/Sn1aIqQcsHOx7hDhRUOu0yih3CJv+K7HiSt/xKdvRpLAxBK7
	 uNiOwHMzb3OmXsJPNOhSRmiKonF3mXegdbFfPK2XTyGjwDdsc7uxL7mtSZJj8gMwgf
	 ru2WWG4VEML2FiOwAISMO7D0Asg4S5Lfbd+5Mv+WUnOUKCg5D9d1TtIOlGGBDWkvKj
	 PHobj0Z/9HWALPe1v3/XjzRpAl3KnDm7V0af1GHnhlPvABhPasAswK4de7YkxXCluB
	 bnGI9WAIBQVYQ==
Date: Thu, 28 Aug 2025 15:58:25 +0200
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
Message-ID: <aLBggd4rGHV_5zQ7@finisterre.sirena.org.uk>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
 <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
 <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk>
 <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
 <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk>
 <CAMRc=Mdd3fmKjFAfbUB-AAhx-5_CR+c7f36pePkF1k_2LDoORw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pdNHFBtb1jUgefWr"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdd3fmKjFAfbUB-AAhx-5_CR+c7f36pePkF1k_2LDoORw@mail.gmail.com>
X-Cookie: Filmed before a live audience.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_065830_347349_CFFAE919 
X-CRM114-Status: GOOD (  15.99  )
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


--pdNHFBtb1jUgefWr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 03:36:43PM +0200, Bartosz Golaszewski wrote:
> On Thu, Aug 28, 2025 at 10:51=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:

> > It's failing prior to putting any output on the console.  I was also
> > seeing an issue on i.MX6 so it might be all i.MX boards, same issue:

> >    https://lava.sirena.org.uk/scheduler/job/1697667

> > so it's possibly all the i.MX platforms failing.

> Not even with earlycon? That's weird. There are no smatch warnings on
> this patch and I can't see anything obviously wrong upon visual
> inspection. I fixed all other issues but this one I can't test. :(

This looks like it has something:

   https://lava.sirena.org.uk/scheduler/job/1747304

--pdNHFBtb1jUgefWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiwYHoACgkQJNaLcl1U
h9BglAf/Y29OWtMPmosc5BXwhhJ/DB1eMOx6Pwt45/ZIIP3KfZVtcP8ChTwYJTVE
u2ABb09S26V06eZAT7LKYhtQG4rTpgpT1XsEFPRjINGsorTtjmkb2mzyjol9redt
4hX8VqvBozyttsvveKI5gz99QgrRzWP4qG9el23QmBXNPHXepE3zj7DQSLv/N4js
iYFSgrRlkcyUCfoQDicck2S46lGl+7Beb4HcbRWieaQf381fgBqewrDFc6Kjd4Dd
ZCuh/UCjOU4bfLFrD+7777yJnSa5QysD5PyWqvByJ3vcoCQ1dwjDDIvbFevoe8yD
Xy0drJVTnqFyVOPssrxiz7IHh1kaHA==
=VMqo
-----END PGP SIGNATURE-----

--pdNHFBtb1jUgefWr--

