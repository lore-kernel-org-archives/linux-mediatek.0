Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09623C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6tA3sMNTJ+pfpG/2lKC//CPyCDix7bT9c5q9QV/Y/o=; b=Qlq5LhG9jMD1slZxjkxzlsQJa9
	spNX9jx59qeSgCE4eXl/uydBk08CYhqh61c2xyb01hBqktPv4imS+RdhLdKs/j5cdlqn1k5UFHbvh
	RHW3GIHEY4Cb8KRj/n5ItHjGTtQ4Goi1cPyEC55TMdDxPmn6/4JV+8+9WFz8eB1MC8309QICBtDhW
	ukvP+IzNj4Fik+2XbwIQVhsebm3agNWn1dpl5hKNCpwN7npMl51vg1oECR3LvU58VKPMhfPW8NiCJ
	cbgK0pImM9zCs1DMfTpePGmq6mfSDYgjLybhzS5SyDY8rGbMV26031judb542meu/kMa6CfIMwmSE
	hojYucKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXra-001hai-Aw; Wed, 13 Jul 2022 08:36:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXrW-001hYz-QS
	for linux-mediatek@lists.infradead.org; Wed, 13 Jul 2022 08:36:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC9E461B47;
	Wed, 13 Jul 2022 08:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B98C341C8;
	Wed, 13 Jul 2022 08:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657701409;
	bh=A6tA3sMNTJ+pfpG/2lKC//CPyCDix7bT9c5q9QV/Y/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ry8hELMwHNQ2QhoXuTTwsF7tgUFIR9eGcSpsok6XkU+nhmiywMwWA/kOVVEODTPmT
	 8mwVXpOal3j3vrM0RFCAEXdD7f2SrSnTYEuee65gAhq+zBaO4AqCZWkQX3mapiXnD6
	 xBEQwEz1aELGXCh3Xl253e9+XqEfIzCuhbfwyW08k0Fm6s5fFPWM6qTVlyxygYgprm
	 AL06vjm8Aw7bpm4IfZM1lzY3MXnbGySXxkONCZ/9QC6p/UYxi6C2AZOqxlHCpg8xhu
	 A7bWfqG0iC91M2uPgQTHzBU8YYNZnm/Ci924hBh+VkSIjXFMy+1H4Gl11+Z2cCT8mN
	 rBJxVyy40VwLw==
Date: Wed, 13 Jul 2022 10:36:44 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
	ilias.apalodimas@linaro.org, lorenzo.bianconi@redhat.com,
	jbrouer@redhat.com
Subject: Re: [PATCH v2 net-next 2/4] net: ethernet: mtk_eth_soc: add basic
 XDP support
Message-ID: <Ys6EHHsFegBNX7AD@localhost.localdomain>
References: <cover.1657660277.git.lorenzo@kernel.org>
 <660481b3292e8438b08d129d74e3bf62fab51db7.1657660277.git.lorenzo@kernel.org>
 <20220712205655.3d3ac17e@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5VjmywQPtWCzzGKa"
Content-Disposition: inline
In-Reply-To: <20220712205655.3d3ac17e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_013650_925355_FDFC3B83 
X-CRM114-Status: GOOD (  10.67  )
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


--5VjmywQPtWCzzGKa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 12 Jul 2022 23:16:15 +0200 Lorenzo Bianconi wrote:
> > Introduce basic XDP support to mtk_eth_soc driver.
> > Supported XDP verdicts:
> > - XDP_PASS
> > - XDP_DROP
> > - XDP_REDIRECT
>=20
> Looks like you're missing some rcu_access_pointer uses here.
> sparse is not happy (2 new warnings)

ack, right. I missed them. I will fix in v3. Thanks.

Regards,
Lorenzo

--5VjmywQPtWCzzGKa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYs6EGQAKCRA6cBh0uS2t
rLWjAPwI6shWgE43M/Xpb/QhSWb4o2/OdUberrqRR/xZqqx26gD/bMqP6MJE1rkf
aYlOtz6trKkcARZsrHcOwkzCRYgRdwU=
=JkcI
-----END PGP SIGNATURE-----

--5VjmywQPtWCzzGKa--

