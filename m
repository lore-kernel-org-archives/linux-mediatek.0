Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E33C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMHqVa+wbe34NuePd7Ql640C/zdf36HKRo/Y8Tmnsjg=; b=mj03nUIHaFyXh93aRAFBMO1m09
	TgCot4uORK54VuWOLhwicZyQpMVV6tZ1x6Iu1ZuQbqKTnVpWrMpxuG5YZJYlV4kQePcYIqK7gV6gX
	XnUlVIdsGLPTnysOMCh2Kqs+PaxJMfLgLMVln7mtdudOLxn/wgA9Br5Dmj96yebrAms4BkblfwQ5L
	7p2/Tpf/xegBXeIp5UkIuPx9j7xf8YiBVP0sGr/Dz+whH3qBaQ9EJFU+r4oNjoDHh75Fhlt5fuCTh
	sSxpfrBiGg1d9VWfWJirVbU5rFdGV8kwGhIzfq1FdWEVG6mJzhY2DA4GFMizC51RhZarYPacSezmD
	TqKlmWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtAYu-00GPJr-14; Fri, 03 Dec 2021 15:33:24 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtAXs-00GOyg-2E
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 15:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1638545532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KDEb36E4YLXNFoIVpMkEuU1ZVg+cNe5IMJDkmd+ss/A=;
 b=gHWwhKP+f9iUSCL8TV+3cvwJf7bPQa9KJfd039zEOL65IcSfEZIYMQwcLncQ/aV/xc3rLK
 rztkVwsBsg0+c9M4gHKcWqtF64vuOBnGpFVXDhTdKGOmeThFHqYkyj8gcN3oZN3/EcDc4t
 NbypO0CKx28iy7mKWDyU9SW2v9NLHUM=
From: Sven Eckelmann <sven@narfation.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Jan Fuchs <jf@simonwunderlich.de>, linux-wireless@vger.kernel.org,
 nbd@nbd.name, linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: mt76: MT7921K monitor mode not working
Date: Fri, 03 Dec 2021 16:32:09 +0100
Message-ID: <3467395.ZLqV6DWSsM@ripper>
In-Reply-To: <YalFC7UlCPsCSZqE@lore-desk>
References: <7e156597-a206-b236-e4c8-d476614de7ef@simonwunderlich.de>
 <YalFC7UlCPsCSZqE@lore-desk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_073220_457254_C88100EF 
X-CRM114-Status: GOOD (  11.33  )
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
Content-Type: multipart/mixed; boundary="===============8886539073957742807=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============8886539073957742807==
Content-Type: multipart/signed; boundary="nextPart5961587.kT4IN9KiTn"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5961587.kT4IN9KiTn
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Jan Fuchs <jf@simonwunderlich.de>, linux-wireless@vger.kernel.org, nbd@nbd.name, linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: mt76: MT7921K monitor mode not working
Date: Fri, 03 Dec 2021 16:32:09 +0100
Message-ID: <3467395.ZLqV6DWSsM@ripper>
In-Reply-To: <YalFC7UlCPsCSZqE@lore-desk>
References: <7e156597-a206-b236-e4c8-d476614de7ef@simonwunderlich.de> <YalFC7UlCPsCSZqE@lore-desk>

On Thursday, 2 December 2021 23:13:31 CET Lorenzo Bianconi wrote:
> IIRC you need to disable runtime-pm and deep-sleep to proper enable monitor
> mode:
> 
> echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/runtime-pm
> echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/deep-sleep
> 
> Can you please give it whirl?

Jan gave me the card. I've set it to a rather busy channel (2.4GHz channel 
11), created a monitor interface, attached tcpdump and then waited what 
happens. I didn't get anything and then I've tried to set runtime-pm and deep-
sleep to 0. This didn't change the behavior for me at lot. I saw two packets 
and then it went silent again.

I wanted to try the same on a different card (ath11k) in the same system. But
it crashed my complete system - so I had to recreate the test setup. This time, 
I've set runtime-pm + deep-sleep to 0 before creating mon0. After doing this, 
it seemed to work.

Kind regards,
	Sven
--nextPart5961587.kT4IN9KiTn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmGqOHkACgkQXYcKB8Em
e0alJBAAjZ+Fk8GfFSDsiGJrSp0EiqoERd2NZuzTI9iawdlkwp+v2uI4ye1AdSk8
GXsZ1UkvkjSbRY+7V1A8M5VSLMwLIc0y9v6+6QifWUXmMFlOZegJ7wyr88cX0aNZ
TqWb9x4fsnbLAF8ntnj3r8DWFPPymlf1PnaAJmZydzL256gE98JqxGFo9gjw5R+v
zcIxvYYMZcoRuMNd4J7UnWxQp8ILAKQoiQZNqFGDMTjeUG9m66iknUG3klJD3DD2
NK2LibU4E0N++yDy0xDMD1wQyoGMsIcgMq2yrlGudYnjk6o448GbR91Rwi7w5tc/
bsThxnokUbzJrXqRcOeq+JTC8D13q2ePo9Zez+1ooKqfhw8m8zgewJC1PkKtlGyD
2MWg39F4O4ej8FLgXTLr2uirF/ZSHKqNMYpWC+XADwaOmWj0y554aKOh5BYW4ck3
alpgha2DXo+BiXiIEwWgGHqdJrrRxMSRMzIP0vWYk/TDJh35SkN3CaqsMRJX8icx
8hg6rKVJuglb4shYY9mfzM82Jt3YxADiQ/qgIlMGnEmjIUvUQFowmKn8jJTgGv1N
mR8DBJbwelyrHBY+sxqG56qT3trThLdVyqyCYyTmzbuwfpshg9bg2jC3DJ5SI0P4
V+8HtqfPYCe3hxy8z6GoOCSkZ1DdYuVhyGh2ct4p8n8EFi/uNhs=
=AOwR
-----END PGP SIGNATURE-----

--nextPart5961587.kT4IN9KiTn--





--===============8886539073957742807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8886539073957742807==--




