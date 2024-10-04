Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2633CCFA750
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONouNg2hF9X/86Cv/92Njjj7IySTDtFAXczcRyccvTM=; b=JP+0xK1EzQbYYcQZ7a3tMqmebS
	5PsrWinxpDv8V2+o+LcNOvNkrDPX0MjoN0tZQDQZYWQbVZahz0MGVO6Em/WGoHI8YIIgkLsn0m2bs
	a7oKzxdWNgjRnz537P+QCPklEvfOR6wbK9sS+PM+s7j8xH/K8nhRoWsJmH3WDPz02vhljuZFbHJ9u
	tI6Hhndz5O3qIrLCepNmHyTdWcvy6eDOGh6NXcMkxApRg2InHsaC7P8EwZhR9AQ1PXep+1q6SciS1
	pXiCqnmt5Zjm26hJf7kBa/tu9piMA5cOr5XD65p4G1AJw5WyX1OColWKFL6KMiiL1TSuvN0RFByI9
	8FNf1hJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdiv-0000000BQDZ-3fFX;
	Fri, 04 Oct 2024 08:31:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdhe-0000000BPxB-3sbM;
	Fri, 04 Oct 2024 08:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06157A447AE;
	Fri,  4 Oct 2024 08:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C925C4CEC6;
	Fri,  4 Oct 2024 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728030621;
	bh=ONouNg2hF9X/86Cv/92Njjj7IySTDtFAXczcRyccvTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0Bw81LCVRE2qnKCTReH//grgrJpgftd1AdMIrIBZ0f+2GNjcQmxr9M/9m3GOH2lQ
	 O7jO9cC/JMrEZaB9oZO+88nQsoZFWCp2ih74OmmoKBgnigg2qCag81qpp7qWIzFVfA
	 N0ppC18YJCg8VXfuvI988OGA1xYYi8cNESwVm/enN2XH9QQvegdW4v+GpxSWgJHctL
	 CywtXVcoHGpEO+cRn0rBVAM4Y+67LRoGJJh193tbLrWeZG7CHbP/uXIH437/xQZTqC
	 wIUzukI/k5cHdQWbH+KB8YWjBqLdgA4OAZq7Gp8j07xO9Yg0FcEXFSr9WnnXeh/q+y
	 qtUwN4KdKVLJg==
Date: Fri, 4 Oct 2024 10:30:18 +0200
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
Subject: Re: [PATCH net-next] net: airoha: Implement BQL support
Message-ID: <Zv-nmru1Qx6lk9o4@lore-desk>
References: <20240930-en7581-bql-v1-1-064cdd570068@kernel.org>
 <20241003172407.1bf35bf1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rEW0/ZG3FlIaXvJn"
Content-Disposition: inline
In-Reply-To: <20241003172407.1bf35bf1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_013023_053183_4EECC5B6 
X-CRM114-Status: GOOD (  14.09  )
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


--rEW0/ZG3FlIaXvJn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 30 Sep 2024 14:58:35 +0200 Lorenzo Bianconi wrote:
> > Introduce BQL support in the airoha_eth driver to avoid queuing to much
> > packets into the device hw queues and keep the latency small.
>=20
> This patch got set to Superseded in patchwork, somehow, but I don't see
> a newer version. I think you're missing resetting the BQL state in
> airoha_qdma_cleanup_tx_queue() ?
> --=20
> pw-bot: cr

Hi Jakub,

for an unknown reason my email about dropping this patch has not gone throu=
gh.
Sorry for that. I need to rework this patch in preparation of qdisc offload=
ing.

Regards,
Lorenzo

--rEW0/ZG3FlIaXvJn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZv+nmgAKCRA6cBh0uS2t
rNCEAQDrvLXLmeoE6s/7ZGvUBRDhTOD+QYZSjAMKknKkkoNhVwD+Ke9qn46kmxyu
t/XdrlTpEiVE5LvLitObOxZIMCX4Egg=
=J9rN
-----END PGP SIGNATURE-----

--rEW0/ZG3FlIaXvJn--

