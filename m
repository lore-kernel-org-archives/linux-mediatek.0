Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A5DD216B9
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 14:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dIkEUiVTAefPTGSQ1DsXqyfC5j2X1Y+KoR2VozeEkU=; b=qUpXjvSBWUfbbRhFgAZx4vg9Go
	yhWosYlReAOIZWCC/LOAEo+jB5jDaGkiUGQkzWoWINcKabp6wEbqkP5/rcX8/6iYa1jM1ohqkqdQJ
	gT56DpGFSWqzPr+RP7ESMkpyi16QyJVuLBuDIeZo9vo7WllneszU4as3PnNh6oALLJIH8Bd5RsUGR
	qRcj2EuQfufNm1js1qGa0xofNWtyuugu2Pi+Wrl3X4noL7jmA+/LG/01irTH1xYA+4mK9Lz3z18BB
	xambB9TD0EgXvlHDWIlzv1+uagLKxhX/mjfVMVpVVY55sELJP17BLBHm+N23VxDSyBh+Y3sUof1Z7
	zL6Tklwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ij3-00000008Y2p-0Qt3;
	Tue, 15 Oct 2024 14:40:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ihb-00000008XsI-34oJ;
	Tue, 15 Oct 2024 14:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87C925C5DCB;
	Tue, 15 Oct 2024 14:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CE9C4CEC6;
	Tue, 15 Oct 2024 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729003150;
	bh=3dIkEUiVTAefPTGSQ1DsXqyfC5j2X1Y+KoR2VozeEkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GtGxroolEmsbOtOKKHbMCn+g5f0W9pfoaAh+Ba/uHiEiUudMFgJeEiQxXQ00l5j/L
	 RwGm7erY6HUazc/Qu9hLJ6b9u/nZK0BPheiJx16ch66k8jMJmnsSzfkF3yWEDAfaLn
	 LzbUJXPvnjHiSUvJSAjc+Q/x6RImhJP7Q1snr3FZzIF2wNMSnQyyFyFM2Nn9aOT+Fs
	 qxmIvcO8JznHz4DtcI0UTHBX2D86ysnFhaG7ETTfWP5hFk2pARH4zYBpBiTWKsXAYu
	 DymuFFsnWrYgnSlZfH5OQngSNciPTCo2YLd42AHOiBm8DSwvk/bSEruWPPNlpnyHBC
	 i+LXZgMW9x9og==
Date: Tue, 15 Oct 2024 16:39:08 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next v2] net: airoha: Implement BQL support
Message-ID: <Zw5-jJUIWhG6-Ja4@lore-desk>
References: <20241012-en7581-bql-v2-1-4deb4efdb60b@kernel.org>
 <20241015073255.74070172@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S175T165iell00YN"
Content-Disposition: inline
In-Reply-To: <20241015073255.74070172@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_073911_841290_B150F44B 
X-CRM114-Status: GOOD (  14.53  )
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


--S175T165iell00YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 15, Jakub Kicinski wrote:
> On Sat, 12 Oct 2024 11:01:11 +0200 Lorenzo Bianconi wrote:
> > Introduce BQL support in the airoha_eth driver reporting to the kernel
> > info about tx hw DMA queues in order to avoid bufferbloat and keep the
> > latency small.
>=20
> TBH I haven't looked at the code again, but when I looked at v1 I was
> surprised you don't have a reset in airoha_qdma_cleanup_tx_queue().
> Are you sure it's okay? It's a common bug not to reset the BQL state
> when queue is purged while stopping the interface.

So far airoha_qdma_cleanup_tx_queue() is called just in airoha_hw_cleanup()
that in turn runs just when the module is removed (airoha_remove()).
Do we need it?

Regards,
Lorenzo

--S175T165iell00YN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZw5+jAAKCRA6cBh0uS2t
rIkQAQDqV7Mo4T8/4fbzV0YPdonPq6Q1aTiXxWBuWts88w+ccQD/bxU3AHKNspoN
I0jY9vv4CmS5Hug8lff1CnSIryiGhgQ=
=+BUs
-----END PGP SIGNATURE-----

--S175T165iell00YN--

