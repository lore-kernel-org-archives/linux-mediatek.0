Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4492C71133
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WR5rJnMPFIZbEiu4b92VXv4anq8fAF3KLyv5xA8v0MY=; b=Iab4inewfHNWfzvMsXEp54aA7b
	lUeVaAEE7VZdLqJUuBcBmSajxal01rH1HCqDSXsJLfX44RUyKXNgM70ZiQDMhChcu2B/1UEhqLEqD
	+ANkeaGbSC5L/6Glm52LIn5dmLmJT2QDgU8nNzqrEQSYzdhl9G2pnwsShjtKya5yvq7QcuVdDEt+C
	mU36oAOMpl4RpYeaelke8tyNsQ8GmpKWf62UmOh/VfX/KJujh8WvaimtHmR6X2tE8NNGJE1sFtuUI
	kcUxXXU52Ahn7K954HRvKmH4+IhRh9vZoGizIz7VqJ7lMi2E1CQrXVZ7nNQyB/s0B5H0CvDEvlgl3
	B9dv4tXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZU3Z-004orW-0a;
	Fri, 25 Aug 2023 10:28:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZU3W-004oqz-0l;
	Fri, 25 Aug 2023 10:28:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26CE562FB9;
	Fri, 25 Aug 2023 10:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1794C433C8;
	Fri, 25 Aug 2023 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692959320;
	bh=WR5rJnMPFIZbEiu4b92VXv4anq8fAF3KLyv5xA8v0MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lw9HMWnReyvbebZjrH+X9I3k21rtlkBbHd6UEGDrlEHZvQDizzeEYySgTxpa4CcEf
	 SlHl/iGJw9lMPXeBNRSL/CKUPO3rKxYCwYghx9JbxpToYYdciemjH1k3GyyUARfYLV
	 4Dr31J46FVIoi891flKwEG3sC36pPt8JV9dtEFlsgoUcOadPMKuk/AILxASCO7ipyq
	 4nBP8VjTrUCt1h5KWYxOMfY/9RIfusu74+PaHgCzlfomG57cCExdNtYgRKun2fYm8I
	 x0n6wT6qwxWdiEw3Cmk63PkyX1CZI/aUwPXaTEY62PryuK0rsEr91GMKfGV1cOAux/
	 GwrXKrt1PeRzg==
Date: Fri, 25 Aug 2023 11:28:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND,v3 2/3] ASoC: mediatek: common: revise SOF common code
Message-ID: <ZOiCVCJMaNX9Xhgy@finisterre.sirena.org.uk>
References: <20230825024935.10878-1-trevor.wu@mediatek.com>
 <20230825024935.10878-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qZGV3Md4Y3CzMmE6"
Content-Disposition: inline
In-Reply-To: <20230825024935.10878-3-trevor.wu@mediatek.com>
X-Cookie: Give him an evasive answer.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_032842_340832_B719597D 
X-CRM114-Status: GOOD (  11.17  )
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


--qZGV3Md4Y3CzMmE6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 10:49:34AM +0800, Trevor Wu wrote:
> Originally, normal dai link fixup callback is overwritten by sof fixup
> callback on mtk_sof_card_late_probe and it relies on the mapping defined
> on struct sof_conn_stream.

Angelo?

--qZGV3Md4Y3CzMmE6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmToglMACgkQJNaLcl1U
h9Dv3Qf+POxM9sVWwvYGhP7SaK28bRrbWzMUGisxBE2aZby/aauTn/kZqgsiks2R
Etc8yDkOPbuDz/xyjvRda6ABgbQ7HYduuhcHxOmkfJMaAkRUtFG9kUJ0ILE2+lMV
CBP+y2Qtn1Zqfp4Fr6Iqq055uAWv70LtGNCeMeWuDBh9Insy2HVGQ04sN0voOKzl
x5rQNFFrriXLVejqXNaQiqON/h4XqKuSBX+4ev+rGORpy5fzSPamX/+ZnPqYtbeK
zs0dBIRZF4EcqHWvq5nhJr7VxUg9ROUeTnoXvMYWEtJMK1JsTtM0b8pYmz/3JFxr
bToxhRrTPnbUzLetGKrgYTRtpJEHaA==
=bFHg
-----END PGP SIGNATURE-----

--qZGV3Md4Y3CzMmE6--

