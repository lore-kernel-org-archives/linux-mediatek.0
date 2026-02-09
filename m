Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53C3E78D70
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 09:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ISR/mfVT+xDv1tvxnsCEeFByJ832c8OhCJ5RCB0HqM=; b=FSoaLJyrXQnIy88TEH9PWbkoWq
	dqO6qaw/eL1pNWWrmmhOHVbXIhQLkbyYwUrGP1Y097BNG/i3plBUWCNPuLSdlnm+vtLl+txKpH1JE
	l4N2pxvAxuoTWJ1HrcTpQy1g/5RifwoaujkX1AvwWOfLfhiXe7hZaL4S3ORV7DQYkJq7EBT2GV8wi
	SOW6VDglQiWwOIhOLeuPkcLH7a899EykRAJ1qJ7Qu+vMQgFAb3OeMaKX1G06LB9UnR410AeuQMKPa
	a7NFBocAQktBHu7zEjClhiOVZS6G1nqOlts8z73FJJfb2BagBhtiVoQKHb0nKZUfnshSNFKU8tTuV
	ysv6sihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNOP-0000000F7AO-1ffb;
	Mon, 09 Feb 2026 09:17:17 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNOL-0000000F79r-2qsl
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 09:17:15 +0000
Received: by dvalin.narfation.org (Postfix) id 7B52F21722;
	Mon, 09 Feb 2026 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1770628627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ISR/mfVT+xDv1tvxnsCEeFByJ832c8OhCJ5RCB0HqM=;
	b=Pc8K8le2y3fVQxXWukrh6DaIZQ/AGYP+41/QZ3tu405GjjcUnGn1/FIC8xIzbOXqo4SH2B
	OsbXRLyg2e+BJVa0UhUF9hGm1Jjy+g9C+J49mEFL0eoUhqvvP/TfGy/I9T5n32iNOCwT5O
	wlNDNrcvn9sm9n3pokzdFb1bAFHFniE=
From: Sven Eckelmann <sven@narfation.org>
To: "robh@kernel.org" <robh@kernel.org>, Ryder Lee <Ryder.Lee@mediatek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "nbd@nbd.name" <nbd@nbd.name>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Allen Ye =?UTF-8?B?KOiRieiKt+WLsyk=?= <Allen.Ye@mediatek.com>,
 "saravanak@kernel.org" <saravanak@kernel.org>
Subject: Re: [PATCH v2] wifi: mt76: fix backoff fields and max_power calculation
Date: Mon, 09 Feb 2026 10:17:03 +0100
Message-ID: <4713788.LvFx2qVVIh@ripper>
In-Reply-To: <278546e3f3e526288d245111d8e022b2d68d012e.camel@mediatek.com>
References: <54627282cfb8e5a89fe753da66552c0a084f6387.1769557863.git.ryder.lee@mediatek.com>
 <7906220.EvYhyI6sBW@ripper>
 <278546e3f3e526288d245111d8e022b2d68d012e.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2400649.ElGaqSPkdT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_011714_217900_AE5DB162 
X-CRM114-Status: UNSURE (   7.85  )
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

--nextPart2400649.ElGaqSPkdT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Mon, 09 Feb 2026 10:17:03 +0100
Message-ID: <4713788.LvFx2qVVIh@ripper>
MIME-Version: 1.0

On Monday, 9 February 2026 08:48:50 CET Ryder Lee wrote:
> - In connac2, beamforming entries for BW20~BW160 and OFDM do not
> include 1T1ss.
> - In connac3, beamforming entries for BW20~BW160 and RU include 1T1ss,
> but OFDM beamforming does not include 1T1ss.

This doesn't seem to match the documentation [1]:

                  paths-ofdm-bf:
                    $ref: /schemas/types.yaml#/definitions/uint8-array
                    minItems: 4
                    maxItems: 4
                    description:
                      4 half-dBm backoff values for beamforming
                      (1 - 4 antennas, single spacial stream)
...
                  paths-ru-bf:
                    $ref: /schemas/types.yaml#/definitions/uint8-matrix
                    description:
                      Sets of half-dBm backoff (beamforming) values for 802.11ax
                      rates for 1T1ss (aka 1 transmitting antenna with 1 spacial
                      stream), 2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss,
                      4T3ss and 4T4ss.
                      Each set starts with the number of channel bandwidth or
                      resource unit settings for which the rate set applies,
                      followed by 10 power limit values. The order of the
                      channel resource unit settings is RU26, RU52, RU106,
                      RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
                    minItems: 1
                    maxItems: 7
                    items:
                      minItems: 11
                      maxItems: 11

Regards,
	Sven
	
[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/net/wireless/mediatek%2Cmt76.yaml
--nextPart2400649.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaYmmDwAKCRBND3cr0xT1
y0eTAP4x/wnJjrsntSDQSErh9wdbbDbTV2Us/Y9H167xWGX0lQEAixfhJF2XsZ7O
EqIwD6otwncazjb4ckPtxspWy4wzKAw=
=7NbR
-----END PGP SIGNATURE-----

--nextPart2400649.ElGaqSPkdT--




