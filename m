Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C15BD7237B
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Jan 2026 22:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTgO0VCdnh1CfBBoLFE4r4P+fwbkrM17HUN8i/ddW6M=; b=T8A5YKzkTzy4dZMZNY3pEhrNrw
	HM83NXhbbuqMzJe6C+j0usKLiWWgQS+NNRcqtLRT9ShtFADZ/xh7ZqMqRPCJHof8XoW6WMojqrLv1
	Luo5T0ZxGWU8qoh3sD+X6RLjdYAZnq5xg/GxGpbkEHLyiNEbpBv9nZ9J4OW7dn/cDgjzJgQp5YbzL
	1xV/mnolsIJ5h09Mbep/smEM3BZeSN9NeyJQdmrmKo+Z2e4yYBjiYGZ80Kf03WNABSFqdiSajYLMg
	BTG9LtMJ4w0cqrwZcUmGUk2BrLNBKftlkYERgpnQj7e2voLXhPhdf558LPn0GPD18/ZOFjH01fbRe
	2GdbcZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk92O-0000000BeXq-0hVo;
	Sun, 25 Jan 2026 22:56:56 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk92K-0000000BeWt-3Zpw
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Jan 2026 22:56:54 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-4044d3ff57bso1189576fac.0
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Jan 2026 14:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769381809; cv=none;
        d=google.com; s=arc-20240605;
        b=fO6P0mjcc4cmNQdjNUlDcM5EWha6DWKfypGF8GaR+60p+pRRgHzUSvWLfRXh1+YpYM
         Y8Q3/VJfgLQfN46qHysYSX8Mjpkbl5Fic5dDXhzlprJXhuK4D8ZDw4Cc0d59PDsbkiJZ
         st6G2Zle1qyP+/eK4+nSmV1SfcARHfPIzxiTTDOdwqXtEW/nutDT5YCLAUdxOJjO8PkR
         xnppHcOxGO5c6881rCl++nvzdVP0KzokWnpzuarL5snYtO2rusoLwD538aL/pPxFLNlR
         O5oEsj6IG/aurlMLMSMnWLzrnXyEjgbqA1MKSeMlGMv2EmECOTuc40EhGot3RCfaaL7p
         dR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zTgO0VCdnh1CfBBoLFE4r4P+fwbkrM17HUN8i/ddW6M=;
        fh=vUGoQzgp3PQintuU0NjYMxFH2nBJG11UYTczOsTQP9I=;
        b=de9JATJCdPH+gu1c9hB4ih84My49YGefcYKmhP4VklEs6tkwssY3SIUz1sqyFI3XM3
         wlKg4mxP+bhFA1TOavvk6JMWEwS2Bed0EX9wfFMWodEqY3PJNmypTtlBVcDWFyRV2iSt
         13iQIY6RtlCpF/He5grJYWo41lPEq1FYu6/9HbudRerixidlr98k6KjKx/w6sz3IPrV/
         MBwxTNhZuhrnfQ0ejP1TPGFd4Vqv1vwV8vLa6biXSDms3HKtzMdb+J+wGoHQ8AKla7Ij
         SPlx7k+rIG+8PJpTHC89hvvcMFUUD1HlkGMdb059SkCKiotsTq9Brsi/8ZGFE2OHn13W
         914g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769381809; x=1769986609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTgO0VCdnh1CfBBoLFE4r4P+fwbkrM17HUN8i/ddW6M=;
        b=UqGF8g8S7F9ynNkKu+28BW9YUXYCWrKii4xvYZ7BYihh1AGqvcp9FkQ2veBk5jNPDN
         BiAiRrwh/vby2aYyZQAxnTwFYD+qHSodkN1qq0YVGelzhqTNw+QQaeXMFiV7c/i0Pdaq
         6m0Bnw4mDdVuTLR+BR6bRkkQX6Zi+tE9gyK1qnEP7mCWGh+f2ttRUE2KoZrNKD771R+t
         JwH4cUudjt/o4HdCGsZnvMZm4ZIW/oOMlYPp9BQQP86atjZR2AFepm1qjATVTLYLopk+
         To3AprjOfiHoR4DVc2EOQGBxYimM4EUMMCtPUsTo8N1awy13lccyzna1oBiLK2+qodLP
         tRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769381809; x=1769986609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zTgO0VCdnh1CfBBoLFE4r4P+fwbkrM17HUN8i/ddW6M=;
        b=tJr39vuK0QTjNV/yrwmsUlPZwP1muA0NNhNHmQZmwSFb12V42bjj3vY0Ui6sg4mm7c
         UPcNM+PWbXwobl2/TwgXi2CizjIQFRtHZssMeU2IzITWKKnMLd8VO0RXSow3XQBfCcdV
         XPQbUjvTB7ETNqrV9RK7vh+Kpu/qX8/kztaddl1gtGbJ82K7TjjZk2mzZLhKIeDDlZHO
         MX7iMe/GUjM2y1+e4YQb0vPZIFM10a8pjy6Zkkev7CvMXpK3xAgW0iDZ1zTk6lOLvt6z
         x0cKXaHGcux04OJDfutrCxLrcm/ATYtNtm5nwVQuBPhGaSuxWazsTqONV4QbNh5n5dIc
         j87w==
