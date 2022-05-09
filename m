Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093FEC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsFv7hVfDWjNTNLtuAbKk1P855d7NvX2BypeMQOCmqA=; b=k74L0fKbTwx2NTgyvATUomj5yu
	QH1O/rYRh1+omqnGbvkxDsLukz0DbxPryDxLY5f+eBa8grGWsAZI13c1X7D/HV2qzij4HG7wbVn4v
	InXwsWQDBkFf1Orc2T3k5sgh2JCDR5ctv8NJ0EQNRSuakF6DES3X2n0xxM/ZnUbyN5TzAfDiOkazb
	V6PbBXmKb8IwhEoG4rgzDRZaddzYRPiN3KlhHTBcCf6z3I3l7zt1edE4/ttVhYgGwyPhTY3U3yLIh
	oFlCYPbwwIar0sZKKiHO1gkExQ9wzfMVWRvTuXu/oK8+obVSQAxPGbXtyWi9MJYk3RFA6VtxEM6a3
	v+cCub2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no6Ey-00FPpN-Es; Mon, 09 May 2022 16:28:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no6Ei-00FPi0-EQ; Mon, 09 May 2022 16:27:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B855261326;
 Mon,  9 May 2022 16:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384D2C385AC;
 Mon,  9 May 2022 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652113671;
 bh=S0V8g9Q+rtOhW8zS6pQb1UdHnzurpYoAzo408azn5ig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R7R9BUtPSg+q2p7vcGt0yB/n81n89BqJc2feue4wN8K+Ko/9kWHUUAof+9WccHqbi
 jbxtczbK3MbL8/my8gZU6kimoAMvjHpSh0WCBuA3nvjf+r+Z3Xoa3Sv4x0SJvlBMVn
 2pMUkSG47qsJ5l5gilSOjiLs5eOk1+CoRCOlZ/FH5KpOJtHzrM7uFpGZsxYjdfSaLs
 WF4QdqNKNEbdIxvkABOcyUGv6BiHt6y3nWmoMLerOZuoM6/bTAt9qcdpQ2tH94D5n8
 q5uhVFXqdpgKR43N6VyIA/4odOvXh5ziM8JMBRSO/+FgpK48laW67B+bp4YAol0WE2
 v0Dyy8bX0tLoA==
Date: Mon, 9 May 2022 17:27:46 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernelci-results@groups.io, bot@kernelci.org, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: next/pending-fixes bisection: baseline.login on mt8173-elm-hana
Message-ID: <YnlBAoZTJ6WbM394@sirena.org.uk>
References: <62793d83.1c69fb81.71b96.033e@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <62793d83.1c69fb81.71b96.033e@mx.google.com>
X-Cookie: Boycott meat -- suck your thumb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_092752_658022_F2D18B6E 
X-CRM114-Status: GOOD (  25.61  )
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
Content-Type: multipart/mixed; boundary="===============6397657792012709546=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6397657792012709546==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="byCN00+m1yrx8Aui"
Content-Disposition: inline


--byCN00+m1yrx8Aui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 09:12:51AM -0700, KernelCI bot wrote:

