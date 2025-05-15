Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4149C2D0CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 06:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTu7FCPLVb1Lmds6U8zszxWLIezt2U7rDOMAZnWiCZg=; b=yN4VSbYB1ELlBDa3pVBn6dPmua
	iJcOxdnUxwzU5DhePMpM0tfyDfFoxKXIJ+T7OJD5KpxAVGlobMOWyvchArOz+huKNG0FYTo1SA9yM
	XL5jHSgjnQCCH619Y+mesHy6J4UerI4Mrwz9vshtW3ZVkquo55ffpnCvK300Q30BMt7zNyZeiYLpC
	qlIYL358ys85VlFrZhv+WkS+WF2Xe60/2cq//rpN2qyP3+4ldVXAyosGhG8XRbxUw5IgoF4bQ2mt6
	CgB0nAw8ahLTbxHmcOcIJGX6DsSCHm/twDobBjYCcXJibT/CMlinpxQ7JL93JkIb+Su8hl7eFnuRU
	sd/lmDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSOl-0000000HBnj-2aZ7;
	Thu, 15 May 2025 06:48:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFS9Q-0000000H9pr-2Ida;
	Thu, 15 May 2025 06:33:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0108D614B3;
	Thu, 15 May 2025 06:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07020C4CEE7;
	Thu, 15 May 2025 06:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747290783;
	bh=dTu7FCPLVb1Lmds6U8zszxWLIezt2U7rDOMAZnWiCZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hcU7ucYnFEIkGfgSkwONAAOY9aBvKHrsovgOpGWO2SWxch5ZCzm3Bn4Q0KAUhfjNL
	 WvWGGYeZ7MzUhx8HJmQTnNQj8+Qum7RPuHHLqeBSGtigNROXZfpht12cboWZDRIiu6
	 JBZpAh0DObCz5in/GQIbRK4nkBknkNaabB+JVjVFqxcpWJ+JNTpQ0Mf+TZ4myXIYVW
	 tPFo8CQk5TspWIeNiTJWFLImEt0MEVXXsXyayubDASSsfNM/EcjqOVC18tEzEct3eV
	 1WIkEZBssQjtRWPCCiE16qV1mbfLIuM2MPetFkP9exzPQcB6nGl2veJTT2pnm2pXOf
	 aO7c5Bn0F9WTA==
Date: Thu, 15 May 2025 08:33:00 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix page recycling in
 airoha_qdma_rx_process()
Message-ID: <aCWKnGVkjlS_d1I2@lore-desk>
References: <20250513-airoha-fix-rx-process-error-condition-v1-1-e5d70cd7c066@kernel.org>
 <20250514190917.4b0ff404@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9w4VoQ4TwqdOLLxN"
Content-Disposition: inline
In-Reply-To: <20250514190917.4b0ff404@kernel.org>
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


--9w4VoQ4TwqdOLLxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 13 May 2025 18:34:44 +0200 Lorenzo Bianconi wrote:
> > Do not recycle the page twice in airoha_qdma_rx_process routine in case
> > of error. Just run dev_kfree_skb() if the skb has been allocated and ma=
rked
> > for recycling. Run page_pool_put_full_page() directly if the skb has not
> > been allocated yet.
> > Moreover, rely on DMA address from queue entry element instead of readi=
ng
> > it from the DMA descriptor for DMA syncing in airoha_qdma_rx_process().
> >=20
> > Fixes: e12182ddb6e71 ("net: airoha: Enable Rx Scatter-Gather")
>=20
> Missed your sign-off.

ops, let me fix it in v2.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--9w4VoQ4TwqdOLLxN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaCWKnAAKCRA6cBh0uS2t
rN7HAQDQFLb17eTABm57pebhvFKxz2kZe7oY+Vv5UTosiivHLAEAkRGdFjZE+cCN
R+BHEX1w4Vw3LFDvYR0H+gPQMhIyuQM=
=bbGj
-----END PGP SIGNATURE-----

--9w4VoQ4TwqdOLLxN--