X-Forwarded-Encrypted: i=1; AJvYcCU1Qs3X8QZg7C715pBdTvjmXyLo7DTgIdLDdFZYLfehqamQaRlYYiAAn3osMzEsjyIy9Gba5C+0FdLqwO5KZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuO/ugNkjrAujxnihM2UNmgkiKkAiNyykia3ScShTazQw0whXV
	mRwaejqSIXswViuhW/Nr7W6glUMzknFTj8pZlaZXCivUX1YAU5VSQbDXEn2fxE810nKjntbupFe
	/8/C9aMu9azz83x5y85zqk4C5BOFnd6I=
X-Gm-Gg: AZuq6aIEcqVxrQ6Z4qXCIoFGsC7fEpYbyz2FezZpl1R8PNqsGnUaQmlPRD5ZQ8WYosN
	kShUTtzVwQfncHA5/TDr+Uy2E2so3RDsNWkc6FSaK5Wp2ziucheyC2A3hUZbLUv4zo7XLMuf9lq
	ZyKMwkBEv0r60mJOOYjhWoYGLVQzrVUxrHlscWn+G9dqCe2Maip4gcN2lssiDy1x5kAvl15v0pp
	e1seHzX+lcAdpAR0+aew/YuJ4s91aYVU+XTulYk6QBZMhQPw5GlQ9O+3v+t7OTHpSyAq4I6IfHE
	GFbOjLqoMHyuEBaW3aW/S0/zyHg7snG6iaTadHm0WLn8TEw7yQdHa9+YT4e2
X-Received: by 2002:a05:6820:1609:b0:659:9a49:8dea with SMTP id
 006d021491bc7-662e0450083mr1377281eaf.44.1769381808725; Sun, 25 Jan 2026
 14:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20260122185255.2761568-1-mmyangfl@gmail.com> <20260125223455.31fd7a93@pumpkin>
In-Reply-To: <20260125223455.31fd7a93@pumpkin>
From: Yangfl <mmyangfl@gmail.com>
Date: Mon, 26 Jan 2026 06:56:12 +0800
X-Gm-Features: AZwV_Qh11aaleaFzpaDBhtbnorJB6-ZX9WBC2tkVSbFXNX7yzlrhcDRvcGkAFUI
Message-ID: <CAAXyoMOtMz9Hn=gqS1Wj0ASTZ1JaReZnc685h7YN2sD9zjrtcA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: airoha: Use u64_stats_t with u64_stats_sync properly
To: David Laight <david.laight.linux@gmail.com>
Cc: netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_145652_957407_170295A7 
X-CRM114-Status: GOOD (  23.59  )
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

On Mon, Jan 26, 2026 at 6:35=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 23 Jan 2026 02:52:51 +0800
> David Yang <mmyangfl@gmail.com> wrote:
>
> > On 64bit arches, struct u64_stats_sync is empty and provides no help
> > against load/store tearing. Convert to u64_stats_t to ensure atomic
> > operations.
> >
> > Signed-off-by: David Yang <mmyangfl@gmail.com>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 136 +++++++++++------------
> >  drivers/net/ethernet/airoha/airoha_eth.h |  34 +++---
> >  2 files changed, 85 insertions(+), 85 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 62bcbbbe2a95..6ed220e5a094 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1472,131 +1472,131 @@ static void airoha_update_hw_stats(struct air=
oha_gdm_port *port)
> >
> >       /* TX */
> >       val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
> > -     port->stats.tx_ok_pkts +=3D ((u64)val << 32);
> > +     u64_stats_add(&port->stats.tx_ok_pkts, (u64)val << 32);
> >       val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
> > -     port->stats.tx_ok_pkts +=3D val;
> > +     u64_stats_add(&port->stats.tx_ok_pkts, val);
>
> Wouldn't that be better written as:
>         u64 val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id=
));
>         val =3D val << 32 + airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(=
port->id));
>         port->stats.tx_ok_pkts +=3D val;
> (Assuming there something has stopped the hardware increment the register
> between the two accesses, and there is an associated atomic zero.)
>
> Otherwise you are generating 'tearing' on 64bit systems by adding the hig=
h
> and low halves separately - regardless of how the stats are read.
> I think that works for 32bit as well.
>
> Making the code completely unreadable with 'special' types and 'special'
> copy routines really doesn't seem worth while.
> The compiler won't generate code that does 'data tearing' for aligned wor=
d
> accesses, and even if it did nothing would really break.

Quoting 316580b69d0a ("u64_stats: provide u64_stats_t type"):

  On 64bit arches, struct u64_stats_sync is empty and provides no help
against load/store tearing.

  Using READ_ONCE()/WRITE_ONCE() would be needed.

> The most you want is a memcpy_in_words() function that guarantees to use
> 'word' size tranfsers for aligned buffers - and is probably an alias for
> normal memcpy() on all current systems.

See https://lore.kernel.org/r/20260120092137.2161162-1-mmyangfl@gmail.com

And if you want a memcpy, you need a buffer. If you want to fold the
buffer, that's basically WRITE_ONCE().

>
> OTOH data tearing can be seen for 64 bit adds on 32bit systems.
>
> It is worth nothing that on 32bits the 'packet count' and 'byte count'
> increments get seen as a pair, this doesn't happen on 64bit - one happens
> before the other.
>
>         David