The KernelCI bisection bot found a boot regression on mt8173-elm-hana
which bisected to 6f81fdded0d02 ("serial: 8250_mtk: Make sure to select
the right FEATURE_SEL").  With the patch the output terminates at:

<6>[    0.763969] EINJ: ACPI disabled.
<6>[    0.789312] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
<6>[    0.798321] printk: console [ttyS0] disabled
<6>[    0.823022] 11002000.serial: ttyS0 at MMIO 0x11002000 (irq =3D 251, b=
ase_baud =3D 1625000) is a 16550A

with a stream of ^@s following.

I've included the full bisection report, including links to more info
like full logs and a Reported-by tag from the bot below:

> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

> next/pending-fixes bisection: baseline.login on mt8173-elm-hana
>=20
> Summary:
>   Start:      a42b168a3ce2c Merge branch 'for-linux-next-fixes' of git://=
anongit.freedesktop.org/drm/drm-misc
>   Plain log:  https://storage.kernelci.org/next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.txt
>   HTML log:   https://storage.kernelci.org/next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.html
>   Result:     6f81fdded0d02 serial: 8250_mtk: Make sure to select the rig=
ht FEATURE_SEL
>=20
> Checks:
>   revert:     PASS
>   verify:     PASS
>=20
> Parameters:
>   Tree:       next
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git
>   Branch:     pending-fixes
>   Target:     mt8173-elm-hana
>   CPU arch:   arm64
>   Lab:        lab-collabora
>   Compiler:   gcc-10
>   Config:     defconfig+arm64-chromebook
>   Test case:  baseline.login
>=20
> Breaking commit found:
>=20
> -------------------------------------------------------------------------=
------
> commit 6f81fdded0d024c7d4084d434764f30bca1cd6b1
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.c=
om>
> Date:   Wed Apr 27 15:23:27 2022 +0200
>=20
>     serial: 8250_mtk: Make sure to select the right FEATURE_SEL
>    =20
>     Set the FEATURE_SEL at probe time to make sure that BIT(0) is enabled:
>     this guarantees that when the port is configured as AP UART, the
>     right register layout is interpreted by the UART IP.
>    =20
>     Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
>     Cc: stable <stable@vger.kernel.org>
>     Link: https://lore.kernel.org/r/20220427132328.228297-3-angelogioacch=
ino.delregno@collabora.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>=20
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250=
/8250_mtk.c
> index cd62a5f340149..28e36459642ce 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -54,6 +54,9 @@
>  #define MTK_UART_TX_TRIGGER	1
>  #define MTK_UART_RX_TRIGGER	MTK_UART_RX_SIZE
> =20
> +#define MTK_UART_FEATURE_SEL	39	/* Feature Selection register */
> +#define MTK_UART_FEAT_NEWRMAP	BIT(0)	/* Use new register map */
> +
>  #ifdef CONFIG_SERIAL_8250_DMA
>  enum dma_rx_status {
>  	DMA_RX_START =3D 0,
> @@ -569,6 +572,10 @@ static int mtk8250_probe(struct platform_device *pde=
v)
>  		uart.dma =3D data->dma;
>  #endif
> =20
> +	/* Set AP UART new register map */
> +	writel(MTK_UART_FEAT_NEWRMAP, uart.port.membase +
> +	       (MTK_UART_FEATURE_SEL << uart.port.regshift));
> +
>  	/* Disable Rate Fix function */
>  	writel(0x0, uart.port.membase +
>  			(MTK_UART_RATE_FIX << uart.port.regshift));
> -------------------------------------------------------------------------=
------
>=20
>=20
> Git bisection log:
>=20
> -------------------------------------------------------------------------=
------
> git bisect start
> # good: [c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a] Linux 5.18-rc6
> git bisect good c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a
> # bad: [a42b168a3ce2c4923d405814c81ef015aa5e6515] Merge branch 'for-linux=
-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc
> git bisect bad a42b168a3ce2c4923d405814c81ef015aa5e6515
> # bad: [d424caf55dd6da1f39787899d223b17b61bff74e] Merge branch 'tty-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
> git bisect bad d424caf55dd6da1f39787899d223b17b61bff74e
> # good: [2ecea400e96eddd79295a717ce9a7ef71d9519c0] Merge branch 'master' =
of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
> git bisect good 2ecea400e96eddd79295a717ce9a7ef71d9519c0
> # good: [493e389da29b9df4898136e487b7217b277a0d2f] Merge branch 'for-linu=
s' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
> git bisect good 493e389da29b9df4898136e487b7217b277a0d2f
> # good: [4e02910ec7a8c7d7608dd3d18169f92d04e40eac] Merge branch 'for-linu=
s' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git
> git bisect good 4e02910ec7a8c7d7608dd3d18169f92d04e40eac
> # bad: [edd5f60c340086891fab094ad61270d6c80f9ca4] tty: n_gsm: fix mux act=
ivation issues in gsm_config()
> git bisect bad edd5f60c340086891fab094ad61270d6c80f9ca4
> # bad: [6f81fdded0d024c7d4084d434764f30bca1cd6b1] serial: 8250_mtk: Make =
sure to select the right FEATURE_SEL
> git bisect bad 6f81fdded0d024c7d4084d434764f30bca1cd6b1
> # good: [bb0b197aadd928f52ce6f01f0ee977f0a08cf1be] serial: 8250_mtk: Fix =
UART_EFR register address
> git bisect good bb0b197aadd928f52ce6f01f0ee977f0a08cf1be
> # first bad commit: [6f81fdded0d024c7d4084d434764f30bca1cd6b1] serial: 82=
50_mtk: Make sure to select the right FEATURE_SEL
> -------------------------------------------------------------------------=
------
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#26744): https://groups.io/g/kernelci-results/message/=
26744
> Mute This Topic: https://groups.io/mt/90993243/1131744
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [broonie@kernel.o=
rg]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--byCN00+m1yrx8Aui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5QQEACgkQJNaLcl1U
h9B5Vwf/YWVIfriIAi/mXoPDS+3GuOCCdwXq7OydHL4v2uxpjhEb6RhW5UIhkw4L
K4OkWGoWpXkfSkIUfbX+KsolJQLof1KfQMZVXObP0xVFTTmeTJol7ng65jlGjBqu
P1Sn6+wTaXkoXhtHR5WStObcB2UcCH+tX0y4Hp6rYERzO4bqmyroIEFp/ttt+FFl
KdROHQC1/ORv6M3Tx898+T4d5JQwLRp9p6mtaODvucL+9DxxrzeGyTz0mEfESB0I
FOi5Q3VT2n6+Y3rW3nJIrzI0MyM0hA5MbMvC+Lrl+2MfoH8e7ic8IT6SQ9pWo6Ie
WDGNQVXCpZB7cUHT8e56OE1LKNCOMA==
=JeF4
-----END PGP SIGNATURE-----

--byCN00+m1yrx8Aui--


--===============6397657792012709546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6397657792012709546==--

