Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE405C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5t578IntArhefASWL/z8BTXcOQsW6QT4XJMG79HzNMc=; b=gU2MaBcsit5g1WDfh5y7Swd97F
	1rJJd64SZgRfNipbcNpu6sUgCygO+c7GxcylsdxoBdMhT3TearNJi89RYd+DRrJ7s3cyaBKV8dP4u
	cnRjHE3gd29TI7FFz0Trlt6purAObbMuoZkB/OvnrXYJ6PVdaGyuhMSaAhR31ROELdp6LxahiTF2E
	0pb+2twgAYw0PUXXBaf5lkn7KpHKznIec0ArOdHMjdDd0JhdLs4w/D89fBj30Zi6tuLEziz/fMEOM
	wmDir9ahOvqlZu7ZbE0DPdf7AeKMVkTNP9kRF8V5vEdT7yl1uKwhDcgCorIAuNhKX7aXsvOB30qln
	YSy4RiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myEQR-00AgOI-38; Fri, 17 Dec 2021 14:41:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myEQB-00AgJ2-Um; Fri, 17 Dec 2021 14:41:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74E84621A5;
 Fri, 17 Dec 2021 14:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8BEC36AE1;
 Fri, 17 Dec 2021 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639752078;
 bh=7Cvnp/ZTaHG8nzRCSQUsaA6z+nwKUnTyShmyFjYF6+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q6ktUtpev9sn7AigNJF30+1zvoxQLn/0L/oEszOVrUXEI7TjXdRqhWRCr/BI2MkoT
 sWO2AcsQv1FXWOMUMrsB5qXjX0/kBg1zJDTxk1PgFtPDk3o0QQlUG8/putWroiCOq+
 kdeYRrfoarePADTee4YDIaGEvuqlFECodiyKVRTNk5dZxzaElG9jjeGPCerDzkiV7K
 NPgTYWufqW3a85XD9/1y0bAMcC+XSgtW1kUk36xeSQjxbEWOr4NPi+y8MBmyP/i1E3
 MLhbZZZUK4NISlcl/cr4Nzos1ax3xw2c/L4leY40WVwJFr9v9trBYLbJfsPXgKNfSZ
 x9tZLkpZd4PKA==
Date: Fri, 17 Dec 2021 14:41:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: matthias.bgg@gmail.com, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] isoc: mediatek: potential use of error pointer
Message-ID: <Ybyhir3PjKii/yok@sirena.org.uk>
References: <20211217143551.675368-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20211217143551.675368-1-jiasheng@iscas.ac.cn>
X-Cookie: Pause for storage relocation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_064120_056995_4CC99DAF 
X-CRM114-Status: GOOD (  11.64  )
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
Content-Type: multipart/mixed; boundary="===============0513901659929346301=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0513901659929346301==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d0USlWQysP9phstr"
Content-Disposition: inline


--d0USlWQysP9phstr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2021 at 10:35:51PM +0800, Jiasheng Jiang wrote:
> The return value of devm_clk_get() needs to be checked.
> To avoid use of error pointer in case of the failure of alloc.

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

--d0USlWQysP9phstr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG8oYkACgkQJNaLcl1U
h9CHMgf+JJKucdSSOzHdvJK5oPUKPzOqgM/6veVDk3VPfJb48zMOSmHGfgd1Bim0
oMf5jgOlMZvniPZkz0b/BzGw72b8eTpnHfTqN7tOn5wZAfqyVH7rrC/VJUoPvh4S
6f6dnpPtEt3H83Nqpt2kdc/75qyeUpQxg29ZVA7WwxDQlwOolAXSlzw7fTR9xhmB
D5NBvRtjOleL+tnj0CYmaMzU08jcixi7RAEyp9+KmIvfgfsWXm/x1QEQmg8zcf79
divhLW9uAg13qwgst7ukkqS4Hej0mzm3AqwQ7OEt4QbEr/LibgBPrL2JboAQdlJi
FAfMsmze8wv0V3zbB0qGe5holN1FLQ==
=1UVU
-----END PGP SIGNATURE-----

--d0USlWQysP9phstr--


--===============0513901659929346301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0513901659929346301==--

