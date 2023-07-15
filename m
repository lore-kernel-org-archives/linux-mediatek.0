Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8935AC001DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jul 2023 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dF7OtGXMRje1f7jke9Bs430OqzMpDW752u+Jth/n5k0=; b=LL16KW+HFelllWHVDd/0EVmxj3
	F7m1UXT7KZZnFmNs4h8SnfISNQ5CxVWfZ+Yn66MR409i33SzD76Nis6eXmPK1cCqk347FbHYTnx0Q
	IIFK/Mpi7nmm0pWkz/vlV7HsRhCAbRg3rCPq15hG1jJPxy9wehvACSgEuv6IWmUOlIvA6cF8F2RW2
	NrTBLk7en0LoBbOadrEWtJVzMdr54uGQmnDZb+FrCpSesQvG2UTw8gfVJe8HxmEDo3X5E3qCh5Zck
	BFe1s5qF+9n87W/q9sI7mrMUVeFebZ1X9iQECbLOdoI53zm4AO6CLzpfehgM2E/JNixolo7IHfDlq
	8GwEqFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhsk-0095yy-1O;
	Sat, 15 Jul 2023 16:12:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhsj-0095yQ-1D
	for linux-mediatek@bombadil.infradead.org;
	Sat, 15 Jul 2023 16:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dF7OtGXMRje1f7jke9Bs430OqzMpDW752u+Jth/n5k0=; b=JItsXpCsfG42+anUc3pNdKIpRl
	+cGYXR3AeIf7giC5sJvFYWxelhNSbV8dzTfu5ijezeZOorVoeHNXoeRg6O8E2KifcTBTznNZUAqoO
	WcPiAZL1dj3fz/ROkle50TTNAwLzh+pKqvAQK8/aaTCWZAtlmjR7EMJ8f0Mpl85gNXivZmjNG0oli
	2RnzvmBzh8BmoLffkYA2lQILScbR0TY6DhzoPGOU7U4SAuRDmEENx93AXdcmFjxP7WlDTTnBVXdC4
	AKUW4e/7+HFXzfHnvsZMiX323E/T1uVSPNkjvHhRowgHwhJdhh9j6Ti8J+F7/MboILJEx1gGuBnCh
	uQO0AD0A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhsf-006yQx-0h
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Jul 2023 16:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689437537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dF7OtGXMRje1f7jke9Bs430OqzMpDW752u+Jth/n5k0=;
	b=Ff2hFNfBeB9d3mdbB1FwC/CZ/bceqnlLGmuiTOjZIbG37ZvjxYzTI4gsxTo+Ib9F8yilyx
	w0BUWtsKmbyMO1IFiKp117jc7QySbmubpTy0PT25bE/T2LL5Dzb/dhk8Lv9Y98ybTd/hmB
	8z7UnIPBfOn3+OnFsXmHCijmdXuM5fM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689437543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dF7OtGXMRje1f7jke9Bs430OqzMpDW752u+Jth/n5k0=;
	b=ANcEG9RxazYJVtIsY9+2slZaSPwGQJ7AmdoSgcFOm/aWaH/Si/TpeUFgkwY0mlOKKBDxPc
	R7urhZ50PD1hfDewMKzon25rvlr56d9YMM+7lQrrGjvaL3Ch90wI0DWYKB009PR/r6AdBR
	1N7kqoUY9yaJ3bIgFQmgLii2lmAGJxk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-MAMQduhYOPu2BUURomyybA-1; Sat, 15 Jul 2023 12:12:15 -0400
X-MC-Unique: MAMQduhYOPu2BUURomyybA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fbdde92299so15532865e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Jul 2023 09:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689437534; x=1692029534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF7OtGXMRje1f7jke9Bs430OqzMpDW752u+Jth/n5k0=;
        b=KKltSpJTA1NQmby8cC/tpafhoOtWRuwjR5InZHg2Mh5xvUKkQWREfdb9AlbJul+J43
         dC7OZjSkvtabQnxOxOpLSKjGBJgu1EsQJ8DR4F/zKjmz4MxHEEQDUxEbY1rZDFA6rd+w
         OApmuCk7J2G2cxxzz/KgLNjGYXe5o7JR9bR3WAVvCFRSinY+LItqCGXkG6fMtF3mH/cg
         ZdiHqK14oYvc777IKBva3UlDNC9gB8LreDm+GaU0mBFTgWwzjBCp4yLXJPt+/01zlKDY
         Bc8CTa+8w4MlzKUVKQvnkVzLDjAQ+u+32XlW1iXvU7PAU1GKkm3P+3a2rJhsTvhAKZNI
         cfxw==
