Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34B4C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TMTthrybuHSw38BcPdvVtrHCMWIDAeNmf9go1g+GtA=; b=EP2JKYISg2A5yIzCQtAXwGls1q
	05dd2WhmC+VZIVnu4xZunzgq61B75R2mKZgPf/fZZnK7V9aLfKCKZ4Ej8nLeqV1YU7O4etVyf7NCR
	zvJ0Ra7p3WJJLhVT2S8wLoSeZBdJM6Y6WJ6vDA3FqA6hgOXnlFWqbL0PXA/lIDJYg8UEfxGxzUzta
	6MhM0iytJB6CRiFRKmkgLo/Pmci3Yt4KlLCMXfLcg/qi05I0nuonynJKb9qy6OZH/piG1phDO7JEZ
	ez8wrp5qMCioqBNVke9dnNEMfeonY8xGROJHTHf+GFjAfDIBbooDgMi9V0DgW8y48HeAbSIYO/PeY
	LHa48CMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJakt-006G2m-DG; Thu, 04 Aug 2022 13:19:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJajD-006FAC-8Y; Thu, 04 Aug 2022 13:17:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6E470B82492;
	Thu,  4 Aug 2022 13:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214E2C433C1;
	Thu,  4 Aug 2022 13:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659619048;
	bh=pGAubC3p5cu8E3aqPdqw/fxyUjG67zf8Tpf1JKEF55w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6stWst9e41BreGAtGPuz0nAu0TXJwPKwlYdFFr82zphG4M14QXdbrLumphztxMuJ
	 YDRDikw+/QifdRAghI887qlMaly1LeHw8FJsuERxDrwM3ejq344jv/6P8SI4qYYdJ6
	 5Of9c4WpCS92Rl1VVFiCsroAA0eleXumCjmYnyo8IFRFv4y/qUerR/K5kbtnJ5LAIg
	 UDbeeAdrYpjf3kwUPHCL5Z0qhffTosxBEGEg81cPe0P6vOxWBysZgF7P1CoL7ba0tt
	 Us8sPo+r1mwRof5YQzLUBmLtUbQcZ4hxS5HMbkd31WBWTjRPaXzWomF7kb8cwcDSmD
	 P4nOg8r8+XqwQ==
Date: Thu, 4 Aug 2022 14:17:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Chunxu Li <chunxu.li@mediatek.com>
Cc: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
	lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com,
	daniel.baluta@nxp.com, matthias.bgg@gmail.com, yc.hung@mediatek.com,
	tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	project_global_chrome_upstream_group@mediatek.com
Subject: Re: [PATCH 1/2] ASoC: SOF: Introduce optional callback
 of_machine_select
Message-ID: <YuvG4drwG/rYoozp@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
 <20220804091359.31449-2-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3rmzYVoKrLLLmuXO"
Content-Disposition: inline
In-Reply-To: <20220804091359.31449-2-chunxu.li@mediatek.com>
X-Cookie: Did I say 2?  I lied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_061731_500853_2EC5B9C2 
X-CRM114-Status: GOOD (  15.00  )
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


--3rmzYVoKrLLLmuXO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 04, 2022 at 05:13:58PM +0800, Chunxu Li wrote:

> @@ -284,6 +284,7 @@ struct snd_sof_dsp_ops {
>  	void (*machine_unregister)(struct snd_sof_dev *sdev,
>  				   void *pdata); /* optional */
>  	struct snd_soc_acpi_mach * (*machine_select)(struct snd_sof_dev *sdev); /*
>  optional */
> +	struct snd_sof_of_mach * (*of_machine_select)(struct snd_sof_dev *sdev);

I don't understand why we pass this in as a function when as far as I
can see it should always be the standard operation provided by the core
- why not just always call the function?  We can tell at runtime if the
system is using DT so there's no issue there and there shouldn't be any
concerns with ACPI or other firmware interfaces.

--3rmzYVoKrLLLmuXO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLrxuEACgkQJNaLcl1U
h9C1FQf/QjsEtLV9fR8Iz6XmIP9rAebV+D6AS3pDxlY44Q3n5kTg2SprGpkW0N3X
PZVh1GJ4B4MWkO2ODQKF2X322Hr78Np7AzYSQQv0QrcRbRj7/IJHnn4zCs26DlaB
IOk/MGuxUw0kHzBERUoreV9XF2MjBJXTBURBc198Uw1xcb/WarVtk6OPRfmn8blp
5DQZ640pif50r6aQaRaOq9/c7RnUy+hAjsT78GNnIsbEinE1w5JOb2Xf9BTQAXZ5
slxV69bTH2+yDkqU/G92cqXI8RhuD6Sz6KP6gKnAF8n1DNUVTk+pAZeHrRIJ2cQT
pw8nMfmjoexKvLFc+FTsGrdNuJ2zTA==
=PLcm
-----END PGP SIGNATURE-----

--3rmzYVoKrLLLmuXO--

