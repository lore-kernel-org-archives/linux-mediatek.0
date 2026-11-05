Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E02606A329
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fYSyopbA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQ2UVcx0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WMIfUSC08BqgK169oF+WQophOR+gP8olx7dB7m3lVdI=; b=fYSyopbACdEqrz5789BmV4JkI0
	LJu8d7oKre5FISanWy7zTrd8SNhMewfnuv++jr71KXzwKYBl8EfcnKGwWDI6FAbIIAV+S+L5fUwaS
	DUPa2hPuQ6SesDHAOQiz7r09hss9awGj8Toecnz0ABf5hQTSIlPwscuU4GnDSyUSi3v3ZGiV4bP9C
	clbNn//qpRsJFKxnOQn6u4asyG0Y4pRotmT7MsPi6qJi3ZOnkIRgagN3GtBDYaCR7qaMP+3W1By/7
	WB3HqC7CiT1HkjUGWpDXgDRcR6I0QdrDmSchFrge7RY8adAjVzO38ZRNffitOPLqoCFRO1FwNMjVW
	50gJCUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzW9-00000009Q7Z-16Yo;
	Thu, 05 Nov 2026 15:36:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzW5-00000009Q7Q-1xeH;
	Thu, 05 Nov 2026 15:36:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0808E4147E;
	Thu,  5 Nov 2026 15:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3617D1F000C1;
	Thu,  5 Nov 2026 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893000;
	bh=WMIfUSC08BqgK169oF+WQophOR+gP8olx7dB7m3lVdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GQ2UVcx0gaNOwo0yy9wftnb8YdlMK/DhNEwIT+Ja4l0mEunsi7pyo+Yoj+Ijw7oqf
	 mUr8+4Y9IKNGF12cfn5mWrWn87XYuqmTMQJphnw2OCQ1WjYneGTAZvps6xLlNfO5oQ
	 oSJHx8/355u1AZtd58DBfy/xtRnTeZ+VZojz2v6C5itcJZdiGLR/hsGTAG0ZSV9VY9
	 n8FER9NZsV8jYHgeaY4da3lu7SKNrw57S8PTG90MNhkl296SICCgdGoTg13reFYICw
	 zfTvJI58o4+DE8ClCZFFcs1HAxxT/4YOpd2sEFGXy+nwq3X6z+W1BgMZrSWmNG4Y7s
	 B7xxjbNedfKbQ==
Date: Thu, 5 Nov 2026 16:36:38 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank.Li@oss.nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, 
	Richard Genoud <richard.genoud@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Cunhao Lu <1579567540@qq.com>, Raul E Rangel <rrangel@chromium.org>, 
	Yenchia Chen <yenchia.chen@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	Carlo Caione <ccaione@baylibre.com>, Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
	Kartik Rajput <kkartik@nvidia.com>, Fan Wu <fanwu01@zju.edu.cn>, Nicolai Buchwitz <nb@tipi-net.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>, 
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>, Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>, 
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
Message-ID: <auyiAE3lhnFahBK2@orome>
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
 <aux2VKHnVLwq_wzi@orome>
 <auyQEVmA2KeGu9DL@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ahiyus6jckmdxu2"
Content-Disposition: inline
In-Reply-To: <auyQEVmA2KeGu9DL@ashevche-desk.local>
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


--2ahiyus6jckmdxu2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 04:17:53PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 01:28:46PM +0100, Thierry Reding wrote:
> > On Mon, Nov 02, 2026 at 12:54:48PM -0500, Frank.Li@oss.nxp.com wrote:
> > >=20
> > > Replace open-coded assignments to callback and callback_param fields
> > > of struct dma_async_tx_descriptor with calls to the
> > > dmaengine_desc_set_callback() helper across serial drivers.
> > >=20
> > > No functional change intended. Prepare to make struct
> > > dma_async_tx_descriptor private to the DMA engine.
> > >=20
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> > >  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> > >  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> > >  drivers/tty/serial/amba-pl011.c     | 6 ++----
> > >  drivers/tty/serial/atmel_serial.c   | 6 ++----
> > >  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> > >  drivers/tty/serial/imx.c            | 6 ++----
> > >  drivers/tty/serial/msm_serial.c     | 6 ++----
> > >  drivers/tty/serial/mxs-auart.c      | 6 ++----
> > >  drivers/tty/serial/pch_uart.c       | 6 ++----
> > >  drivers/tty/serial/samsung_tty.c    | 6 ++----
> > >  drivers/tty/serial/serial-tegra.c   | 6 ++----
> > >  drivers/tty/serial/sh-sci.c         | 9 +++------
> > >  drivers/tty/serial/sprd_serial.c    | 3 +--
> > >  drivers/tty/serial/stm32-usart.c    | 6 ++----
> > >  15 files changed, 29 insertions(+), 58 deletions(-)
> >=20
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
>=20
> Krzysztof, now look at this case. I would argue that this is even less fi=
t than
> # subpart(s) case, because it might imply anything. Again the problem is =
the
> bundle, and for such a case (when tons of independent changes are bundled=
 in
> the same stuff, *every* Rb tag has to be explained on what has been revie=
wed!

It may be a bit subtle, but the placement of the tag indicates that it
applies to the entirety of the changes. I didn't crop the list of
changed files, nor did I omit the summary.

That bit of meta-data obviously isn't picked up into the tag line, but
I think the default meaning of Reviewed-by is that it applies to the
entire thing.

Thierry

--2ahiyus6jckmdxu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrsooYACgkQ3SOs138+
s6HsEBAAvgrbYKAHxYaotfiffEkaiu5bekj96h6z+cilejnIbjAQULN3YB/vJgMw
989E+Tc9xOUp2VZUOGlEURoAZlx2VASTX17Z9qMdAMBvAU9JaaRRR3lgg3DBe9P8
nesEI+jXi55+OB8tZg5FthLgQGbxy/lM0Nqch6aZbmT6leB70s5h6lYrHeoafCtw
3qy76KmxowG5jx/CIQHQhUhC5jMsTFlqoX/6YoC2ps0L2dinYqON9TEhN+ljs0hp
kYmyPE4g1QaXGk2sUrrCM18iLOxjNtJwNspmndfkUP8T1v6qexGmSJXeQMAF6Hsx
Mb47ov4M1dpeFP4TcXghlmJdCbDQyO6Z+SDMzMOO33UdOkC+MrSb8P8yuN4QD909
Dw/3qIapRxlrxhIkmd+dihmne+1irCgEMuTqpJful+lMYOWQ2yESoE+G9u9fJHDI
wL7sTTrtCEMAl2oaO6xtAmaV6/FHFgCG8vCMM1QVg6zuSGk3mTW3qQbRO5ginzwk
tAxKdIbWeU0RQoXINwh24JoAQs+rswnGgFUBvl+XZpNgnp7NOs2DrvC1uueuxtvB
1s57F8cZLIwxAMhmnBNKuTiu8YGNEwNGVQpoCBDvvdTohhssdav1DaP462lhmVfh
aLHhfjTv/1wqXk95lqVM51sm3ytRti+1p0zjyqZN0Hm+p3vnZX8=
=tFls
-----END PGP SIGNATURE-----

--2ahiyus6jckmdxu2--

