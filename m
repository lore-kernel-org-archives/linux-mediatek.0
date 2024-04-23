Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEEEC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBMZNUyJIPofXPkOd98UTYjMLrIF0XA88T6Ccx+cOro=; b=gyKsrpKgmQhNt8nGdHPrLE6tc6
	wXSGzUDMzE3Ei9nIJadUkzWbYwnptWRGMBexDnp1h2d1kvqWusWAjkD1S7zvZv+Bch5vdylcmS0o+
	Jrm9fgcQWv4qAj52BVAJ5RlyzvdePe9WWbQqhlU2quAumuDMql0Tn05l0c07/RgimNDPfsmKv9RA4
	sX1wtUeQ7Gj/v4r88WvsgIOODdkLBbBBm6vkhwLtqXRFK9P9Yj+qkZSw/ts3idRCDOsQuXL1fgtlJ
	1b4N7N0gkHhIXRXAaFk29/QtzPNTJxPagf7/wf03ZnLluk3VCdvmz267bixE0DRFG6PM2fPY6j6m8
	GOBZWdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzBi2-0000000GUah-0j1B;
	Tue, 23 Apr 2024 08:41:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzBhx-0000000GUWk-2xyx
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 08:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713861655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fBMZNUyJIPofXPkOd98UTYjMLrIF0XA88T6Ccx+cOro=;
	b=BXP4IbJicuKj9y5NbLBPeSWUKMUs3EO2FhXEE3cE3qUm5nAi3n55Nd1cavUet0li01tcJZ
	tnPOLyMtaBR+4O3koxQSBY9oAL0fHSnwFaHeOzb53c+PbCZHldQJvHY7YAJ6DggKWhRFxE
	0ugSTDpy14qNVUNtnuIkbIbXMQUXSWE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-JgnsgJQ2Pf-Ezb5DEKOU2Q-1; Tue, 23 Apr 2024 04:40:52 -0400
X-MC-Unique: JgnsgJQ2Pf-Ezb5DEKOU2Q-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-349a31b3232so713701f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 01:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713861651; x=1714466451;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBhy2NIZyHBCakG2u3+dlgMj9SbpEWO/Yr2w1puTclg=;
        b=mW3IyJ4x0cKRUr4HwmMCDodhlWGt8uanqQxQkAS2LBk5Lv/aSReG7ZcMU99JzRTs9p
         co6nx+Jfz7cTUEUm1jGXq2KhZaY86zdeEH6eG1J29ZEPHKNgcxNdQ3c4cgmWUTtjbXwk
         qDfOyuReCRHgCj8npY3Tk1W1y79wptvLUAWTnzeiUlOC1HSDsMpEBSfaBsqHaY4aYQ5L
         3AJgL1/lqCACgwMU+6r4g1fS9obIhW8ebCbmlBs1mxbN6QbscVf1nqIuzIMIVHlMYO4x
         rCB3llD0RwkgpUGicoVu2pEWsfuKBszE3G1KH/wL+bJaUB1l1DZgtqf1MeVrXN37jWI2
         XIIw==
X-Forwarded-Encrypted: i=1; AJvYcCW/PfBrxeN7eSOqSEMUJooww0Oi5/jsY6vLT0M4kQB15wiopc7F4ZND0LgqlAZb023q2aHOG/Fj6fi4eIzrguw6pojeRY4rFrVx/hlSyA8M7E3e
X-Gm-Message-State: AOJu0YxHcTw2kt4WegAP/xRjKjyP5IZ5SjKWiBrjzhYy9dCZI3sYmAnr
	aAx1avbOIacGq+79Tm4fa9CgvesOiTxDEq+dLvOd61qfRTCYONy2C1UQ+EmRS0yaWLZjiGjbefm
	AyHuy58EDHUgc3ZLZIwR5YfbNhiH56B/EUMXRrvz3d+DO+VWeVb4D7b+wdi3Es232FuHVug==
X-Received: by 2002:a05:600c:3ca4:b0:41a:bb50:92bb with SMTP id bg36-20020a05600c3ca400b0041abb5092bbmr696571wmb.0.1713861650916;
        Tue, 23 Apr 2024 01:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuYGM+Izwbr16myDEMQ3YHgPrdTyUYh8tJVaQzd3+LFEzph55+XImIQrAxk2Nx1xsGhnoCdQ==
