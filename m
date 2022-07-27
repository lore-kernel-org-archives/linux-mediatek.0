Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEE1C19F29
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 12:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nkpa4ySp+7hofmDtkeBasoIC9+NvWUsGD1qYEeQ3/sQ=; b=iT1JqiLIMX7Y59EDtv2dr5guy2
	2funyifXa4TO79aJuR050cjw7dpD/dWlhIxfJlXPTTcbsINLlq6PwUkYddCXP0C7CNg/766NJRLCi
	nas/KztJR63eb4EFI4skRxk2wu26A8pAuXbQrFLuVVC9G+P3zjOHX5CyUqIvsbMyzXAFeffqGuOF9
	rXPodIO+zQ+DRZuVBuWqGH6wjjhnJmPIZTXrjlN0VVcSf9fPvutXKXxrQeJSj7SWnHC0JwA9Gm0lQ
	fvxCXugfhvAlCDHburSDsQfnf+y5L5g8AS10xiEgkBVR4UaxUjxr3Mdt/KvT5liO1MSiFrBcSTrRd
	nZxau7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGg5l-00DShE-Su; Wed, 27 Jul 2022 12:24:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGg5j-00DSfO-82
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 12:24:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98B6160FFC;
	Wed, 27 Jul 2022 12:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFED2C433C1;
	Wed, 27 Jul 2022 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658924682;
	bh=tgr9vu7Qy97JGQaPLpU0cHT1c8Wg6XMcuOwhabrCXSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXVn3/nVa5nuG9VUzpC907NJhkP4zVnx5/WGNkSjNJpLmss/EYIT1wZsgUZJNAH2T
	 6ydUtcOsBowfO2mak9A6RgzwUl0ZvZ0QhmbOBxK5ftGO0BjJbWWQUKMjYsEFMsUZgD
	 6r9J89gLwhu1KO2kVXKxpuv0+5HVqpNGCG0JVX67mQE7zA0zjISkgKYNV1b27sPloA
	 QzLk1gq0GVwk63/bruLaQquVhJxSHHjfs5hx+LvPkM3ntWu7HUFp0BAlL9YdTng8RX
	 fIs7RkeCx9JA3cxRQOVVXG+/nBhTauq8QcmkA/RzltP55vMpWZsQx7FtoX5BNy7azK
	 c86LK7x7+KhMQ==
Date: Wed, 27 Jul 2022 13:24:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chenglin Xu <chenglin.xu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH RFC] regulator: mt6380: Fix unused array warning
Message-ID: <YuEug/OV9H0DKnmZ@sirena.org.uk>
References: <20220727132637.76d6073f@endymion.delvare>
 <YuEpGTD/DbC1T9Z0@sirena.org.uk>
 <20220727140809.0951b72d@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IrK3sxxWYqfC4Njx"
Content-Disposition: inline
In-Reply-To: <20220727140809.0951b72d@endymion.delvare>
X-Cookie: No motorized vehicles allowed.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_052443_345248_AF046390 
X-CRM114-Status: GOOD (  15.24  )
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


--IrK3sxxWYqfC4Njx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 27, 2022 at 02:08:09PM +0200, Jean Delvare wrote:
> On Wed, 27 Jul 2022 13:01:29 +0100, Mark Brown wrote:

> > It's helpful to keep the build coverage high.

> OF does not depend on the architecture, anyone can enable it. So I
> can't see any problem of coverage with making drivers depend on OF.

It still reduces a barrier to entry.  It's also that it's easier to just
prefer the conditional compilation pattern rather than either check to
see which cases is needed or have people copy an example that doesn't
use it when they should.

--IrK3sxxWYqfC4Njx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLhLoMACgkQJNaLcl1U
h9CtWAf/WXQJMmNCCRSTl7w68FGnmuXW/Q96sMMgLKKFdJpsEV2dQ4xz2rK+Tf2P
aluA40nhXCF/2fZGiKjhE1fmQR9UCrPvvO2mOr9DYarsuxKPo89nH8eNxXpseF78
5PIjBIv5DhM4mMD+4utbceGm4uSK3BdCEU9k6jRJ3fQHPlZiS0YT/rUQG3UH+grs
5n+w29BGDEZmbsJoc0/+utzjt68ysKgZNetC5F72J2YLB1geS7gsLVDNP6NjcDw5
TlDcRUSgYSc60XPe7L+LfwNCU/LPm2H7NvV4c7PV6gYY1eBd5Wef1avp6ZT/Bqyt
n7k2aPvx+9ZGoUxXgLPwAOV4TZxv0A==
=Elcv
-----END PGP SIGNATURE-----

--IrK3sxxWYqfC4Njx--

