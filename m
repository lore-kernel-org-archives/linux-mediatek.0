Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B63C001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqlYAMnZ+JfeuRXdftAEQ5hSDtUAYpYdfgTVGuT3sEo=; b=RXHTo3haZqrpXud9fLXfPtmiMR
	UXbDa8gEsfEhHhnT7uxU9uQcZwCnsKm6YCKC3xbDIiScfnO9DA9Pq8LPpqSERhbvPh13BaG6+WwZK
	U/oEYjqIp5nO5ZnEM7/DwprZ5Dp7Gygp7gtR1/uqWd9w1PFHWDq15RZPGwCxhb2nADdoQcxkKwq8S
	PVdYiVy+3JyMbb5rWuOKgGR5UUFn7w2Wz6LW7rSPJUphmZYPwwIzTDMkLsVh/Q4WNR6r74VhM/UVU
	KpJ1EP7vKlJfji/Q6vZ58WJseJCEdDBf6q36WcJt/6kLtHIxU9sffOjq6O6LKHng9ijpoqKxcr/Ee
	OnwsNcmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUAo-00GAug-1I;
	Mon, 31 Jul 2023 14:47:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUAl-00GAtL-0P;
	Mon, 31 Jul 2023 14:47:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 591416117A;
	Mon, 31 Jul 2023 14:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDC9C433C7;
	Mon, 31 Jul 2023 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690814817;
	bh=PqlYAMnZ+JfeuRXdftAEQ5hSDtUAYpYdfgTVGuT3sEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwBcAZY0NKbmJ5/K/4M5wt/q/Snl9MV8edbQpaIhW2ZSTntBQ5f77YrshzZRcfM+e
	 +F4hKqaNsjLncLgFqOvZfW0HTRgOF62Qj+B0thqCeMAO1sC0HScYVmGQXi9sCw3tlE
	 jNdt632W55A8xLfTP6hJe+b2z/6VkX4dsVXfN58691SetbITwgu8P2d5JsmecepkZz
	 cbcedP4GmD28lPvBAMgkr2cFU2ZZcTFJtp2TaoRVBUJEdVolw+8kdcbqOCBPDUY1vj
	 3eHpHAdbQdsOklnI7ZBoCcTqoia9YDAlfoAXiwlUaTTTfyYYY6J2NrnAvZbstdDn8M
	 XABBzcl7BB2VQ==
Date: Mon, 31 Jul 2023 15:46:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 01/12] ASoC: dt-bindings: amlogic,gx-sound-card: correct
 maxItems constraints
Message-ID: <076d8a7d-8369-4e88-9997-d54b91b7920d@sirena.org.uk>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-2-krzysztof.kozlowski@linaro.org>
 <1jr0oowg6m.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hTgg8DCib5JQmztO"
Content-Disposition: inline
In-Reply-To: <1jr0oowg6m.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Single tasking: Just Say No.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_074659_248792_C0491AC6 
X-CRM114-Status: GOOD (  15.52  )
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


--hTgg8DCib5JQmztO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 11:52:53AM +0200, Jerome Brunet wrote:

> The upper limit of 8 might work now but is very likely to be wrong for
> the next device to come.

> Is there way to correctly describe this "pair" contraint with DT schema ?

> If not, then I guess the most adequate solution is to drop minItems and
> give no bound, like simple-card is doing for the same type of properties.

> Same goes for the audio-widgets property

Right, dropping minItems seems better than pulling a maxItems out of
thin air.

--hTgg8DCib5JQmztO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTHyVgACgkQJNaLcl1U
h9CwBgf9GKwK7KuMoeQQsc9Rl6Sc5X+7lsuk+17rjQr+cd3VJNRkXwkjGCYVxgeP
X6JVUsaKujgeRg/hH9ICfqh0FPemGcEpBh23RVIalVSMA8XZZMGzqwsUw4HUinch
cMfTWev5z6ga9lBwr0CclsNVXu/JYkQXKWPBk3vIYH6sTGwblalUI5AbB6WlwH3F
uzJ7ejviucxNzfnFYheFgckbVJ2MIM+IC4WESBp+Cychr+veWiyr9bihzgSe/9f5
dwEhwsZzQAXdxL6eh5P/shLLT2qHgRFiDfKL101YuzqFSze8ZWSsZ/7Xd0GEkzQa
OF73R/jk4LKgIilX+yNwWW545Ynefw==
=iYq3
-----END PGP SIGNATURE-----

--hTgg8DCib5JQmztO--

