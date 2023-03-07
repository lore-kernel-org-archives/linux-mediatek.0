Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE332C6FD1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 17:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ild2gcJcJcETh3rJlpdNeuafOhtqR3DnBnpv5vKXAW8=; b=M2nJKxWNtJh6Y47OGmf2Cuimi8
	QBjIfL92m1mY7s5wVcF/253YIhuzC1Ll5r9Iy/Pb2xpc2k67r7/A18a2fg3CzU3u+gdvDWwfPXBeh
	sQhWdl1+OHWB6SLgYpGZjT+TUpOELHzeJpvP8EQHCXO8HjrDqkvP+liivanIflAaXQKV+xcqS+UxP
	KGkdtuoJbvcBP1TUcgcOm5Qyg93NQsVmOBBIZVsYaf+A4aO7dyOlytalk4TtJTOf3oZa71rPt0Zfu
	fTCWpv874PhMqS+xARVD/yuFa7YG1EJMyPWs5iFXRWMUZ56KUOuNPnmln7y+NX7gjaWEJCUCTlIDc
	/nBC4XhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZagd-001iXd-86; Tue, 07 Mar 2023 17:01:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZagZ-001iVv-2D; Tue, 07 Mar 2023 17:01:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 93C0FB81997;
	Tue,  7 Mar 2023 17:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7A4C433B0;
	Tue,  7 Mar 2023 17:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678208468;
	bh=tKFTmiEx5lWVMe9kc/4siOWPAS1vRgintq9BdapPuw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqt5/BmZ7eO+af/HjVRQiU3sw8JOtHGp6EMO4dWuOwrg2LueVE87FwMwbJmSMbDw3
	 ws29jqaUjUDjYiikTtt7/iKYg+2yrYf4T2JYLdR/uOCpmU1RmrY5zY6A63gtW5rM+x
	 DmiW0/1nByleyTnwwYj1Q66go/nxAjY8OGVSo4KWOto0Z75wa5ysvNT77Nh88lPcIm
	 kdDMXsZCBZ0GbSeik/wu87szoip24bAwSGhB4IwTpJH8yCVAVCuT2KqcDQtesriupl
	 JAFNPocJHQredNufuxvTfWTr5qcifQwWUjloMf3yohaiWo14eqm5mjyT1XK3IaJ4T9
	 RGF37doTHhI7Q==
Date: Tue, 7 Mar 2023 17:00:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	William Zhang <william.zhang@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Anand Gore <anand.gore@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>, Han Xu <han.xu@nxp.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Jay Fang <f.fangjian@huawei.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi@etezian.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Li-hao Kuo <lhjeff911@gmail.com>,
	Masahisa Kojima <masahisa.kojima@linaro.org>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org,
	Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	linux-rockchip@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 00/87] spi: Convert to platform remove callback returning
 void
Message-ID: <ddcda593-f8e9-43a4-bba6-dae31e8d6b39@sirena.org.uk>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wo9frzy+aFktTPxK"
Content-Disposition: inline
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
X-Cookie: A rolling stone gathers momentum.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_090111_408495_FBF97A2E 
X-CRM114-Status: GOOD (  13.08  )
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


--Wo9frzy+aFktTPxK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 06:19:14PM +0100, Uwe Kleine-K=F6nig wrote:

>   spi: mpc512x-psc: Convert to platform remove callback returning void
>   spi: mpc52xx-psc: Convert to platform remove callback returning void

As well as the Raspberry Pi patch dropped due to build failures I also
dropped these two as they conflicted with Rob's refactoring of that
driver, nothing especially complex but since there's stuff to resend
anyway...

--Wo9frzy+aFktTPxK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQHbb4ACgkQJNaLcl1U
h9DDDQf/eo3lXns3dzYdzJYf8MxUxafb8rgDkge5kzhM/iS9lEnDcJX8Vno7IHOa
iZ7/NuWC1p4ofFyl04/WPa94f4hEYWTNqXgQ4TuEq9SRTyOTwZsqpS33uEc9v0zm
3/ja2SHHOw97vKeI+1IjK8fycKlOze/YwzP38U0UTECpJou6+41HYgRgx8L+J3Js
zILjs+qw1DhbaslGny+CEV6juxQO2LcIoNjdQYfWSbN4leZdcg8cW1+Obbr8KLen
nbcN3szhArY3SvbxgXR5muD5yNFtETWVBmVtjlT0mBXX4Lzgj7Pf0SgN1haH9bq/
jlQbNnEEvvkvGVicjB7wmDlS6gOoKw==
=fVjM
-----END PGP SIGNATURE-----

--Wo9frzy+aFktTPxK--

