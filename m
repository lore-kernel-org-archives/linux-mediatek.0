Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF685F99C69
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2026 22:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Frw2WIcsMXau1lzNqvo61mU42MBSPeG0i7j4l0PnqU8=; b=ANVw1fGBOFcitt+xDljJ+gxJtn
	PH1sPT/a286B9vwlLeIhSl27mjBLNoLm5YI+kTR4fpQDHV4BoudefA552lJjiTe/S18VJrXnfLixc
	9DcDSfiTVUA26BdZ+Zkb8iCvxTC8cw3gnX2PtJWQhvh85VhYx9NPUS6ggs2/D+WOa3MMuiGpnGsYT
	foX7NbZhc4x9S6Ka3YzELvCRBJsrHuPAEaPINQWI02DV927Vz0lgsxGT7vCS7Intfn1JWyopSw+qW
	wWEi2PR2DOo8NMo4JTU3mpaW7CesaVv7SLmx/vG1FPUwGG2XSuLdk0GLVwbaY03GQCOo8kVcUoMjq
	M5zKWS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDs3e-00000004XWC-0g60;
	Fri, 17 Apr 2026 22:53:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDs3a-00000004XVh-3xII;
	Fri, 17 Apr 2026 22:53:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B14640E27;
	Fri, 17 Apr 2026 22:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEE8C19425;
	Fri, 17 Apr 2026 22:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776466381;
	bh=Frw2WIcsMXau1lzNqvo61mU42MBSPeG0i7j4l0PnqU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WD+AArgDs+vyowQlE5XeV2t9ZJObt/J1PFD4+zhCh6pjvkZOkeoXeGlT4FIcuTw5d
	 6KOggY7yyvLsa/1jBjN3oYKmfuPg6aRAEc1FjGGRfsMhpwJH4JR3XFR/SJQ/i5buOr
	 qBefF7+8NhwuMHxxCC/vuAg+nJcsbFwbIgeZ9nY7KqnRbVrLq4EbrnvFJlz4B3QNeA
	 w8vHjVGd1bLmbjN1VPlzPpyd8PFVKr9QsgM5qcBB4niTWCjQNzt+7851Rp+s10t0e6
	 7qlfMxBT4PPAPYsPiV0pMnI48o7oUnxCe+BeYGRWyF25EwJMaxaPQepQK/IyHnirWU
	 zXKGRPvcAlgyg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3C6671AC57F2; Fri, 17 Apr 2026 23:52:57 +0100 (BST)
Date: Fri, 17 Apr 2026 23:52:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Cyril Chao =?utf-8?B?KOmSnuaCpik=?= <Cyril.Chao@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Darren Ye =?utf-8?B?KOWPtumjnik=?= <Darren.Ye@mediatek.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 08/10] ASoC: mediatek: mt8196: add platform driver
Message-ID: <aeK5ySqgvHdBvuuB@sirena.co.uk>
References: <20260324015719.17543-1-Cyril.Chao@mediatek.com>
 <20260324015719.17543-9-Cyril.Chao@mediatek.com>
 <892468cc-7eb4-411e-b91b-f14789d8da0c@sirena.org.uk>
 <da5752796e1774b6bbc24f5ef1ab2529e24a384f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Z+JCqeY2FxPdfrp"
Content-Disposition: inline
In-Reply-To: <da5752796e1774b6bbc24f5ef1ab2529e24a384f.camel@mediatek.com>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_155303_036300_2CD74196 
X-CRM114-Status: GOOD (  10.04  )
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


--1Z+JCqeY2FxPdfrp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 05:53:25AM +0000, Cyril Chao (=E9=92=9E=E6=82=A6) w=
rote:
> Thank you for your assistance in reviewing. Could you please also
> review the modifications in the diff? If everything is okay, I will
> include them in v9 in the next update.

That looks OK from a scan through, though it's possible I'd see
something else if I review in full context.

--1Z+JCqeY2FxPdfrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmniucgACgkQJNaLcl1U
h9DACwf9H2I11k4JlXEGCoDjtI4sgy3/SrHG9jWgFJ4N+WaSWg5a00Cs1icay7Lz
CrAmRcjVbCuLniYSP18LS3Mbv8dtKs98W60KdDGGHDz3pxFCKGYr4pnhkXdM/SFz
D0PbcBHlaj11Abd4kUSeTG3JO4GiEUidCja0vZX+YYGVaPJjWeA3SJwZuvkSjUcM
FJ6hhGnvDJcyhwt29fV+FTYVe8gYxUYQFELH0vKUwsk5gj58vi6ZFHo+1GDSwBbC
KfCAO2nvkF1mJhLJckU2xca67RoYdMULyNCkh5ig/8g6/u54TuD5smI4wByhHmwK
Qw+KSoMw96DdwqNqYYb0Ewhh9pl92w==
=Ugrc
-----END PGP SIGNATURE-----

--1Z+JCqeY2FxPdfrp--

