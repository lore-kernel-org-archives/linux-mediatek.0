Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D8FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 10:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rU8VlC9Qw+q93wR3rJrIFub8lf21z5Ms/tdshBVUic=; b=OjwuzqjeR9pV8nOSlknx8sx1mf
	ka5h/wJhn1w4pDf0QZX/R9k+cXFG42tQcx/8GLp7tNIOFTdPXSMJLjF1czJFUeCs049UyPHIqua6M
	pgPiZ7Izilg2WM8oqWPWFyE5BWZUmXpHjj7XZ+QgCL28Z01/8p0dTmwT6f50iP1OwstEOXZp5gUei
	XB0E2kh1p2j9iz8yNZXItcwpDtTatlAXeSjMUvBbAvqEpnfiRuT8yPFw5LvoId/FXqCT1X0nuZka8
	9qgmay2G/tFg+5TyhsK1CHpKvKOBcFLROTRTOPTmJoPMNHX68lwr9xX9R9CUMBEDqnkIlwdniS+ZH
	rH1lWyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7EmG-00FrKq-BI; Tue, 11 Jan 2022 10:53:20 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7EmD-00FrJX-5A
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 10:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1641898392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QTd0FTuJ1zu6nHPFav2wUHpH9/BRDgLmM7wW3sL7Nzg=;
 b=oLaJMtpsujuEk1zQOAC161mq515hFcZJP0N4CTep3ceeV82BQPW7UOZULiv7/I3y9iqfg5
 22iPeccgyDnpA/IhQ6rhgPJA1QUJ5aH5wJ3KFpB5obAXLZQDZx2ohrzjr4uoUFYKwQ96sE
 eG0o/PRHkgrGQVFu3NLX9/CDwdtCac4=
From: Sven Eckelmann <sven@narfation.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lorenzo.bianconi@redhat.com, sean.wang@mediatek.com, nbd@nbd.name,
 jf@simonwunderlich.de, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Deren Wu <deren.wu@mediatek.com>
Subject: Re: mt76: MT7921K monitor mode not working
Date: Tue, 11 Jan 2022 11:53:09 +0100
Message-ID: <34944167.qDeGz8lmHr@ripper>
In-Reply-To: <YbusBazb4GAC6YQl@lore-desk>
References: <YapTmM3EztojTS9F@lore-desk--annotate>
 <12706913.cppxkphV4n@ripper> <YbusBazb4GAC6YQl@lore-desk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_025317_391981_E9E6EC14 
X-CRM114-Status: UNSURE (   9.52  )
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
Content-Type: multipart/mixed; boundary="===============3140941322788277144=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3140941322788277144==
Content-Type: multipart/signed; boundary="nextPart1995525.QtnH1V4xGb"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1995525.QtnH1V4xGb
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lorenzo.bianconi@redhat.com, sean.wang@mediatek.com, nbd@nbd.name, jf@simonwunderlich.de, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Deren Wu <deren.wu@mediatek.com>
Subject: Re: mt76: MT7921K monitor mode not working
Date: Tue, 11 Jan 2022 11:53:09 +0100
Message-ID: <34944167.qDeGz8lmHr@ripper>
In-Reply-To: <YbusBazb4GAC6YQl@lore-desk>
References: <YapTmM3EztojTS9F@lore-desk--annotate> <12706913.cppxkphV4n@ripper> <YbusBazb4GAC6YQl@lore-desk>

Hi,

On Thursday, 16 December 2021 22:13:41 CET Lorenzo Bianconi wrote:
> can you please try the patch below to see if it fixes the crash/hang in monitor
> mode?

I have tested it now. But it seems like it was already applied. Otherwise I 
would have provided my Tested-by.

The only problem I have with the monitor mode is the missing beacons (and 
maybe more frames which I haven't yet identified).

Kind regards,
	Sven
--nextPart1995525.QtnH1V4xGb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmHdYZUACgkQXYcKB8Em
e0bz6hAAvN8XCN4JT8UAOQ2mqUvc4un4LFdZErMfVY3E0PFPX68IdIw3xVlZZbVx
4KHkCAO6lsfcQnYytpxljYCA+m0iT/A5WLObqwmNTevZ4pXW2IO2bK2Jpt8FaSCd
8PZfw1YeTzHT8oryQXXpc+3T6X6i9/txs3IYxdA3aCW28bLugJzaJrV68JI73PPm
lSsCUAlEiUtPmWmWmNuD0XIbPgVc7tCF72ghX3lMK6r39vx1EuKfzhePOh6FQBLg
Hvjbyhs5xKU7nAYsaV5ZODmDl+lbXmxTlqfHqlNnRwnoxiD1CMwZJdWk1Sy0mfxB
6vNCJJykja0isJwvTb0lkFP9emgPiDspzGf78dgPRSs+tHwNsVrdU2Rx7xYYGYU9
pQVT4b1E1rot7z5u9fo9rQewVvsKC1ayLyijhjred0A2gZmtqEBp/wpxbcmAy6k+
Ab66IjYWZF/iuuqjyCSinRJFeqQbqi96F5sX/qwutSXZPwZSMCt8R7+TenB9JrDq
bQnsiIaDkmr5QZk+LuBKr07OX+zt4qtkygSHeHXZHsd+TrFn7WgmIJ/yanzNGauW
Gf+AnT3uLwdfhuD7g34q+LustQrgfrjTNX+Hrs7VeV8uG1cM9Rhs4l5i19HE29JC
fYCgmDPSX1k7xwJqKwxEszClcDjIKiIeQ42482hPsWTcT0emHso=
=trR3
-----END PGP SIGNATURE-----

--nextPart1995525.QtnH1V4xGb--





--===============3140941322788277144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3140941322788277144==--




