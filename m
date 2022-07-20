Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1389AC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlniCXIjmJIhQPHhab1IXU3VrLB1Ym4LR4ASTuUus+8=; b=BzYvtr+7B9W4Uaj8/W6V8f59Rz
	hjnD0CiUl0XGlruefD2W1yJCQii2trEGGefOYz3WioYl89JIkWAqLItQoQg+RIGkcxUniNGkBfD2C
	Rp7Psr8EfSZPBK/KuXMHKhsjv/3yse5d4agIZXOVH97zRKi5uGGHMzJ53EeYkDXoJ26YvO0J4pMuA
	IM5iE/Apa1VkSWQ4PdCClwfCkra8Pwu8bLo9um04MKQ5tNXnTfu8N+DHV5U9+xv5CsecBqxXKVVVM
	I4oNm2f2Zai2FSEhemNlRSnMSP+QdY3gJgYDe4L78Tjg4zRwrIO4ay/zP6Sp3OMnA7j6PX8loT1wp
	z1nsGJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE4OZ-0028I3-1V; Wed, 20 Jul 2022 07:45:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE4OX-0028HZ-F8
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 07:45:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 50BE661958;
	Wed, 20 Jul 2022 07:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07469C3411E;
	Wed, 20 Jul 2022 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658303119;
	bh=AlniCXIjmJIhQPHhab1IXU3VrLB1Ym4LR4ASTuUus+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efXR05KbN/agYn9mcVb0qYORBpmoq7uAiYu8AtIgKtXRfa8DdgHN35wZCY6yvudee
	 0g3JR+XR+mRwE7jW8cHGoVyGsk9JvnYj7tcmlz4CtjuxAjXjlWQgGpQlDI4hg9WMrF
	 w/2OC8ddKGDYEFtbDmT0KvMjV/esVkhN0+3fT0/I+ws1/g9UlEsUsjRhA51Od7FUWA
	 s98/bJzfOAElpE1I3jRozuAoM1Sp3oTxdTdPG62uBGfci2mh5NfkUxK12Yfd6Qdxur
	 +c5fpQnZrhdkiaDBo0WC0K7Yr49VFNFamv8oveH6m1JMD3fo3tzHJxJN2eM1rY154W
	 1pWhvFLlKBVoA==
Date: Wed, 20 Jul 2022 09:45:13 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	pablo@netfilter.org, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	Ryder.Lee@mediatek.com, Evelyn.Tsai@mediatek.com
Subject: Re: [PATCH net-next] net: ethernet: mtk-ppe: fix traffic offload
 with bridged wlan
Message-ID: <YteyiWvRGSRAeAIJ@localhost.localdomain>
References: <7fa3ce7e77fb579515e0a7c5a7dee60fc5999e2b.1658168627.git.lorenzo@kernel.org>
 <20220719174038.7ee25c6d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ylvo4zkjxaI9i2J8"
Content-Disposition: inline
In-Reply-To: <20220719174038.7ee25c6d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_004521_586771_ACDACEA6 
X-CRM114-Status: GOOD (  14.50  )
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


--ylvo4zkjxaI9i2J8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 18 Jul 2022 20:36:39 +0200 Lorenzo Bianconi wrote:
> > A typical flow offload scenario for OpenWrt users is routed traffic
> > received by the wan interface that is redirected to a wlan device
> > belonging to the lan bridge. Current implementation fails to
> > fill wdma offload info in mtk_flow_get_wdma_info() since odev device is
> > the local bridge. Fix the issue running dev_fill_forward_path routine in
> > mtk_flow_get_wdma_info in order to identify the wlan device.
>=20
> AFAIU this will conflict with 53eb9b04560c ("net: ethernet: mtk_ppe:
> fix possible NULL pointer dereference in mtk_flow_get_wdma_info")?=20
> We merge net -> net-next every Thu, please wait for that to happen=20
> and then repost. Conflicting patches are extra work for Stephen and
> for me.

ack, right, sorry for that. I will repost after the merge.

Regards,
Lorenzo

--ylvo4zkjxaI9i2J8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYteyhwAKCRA6cBh0uS2t
rMqNAP0UkJbZdsHrCjga7YxdeBzjLAcEwucNWMwf3HHYLMOHfAD+LNoP+s9tN16w
Yb6Bemq7UuLopuVdPx81XvbSFs49Pww=
=zvZO
-----END PGP SIGNATURE-----

--ylvo4zkjxaI9i2J8--

