Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E250EF36E5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 06:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HM7LGVWVOUido3DYx44xr36FVGYSQBajWYQuvhGqhfg=; b=OEj2h1GLQ2+kI+bMVdap/33Jgw
	sLhETTuQAG76TEwyX5GiolXJZcZLjD7/kTGbLBdkAKaa7tXF8Om/+gitYJ6q2Jz17TxwF8HVKeWl/
	Rm9WNfUZyhYpMV2qf/bCvwFE3DElYdB6QfKvz6lmSIxQd6iMiZzAMfJJeY9UWgIC4E1fZrYcVXVrs
	Iz9xZB7m86/qAnlrK7Cm3YnttL3WBWH1u/OJgM2/sosl73dNgSeC5lMi2LptiUQQ+Z5MQm7JINgRr
	5cs+70f9hQOXPGvEd5AnSlUhtsDGTnzcbuA4Bt8Y9UcTBYEdQtWcemCUcJ1evHCYEa+1hPdDREqvZ
	9wWMybCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUK6-00000006kY3-0cYm;
	Mon, 09 Mar 2026 06:42:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUK2-00000006kXm-14mr
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 06:42:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6989560121
	for <linux-mediatek@lists.infradead.org>; Mon,  9 Mar 2026 06:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20631C2BC87
	for <linux-mediatek@lists.infradead.org>; Mon,  9 Mar 2026 06:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773038553;
	bh=bK4Sr5UqmtGz43bgA7L5468rrUIu5McOxaPwXrtQ7p0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mWwiKulvCnIo8rj5DXimcH7a17H3bDJFPKPAx7tJIQ4vHIWnQrZEIQ6ywkUTm+0ok
	 CcXNmZCQAdb+TmRvDZwbxCIF0k4T1SxdXivx+HaOWN1/xNxuGQh/pz/HIakYb9jSBP
	 kjCYyh37QMygU26kGR1ID21XVOAogrZpbPVNIt7kUx+23eUV5MUU4X4GLwCdzHSTu1
	 s6A4a6I7lTr7Fg0OgKcn6S/2i31i0KVJydGyu6OhiYhJwJWxOcjZS1aIQ1x9YKecTt
	 gy8912SdEbV5PT+Te0K+UBVnuyDh5cJIuaB/oG5FVXW+92hdR+x/aLnv9W3PH1sUUO
	 lfi6YIRC8SE9w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a12c19affeso4812261e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Mar 2026 23:42:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUADkJhluN3pG0uKgxz7qoNf8uZLOfNdD5jHRfmmcyefM+K70FCgub4zpUSh4iGYxc7kot2eCSSkGc2RCAbag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCtsPSfsTMf9FOwadHFohpEfKKPWhFP0IZpjocsFCJ+xHemSoQ
	kfDZFXKo4BvkCqgUTupzJHNxm5MT1sGn/llFCxlsa+w1i8TSGG4lcXgEkrbU9glAtIku/4MNask
	jsMYAuLVe8LeJfYce7x+T2FlYTr16L78=
X-Received: by 2002:a05:6512:2241:b0:5a1:2c19:4e83 with SMTP id
 2adb3069b0e04-5a131f27b2fmr4547137e87.20.1773038551421; Sun, 08 Mar 2026
 23:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <CANAPQzi3BkfnRS4CEXAA560O5cO8e6MEYxeVVx1u+xUeXS-gmA@mail.gmail.com>
In-Reply-To: <CANAPQzi3BkfnRS4CEXAA560O5cO8e6MEYxeVVx1u+xUeXS-gmA@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Mon, 9 Mar 2026 01:42:20 -0500
X-Gmail-Original-Message-ID: <CAGp9LzoidBL1iYYC371+Fw+drbArLRTneJKxCoFiitx=dweKCg@mail.gmail.com>
X-Gm-Features: AaiRm535bp3mMDjGT40DMDnRmBiHn2tomilrBSmxbcjZXNAf71PJZph4xcRZiHw
Message-ID: <CAGp9LzoidBL1iYYC371+Fw+drbArLRTneJKxCoFiitx=dweKCg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mt76: connac: fix txpower_cur not updated in mt76_connac_mcu_set_rate_txpower()
To: bryam vargas <bryamestebanvargas@gmail.com>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Fri, Feb 27, 2026 at 3:53=E2=80=AFAM bryam vargas
<bryamestebanvargas@gmail.com> wrote:
>
> From 0a29ccaeb2211451b88ad71c4c0cdbc418b7d64d Mon Sep 17 00:00:00 2001
> From: bryam <bryamestebanvargas@gmail.com>
> Date: Fri, 27 Feb 2026 04:30:01 -0500
> Subject: [PATCH 1/2] mt76: connac: fix txpower_cur not updated in
>  mt76_connac_mcu_set_rate_txpower()
>
> mt76_connac_mcu_set_rate_txpower() sends the TX power SKU table to the
> firmware but never updates mphy->txpower_cur. This causes mt76_get_txpowe=
r()
> to always report 3 dBm regardless of the actual configured power level,
> since txpower_cur remains at its zero-initialized value and only the
> path delta for 2 chains (6 units of 0.5 dBm) gets applied.
>
> Fix this by calculating the effective TX power using the same approach
> as mt7915: mt76_get_power_bound() applies SAR constraints and chain
> delta, then mt76_get_rate_power_limits() applies the per-rate EEPROM
> limits, yielding the actual value the firmware will use.

I wonder if this would fit better in .get_txpower instead.

mt76_connac_mcu_set_rate_txpower() is primarily a programming path
that pushes the SKU table to firmware. Updating txpower_cur there
mixes write-side configuration with reporting logic.

It might be cleaner to handle this in .get_txpower with an
mt7921-specific callback that derives the reported TX power from the
SKU limits instead of updating the cached value in the write path.

>
> Fixes: 3b4a3bdba808 ("mt76: mt7921: add support for reporting tx power")
> Signed-off-by: Bryam Vargas <bryamestebanvargas@gmail.com>
> ---
>  .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index fc3e672..4ed31ff 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -2272,6 +2272,20 @@ int mt76_connac_mcu_set_rate_txpower(struct
> mt76_phy *phy)
>              return err;
>      }
>
> +    /* Update txpower_cur so mt76_get_txpower() reports the actual
> +     * configured TX power instead of always returning 3 dBm due to
> +     * txpower_cur being left at its zero-initialized value.
> +     * The value is stored in 0.5 dBm units as used by the SKU table.
> +     */
> +    if (phy->chandef.chan) {
> +        struct mt76_power_limits limits;
> +        s8 tx_power;
> +
> +        tx_power =3D mt76_get_power_bound(phy, phy->chandef.chan->max_po=
wer);
> +        tx_power =3D mt76_get_rate_power_limits(phy, phy->chandef.chan,
> +                          &limits, tx_power);
> +        phy->txpower_cur =3D tx_power;
> +    }
>      return 0;
>  }
>  EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_rate_txpower);
> --
> 2.43.0
>

