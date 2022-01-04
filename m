Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BB0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 15:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfi+9Ze1SfLFqZ1ihH94P5Td5OxPxsieSiNJv3Qs5bc=; b=cprci/qoW3VLpgBn4MoIqARMh4
	NtIjjMgO7ISZQMNgstEoZWgNXjOJZKwgjfQqsCu6If5jXBGJ1rRyGw4ObATzjnyb0IOkWN7gyhQpH
	PUvmbF3pXEYaewWjrmEh+Y/Qgw7SfQVaL+qZTkvyCbqD2p+vHiKftQPGcqwWPFawJIFXZRpnemNhV
	pr6WJt41JGbW1tNxFF9UB/biZh0waTuJPbI6reAbaqejWjdlfHJxQYjonulJ7wCqjnpEBZ4Hit9n0
	9x5+0Ir3NCQqeFjHNddxDKdpFcbH/3QTf3Hd/oek9zCmTUFA+bdBFlr8o2I6uruLMgJNKJbMKoI4W
	E3AoIAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4lJg-00BqIH-0Y; Tue, 04 Jan 2022 15:01:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4lJC-00Bq80-Cc; Tue, 04 Jan 2022 15:01:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 339BC61366;
 Tue,  4 Jan 2022 15:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2CBC36AED;
 Tue,  4 Jan 2022 15:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641308464;
 bh=wCYKl8HbAjB3pp9BNkTP2Ru1EwIirs5CBVCUZdD7ZS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DEjGuVGCCiV2hhzrTyu5w6cT20zmchrG5CkT5WZfOmfs+whyq7NsKxZnkGx12vpPk
 y49mxvWs1KkJYAIil08529UyWwYBdBSb4Epl8uVpRMY2LuvzZldEISnc+tXauBX5tw
 Iuf9XIWUiEuKrghw104N5aNP4gtu/XqEG4S2oRL76ufW8bh1k2qjvzVZB1OUR0rmpI
 BAUv0yCSyqO5lhwtaFymzxxJvriRP+cC9D6KLjQzLu9I1LB4wkodmAXgsARGINGx1o
 1HpWHF5CLrmq39fVP9xXjhhpYjv67LSTScAUQjBOFDragSj/axLi8oI3OiJMZnlSjR
 /dBHcDLfVaPug==
Date: Tue, 4 Jan 2022 15:00:59 +0000
From: Mark Brown <broonie@kernel.org>
To: "cgel.zte@gmail.com" <cgel.zte@gmail.com>
Cc: lgirdwood@gmail.com, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] drivers/regulator: remove redundant ret variable
Message-ID: <YdRhK55op7XzJAuj@sirena.org.uk>
References: <20220104104139.601031-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
In-Reply-To: <20220104104139.601031-1-chi.minghao@zte.com.cn>
X-Cookie: Many pages make a thick book.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_070106_510760_0F142BB5 
X-CRM114-Status: GOOD (  12.41  )
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
Content-Type: multipart/mixed; boundary="===============7038975744974538754=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7038975744974538754==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Sx7lbAcr290ea0T"
Content-Disposition: inline


--5Sx7lbAcr290ea0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 04, 2022 at 10:41:39AM +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
>=20
> Return value from regmap_update_bits() directly instead
> of taking this in another redundant variable.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--5Sx7lbAcr290ea0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHUYSsACgkQJNaLcl1U
h9Cz9gf+Jguh5RAvwtAq1ZZhx9QN4sxPnzcsOzGnkE+J0ovjiN/tTj4cNGD8Bhme
De7mYFsFY9gAyMD9iqc2ruHwrh7cVTlz5nGeA+WBljF+UxcDDHul6s1MG+yvmSXn
8+Oauy3QRj0mliWQZzTVQM5kBzLWhoClw10YtgBHgNFcIYms1zVrFUAY5NrnPdn2
ECqpZciLMNCBExN5GS5NoX5vj9FwlqgFQT1+udpcFkECmZ6CO4zAxUWWZ1Eo9PJ2
Gim0Ea8dcbjkJmXY0zyG8kbkWW2ZULebdWHanxJpFL9Z7yFeJgJmfGeYR1cQd5si
zW/HbdD83eqnRx4NP06Ecv/9NZTXMg==
=7l8d
-----END PGP SIGNATURE-----

--5Sx7lbAcr290ea0T--


--===============7038975744974538754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7038975744974538754==--

