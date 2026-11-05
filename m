Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F72606A31B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZpQ+gxOL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvVbVPQc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YNB1Wit5xYUO191VIQdW8ACPoY/mVp3oInWQ1K0PfQA=; b=ZpQ+gxOLc8wKbWdpdZHQtqVxed
	9V7vgIL5TjQsgmRGis5+g0q/HWVXCh1QMwm+VkkOUn/oUIFiWref46AZ/d6bzNN6AXViEAi+s7SFj
	dLvNUTgvSZdbefvLyQSa1hh9F/KiYTFE2YmY3BLr0lnitrRxbnVJHoAC3VNEj3lNRKAOxOPa/yGl+
	WPzdfTTgNbUm9qCVuNoochC/w1PAK4nWcpoMeQr1HlXVISTAXlvRoYSEMWfJ2Ek20Ub0IS1ZNtAlY
	x/zvVhxJPzbeQq70dCuXpkyfHr7kpEwPOdRGs+wq/qGmm5FJsc5iMH0oa8oz9jmbh+ciWFOdbW1Ob
	ghlNjfUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzTp-00000009Puo-3N3i;
	Thu, 05 Nov 2026 15:34:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzTm-00000009PuG-2D8O;
	Thu, 05 Nov 2026 15:34:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C531860A5F;
	Thu,  5 Nov 2026 15:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92D61F000C1;
	Thu,  5 Nov 2026 15:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892857;
	bh=YNB1Wit5xYUO191VIQdW8ACPoY/mVp3oInWQ1K0PfQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DvVbVPQc+2LQL+Wy17aVp5lNEAcdRdvX03FQSm3E+382FSh2QqDX+EPcpIBR7M1W7
	 v+57Kfl08brn4YYhpNdfIplE6yTwK2O0vgx+RW/H9Jky6OcBcL4opKPoLoCR+uelE2
	 SjQKeM/0l/KyNLFt7glHiPGGNbh5AozzmAwKv+y2u7+s0BZnC3OmC2y0T2a4xEdJot
	 g25SKkeTr4hDDPiMcg/M0lFrCEpe41NxzODTK28SdLgucqCsG1RKMjkeXWPsNi+RNf
	 463H7bwuw1L01v2FwGULXf/JNollrCeo3gHgbIcojdvfX8GYEY+IXovf3gsr6rvKG/
	 K3Cyuwo5Uhabg==
Date: Thu, 5 Nov 2026 16:34:15 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Frank.Li@oss.nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, 
	Richard Genoud <richard.genoud@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Cunhao Lu <1579567540@qq.com>, 
	Raul E Rangel <rrangel@chromium.org>, Yenchia Chen <yenchia.chen@mediatek.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, Carlo Caione <ccaione@baylibre.com>, Moteen Shah <m-shah@ti.com>, 
	Kendall Willis <k-willis@ti.com>, Kartik Rajput <kkartik@nvidia.com>, Fan Wu <fanwu01@zju.edu.cn>, 
	Nicolai Buchwitz <nb@tipi-net.de>, Karl Mehltretter <kmehltretter@gmail.com>, 
	Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>, Shitalkumar Gandhi <shital.gandhi45@gmail.com>, 
	Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>, 
	John Ogness <john.ogness@linutronix.de>, Pan Chuang <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>, 
	Robin Gong <yibin.gong@nxp.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Zhaoyang Yu <2426767509@qq.com>, 
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Myeonghun Pak <mhun512@gmail.com>, 
	Wenhua Lin <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, vkoul@kernel.org
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
Message-ID: <auygwakavp_Uk52V@orome>
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
 <aux2VKHnVLwq_wzi@orome>
 <auyQEVmA2KeGu9DL@ashevche-desk.local>
 <2e12316d-d079-471f-9c29-ef5fb765216a@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ve7gdihn6fud63vw"
