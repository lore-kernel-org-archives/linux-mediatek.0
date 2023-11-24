Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A674C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 16:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0Guy2IikSc5MeYOJiXDfxaB0G9vo7MgKvXYX5tKlvo=; b=H0FIUsR2FPwnMh7jUMQJcrUhVw
	giS6EGz4cTsAhgHf1+zjJ3eGvAdQ/XHsKMIjpFRKCPti1JZG/K1FomxSm37zbat7MWSMvzvEu98qb
	5wj2U3NyerfV/RxPIGtqt09cabU3hHiW7XzYSDKald9adXG0YoNDQZz7yd3sZKMbdcxq11kThBa8S
	3Om01ZnuryhJ5cXSMFtfJsyO4qEYVztF7SrE3FEHLhjCpTFRAXAErsxRtZw4vuChgXarCMH6YmbWD
	4/BSJwfrsf7FzoGQAILcjuCH/J+ydMFq38O4KKvw9LRBvHdUKsNNYsoFf0wvrwRJjNQS6IJz5ey2i
	I+KgrOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ZWc-007jiC-3D;
	Fri, 24 Nov 2023 16:59:31 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ZWa-007jgE-0G
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Nov 2023 16:59:29 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5c21e185df5so1457949a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Nov 2023 08:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1700845166; x=1701449966; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0Guy2IikSc5MeYOJiXDfxaB0G9vo7MgKvXYX5tKlvo=;
        b=CbEBz1pEgZoAj6mSlMWx8HAEYDvh6rNA5GDDkyyAxnCdm308b3HaA+/yhK4lGrWHdY
         sXDyIxVS30+hDmz5kk37bcse6PE/mO0vzl5lS9B2xytfAPa/wMTIelkRhTAd2SBoVO1E
         hc9WD7g4uLertbDpFvBGFhaLMXfHrd4Ih3yAs18fsCyad+jUr/0aAyMQHwMle1YTlgdW
         mgRkvHaEoBvA9jKucGNFpGGGzr/6ADKqXF3fkefchQ3xyozjxF1FejiBTXccIHVDcWtg
         vFKypEWkV6je/FW5zEo/8qpGQtl1MXd4pEd/qPQeKc1pnmuBlZWt+72F2CXX60MBRd+e
         iGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700845166; x=1701449966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0Guy2IikSc5MeYOJiXDfxaB0G9vo7MgKvXYX5tKlvo=;
        b=SMPlLdzpMDngZMD3+ipvJL58NMnuBEVVS8b9WZ2+9BcTN7r6h8lOMdVuOQCQzNC7ij
         PyO+HyaKtSl8j1zVPQZ6PxyRFwUdlmvxkVJz3pzq99qVts7a3AwHpo85DMly1uUJ4tjy
         8KRGxEx1XT0qkxYz+1egkBsQGlNVibDgXdIH5Zpp9NAtebsM1ACu4+/XTDdX1Nynjyqy
         Hyyx4PwPpIc2/e7SPoGmoHvOxppOBjDzf+oQazxrfH8XbHCpqPT6shaJ/UKwWneSQ8+V
         cK+909QMtJCipzEF/rul88srPpWNyn86O4qO7w3aDTCYkX2nhZVsPc301TxA8uuzgItu
         Ii7w==
X-Gm-Message-State: AOJu0Yw5WoNQqnYlO+3MNif9Go9l14YdZkT3yYv7azTpcpXr51mGCC/2
	HPnEQmzU1hLBcSwaKrTTSQl51Xz+RV7idsTDaYFoXw==
X-Google-Smtp-Source: AGHT+IHANFt6j41WeXiCE1lhK/kJd4IBW6feWSz0BdtxnVoWKOJ+Km1T0KP0R8Av6R6bQ+IbTqkv9F2Rqj6LSMBT64Q=
X-Received: by 2002:a17:90b:1b07:b0:285:9d0d:7e3 with SMTP id
 nu7-20020a17090b1b0700b002859d0d07e3mr1013190pjb.38.1700845166588; Fri, 24
 Nov 2023 08:59:26 -0800 (PST)
MIME-Version: 1.0
References: <655e4939.5d0a0220.d9a9e.0491@mx.google.com> <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com> <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
 <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk> <e32d5c84-7a88-4d9f-868f-98514deae6e9@lunn.ch>
 <655fa905.df0a0220.49d9b.7afd@mx.google.com> <367c0aea-b110-4e3f-a161-59d27db11188@quicinc.com>
 <ZWCQv9oaACowJck0@shell.armlinux.org.uk> <4d159a99-f602-424e-a3c1-259c52e4d543@lunn.ch>
 <ZWC+PbNjir7rT4MK@shell.armlinux.org.uk>
In-Reply-To: <ZWC+PbNjir7rT4MK@shell.armlinux.org.uk>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 24 Nov 2023 17:59:15 +0100
Message-ID: <CA+HBbNHkAxnTLo2N_-LtMCPhZLsqPAjpYUKBNoRqKc1qmbg=GQ@mail.gmail.com>
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Jie Luo <quic_luoj@quicinc.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	David Epping <david.epping@missinglinkelectronics.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Harini Katakam <harini.katakam@amd.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_085928_124770_487C76A4 
X-CRM114-Status: GOOD (  20.98  )
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

On Fri, Nov 24, 2023 at 4:16=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Fri, Nov 24, 2023 at 03:44:20PM +0100, Andrew Lunn wrote:
> > >             First Serdes mode       Second Serdes mode
> > > Option 1    PSGMII for copper       Disabled
> > >             ports 0-4
> > > Option 2    PSGMII for copper       1000BASE-X / 100BASE-FX
> > >             ports 0-4
> > > Option 3    QSGMII for copper       SGMII for
> > >             ports 0-3               copper port 4
> >
> > With option 2, can the second SERDES also do SGMII? You are likely to
> > need that when a Copper SFP module is inserted into the cage.
>
> The document states "The fiber port supports 1000BASE-X/100BASE-FX".
>
> The same is true of Marvell 88x3310's fiber port - it supports only
> fiber not SGMII. This is actually something else that - when the
> patches for stacked PHYs mature - will need to be addressed. If we
> have a 1G copper SFP plugged into an interface that only supports
> 1000base-X then we need a way to switch the PHY on the SFP module
> to 1000base-X if it's in SGMII mode.
>
> Some copper SFPs come up in 1000base-X mode, and we currently rely
> on the 88e1111 driver to switch them to SGMII mode. Others do want
> SGMII mode (like Mikrotik RJ01 where the PHY is inaccessible and
> thus can't be reconfigured.)

I can confirm that SGMII mode doesn't work with Option 2, I have tested thi=
s
a while ago with Mikrotik RJ01 (I think it has AR803x, but its not accessib=
le as
you pointed out) and it was somewhat working but in half duplex only
and dropping
packets.
Currently, SFP mode is checked and only 1000Base-X and 100Base-FX are
accepted, otherwise the module insert will return and error for unsupported
mode.

Regards,
Robert

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

