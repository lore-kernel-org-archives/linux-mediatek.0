Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F343CCE7B1B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+94ef1ovkxDUotn3z9zLsnUGDP25Sus13xAM/vGrTVc=; b=QAXDZ10NkRbcbs6JB+QP5PBmUi
	CteL45XtuHkVeO68rbrgaBKvaRARt5NzF3nvv45BnuHByl3U6c8GN+AXHy7ny83qvly81P42jbKzV
	+XcVEbmHcolUKe6pegc/Hrp65b3ELQJ3Fay5Pk4GHYPZCUQUQzH9bJz2AnlUQOQNZSxwMoPtj5Un8
	Q37/hxmWNf00+s0mUFSKqxZArWmlyqb8VpxKXatwy3e//BQutyT36Bua4+tXpzKXbLSu/8XaOb8S2
	cAhZ9HFZu7ckp9tAP/PE4qJ8Op0frE5WmgfCeRa/e6VgXpEZxnxXm7QBBHkH+Oj4zPyzPKjkgtx77
	flm8oUqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZUm-0000000CRZw-2ReK;
	Fri, 06 Sep 2024 13:59:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZTl-0000000CRKs-2l1a;
	Fri, 06 Sep 2024 13:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B3CEA44FD5;
	Fri,  6 Sep 2024 13:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93B0C4CEC9;
	Fri,  6 Sep 2024 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725631103;
	bh=UsOmUVqDQNmD3noisM+j25d0nW4Fec14iHTYBS5IraM=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=mO98gDiIIVIKieMLvIg9azVVIgKdPkXqWCTxrh4Sm10ZUXEw4A7Ahu0oKDeLiNyAP
	 UubQgHFD2/4ol7EN5Cy/BpxcTZdQmQWxHEfMUjTmH9q3pdXmWPYTcIZndVR+H8xWXg
	 /0/kJz5UGK85esOqpgugUD0qPhqJc+Tro3gHRM5Uyuf5P5JAitrvAdr0z8kei/4JNX
	 v1n64WkiEAtKafmBvReoENkhWa+9EaQt4LeDUX7mG/jIJzW+ddLrD+WaOkXWrh/G53
	 /jW1K8XBXGkIOCFdauuXDP0kBtDZABhPtCXPU2pptSaFfOEyoJMpXsNMlB9OrbBhwl
	 GX9GdTNAygp8A==
Content-Type: multipart/signed;
 boundary=55c931de707a8ac28990aa7fc9bea0976aa99ad4829328b51d70b1f9638d;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 06 Sep 2024 15:58:18 +0200
Message-Id: <D3Z966PUEDVC.2HJCER9HHLTY7@kernel.org>
Subject: Re: [PATCH 07/20] drm/bridge: tc358775: use regmap instead of open
 coded access functions
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sam Ravnborg"
 <sam@ravnborg.org>, "Vinay Simha BN" <simhavcs@gmail.com>, "Tony Lindgren"
 <tony@atomide.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Daniel Semkowicz" <dse@thaumatec.com>
X-Mailer: aerc 0.16.0
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
 <20240506-tc358775-fix-powerup-v1-7-545dcf00b8dd@kernel.org>
 <CAHgnY3=JKUCRvTtw6NzLvm+hy_GeNigj0tjOmbFupEs+=8f6ZQ@mail.gmail.com>
In-Reply-To: <CAHgnY3=JKUCRvTtw6NzLvm+hy_GeNigj0tjOmbFupEs+=8f6ZQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_065825_805724_34E7B8DC 
X-CRM114-Status: GOOD (  10.81  )
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

--55c931de707a8ac28990aa7fc9bea0976aa99ad4829328b51d70b1f9638d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Daniel,

On Fri Sep 6, 2024 at 3:47 PM CEST, Daniel Semkowicz wrote:
> >         tc->i2c =3D client;
>
> so the assignment above is no longer correct and should
> be also removed. Otherwise, this code will not compile.


Ahh yes. Thanks for noticing. I have a wip patch which I didn't
post, which had this line removed. Will post a new version soon.

Probably also going to split the patches because it seems due to
the controversy in patch 01/20 this whole series is ignored.

-michael

--55c931de707a8ac28990aa7fc9bea0976aa99ad4829328b51d70b1f9638d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZtsKexIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ipTQF9GUYkBrGWgFmmOGO2Uq3wbAB+Bhm/ksnD
WUfLXwJcGfojX55IOBZCeWf8pdDXdgLEAX9I/tyljsvtI8wAUgcMo9s/WDXEq0Z6
dsAH7yvsQBh8c6L/zZzsKbdTDzAxfZlBycg=
=74xc
-----END PGP SIGNATURE-----

--55c931de707a8ac28990aa7fc9bea0976aa99ad4829328b51d70b1f9638d--

