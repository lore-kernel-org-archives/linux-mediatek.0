Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDA9C36000
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 18:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCYnaCr6t2CITiy2CVtW2Iw29QsHSOWYrJlCz4eX7VE=; b=SFjZMy5kikJWhK54ROurbeWOzp
	JVCpTOcdrxo/q1Lplqs1OsNBHZ2GMSkrgGeindWcBZtZlwnCeMJKysMqZwJ9o3e+Bn10FW9MFyQmH
	9B0xvL4a4LgZI6K51JvVYZnfBCtpdSV6ukpPBiz97NN3NNP8pWYhs2zN4drI7TkAKGPVyGVNKJUWY
	st6plGguSZUK3dxsg6XQPJ9Clj7SCo44nlWch54duGow8fx8hb0mkgRbq1jP7JeAYy+rDserXFtbU
	2lSwka8VIMA6GKOhyCKNmoDmSuCx67tICdQmpWQJO2920k1oitVE1xzAMDnvx4nOwUrQE0egkc/Ai
	IUrODV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhDG-0000000FsG0-1dnb;
	Fri, 21 Mar 2025 18:35:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhAI-0000000FrRR-1k07
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 18:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742581936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TCYnaCr6t2CITiy2CVtW2Iw29QsHSOWYrJlCz4eX7VE=;
	b=Tpns9EBDvrc5sa7kztWzJu0TjUxDvFboqdZLXn+5yUCyomAaOirOx2QTsZHipHNkiJS+Ty
	dQ6aaX2KcFT1U4KVnAiwWQzxwOGUV4c9pTdlSc2Ly0Uepc8NFA8+6HmZswv8dUp4JpaOb3
	sKFTeyPl2Ron7lfXPDstXHh20rJrJ0U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-fD74tBV6ONKvIlEAeM-2sg-1; Fri, 21 Mar 2025 14:30:39 -0400
X-MC-Unique: fD74tBV6ONKvIlEAeM-2sg-1
X-Mimecast-MFC-AGG-ID: fD74tBV6ONKvIlEAeM-2sg_1742581838
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-438e4e9a53fso13320115e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Mar 2025 11:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742581838; x=1743186638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCYnaCr6t2CITiy2CVtW2Iw29QsHSOWYrJlCz4eX7VE=;
        b=o2aW2NehAUVIUHPiWovEIzXrPQgBOFuKUIvUO3qAp5vXboFzbr33sZN56xA3MIAsLJ
         vKSVx4IwfVfM0XpM4fqhAFc34xapz8bODfGyGor0xUEnSUhz8ceiSrYts6L9S+me8gt/
         gDTIuB0Mea+26hEq2aZj4iQAepmSHrOxoV1xshwOF0Vjye+SndwoH5Gm8pjZ2JhwMcUe
         zR/SYuILxnEEMDbGG6w1rj0/l3oNduqFadIoFeihRDDmZyJtlGIUA9Er0JM74RDqtU/K
         yaZaJBql19JZJZlpyyExbzUYnDmhNdaedX1dKtCzPdlPgGI2vnCd/tViDN2qDOBw/6RD
         I46Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/ifr7hqMplkl8KtLaHqLFAL/6ic19UjJsFlIVzHc7nV+r0xETxW2wAvIF9/1gPpvgAaHcPJLx4EPpFrXAAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeIJGAdacM6FuI9tNFddoNZiLJrTjXC3FD+Suj90IJE1o9wna4
	YwnoiCbuBg5tIl2sfkmfxVPf7lRKxd3RYxTJd2cRKgDBF+CF/7jCKsEHkWmOZ9n/mgFAM5cwOu4
	kcunGN34SCpNTUA/0h41zC5v8vDN9wKsqL08Zr9PxTLYHrKOwLH4YRolm8/mz20hXpugF1w==
X-Gm-Gg: ASbGncst++jdy6jVSl0la3iS8/yh0ibfUnIGlvqISP0Y05ye9a5CH9+pbglXPU9/jdF
	oVy7zLkkMsCpmlWzPFQXHr7MaTu4yLNA9IcykQUux/ip8M+dkfLylCeDlxxjFg8BjYZD5e7SHoP
	KDAntyFtwe9BwTxfzDzqBd8vz1MztmeFnTgbmIQARcifF11PLpp3cV908+Ni7qd4k3KnRUpyEIj
	2QirxifiH5sbyJAl3qWwwStT9n4Wfa4fQIInw/Y/zlczF3On0g6goE5bK9WaJ+pwrB3jXTPGkSQ
	/EbhdE3fGQ68G1aLX3ik/JyU99CB4vNNzkNgFjGytzymZuADqKGu3U+doRHCpUc=
