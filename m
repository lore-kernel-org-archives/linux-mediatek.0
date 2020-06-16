Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC37CC433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 21:15:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 999322085B
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 21:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lissz3vV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MfWsxFbE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 999322085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b1hQZEF65jcodQQBBc5nBh70ISFiBYem5tGR9UrsNEQ=; b=lissz3vV7adwiHDV3QJ4HFxwe
	XTqgekAW636TmlZ6jILTEDdh8CTwFPwUY9FNEgELYC3sz6kRGFLXMpvpfTvyvXMwOStW/nQ+Ur1O/
	8MycfmbdDwUj18sUH4kg5p6tKodmY+A/p+bkZeMTwR4c0sqM5phULzD41vCOrPVgSLuWqPVGXIlq/
	eVzHsNJo9l7MTt/EVtqqGWMkS/WBKZYN939ZV8puDB1RB7BYlC+DbBPFrbfNTYvjWm82Uronszry0
	Osbohv6vKYYiZYIkqXTVSK2SfymKdIikLypwcZMv9tnaKTNDSnbAO493ESKpz6NOGOHf3Ozq0PMBI
	qpGQTlb2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlIvU-0000Cv-PJ; Tue, 16 Jun 2020 21:15:24 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlIvR-0000Bw-Nn
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 21:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592342119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KNUUq8EEWGOHLcrAyud1lFBDd5Wbt397tZLAuNQXRTA=;
 b=MfWsxFbE7TzF3URDHCYJAXMRzqlY0U6JNAyBq6cc2deqXMVB+EO8OYG1jD7sSYsg5oRcE6
 g44z3SOkHMVPPOOJCFu9rXVhOmJ0hgruzrn/z5TwnJfMfAIJyD2uVKwdzY3DcJkmi4uZU8
 tqkKDs8zV1ph6gfQHemzUElc0Yh/u/s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-Tmei2MLFOQO7VtUvHSuUQA-1; Tue, 16 Jun 2020 17:13:22 -0400
X-MC-Unique: Tmei2MLFOQO7VtUvHSuUQA-1
Received: by mail-wm1-f69.google.com with SMTP id g84so86266wmf.4
 for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2020 14:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eSzFkwURLVeW2opiRMpP25mHAWNktDQUA6Jwol8j1DE=;
 b=fSypEpOFzP7kEnLik9cdZfdxoZW7BesuO4kgTwIPqggdKc7X3bb1e7+9Zxa7kuLl0u
 dLQ/5THW263NDPpUpUkbTs1DUemHt8CkHQ/iLJFDJtI2nz5GGUP/egZs1YLRcAywDuAB
 lKKK5dGwQEFvRmJw3FdrFevldtMSbhKYtxTPmTWCJ1HqYzKgSO2azSzti5r1YQ50C9dZ
 Q9By2qUlTYLKDB3u3Os1U45eq9qyFy97yBGEUoo7YJrOVi1yZx0eLqzgzhmYhQogfN1u
 UgN+UMb01TcC7zty2Ll+mMTqOHnPQ6WIdHSnj5hDBih15rL2zmArrcjq+R0TurNI8wkw
 m1Bg==
X-Gm-Message-State: AOAM530t/CB3PWc5APW9quQGK2/BZPb5GvIEZMRitsg29ouc1dUYDBBi
 /z6kTT/HNsZbESnxOMD5u2bm2OunA6POyJTqYB74W2PA/7bZBJotrV14Xyieh03fUwYlTTs74et
 JQxN/u2y6uC45NczvrR6gi9tOM9E5BfT3
X-Received: by 2002:adf:82ab:: with SMTP id 40mr4728958wrc.85.1592342001440;
 Tue, 16 Jun 2020 14:13:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/qi++d55UA+IwKBiZUUaY0o68WCq/wUWthnInfPt1DBbyhEHxviYjhjajoKfGjP0RSvNaNg==
X-Received: by 2002:adf:82ab:: with SMTP id 40mr4728937wrc.85.1592342001092;
 Tue, 16 Jun 2020 14:13:21 -0700 (PDT)
Received: from localhost ([151.48.140.182])
 by smtp.gmail.com with ESMTPSA id j5sm31290775wrq.39.2020.06.16.14.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 14:13:20 -0700 (PDT)
Date: Tue, 16 Jun 2020 23:13:16 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: mt7615: cleanup codes
Message-ID: <20200616211316.GA440740@lore-desk.lan>
References: <0cb7ad2a49010a540baca21cd19c43540534b141.1592204310.git.ryder.lee@mediatek.com>
 <d38bed5a-a035-4e87-aaf3-12031d55de50@nbd.name>
MIME-Version: 1.0
In-Reply-To: <d38bed5a-a035-4e87-aaf3-12031d55de50@nbd.name>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_141521_853552_7CDA93B3 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: multipart/mixed; boundary="===============1232002384963840376=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============1232002384963840376==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline

--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 2020-06-15 09:01, Ryder Lee wrote:
> > Cleanup indentation, mixed licenses and change some functions' type as =
void.
> >=20
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Please separate code cleanup from license changes, and make sure you get
> an ACK from all people involved with the code that you change the
> license for.
> I'm fine with the license change, but I'm not sure if any code was
> copied from mt7601u. At least Lorenzo also needs to ack this.

I am fine with license change. IIRC I used mt7601u as reference but I did n=
ot
copied the code. Adding Jakub in cc.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> - Felix
>=20

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXuk16QAKCRA6cBh0uS2t
rCCZAPsFZ4V26kvFngFmmf11RZdpgKh+ntCuT34dhbHrXUA3XwD/Rz8q2Zc1ZvjU
F+WBrfJVMhFPw+CGfPXwRfHBlu7tTwc=
=D7Zw
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--



--===============1232002384963840376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1232002384963840376==--


