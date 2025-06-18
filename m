Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3865DC7115B
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 07:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aC64CEq1Onwzg7hQyJBpP3n73y+2vG8xqxjywocSUUI=; b=JoJJBX9qG/SBqGyhbXhBA55zi1
	YddnV9HMO12Yx0AxmukMmjDT+vWUC18CHKr6K6jlqJo5dU73iC9+eVvIyKJpa4Q9m4wxaCVaeOAbP
	iAC/s+qr6pPtx5mKSuAawUWJFGXPJV/tafgciA2GsLgYyZ6TwVpuU1LEefzwvRPdh+t4fBE5E6h6m
	YPTFxVNPKRLcWcWdWlWFU8CKhCyAn/1h68RJYfG0K7WY5c8Li3qflFQJq9VV0vtpbAr0Gw9i7XFcQ
	IxKM+IJofKJ7vg00pGWQ+zCRPpiPhygeSUXaO4oo1atBnrtXj1ViG7XjGUDBE1yI5KqrH4EM8gRPq
	GmpWwc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRng3-00000009Lop-0eFT;
	Wed, 18 Jun 2025 07:57:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnYQ-00000009Kal-0M1M;
	Wed, 18 Jun 2025 07:49:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DF134A288;
	Wed, 18 Jun 2025 07:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9BBC4CEE7;
	Wed, 18 Jun 2025 07:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750232993;
	bh=aC64CEq1Onwzg7hQyJBpP3n73y+2vG8xqxjywocSUUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FujFC+7Ahq84E2eCe+Iiou4DRzWv2GhCOKy0IPaIsSQypsdcoCFpIHGUboR85UBkm
	 FvLILNyJOE7g/IDFE9scsVoaGTGPmbAYEHTLI0DDgydUhYlhYz8XNTmazgJGu6maGL
	 sLstO3vI5FXbowGzjg2IDWMa9cWPTFyOuT4blRD2K17dPJljo2l3JR02ksGjsWwvpw
	 dB8NXfC7BKglijPdr4A7aXSCdp9qLPZzk8O5WJwg/9KZJHO4/PG6I5EN22ral76jBS
	 JAN163WWy4+TW+4GlIraP6DyBcNaAerYnA2/kS1S7mRb4Q0BZtUL5iiSa6NXqIIfBC
	 1Xi8l+90P9WZg==
Date: Wed, 18 Jun 2025 09:49:51 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/2] net: airoha: Improve hwfd
 buffer/descriptor queues setup
Message-ID: <aFJvnxVVM_sdSpKX@lore-desk>
References: <20250616-airoha-hw-num-desc-v2-0-bb328c0b8603@kernel.org>
 <20250617183244.641d9cd3@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v6JufC9cwr1xoEbW"
Content-Disposition: inline
In-Reply-To: <20250617183244.641d9cd3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_004954_143551_48B2E3E7 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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


--v6JufC9cwr1xoEbW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 16 Jun 2025 15:45:39 +0200 Lorenzo Bianconi wrote:
> > Compute the number of hwfd buffers/descriptors according to the reserved
> > memory size if provided via DTS.
> > Reduce the required hwfd buffers queue size for QDMA1.
>=20
> Same question regarding target tree, FWIW

ack, fine. I will post v3 targeting net tree.

Regards,
Lorenzo

--v6JufC9cwr1xoEbW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaFJvnwAKCRA6cBh0uS2t
rHwQAQDRWhuDKkooK+3SdVhoIcSjVlWNQW9cx1j+py4qwhHrxwD/REl0bOTp+6/n
fZd/+nOnfqJphhHl2l5TM92s7tbawAI=
=pcct
-----END PGP SIGNATURE-----

--v6JufC9cwr1xoEbW--

