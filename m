Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBDBC982F1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=; b=xoXw4x0LE4nhuw9d7ivfhCfZ9v
	3THl+/SxB27WUf4d3JGbnnP9Y5lmgezSru6nOTH8Y36+QVmmzYsjeEOmdjtP23Um/z1HjDp9nTu4C
	c0+PJrP0nBMvh9XriJX5lq+YJiXgJpPj1cblNR8vh3CyYJ75yUDmXrF5vhiR0df+Mw3LDwB3uGdKv
	FMbahD0CRhAy92kHa41SdQS3sOK+dIZHgwRlGw+JMqONb6gMJRxT4uXmRY0WF2yle0M3H+fcPOtW8
	nB0rfeMHbpbYoAE46SYYL4ZoH+5oHoUfmFMwA5uespAUpBuwbpMsTOGeZui6Uwk757YU4uN+iyUCK
	efFEQ0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xWI-000000051fj-2JEt;
	Tue, 22 Sep 2026 10:14:38 +0000
Received: from mail-qv2-x0f.google.com ([2607:f8b0:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xWG-000000051es-0XHF
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Sep 2026 10:14:37 +0000
Received: by mail-qv2-x0f.google.com with SMTP id 6a1803df08f44-90cdfcbe207so44781236d6.3
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 03:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790072074; cv=none;
        d=google.com; s=arc-20260327;
        b=TMGVrnf6dwchkO2qXHj2hEeXRrQkQ6593qO1sP2CcAfZIcQayNx9GG/u7x0aSUe5Bk
         F/PdVnk3FLyvSM/24gDhmO4PcZ/8naetl69OhxuRxKopbK0mF5UX2tZ/WgmBAfUq2EvD
         teHu2+cskjQGAv/xKM2pd89c1jpTJvwms7RnjIq8Z7KdfmoIg2tmNAutpkrU+UQO9OSF
         4rinNLrEOxLWqsUxmjW5b+or9fd5RS/n/wPwo1E0D9JZZCQhUnVILoB3zuV1/q6NPRRT
         mKIMdx9gY+khv5cSg2SecPLeGKwzw4GTXL/IMyW6l51alFgiJ1LyXa6bhhAq9kFwg9na
         GzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        fh=TLozUS0v5JIZDb7CVVz6QRgxYf7flQ9SW7wNENfJngo=;
        b=V51007rgvOJje9uFhmQ2Ujc95MBo9E6dJAVEsUj5Tc+JoyhLzBQrO87k64kNPPbmpb
         hyCX86Fl1jgepemX6NMs6yfpkgey1hnD1qkahBs/6cP/vl5xRqrQ3rJ47IUFNWv2vv8a
         f3qDpnlM1mgIlKoB4t+dRppdejtgHQQYEQM9WNyZFx92XBMw7c7veS8WpioyWEwPM0+9
         8VkXl03R6clO4sRWoNl1L2sDO2/KDhHSkWM48TRjXRinf9zDqhoPlD4/CSfTwPD0l9u7
         xtoGD0TAA7yO68CY/XVJEmnnCQdSi7aggJ1iPOUWC/cxi7YQTyt2sZflMNlBaDKuYCOl
         CucA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072074; x=1790676874; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        b=AG4pAUIM8kdzWFW6t1eJ7r7a4XR5NpaHb0IaOIWXBFSZFSzCBB9omiMO4NlI9EKaHR
         PXDlZ3jF2ROekisE8Qz8T8r/4O0mm6ADezf+uq0foURS38rH4p3oDveY1SQwZG/ZU+1y
         LLdY/BNwCLQZUZoOSY9caBkb48tgeDbDsqyKtK+PcRScENxRkU6ScpcEqUusD8ZTDHyU
         hTwkbayV2iwrHjS1Ijysf9glAa8x3YQg9QJFyh/+LZY/2eBK891JsvHNopJ4FqW54Zfd
         v/VtzlVXfmWVM0k7rCW8jOTfxxoMeSccoKqs4H7kR/uipzRhPQ66q44arJq6hN+FN5pp
         MDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072074; x=1790676874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        b=tNcF7XUX+jxjkyiVz3dudhTQpnKgBX5lCLqeswvWZhElM1f6OGtfKwoKCGx6YJCIDS
         nRbRa6vLH2eG20Begnsn7EF4Bwfg6e8HiHLIN01ROlmIllqYV6YeHC7wHGtI4F9eUH8k
         rRRDaSTkapxvdKdxktO2V3RuDtZyRnLyrkrTt3IltBERdCl1JZ85o8e7iN+KglpzlcVp
         LO6fh6+BzUMjztkk9gZS9T3VXKDK/EPDMfunLxthrq56s7kkmgt2nOWVTkJXyWhcuo9C
         +6urpbe1CvQATmT1tNgaapCs++2Q7XzuLGNR5V2XshZm0nQHx1pUTn+mcf1QcLmAQBAV
         kT1Q==
X-Forwarded-Encrypted: i=1; AKwUvByRQWbDKtnCf14aQYN9zmrikRZYSI6V7prPZw9R8hC/BNjQOFF74RoBH+pyT4ygIEcESPL+n3k5OJEZydWFaQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nmDHQaQr1BWtvK7by/J1xpx+oiSJ/AnQinnCfp15DHdPcVIevH
	hSWvR2ny1l0HtGjFrr4e6WnTcYfFx2DILGy3HRG/TAqiTM+0Sbtd7wNjf3zgREdr3ZHYR2bAHiw
	qBbJ6AoWKfQd2yaEtyq1xSOOFR8v/kng=
X-Gm-Gg: AYBFou2qFojbZuew/IjbHfLY7uMsoPQqny8OxVYS1wa0TYFIoGv3s32wzfAtZhBeTGo
	15bqvkwB0KiCj1zDnyJe0ffEEnOZUgyPi/mk8OuzyXCdw5nF6QKVwB7vcUZamSb8tLJjG+DlXwZ
	y+mSNXl91KbAOrMubk6hW+Q1H7xLuGJFdlQHW1/sm0owJvd/R7YcYXSnQrJKTSQ3oafUzZbDIfs
	o7DSfvAwhjRA90bORqmcRoWFfwbYSvoCJLAwP5OVXijlHpfttWxs2Lnclj6zastTZbyR2e1ti4a
	7WyT4/480YoZsN3scDtCZ9PrVwQRByRM9mg+lknQAJOBxRWjwhm/sYo=
X-Received: by 2002:a05:6214:d63:b0:913:fa79:99c3 with SMTP id
 6a1803df08f44-913fc94b160mr46562816d6.43.1790072074583; Tue, 22 Sep 2026
 03:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260915123812.14747-1-ansuelsmth@gmail.com> <20260915123812.14747-5-ansuelsmth@gmail.com>
 <20260921134410.13a7173c@kernel.org>
In-Reply-To: <20260921134410.13a7173c@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 22 Sep 2026 12:14:22 +0200
X-Gm-Features: AcwNN1WQadm9kZulSu2D2w98S17OkpHd-MeZLtXiKqWwHyLw9Fh6tPwUuh65TfY
Message-ID: <CA+_ehUyFH_ZSsjhp-U9WBFoRZR-ZMWnNQ5pY5vAy1LxUU5hSsw@mail.gmail.com>
Subject: Re: [PATCH net-next v22 4/9] mfd: an8855: Add support for Airoha
 AN8855 Switch
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_031436_176167_30C92A2E 
X-CRM114-Status: GOOD (  16.29  )
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

Il giorno lun 21 set 2026 alle ore 22:44 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Tue, 15 Sep 2026 14:38:01 +0200 Christian Marangi wrote:
> > Add support for Airoha AN8855 Switch that provide support for a DSA
> > switch and a NVMEM provider.
> >
> > Also make use of the mdio-regmap driver and register a regmap for each
> > internal PHY of the switch.
> > This is needed to handle the double usage of the PHYs as both PHY and
> > Switch accessor.
>
> GCC spews warnings:
>
> drivers/mfd/airoha-an8855.c: In function =E2=80=98an8855_mdio_register=E2=
=80=99:
> drivers/mfd/airoha-an8855.c:438:48: warning: =E2=80=98-phy=E2=80=99 direc=
tive output may be truncated writing 4 bytes into a region of size between =
1 and 61 [-Wformat-truncation=3D]
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |                                                ^~~~
> In function =E2=80=98an8855_phy_bus_register=E2=80=99,
>     inlined from =E2=80=98an8855_mdio_register=E2=80=99 at ../drivers/mfd=
/airoha-an8855.c:469:9:
> drivers/mfd/airoha-an8855.c:438:45: note: using the range [-2147483648, 2=
147483647] for directive argument
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |                                             ^~~~~~~~~~
> drivers/mfd/airoha-an8855.c:438:9: note: =E2=80=98snprintf=E2=80=99 outpu=
t between 6 and 76 bytes into a destination of size 61
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>

Hi,

 I also didn't receive the email for the AI review... Did it broke also her=
e?
If everything else is ok, should I send new revision or maybe we can pick t=
his
and I can send followup for this warning?

