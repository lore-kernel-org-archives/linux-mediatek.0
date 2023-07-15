Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5900C001B0
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jul 2023 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js70kE6M4tQuHcgETIy8XYzF63AeuA3GvQidoiOZKq8=; b=vfj6ld+o2WJll9VIadBWYWR4KV
	pue/8yi1osutIXUjq+UlWAmdgqgnknY1vCKFzZaEXRQ62e05VS7Lv10cxnxgHMmAL4/rtoFHY2Ee1
	87Wdsvqhi6VSiD1wr0cgDigcTJ/HWyubJ3Z9Q2KUODVm/zJR4i5DM0/Ah9Y8aOL9EhfjoU3THMS3R
	cu3NpNriesp8azHniE04eSrO+75uXmCUZGngIpW00wIfe4h+k4nWDL9mPPiHrJpZE0btERkMMCgfr
	h393JxH/d/iFKSTNIXxpVxnochXap5SRqi0DQ/CIROgabRSPOJ5HYA3EF8q6W4D5ubUDrEQO0dBgE
	A5LqkI1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhsM-0095uE-0l;
	Sat, 15 Jul 2023 16:12:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhsL-0095tz-0n
	for linux-mediatek@bombadil.infradead.org;
	Sat, 15 Jul 2023 16:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Js70kE6M4tQuHcgETIy8XYzF63AeuA3GvQidoiOZKq8=; b=BrEAQZlGJkznW9C1bw59uPvgYQ
	GPu3pQN7bivCXo0NNQI+/U5qCloXaPNi7UAoASWC2wKMWhsv/IuRiKzEwTT8TEQP7p/tSudy1dSxI
	MsfGvYE0cwBy8p4Q7n1CCqdhvjm3EPjnDaNcqHC9ztmXIGhU1gmTi+jY3cxHQ43+nrrHvG70GSobz
	ulMLmHr1zEntrDMJHsXFyyiVI1T6dSXoNCdxRWTHG18X3u013lUOdESNRQh0+sPwN23VNrFq66UvM
	9Fzx+Ky/OnTcq48pI8Kok4XUiw6dp286Y6uXW2C5D4zz8jnlz86vSWsIS4CK0L8x/FRmN3axpryde
	NfBN0MTg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhsH-006yPq-0t
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Jul 2023 16:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689437510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Js70kE6M4tQuHcgETIy8XYzF63AeuA3GvQidoiOZKq8=;
	b=DdRurhm/yiydoX4ioYtZBcbkIg9ebeX3qhnCaWP74Ze/RpgyUIHq1AFxUR8c+4+eq28oY9
	uDuNDwIIpJeBo+FEHGNsslWCs69zqKz0R2HSyr8OJuqtVTK1HYAFEnDWpgEULGc2+lt33a
	Igvzf1RvPpbqWmAu4YQqwq1UlphqPPA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689437518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Js70kE6M4tQuHcgETIy8XYzF63AeuA3GvQidoiOZKq8=;
	b=DHYUZDzsceDigijAXuyzkHaAHIjYGsN/6I9zOaSbu/oOE3oj9/8yTmSxMdRzbzwFjrMe8/
	FZ+lEQ5Babxkp8S3x1hAhMHwO4V3kWWYQSnbFp1goWZy4cVwf2hKN71tntt/NqjjdzGMyN
	9grKzLO44ieVeDI/CldvH69iUqyNUwY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-KtTgEqcvOlqqQkTBhx4TXA-1; Sat, 15 Jul 2023 12:11:49 -0400
