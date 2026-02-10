Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C08EA3F0F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 07:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuQo5m5WVF4qQncKmUBdwTNv+fOhnEkb1fAnPLf4sl0=; b=BQog1w+BFhGdaebUtgDo+BEB6S
	eC3SsrQYMWhUJdPhZfD/Nfj2yqJbDFX730kQ+OFiFDIHu0J5/PpMVV5KtefGbCaEfvOE9KV3LEKxp
	JcYmDLDTNiPLPIawuc3KbAGjfUlB4nh1engcJcfqV+HDbPJzY1d7aHfzQbaoLjoMUl2mBeJw60V5U
	E7QgYodHjUB54JYNvSKqZIzrB11e2buBLm2Q9SLDlttQNjQB/GCYfXHSp+i69zgBRpQZeW8yTcUge
	f6aCfqnrqYCx8jpsAfnVW4EwNuCIuWjd4gSBFjFVanjFVUY8XRdQ8ftQoWmT1eZ5ptZMuqTESHCnX
	ShOabOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphkr-0000000GZST-48jJ;
	Tue, 10 Feb 2026 07:01:49 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphko-0000000GZRg-3dd0
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 07:01:48 +0000
Received: by dvalin.narfation.org (Postfix) id DCE6C1FDD2;
	Tue, 10 Feb 2026 07:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1770706902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NuQo5m5WVF4qQncKmUBdwTNv+fOhnEkb1fAnPLf4sl0=;
	b=suIVVqXo80JnX1uqu7Gp0ahAwsV4K5SwWszfMt43VtNg5lC+Vy2ZWVjgjVHcP4wdvzBjmj
	5mUWzhWCScRdcemDoXAiR+qlO9HDRuCpZEaLunDjrRNYIrRfHlL4r1WESpPQCwImr9T2P+
	bOYh1ehGqI8C/9pRTuKfaqUv2yKSyAg=
From: Sven Eckelmann <sven@narfation.org>
To: "robh@kernel.org" <robh@kernel.org>, Ryder Lee <Ryder.Lee@mediatek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "nbd@nbd.name" <nbd@nbd.name>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Allen Ye =?UTF-8?B?KOiRieiKt+WLsyk=?= <Allen.Ye@mediatek.com>,
 "saravanak@kernel.org" <saravanak@kernel.org>
Subject: Re: [PATCH v2] wifi: mt76: fix backoff fields and max_power calculation
Date: Tue, 10 Feb 2026 08:01:30 +0100
Message-ID: <3596367.QJadu78ljV@ripper>
In-Reply-To: <1816591a2149629822a1e08fc4c3fe7601b802fa.camel@mediatek.com>
References: <54627282cfb8e5a89fe753da66552c0a084f6387.1769557863.git.ryder.lee@mediatek.com>
 <4713788.LvFx2qVVIh@ripper>
 <1816591a2149629822a1e08fc4c3fe7601b802fa.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1952642.CQOukoFCf9";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_230147_518157_BD5DF78C 
X-CRM114-Status: UNSURE (   7.78  )
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

--nextPart1952642.CQOukoFCf9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Tue, 10 Feb 2026 08:01:30 +0100
Message-ID: <3596367.QJadu78ljV@ripper>
MIME-Version: 1.0

On Tuesday, 10 February 2026 07:38:24 CET Ryder Lee wrote:
> Of course, I can revise the description for connac3. I just wanted to
> say that there=E2=80=99s no need to change the min and max values, which =
should
> make things much simpler.

Ok, thanks

Regards,
	Sven
--nextPart1952642.CQOukoFCf9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaYrXygAKCRBND3cr0xT1
y0emAQDQ6WKUrkWC/22IIPGth1fOyuYCl/S4vMfiXu7hBhFa/AEA9A/LnQmNQ8tX
aaUzZSB6o9miIuSlwglW3zm8/hB4vwA=
=uWRc
-----END PGP SIGNATURE-----

--nextPart1952642.CQOukoFCf9--




