Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A233CC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSQDH9DcbUcC6QUuOUfyfevI6EW1l3YPQhbc1mqY79U=; b=mOTfAy7yUSuVy/xDFb5OQbxoYY
	NYkE3o2ZsLnhFC4kq//IG1HN3I9lQOWhsCy/MMBvPG6jEgjoHQJVy16jPDaeuZ8A3sB1R03IwyzEj
	U71FjFznR5zjeOzacSb9637YlwGRLsXgQZIkeibscqrXM5USpFN6atmbAHqnO3MfXPgHRZhOQp088
	bTxFOwAvIwju/h6/+WNyl0hHc50/u4e1f+VGolECT0SUN/kNnRQe8yVpDyWMiSBnjRn5GzKx7E85l
	OErnNvu3odgVLh+qTNbpijseXRQUlq5OC85i0jLUgdwPlSj/Ohstrj2KOEh/zr4sOwsSpEGrKDnLk
	qTqOrofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofPNs-00757x-53; Mon, 03 Oct 2022 17:37:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofPNp-00756t-Pl
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 17:37:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7252FB81085;
	Mon,  3 Oct 2022 17:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DF1C433C1;
	Mon,  3 Oct 2022 17:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664818654;
	bh=kSQDH9DcbUcC6QUuOUfyfevI6EW1l3YPQhbc1mqY79U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfC7a95NFUEUtwQ5tjnTpjp1m+tqpRKb7raF/HJTUkUAsOwbdfgxdBvI126ia5Lfr
	 hR64fi/gWkLEUtIfdF+PS59xeyJPJN6Jt96nVaaIMdwQj4l1g8XlT+gHkJDHhEPwGP
	 S3+hQ63v+ofvqfRw/4hHTghPbK/JDh2R9VOIPfgHrS783I2ftLHyJ6jRVYipUnMK4g
	 +7hNeXlahBJ24n5TTtgwzplCtEmt4dwgXP6K/Ed1LSAJ8Tu2DXfg8gT83B2dYIMPbi
	 BMDOz0lLTc7/hmG1Ph6bC/GJXLdCT40vw3D9OoFwfAN73OmIuJjswZGYIX/XuIVu8v
	 n1m5nF2La8ZbQ==
Date: Mon, 3 Oct 2022 18:37:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	matthias.bgg@gmail.com, ckeepax@opensource.wolfsonmicro.com,
	jeff_chang@richtek.com, alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 4/4] ASoC: mt6660: Fix PM disable depth imbalance in
 mt6660_i2c_probe
Message-ID: <Yzsd2ctRQB/6Tdvc@sirena.org.uk>
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
 <20220929150653.63845-5-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hZY/cLFnhrylGE4A"
Content-Disposition: inline
In-Reply-To: <20220929150653.63845-5-zhangqilong3@huawei.com>
X-Cookie: Store in a cool place.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_103737_994942_7CF4006E 
X-CRM114-Status: GOOD (  11.19  )
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


--hZY/cLFnhrylGE4A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 29, 2022 at 11:06:53PM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.

This doesn't apply against current code, please check and resend.

--hZY/cLFnhrylGE4A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM7HdgACgkQJNaLcl1U
h9DeXQf+Pcn1W5iMv8sq7yHqIH+EEwcqfrgjbAl3T/+zCd79/uPnzlz93ic2vHgI
sn6QKTTb9yNqyp30+FzJQcut0kRNT2My/Ykw7AC7VDHERVEqpOVFFvyRh7XvRxvt
pC2NwRH8WRGvQwJe4D/z9EqdAv0h1MgdaRjh8+IWdUyJz3+XsGcnd0TJ3XPYMxrm
vnj8a3M6djEJJijZtkooEgteByH2I8YI/ggXTgh48C2y4SJ8pu3mjTkGWTNhwbHp
FmMDCUVrKab0AxFbtSk7RClP5VLTCnHr0Ot7ThE4BdYBB6wNeDJtA2jeddd1FHPs
6UF1eHrFgwEYSEZ7DsiSDwRyoXQhyg==
=bQ2p
-----END PGP SIGNATURE-----

--hZY/cLFnhrylGE4A--

