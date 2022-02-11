Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzpIU0PEyvUKGksfXCOiRvMq1pYfAyWlRnsXv8WmVgA=; b=tuMK0FL4v0ZPLVcfkk/qeL91VI
	aL07VhGpqIr/66shR/hPmRLxPnckchJZ+QI3p5nS5ug5UFX3h01GiAoLSOj/FFbvQ4P6wgutk92ju
	BqRrukRB1xeWtorjpwJufcbVpe2ryiqViSsznXbiny+DxALEqR8MGcL+m5ftFgoeWfwFukk7tLVZ7
	Ah6ktIi/uSdwZB9PSmCmknyAdWHc6c7x1IJ9leDVEZ4fnK6qW2PLn6meNOc40qF+piKx4YafDVNL+
	w5XkEFMQM0CUf39ZNKVV7LhDGPY7rDG+r75nh8gVyZCHiK6Iy13psjGHOkXas96Ql8XWggwftAITA
	P2XOpVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIYXM-007x3N-Sk; Fri, 11 Feb 2022 16:12:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIYX5-007wyT-U4; Fri, 11 Feb 2022 16:12:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 906D6B82A6C;
 Fri, 11 Feb 2022 16:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB90C340EB;
 Fri, 11 Feb 2022 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644595945;
 bh=rgSRG/wI/UvP1JIcRcANguOObOhXqt/uGPw7rZYmMLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TH0MAjBSPqE4IvkEaG/RqqjT//6OxDhIaX4ubPKeBufLBVs+dhZOSFK76aUYUIrFu
 qm3Q+9OuINork29yHWxhWekK77boma+MX+IjD6R9YfY+PtYB1WtxsvcQq3H0qzE8kj
 fMEaAzT+nHQQNoA75Wd2N3/mqGMd4UAWe7pz/iO6v8MFKpcQFelNPDWbiXMKx2T8N2
 hyCknDNwaFNyJff8KDVIr5Ndy2b12grxjQXCyMli2hTx9y4czC4fWzJLiLhwgw3iNh
 c3RgLyGb5dSSXN9m5nZQ3qGxBkZsW6/C2qS0l8OzNN2wMfOS0SLqDusMgBWWe5+25A
 e310hORe+8+Xg==
Date: Fri, 11 Feb 2022 16:12:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, p.zabel@pengutronix.de,
 geert+renesas@glider.be, trevor.wu@mediatek.com, tzungbi@google.com,
 zhangqilong3@huawei.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/15] ASoC: mediatek: mt8186: add platform driver
Message-ID: <YgaK4hiRjEJi9wQ4@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-11-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220211103818.8266-11-jiaxin.yu@mediatek.com>
X-Cookie: do {
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_081228_161258_FC353DFE 
X-CRM114-Status: GOOD (  13.80  )
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
Content-Type: multipart/mixed; boundary="===============6774453216464351767=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6774453216464351767==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gYCP5ior9YtfvDdG"
Content-Disposition: inline


--gYCP5ior9YtfvDdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:13PM +0800, Jiaxin Yu wrote:

>  sound/soc/mediatek/Kconfig                    |   44 +
>  sound/soc/mediatek/Makefile                   |    1 +
>  sound/soc/mediatek/mt8186/Makefile            |   21 +
>  sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |  719 ++++
>  sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |  210 +
>  sound/soc/mediatek/mt8186/mt8186-afe-common.h |  245 ++
>  .../soc/mediatek/mt8186/mt8186-afe-control.c  |  262 ++
>  sound/soc/mediatek/mt8186/mt8186-afe-gpio.c   |  211 +
>  sound/soc/mediatek/mt8186/mt8186-afe-gpio.h   |   19 +
>  sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3030 +++++++++++++++
>  .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
>  .../soc/mediatek/mt8186/mt8186-misc-control.c | 1729 +++++++++
>  sound/soc/mediatek/mt8186/mt8186-reg.h        | 3433 +++++++++++++++++

I know it's already a long series but perhaps the clock and GPIO bits
could be split out into separate patches?  This one patch is over 300K
which is a bit much in one go, especially when it's not just all big
tables.

--gYCP5ior9YtfvDdG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGiuEACgkQJNaLcl1U
h9CJtQf7BDZBnFCixO3E3MMHZvLzF2Pnw7+W3qm+6WvLPzVSD0iOyTc1J3ZrilB9
06VgI3G0b0T12wP+S0o0m4nWBfjBuFcSm0SlMQ8tNHm4VNZz13RJWL/HFKOWBmyL
j3orzapgV2Q46cYWkZpRu1ghoNt8yHbXOtj9fM847nykba62lkcTCCMQkGZCxPuU
wSQvZko3pHCRhRV24sQuIuLE2XhP+trDjSJzEG7EpcgPC2OLioAtCOZMaqbjLT1P
7K2gfHPXcBfiCOAn4p/Ns4votdDgBcoPwnyKmcn1V+wuRKdGQT5E15QOAyRi6s3Q
9pCv5S38o6lxca49gRWRCRt7T79E8g==
=dsn2
-----END PGP SIGNATURE-----

--gYCP5ior9YtfvDdG--


--===============6774453216464351767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6774453216464351767==--

