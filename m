Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C03C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sG1hXTwsPa7UdfyHs3qzfNJpTEP8CuS5CCxK9H+sDgY=; b=OeH9CpqDnTO6qHf+wUrzj78XT/
	kzjQ0L9KREBXwp9Z2ZPhZBD1VCtlrMAY98XZqq4DEkvaR+eVzSWJvz9uYlas6Uv53hoGx8oAWx0Rd
	u3lswD1h7KFlMO98W8hQVsuxtbol4AK4a5fWckgkHnYtrpOD1JlpiiQfGPKs5l86Vu5v4urZEF07o
	rCbJoC/fxttOBsbMah2pasHOfIPUCjRfs+4uELnnbuCPV1W4LKrnPC6doOTQUuuswwUCkBTKy2Zol
	WswOKVk/gmcuLkOPKXxo7ky0Gz/MujRPdKJMPzzii+swgRSH6ay2Te2cMw3nXIEF3sdTGY9bx4PdY
	XhOpgjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZaa-00H4zZ-Bu; Wed, 28 Sep 2022 16:07:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZaW-00H4x7-Fb
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 16:07:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B8DF9CE1F13;
	Wed, 28 Sep 2022 16:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5A6C433D6;
	Wed, 28 Sep 2022 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664381220;
	bh=yR40IyiKNghcwozl5s4qZL70bzhELlgHqRQpLqph6PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q8FqFRW6g9N8kJ4CKlga6Su7lex28H8npg4J8QOM3iF4T86T5r/gU1LWisnRwiLAs
	 engUFgZgzTE8VpBC+t+8FiRqzYna2BvSXnpmFfb16aZVzYlKzoMqFYzgStykyP1UjY
	 kUCBDKIoHTmrbP5rUN4myZsf/Hoq4nLP2NCOd+7Z5iW4Vt4/gePNAStajpZPp4ubk3
	 iPrIGFmKjPqxqfvAjrChG8bgRbtl5Zt+rqbvpSkYeAkn4gmrMgHO0f3duLBhPBlONr
	 4fN1p5P/wQzpLTaNKS8Eo1O7tNwdRXGJpXiSJyAhx4pLZWL/Wcvx48xvLUPiyrCV/b
	 GRgxClZQTy48w==
Date: Wed, 28 Sep 2022 17:06:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org, patches@opensource.cirrus.com
Subject: Re: [PATCH -next 2/4] ASoC: wm5110: Fix PM disable depth imbalance
 in wm5110_probe
Message-ID: <YzRxHjYeWvZF6eLW@sirena.org.uk>
References: <20220928160116.125020-1-zhangqilong3@huawei.com>
 <20220928160116.125020-3-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="shKddTOcU1EEaNy6"
Content-Disposition: inline
In-Reply-To: <20220928160116.125020-3-zhangqilong3@huawei.com>
X-Cookie: You look tired.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_090708_719615_C0FA3430 
X-CRM114-Status: GOOD (  13.15  )
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


--shKddTOcU1EEaNy6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 12:01:14AM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of wm5110_probe.

As documented in submitting-patches.rst please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

--shKddTOcU1EEaNy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM0cR0ACgkQJNaLcl1U
h9ARKgf/XT+YEn5Jf/8OTfDyxC1ZZM2eH/2FjIo/2Ft11x0up6D3/PB//lgfo2OE
3mgpLNN5tdCHrBZTK7mccNaByUPe2hlozWKz3qNAhmjMnKsYQCsUrqcS6pwQxzBt
DVx7TSPbywHG+Bey0otce8BhZDe9mkHLvruPnDF7GMGhDFhcYVAHSjfZHvTKvogD
fD1VyKZVzTjP17u3njFVcyQBkHUTCHtcRftqNaByfT9rmGxTBwuk1ULIhZc+N+Mr
D9fCbPxVWQ6MkfVQ6y0VmLviyJM+eohDpSSW5Dt8LEqMz4aWbSGWhPVYsM1GOG5b
5My9wrwmHlpJ5vAf8ws0eH0Aev14+g==
=zqUB
-----END PGP SIGNATURE-----

--shKddTOcU1EEaNy6--

