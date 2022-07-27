Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01498C19F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 12:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYlfHhZS5nNnBcVpoKvotCjnbGCGmx+c8y6ayFMdDwk=; b=RYbw25Sx6Wtj88yhQCBm9uI9/X
	FbjANKB57E0wtfvVt+0/Hyp4v7QR1lRS3hh7Co0sS6FNhaBziVYqsIt+nRoin1kXmmmUBsRpG+f7P
	kNcCUMQo6JOI6EXlbkp8jkONnrhYz3uB14GjMZ4B8tVqHMqKQKmrCx8Jy15VwNIFxUWXWTNzpssJ8
	ra4R5U5MYzDbNUMn35aAMj4Gvv8OIFcNN6knIsMp+6X/fyvUeZfOEcUf94602uu4cGf+QKhlXorZh
	JmynTSz/7EseiXfmdici5ZE4U/o4TFxQO0edmq2tlAbPScu5LefbMsHnGVi6Dsm3vlXGNEK7CAGSY
	4A0iRcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfjP-00DFKM-GV; Wed, 27 Jul 2022 12:01:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfjN-00DFIR-4B
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 12:01:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78FBE6009E;
	Wed, 27 Jul 2022 12:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EA7C433D7;
	Wed, 27 Jul 2022 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658923295;
	bh=hYlfHhZS5nNnBcVpoKvotCjnbGCGmx+c8y6ayFMdDwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iT0ED3VvEOhUC+vzOLgiG8/2jadT5tO51UofTJqMUv46x0EM78C5wafH7nCv51hGy
	 vvz223Yt2nf2bPubccBc5zoBvhYtT3V0C096kYPZGI/wC/UlSSsAq8P098V8V+sLaO
	 sfkeSdGFvL6SCBSH1GI1ZTjLWKoa5FLOyWuZxdpm63EwCpCBWMLyDYmASnZQU+QlJR
	 9lIvH/HPEmcobJjmAVW0MDN+xUXacnnKh+uQXvwLrlk7E4uW+WOA5iyOwLHY4EUf5Z
	 SYXOAkTtADK2MMpgyIVFvh2n+4R81zBf5+mjqPaopu+I6Am+B5LKWGKswiR9dxFlvw
	 eMJBNnsLRznRg==
Date: Wed, 27 Jul 2022 13:01:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chenglin Xu <chenglin.xu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH RFC] regulator: mt6380: Fix unused array warning
Message-ID: <YuEpGTD/DbC1T9Z0@sirena.org.uk>
References: <20220727132637.76d6073f@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+UGA3SVN/7XA5mgj"
Content-Disposition: inline
In-Reply-To: <20220727132637.76d6073f@endymion.delvare>
X-Cookie: No motorized vehicles allowed.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_050137_221069_B5ADAD8F 
X-CRM114-Status: GOOD (  15.48  )
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


--+UGA3SVN/7XA5mgj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 27, 2022 at 01:26:37PM +0200, Jean Delvare wrote:

> This assumes that the mt6380 driver can be used without OF support.
> However, I can't find any in-tree piece of code instantiating the
> "mt6380-regulator" platform device by name. So unless there's an
> out-of-tree user, a better fix would be to remove mt6380_platform_ids
> and make the driver depend on OF. Chenglin, would that be OK with
> you?

It's helpful to keep the build coverage high.

--+UGA3SVN/7XA5mgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLhKRkACgkQJNaLcl1U
h9BSBwf/Y0QxIwkYpaF8CB4xGeqHFOqghj/Dj9sa0aWjIpBsaMkNeNxMHtqRtqeY
GZGehdnvw2kccw7982xlwlA/xRLnEnjRjNRuhx7FeudSQSoWqk6JuGvo45f/IkEY
ly8kpfFBAw85hdE2CdoM2bLYNDe4R09hlcdmVI5C31/RuzbyVbmm4Kd2DS+AaGwX
HYAVDVugwQwi4/aMIsoaXleFVw/ImmCboN5WklrsdQc8iiqeju0t5eJuWy6nzAbk
5a/GeIZ5q1u0QM0XE6jarTqiUuQQ0jsZfIgeQWAC3qmZpy26RcPI5gzKPXJEbjya
8tLdIvzBzB9ZGbc8ijkNHccUyBt8qQ==
=FE8f
-----END PGP SIGNATURE-----

--+UGA3SVN/7XA5mgj--