X-Received: by 2002:a05:600c:331c:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-43d52a8ff41mr16399555e9.21.1742581838133;
        Fri, 21 Mar 2025 11:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV1J4g5vZeaiZX63RdE3knu8eFnfAyikgZWs5oJe594PE0zRqxZLu0vVxmRdyWaSppnlnHbw==
X-Received: by 2002:a05:600c:331c:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-43d52a8ff41mr16399465e9.21.1742581837658;
        Fri, 21 Mar 2025 11:30:37 -0700 (PDT)
Received: from localhost (net-93-146-37-148.cust.vodafonedsl.it. [93.146.37.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd26cecsm33890485e9.17.2025.03.21.11.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:30:37 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:30:36 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
Message-ID: <Z92wTGu_Sp9VnqPf@lore-desk>
References: <20250315-airoha-flowtable-null-ptr-fix-v2-1-94b923d30234@kernel.org>
 <b647d3c2-171e-43ea-9329-ea37093f5dec@lunn.ch>
 <Z9WV4mNwG04JRbZg@lore-desk>
 <2d39033d-0303-48d0-98d3-49d63fba5563@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+vQwyXtwdSXuM5kh"
Content-Disposition: inline
In-Reply-To: <2d39033d-0303-48d0-98d3-49d63fba5563@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_113218_579344_0D0BE1B8 
X-CRM114-Status: GOOD (  22.63  )
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


--+vQwyXtwdSXuM5kh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 3/15/25 3:59 PM, Lorenzo Bianconi wrote:
> >>> Fix the issue validating egress gdm port in airoha_ppe_foe_entry_prep=
are
> >>> routine.
> >>
> >> A more interesting question is, why do you see an invalid port? Is the
> >> hardware broken? Something not correctly configured? Are you just
> >> papering over the crack?
> >>
> >>> -static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
> >>> +static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
> >>> +					struct airoha_foe_entry *hwe,
> >>>  					struct net_device *dev, int type,
> >>>  					struct airoha_flow_data *data,
> >>>  					int l4proto)
> >>> @@ -224,6 +225,11 @@ static int airoha_ppe_foe_entry_prepare(struct a=
iroha_foe_entry *hwe,
> >>>  	if (dev) {
> >>>  		struct airoha_gdm_port *port =3D netdev_priv(dev);
> >>
> >> If port is invalid, is dev also invalid? And if dev is invalid, could
> >> dereferencing it to get priv cause an opps?
> >=20
> > I do not think this is a hw problem. Running bidirectional high load tr=
affic,
> > I got the sporadic crash reported above. In particular, netfilter runs
> > airoha_ppe_flow_offload_replace() providing the egress net_device point=
er used
> > in airoha_ppe_foe_entry_prepare(). Debugging with gdb, I discovered the=
 system
> > crashes dereferencing port pointer in airoha_ppe_foe_entry_prepare() (e=
ven if
> > dev pointer is not NULL). Adding this sanity check makes the system sta=
ble.
> > Please note a similar check is available even in mtk driver [0].
>=20
> I agree with Andrew, you need a better understanding of the root cause.
> This really looks like papering over some deeper issue.
>=20
> AFAICS 'dev' is fetched from the airoha driver itself a few lines
> before. Possibly you should double check that code.

Are you referring to airoha_get_dsa_port() routine?
I think dev pointer in airoha_ppe_foe_entry_prepare() is not strictly
necessary a device from a driver itself since it is an egress device
and the flowtable can contain even a wlan or a vlan device. In this
case airoha_get_dsa_port() will just return the original device pointer
and we can't assume priv pointer points to a airoha_gdm_port struct.
Agree?

Regards,
Lorenzo

>=20
> Thanks,
>=20
> Paolo
>=20
>=20

--+vQwyXtwdSXuM5kh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ92wTAAKCRA6cBh0uS2t
rL/MAQDcn4FFF3wmkVqDFXlch5Wj9+r8ZXCL12r0CY8mcPZm1gD/UWZra+6Q2LlQ
dfGzn/9YsTjGEJxgAcx5ERuOnJ7eBQQ=
=/fph
-----END PGP SIGNATURE-----

--+vQwyXtwdSXuM5kh--