X-Gm-Message-State: ABy/qLYo1SUApFlM7qpByHiplL7UpicVObFcbFFvAwZgzADXB3tWj9Py
	UFbg50ba4oDkR4U8sro7yxHJvdSZ4ODgCKn8LiA9TcPmOC+qEViyG71BkYPZlHGRLp3zKvvftB5
	sovsTqMsHNVKb40xwpcgLxzaAT6/Mxgws
X-Received: by 2002:a7b:cd96:0:b0:3fc:10:b25b with SMTP id y22-20020a7bcd96000000b003fc0010b25bmr6623414wmj.21.1689437534440;
        Sat, 15 Jul 2023 09:12:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFpxpfSQFWVxs5xId56kuqovmHBkCRVcENJq+und24xVDDj0feG9wpZsKiSMo/jJvMcazXpMg==
X-Received: by 2002:a7b:cd96:0:b0:3fc:10:b25b with SMTP id y22-20020a7bcd96000000b003fc0010b25bmr6623408wmj.21.1689437534192;
        Sat, 15 Jul 2023 09:12:14 -0700 (PDT)
Received: from localhost (net-130-25-106-149.cust.vodafonedsl.it. [130.25.106.149])
        by smtp.gmail.com with ESMTPSA id y17-20020a1c4b11000000b003fb739d27aesm3922717wma.35.2023.07.15.09.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 09:12:13 -0700 (PDT)
Date: Sat, 15 Jul 2023 18:12:11 +0200
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
Subject: Re: [PATCH v2 net-next 3/9] net: ethernet: mtk_eth_soc: add
 MTK_NETSYS_V1 capability bit
Message-ID: <ZLLFWyr5LbeB/Px1@lore-desk>
References: <cover.1689012506.git.daniel@makrotopia.org>
 <a2022fd2db0f7ed54ab07bb93b04aa9fc59033b5.1689012506.git.daniel@makrotopia.org>
 <ZK+ibBKWFRniQ8rK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yB+7pERcjQZkUudn"
Content-Disposition: inline
In-Reply-To: <ZK+ibBKWFRniQ8rK@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_171226_263796_95627EE9 
X-CRM114-Status: GOOD (  19.06  )
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


--yB+7pERcjQZkUudn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Jul 13, 2023 at 03:18:23AM +0100, Daniel Golle wrote:
> > From: Lorenzo Bianconi <lorenzo@kernel.org>
> >=20
> > Introduce MTK_NETSYS_V1 bit in the device capabilities for
> > MT7621/MT7622/MT7623/MT7628/MT7629 SoCs.
> > Use !MTK_NETSYS_V1 instead of MTK_NETSYS_V2 in the driver codebase.
> > This is a preliminary patch to introduce support for MT7988 SoC.
>=20
> Rather than using capability bits for versions, would it make more
> sense to use an integer for this, so you can do:
>=20
> 	if (eth->soc->netsys_version >=3D 2) {
> 		version 2 and later stuff
> 	} else {
> 		previous version stuff
> 	}
>=20
> ?
>=20
> I'm just thinking ahead to when we end up with stuff that v1 and v2
> need but v3 and later don't.

ack, I will fix it.

Regards,
Lorenzo

>=20
> --=20
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
>=20

--yB+7pERcjQZkUudn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZLLFWwAKCRA6cBh0uS2t
rBvlAQDy03bEQ4loaAkQrbJsOLuS7fpBgSkRYBHq+v1STiH+dwEAhaatBwH6Dv5n
6nKwAO3GR06rfY1eFCm7uJkttIs/XwM=
=TLpK
-----END PGP SIGNATURE-----

--yB+7pERcjQZkUudn--


