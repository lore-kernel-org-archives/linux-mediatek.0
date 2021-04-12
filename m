Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083BBC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 10:34:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 992886121E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 10:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 992886121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lRHlrYJY+bAw38ML3W37iETfvjkp8XVJsTtFL26qi+Y=; b=LLrF5Vay7+Nb+WsasOy+5W6/d
	XyOPc6LftgRkGbs6fFuaCEyahK04Lo9UV0yk6AW84wgb3Rqr7iWMMq9q7rVSqmE/tuid4JTlUfJ5o
	0SDTRRYIaKQJl2TvWnzUg0gOWpwAE/Kr+1cOR7ngWZibh5q5PVY3eB5ci2CweDJLhMWtc9lYNc/4+
	75dOWcUcfHbGbTGGJgON6HasKPyOnzbAd33RVDQKMIxne9yX2zuplN9RxTm/t1zIicHXAiS66x2HW
	JC/T+Pd1TIyVhk/WdbP7fOJn/06kSCgZefURlJO+fgQAlrs2Cp7pF+gpmuNgHMcj/exZxagJCLiAp
	wdQe1JNOA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVtt7-006RoY-Q9; Mon, 12 Apr 2021 10:33:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVtt5-006Rnt-8L
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 10:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IeSCzkLT2TMeD064rdqHLGZki7q9FiMEKUBGP2lah28=; b=atQDWauWGBhW7JbLcTdheBpGYB
 QWSm58P4vbFjsBwpffwMghUOVvVJpRQh4bF6rbZSj5GlXBdxTYCM9DgsAX6W1L+sp/rqnqBZUrx5r
 2v4YNzH5AwASDW7P4TsrESJfO2J0SP7QV1hbizXjAAnb7kas8r3DB+ksZmgHPdzgAEkj7cCD4YBoa
 G33om+Ge6ukCKr3Ri0LiJdW9ru1AOvxJaIFN6zZH+BQVUF9EeGdKvjjCnrcJGe1mSsofVaVyRmcnb
 YSHW6EINU8wlQM3U9+N+R7IBfEPGQxUA+gfF9ph7+jYerGp9UjeHQiW5eHXEgJ7tScurN/1tQKUne
 qtYi0tGA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVtt2-0068dE-KK
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 10:33:46 +0000
From: Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1618223618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IeSCzkLT2TMeD064rdqHLGZki7q9FiMEKUBGP2lah28=;
 b=aOwrlZywc/YrJLZK9f5pAK6bVVkEAJbG8rauLdQSUcj94gqe+Ues1bT7vJRElQlm46GKsR
 e1CLophyGGZOa0Mey7nFRuHGdUTMMzw0WCaRlZQ3IAkbFEjtR0nAnPVhMtTVc6ZqrRpkPH
 ciAOWatoqHSKfJus4ox0SssJKJ+eTxQHOtS1QdUQkHcewDvdumoYjKYfX/h80g98f6QCtW
 Tf1+tgL6BixgjIKD+I63qAYKpXF6jPVhCYJ8wN9qTZ2pnEuJ95+FY41uZAaFc3mC/FJkPn
 o/QDPdzIPWgL7uBsEdjYBL76cMtZZA/V5CRa4DaEeXnsOncCelP6Z0pFTMXIfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1618223618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IeSCzkLT2TMeD064rdqHLGZki7q9FiMEKUBGP2lah28=;
 b=mFv0Bx9kAqb1f/heYquuq0cHNEKj9RxAiMiSk+K6nqcFWebS/8czH/Rp4qoCb6tCF46Lf/
 43lpqtFX4DniNNCw==
To: DENG Qingfang <dqfext@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo
 <gch981213@gmail.com>, =?utf-8?Q?Ren=C3=A9?= van Dorst
 <opensource@vdorst.com>, Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC v4 net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt
 controller binding
In-Reply-To: <20210412034237.2473017-4-dqfext@gmail.com>
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-4-dqfext@gmail.com>
Date: Mon, 12 Apr 2021 12:33:36 +0200
Message-ID: <8735vv6bcv.fsf@kurt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_033344_831129_1D413631 
X-CRM114-Status: GOOD (  16.18  )
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
Content-Type: multipart/mixed; boundary="===============0060323433757819906=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============0060323433757819906==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon Apr 12 2021, DENG Qingfang wrote:
> Add device tree binding to support MT7530 interrupt controller.
>
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> RFC v3 -> RFC v4:
> - Add #interrupt-cells property.
>
>  Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Docum=
entation/devicetree/bindings/net/dsa/mt7530.txt
> index de04626a8e9d..892b1570c496 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> @@ -81,6 +81,12 @@ Optional properties:
>  - gpio-controller: Boolean; if defined, MT7530's LED controller will run=
 on
>  	GPIO mode.
>  - #gpio-cells: Must be 2 if gpio-controller is defined.
> +- interrupt-controller: Boolean; Enables the internal interrupt controll=
er.
> +
> +If interrupt-controller is defined, the following property is required.
> +
> +- #interrupt-cells: Must be 1.
> +- interrupts: Parent interrupt for the interrupt controller.
>=20=20
>  See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of addi=
tional

That dsa.txt still exists, but it refers to the dsa.yaml binding. Any
chance to convert this mt7530.txt to yaml as well? Then, device trees
can be automatically validated for correct entries. There are a few
examples of dsa yaml bindings already: ksz, b53, sf2, hellcreek, ...

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEooWgvezyxHPhdEojeSpbgcuY8KYFAmB0IgAACgkQeSpbgcuY
8Kb6eg/9FdeRCvEbOTCVRDtl5lsVRik6QqjbYTaQLNrkEUmOA9SrkbQ63yxhPF2i
j7heR52USECwZDmiUG+P7CIlk9EIZhsgy4xQngJe8BvAa+Xai4Rybrn/0QIGv8Mp
vlljoycO8z16JNQ4BV7ySXGb901RZFHEDH4MovM30fXwjWLgkV0nwzl87Wj9uisr
jXob9CTbvf7h/+kdAfP3zm1vAscwLqS+JopIbp0qkUd+1B93LZ0E6hyzMTD0/IWp
S3XQNRMOWeHOksTxmZAUvtVB+g2HeQZ4s0sXzPJjlJ2e4XSKQephjd1kjFxQcyJc
Bw14tdWW3OdP6B2lai48RsswjximG50FQHLyUMtAJiiu0S96gC+OEbQY/tPB58K3
KgmW3RCCGvefVtx+OcOiLVYUerGrdHNhteFtrNHxBL63OH1T0/UEfCnyeEq5GcXV
LtfRbSJk2LoipSbyyqqbMptBXd5I5W8Ae5iNQ9eOmkZoG3Jmujh76mJAqV2CeIJd
Rn3PKti1JwpI036y5s048CZoUd7ptSn3T2DoHTuuVuTGbvVVU8HaY/NJMMaU8CYI
1+hluj/sJM9chjGwE270w8pgh8tQV5xnpzLDD54PcaWRiynfS7V2WMCnwdwMSNdT
mz2F2GXEDDrlTaao5T4SpzvmDad9IdL0vLcR+nnH2ji3zoPzMKo=
=+a88
-----END PGP SIGNATURE-----
--=-=-=--


--===============0060323433757819906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0060323433757819906==--