X-Received: by 2002:a05:600c:3ca4:b0:41a:bb50:92bb with SMTP id bg36-20020a05600c3ca400b0041abb5092bbmr696555wmb.0.1713861650500;
        Tue, 23 Apr 2024 01:40:50 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:172c:4510::f71])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c3b8600b0041892e839bcsm19505308wms.33.2024.04.23.01.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 01:40:49 -0700 (PDT)
Message-ID: <6123223eaf54ea6f492c896d81551315a1e38f66.camel@redhat.com>
Subject: Re: [PATCH net-next v3 2/2] net: dsa: mt7530: simplify core
 operations
From: Paolo Abeni <pabeni@redhat.com>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel
 Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli
 <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com,  erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Tue, 23 Apr 2024 10:40:47 +0200
In-Reply-To: <20240418-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v3-2-3b5fb249b004@arinc9.com>
References: <20240418-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v3-0-3b5fb249b004@arinc9.com>
	 <20240418-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v3-2-3b5fb249b004@arinc9.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_014057_828973_A0EC3736 
X-CRM114-Status: GOOD (  20.09  )
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

On Thu, 2024-04-18 at 08:35 +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> The core_rmw() function calls core_read_mmd_indirect() to read the
> requested register, and then calls core_write_mmd_indirect() to write the
> requested value to the register. Because Clause 22 is used to access Clau=
se
> 45 registers, some operations on core_write_mmd_indirect() are
> unnecessarily run. Get rid of core_read_mmd_indirect() and
> core_write_mmd_indirect(), and run only the necessary operations on
> core_write() and core_rmw().
>=20
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> Tested-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.c | 108 +++++++++++++++++++----------------------=
------
>  1 file changed, 43 insertions(+), 65 deletions(-)
>=20
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 64b1f6320b9a..e0cb194019f8 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -74,116 +74,94 @@ static const struct mt7530_mib_desc mt7530_mib[] =3D=
 {
>  =09MIB_DESC(1, 0xb8, "RxArlDrop"),
>  };
> =20
> -/* Since phy_device has not yet been created and
> - * phy_{read,write}_mmd_indirect is not available, we provide our own
> - * core_{read,write}_mmd_indirect with core_{clear,write,set} wrappers
> - * to complete this function.
> - */
> -static int
> -core_read_mmd_indirect(struct mt7530_priv *priv, int prtad, int devad)
> +static void
> +mt7530_mutex_lock(struct mt7530_priv *priv)
> +{
> +=09if (priv->bus)
> +=09=09mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
> +}
> +
> +static void
> +mt7530_mutex_unlock(struct mt7530_priv *priv)
> +{
> +=09if (priv->bus)
> +=09=09mutex_unlock(&priv->bus->mdio_lock);
> +}
> +
> +static void
> +core_write(struct mt7530_priv *priv, u32 reg, u32 val)
>  {
>  =09struct mii_bus *bus =3D priv->bus;
> -=09int value, ret;
> +=09int ret;
> +
> +=09mt7530_mutex_lock(priv);
> =20
>  =09/* Write the desired MMD Devad */
>  =09ret =3D bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
> -=09=09=09 MII_MMD_CTRL, devad);
> +=09=09=09 MII_MMD_CTRL, MDIO_MMD_VEND2);
>  =09if (ret < 0)
>  =09=09goto err;
> =20
>  =09/* Write the desired MMD register address */
>  =09ret =3D bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
> -=09=09=09 MII_MMD_DATA, prtad);
> +=09=09=09 MII_MMD_DATA, reg);
>  =09if (ret < 0)
>  =09=09goto err;
> =20
>  =09/* Select the Function : DATA with no post increment */
>  =09ret =3D bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
> -=09=09=09 MII_MMD_CTRL, devad | MII_MMD_CTRL_NOINCR);
> +=09=09=09 MII_MMD_CTRL, MDIO_MMD_VEND2 | MII_MMD_CTRL_NOINCR);
>  =09if (ret < 0)
>  =09=09goto err;

What about a possible follow-up, moving the above writes in a separate
helper (say, 'core_select_register' or the like) and reusing it here
and in core_rmw() ?

Not blocking this series, I'm applying it.

Thanks,

Paolo