X-MC-Unique: KtTgEqcvOlqqQkTBhx4TXA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fa8db49267so14994555e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Jul 2023 09:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689437508; x=1692029508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Js70kE6M4tQuHcgETIy8XYzF63AeuA3GvQidoiOZKq8=;
        b=dryalWHLc/TrMv3dKPN5+E7l18n5rF+4XdkHn9b3T8G5D168ndgCW+H1o2bFhbQVYk
         QcNqNrW4JyVVUg152c5sLZtU62iTW4g38ygtT/PZTk8IVbsner0bC1Fo992hzLCCOVtj
         Wc2iWRw122Ac4apMplXgbydDgsdOLadRxjqLm+WfQlDF2IqOe6995yQfPVtxroxYwdQB
         iDDXs8D1xC3yvqoIgy1N4IFVl35zkZDUthjfZn1/T499LdvLTEuJX6fYpwwJlMJA+4qo
         6bjx6jAfp8dkbj29xftainVgHLGKUHKma6Ddv1CLHgrOTtP347yPi4UN2zaZTknmdWeM
         K/Qg==
X-Gm-Message-State: ABy/qLbKBiNK5QcS+Kh33MnNVPoa/VCmvtQXC/HP/SK4BFX/O56I9Qv5
	JCENyWXHmIUcderrnQtgOInMebuTwRUyDXQVYlyAmWc8b+ffFP743ibx14mfPihdABrKwCouloO
	l+cL1+dEhL8cXMLaChyo9v9RA8e6F7DqH
X-Received: by 2002:a7b:c40d:0:b0:3fc:1a6:7764 with SMTP id k13-20020a7bc40d000000b003fc01a67764mr6353263wmi.16.1689437507834;
        Sat, 15 Jul 2023 09:11:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG69QqpP0KlK6PdSqxWvSyyuu5NRgXyRxSUWxITz0TGdie9WxsU5U+VqP/uxSgCoNT0EjL9WQ==
X-Received: by 2002:a7b:c40d:0:b0:3fc:1a6:7764 with SMTP id k13-20020a7bc40d000000b003fc01a67764mr6353234wmi.16.1689437507258;
        Sat, 15 Jul 2023 09:11:47 -0700 (PDT)
Received: from localhost (net-130-25-106-149.cust.vodafonedsl.it. [130.25.106.149])
        by smtp.gmail.com with ESMTPSA id y6-20020a1c4b06000000b003fc3b03e631sm3602905wma.1.2023.07.15.09.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 09:11:46 -0700 (PDT)
Date: Sat, 15 Jul 2023 18:11:44 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Ungerer <gerg@kernel.org>
Subject: Re: [PATCH v2 net-next 6/9] net: ethernet: mtk_eth_soc: add
 MTK_NETSYS_V3 capability bit
Message-ID: <ZLLFQJ/CMvqQqRgN@lore-desk>
References: <cover.1689012506.git.daniel@makrotopia.org>
 <6dc1e0ad7e8138835c959fc83a6c1564e8488c59.1689012506.git.daniel@makrotopia.org>
 <ZK+m+ayRW/uaxl6u@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Eh7tZsXyDFZVqJbt"
Content-Disposition: inline
In-Reply-To: <ZK+m+ayRW/uaxl6u@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_171201_519626_467DB67A 
X-CRM114-Status: GOOD (  13.68  )
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


--Eh7tZsXyDFZVqJbt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> on thu, jul 13, 2023 at 03:19:49am +0100, daniel golle wrote:
> > +
> > +		if (mtk_has_caps(eth->soc->caps, mtk_netsys_v3)) {
>=20
> this is a case in point for one of my previous comments...
>=20
> this code started out believing that testing for mtk_netsys_v2 for v2
> features would be sufficient. your first patch ended up having to
> change that to !v1. how long until this becomes !v1 && !v2 because
> it gets used on v3 and v4 etc?
>=20
> this is why i think an integer version field would be a much saner
> approach.

ack, I will fix it.

Regards,
Lorenzo

>=20
> --=20
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
>=20

--Eh7tZsXyDFZVqJbt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZLLFQAAKCRA6cBh0uS2t
rGs9AP49MdY//QxPjTry+O5HMEDUJz0xScmT7VFDAbt7wb7HwwEAn0Yz8q6MfSkC
djHk8lPoM7OXLyH5gZ4UFWEqt305dgI=
=nLva
-----END PGP SIGNATURE-----

--Eh7tZsXyDFZVqJbt--


