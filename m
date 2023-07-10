Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFC8C001DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpTuLljbdaBkyoyitx9Zt2kT2mpNPwthrmEzA4FZh0k=; b=RgGmFgSkNhFX0KXczeNadSxt0g
	zx/s/3YnLbFQBZoHHlrjnBY9nK7dTTMp4V8W3tDOSDMolUGuRcdAxSrrGiFX5p4vZVZz/o3j7RW4h
	4wAkG2b3OOxcWpfSH3c6UAhevIVCPFbPwz+VStSbDJwe44sL3S3ErAqNONbjGjklZCPcS8bj36QrE
	5pFbASaFh3pLW/iimhQfPblyF/XIqiItZwIwNv2XQPRQ1HTCgOWSiJ0Gcux1P8JHKtkMazDUSFdFC
	M2eUFZnvsm06N+aag/i9W2neEc780xGXhYNK35cgDZ5LhPadAcPkA4cZXhl8vKNbIth2CZeQH5f2Q
	AfzYO8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIuaI-00CKSx-0p;
	Mon, 10 Jul 2023 17:22:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIuaE-00CKRp-0f;
	Mon, 10 Jul 2023 17:21:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE93460FE6;
	Mon, 10 Jul 2023 17:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7CBC433C7;
	Mon, 10 Jul 2023 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689009717;
	bh=CpTuLljbdaBkyoyitx9Zt2kT2mpNPwthrmEzA4FZh0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jH9O9AHymoIzZncRhS0boDcQENihuPJ9tiOMacCBW9S1HyXoS4fmk05l3yiGNAo2K
	 KI1hyt+ZX+7NEHBvWCqXjT4yNe/LtAsjRDwPWtbPDyinDXBlqwNxiz4igGDEvFujjT
	 HvuvVf7zfJpIqBT2DHBv4rYYp+mzBEGWoHelZgtBRzC5a9ODbB3jbYPRYOu+MpK8DF
	 3DKPCT3xy2bGoPblEhEFYavUFRlVpmVElN1x+riHF3GGBKfZ16h5m4CDQWCrPt/Kv/
	 vK54neWN9FR7qTjWY6hgaJiuvxPLSkqkKUC983rTnSx7XHJONotnyRARakAtXoacgn
	 BzkLNw5lEztpw==
Date: Mon, 10 Jul 2023 18:21:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 08/15] spi: Clean up headers
Message-ID: <54bb9fe7-fb62-4c2e-ae36-d2c10648ee27@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5h1T0k99Bnkn5Gc"
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-9-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_102158_331098_4A12FB2F 
X-CRM114-Status: GOOD (  14.26  )
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


--w5h1T0k99Bnkn5Gc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:25PM +0300, Andy Shevchenko wrote:
> There is a few things done:
> - include only the headers we are direct user of
> - when pointer is in use, provide a forward declaration
> - add missing headers
> - group generic headers and subsystem headers
> - sort each group alphabetically

The previous commit was supposed to be sorting things and AFAICT did
so...

> +struct spi_device_id;

Why are we adding this given that there's also an inclusion of
mod_devicetable that you didn't remove?

--w5h1T0k99Bnkn5Gc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsPicACgkQJNaLcl1U
h9CPUAf/RRQIrb0PfZnRSA7kc94fTv5rQbNfPboY9/94tcd2SIZjbZezvGfMuSZp
6KHTd2Kkiwzya3J0dExwrNiIzmVrIGl+uWJWbvppEpglEeE0BNrEl1a9mRgzaQUk
Ys7HqCSSbbtJqGSlgQAODJPS7eaPIw1ChR5Wv5B+4AlUGavA+iCrwDK+TD0dFZpQ
ovdLIOvU+8RA2XrWSPmDSi4ywOFt9I70VxOWbR9rbfQcvXLRaJA1FOJa2ZArMhHy
CULubdIfA4BO7mOmyLX63DXgjZqu703oW4W5RFmjc+sa9xmoSdlCYflpgXX/xSqG
VmDSPECCeUQc9NZwlOM4i7+iPwCymQ==
=E/m2
-----END PGP SIGNATURE-----

--w5h1T0k99Bnkn5Gc--

