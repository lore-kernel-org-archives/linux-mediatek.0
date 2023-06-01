Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DBBC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 11:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ka+o4WvXIkrT5/D7beu+3HOKhHNVFqbY9U0402c8HGI=; b=ih9hKthLCXIU6InAMNriU700Rq
	Xm7Yfpg/oN5yrj6tdMdyUTk5fjFxepe8A1kH+gAHa6oS/La3Hbal6zr6jY3nwNwyQ4SVcchs6dSew
	Sl3LI2TuG4KeyDI6QD6go+hst6oV7gpNudAsgY99PUFb4OqAHE8NzGT0kwiGNuT+lmPYr0IFc1juO
	u9JPNUxh/xVkt3LGx+NQaXirGFONZkJ9uA1OnUmdnCyjGWejTLNKu7MZ8Reu++TNhniJ+nTbQlhyY
	JlRrPpohCicfb+1N2JXFY/uCYXSidDlDuYLeS6Nf9Fpw9sXTsBSO50n7jjW7PeDg+8wGVg0Pf3qew
	4DvxGAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gUn-003FIy-2E;
	Thu, 01 Jun 2023 11:29:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gUk-003FHq-1O;
	Thu, 01 Jun 2023 11:29:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 485CD643CE;
	Thu,  1 Jun 2023 11:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A217CC433EF;
	Thu,  1 Jun 2023 11:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685618968;
	bh=YRpFV9EHccLiEr00ihV1MVHY1R0+dLRW9dyu9NplvMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSWlNENd8xqQprpGuF8Mhh0IbIukZI5MPrw5orokNRPf8E+42PK1wiHIOYFSNEf7w
	 644oct61rq004fmUbO7GU84F7lBCfbxqX+h+0hi2qsfira7vhjzDXfc0FaIh6Q5l0d
	 8MuUwpPPSMlP4/bk6jA3hdxGZkxMsjAQ/a3Pbv1tX1BFmNpNkG3LYqlA3dGOT572AV
	 T0dgJxIx+ACORWzL0Gispcl3WTq52rqE7kAzSZRgNv801uENOqemHGhLdzJm+e3/BW
	 NBkDychAbx9brsohEl9IFmkZWLcDQgIJIxVBH1iidKntxmZ815jjDVLMyl8wdbtix5
	 l6VMQctt3QhdQ==
Date: Thu, 1 Jun 2023 12:29:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	amergnat@baylibre.com, alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: add
 NAU8825 support
Message-ID: <df12a113-109a-438c-9a6f-ece021550b69@sirena.org.uk>
References: <20230526093150.22923-1-trevor.wu@mediatek.com>
 <20230526093150.22923-8-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JmksfPfyy4Bj0Tfi"
Content-Disposition: inline
In-Reply-To: <20230526093150.22923-8-trevor.wu@mediatek.com>
X-Cookie: Positively no smoking.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_042930_532299_51FF9949 
X-CRM114-Status: GOOD (  12.77  )
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


--JmksfPfyy4Bj0Tfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 26, 2023 at 05:31:50PM +0800, Trevor Wu wrote:

> +      dai-format:
> +        description: audio format.
> +        items:
> +          enum:
> +            - i2s
> +            - right_j
> +            - left_j
> +            - dsp_a
> +            - dsp_b

Why is this a DT property - why not just pick one in the driver given
that it's for a machine with a specific CODEC?

--JmksfPfyy4Bj0Tfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR4gREACgkQJNaLcl1U
h9AxeAf/ehUGBygKINW6H+yy1gZ0HlpXhYS4swWucFmZqVQIaksZAUR2ly+8bPzD
Puhp4M5k+HV/+H+VLnmi1MGn803l5bD1q3Y4Ecy5mMz8cSzQx3tNEwL+htYaUeg6
pchi7gBYaiBd3nVWeEWelIsBx+1UYRURJ3r+YoCXRVAHaYCsbJynauBKCOAizCfG
W7MItpvce9g75QWSuifAPhQOEggg5eo6eGlq7omEVkvzUrExfGSM5L8bCMdGar90
dqHOrZSq0B0q2w6yGGG9KFvcqvSbnErkngpBeI33DBTDfCIhHuytcB+M3pLhFOnc
nKhBAj+1yD+OMbQC+HYc94d+bsXErQ==
=Zpw4
-----END PGP SIGNATURE-----

--JmksfPfyy4Bj0Tfi--