Content-Disposition: inline
In-Reply-To: <2e12316d-d079-471f-9c29-ef5fb765216a@kernel.org>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--ve7gdihn6fud63vw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 03:35:20PM +0100, Krzysztof Kozlowski wrote:
> On 05/11/2026 15:17, Andy Shevchenko wrote:
> >>> ---
> >>>  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> >>>  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> >>>  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> >>>  drivers/tty/serial/amba-pl011.c     | 6 ++----
> >>>  drivers/tty/serial/atmel_serial.c   | 6 ++----
> >>>  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> >>>  drivers/tty/serial/imx.c            | 6 ++----
> >>>  drivers/tty/serial/msm_serial.c     | 6 ++----
> >>>  drivers/tty/serial/mxs-auart.c      | 6 ++----
> >>>  drivers/tty/serial/pch_uart.c       | 6 ++----
> >>>  drivers/tty/serial/samsung_tty.c    | 6 ++----
> >>>  drivers/tty/serial/serial-tegra.c   | 6 ++----
> >>>  drivers/tty/serial/sh-sci.c         | 9 +++------
> >>>  drivers/tty/serial/sprd_serial.c    | 3 +--
> >>>  drivers/tty/serial/stm32-usart.c    | 6 ++----
> >>>  15 files changed, 29 insertions(+), 58 deletions(-)
> >>
> >> Reviewed-by: Thierry Reding <treding@nvidia.com>
> >=20
> > Krzysztof, now look at this case. I would argue that this is even less =
fit than
> > # subpart(s) case, because it might imply anything. Again the problem i=
s the
> > bundle, and for such a case (when tons of independent changes are bundl=
ed in
> > the same stuff, *every* Rb tag has to be explained on what has been rev=
iewed!
>=20
> I think this case is obvious - Thierry reviewed this patch and gives Rb
> tag, according to reviewer's statement of oversight. I don't see a
> problem here or what is questionable.

Correct. I looked at this whole thing and approve of it. If I review
only parts of something at most I'll give an Acked-by. I don't think
I've ever done partial reviews. I don't think you can reasonably do that
because if you don't know what other parts of a patch are doing, how can
you say that a specific hunk does what it's supposed to.

Patches are an atomic set of changes, so I don't think it makes sense to
review only parts of it. If you can't be bothered to look at the
entirety, that's absolutely fine of course, but in that case don't
provide a Reviewed-by.

Or, I suppose, you do and then you bear the consequences of lending
credibility to something that you haven't looked at or understood.

Thierry

--ve7gdihn6fud63vw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrsofQACgkQ3SOs138+
s6H8Qw//cGBQstXaV/wKkkacAC3cWNFTL8+yZFsZNlz+TH8ENXGRirTUfKBfzoOF
HtimCa5VVbkXs0qyUKXvTM/A5pF1Fq2cdpdO//TpEZnhwVfT6rv7KzsWuUyZVPNK
DkLnxAMcceY7D6zjvtkqsLTUVikBBl+aXcI0ChSBy2Zug88hQpxxwJ/ux+kLs8xE
WDuvRgyUhiJyTGdKru/8NhXKBOVAJnicYfBrndG9ZXG/4aIhpNNRXMQOelAfvhOT
3o6rWWLdXnTZapbimMPSVV8FTihEjQm7QszF0DUJha4h4c0O4gqgnP2FzUzj85u/
S8s2Mh4RRTlyx00NGsoZaoGTnoBhqnIYGXPd7cYgow4ClVf8j0H/dL6jfHwqXm6y
+V9/F1fZcCWoaJp15qo3LQIfEkZuh6sFLJOCHP44fGS/c9y2fKniPUOKVgWUTvAr
u/QrbShhYMlIVPV1vQOdgwum/0NQJacsHqfwJOEy9F73o3evJkdyhP/PBx1Za+Ho
Gah9elyAWQ7TKJxB7yhxe9V8JfZyABe3VyDejZmjd7JRPshTe3gypOsRyAvU7gaX
0s2NAZsjTd97X6CDzlIrIGAy38HWlEa9F8GCeT+EcqlFpw8cuH3+15MUhkDxFHnf
2bYzFtnSkuEdOP+cgYjsukuXCuGEIvSWkZbAjHAuuQFu2PCn0l0=
=lEfV
-----END PGP SIGNATURE-----

--ve7gdihn6fud63vw--

