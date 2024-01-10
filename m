Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B783AC47073
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 18:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81LggYl8Ad3OaI7g/+M//8UHKQbJy2MjL1R0gwI6OsE=; b=L0x2gCmNCv1x5ztDrFfuf7Gbrp
	4QqHD4+UpwCziJ2a7/IFfy49tdgXkiWglxdzGimrlOuig631I66dgsdouxG6ObhU6AaJ1JDa/d2h7
	rHYVxbRFvs/e6ZHG4jS/c3ITDghBrTDmmLQMhdQWlzT+KZSrW3RdnmkLTxI+/1IVt0cn2kAM3pGiZ
	x+WpWDoyWayNvQ6m8NIUkB6W66X6h0bPyj4GqzyMgt7iAAN3thM38LTyACssI8bFNVpGiCa3qQPux
	QQKOnLPrsibYAFAZL6dPcNku3IN6Geu3GEWg2/gKHSfbMpThusAvumgFzRIw1cSYEPB+p00FRJV2w
	xl/Fb1qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNdFH-00DQpT-1S;
	Wed, 10 Jan 2024 18:24:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNdFE-00DQnR-04;
	Wed, 10 Jan 2024 18:24:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3376d424a79so2808561f8f.1;
        Wed, 10 Jan 2024 10:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704911041; x=1705515841; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=81LggYl8Ad3OaI7g/+M//8UHKQbJy2MjL1R0gwI6OsE=;
        b=kAA/Vgy3FTJbXHe6pMsafWzAsO6QWJEdIGiKAgEctYa8LNGPFE4UiiAaDaqxBTfdz5
         H3MCu28ScyO0ZZp90Pn/4Yo3sfD5T7iPyhjFzu7QD0Ng1ZXvEM9PNkNFXefz6fGY3UVc
         1MFhFxPtf8NuZJqWMg5X8P/n680BGF9dAWCq028CMbewbkcKb3C4RoJlpZNnsjVC0RYp
         iwiXTCA4kn/b6k1MccJQ2dFKlG5rWG8FWuWyYe6RqG0CyG+lPy3Ksth2VofDV8a0N2Sn
         4YagYHMyPvGDn9PVMmwKvJXiJb36HSdu+OnElPmOAF/wJ4Y7VXUZVDSfGDdAHq8JDISY
         7CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704911041; x=1705515841;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81LggYl8Ad3OaI7g/+M//8UHKQbJy2MjL1R0gwI6OsE=;
        b=L4+X24L0h7WHjSiS+1S8cyR7S8FTsueWUreBT6afhb1Ux/AuBl2tBlZhVqr6qCGtaz
         2aaGbfJcOL4ytaVtGFjYunhDHoMqWSZjzmXRJQPOuFngSgcITyp8axVGoVHz+xg+Btmx
         ilzzXPoCPS1CZNqTT2bEpDn4yg7qmhmEmtxe5Ulv1gOOH9Und26v/i47HqQenmgXhQ64
         hjW2oWD2ofDNXjWmXv39opWHMMq207q48sj4yHWjY0MM79Z5sCQOiTY3SqorXMPm/aS0
         JgjuHay17cGvBvZMa1qdVvlzA2+w9TtZMxkF9vX/l6Wt1rpfX/PTrHZ/GLsQBQ456JPi
         Uyyg==
X-Gm-Message-State: AOJu0YylkjBWVy9TlVgQqMxg2RU1qvwAgrEWH1qfYTDMOp9tNFUWb63U
	OpMKW4u72bpevcOMmMP7YGQ=
X-Google-Smtp-Source: AGHT+IHLwo386qOHgtlGpo5mH/d/XbKdDKeCID+7bVxNsNhEiOdF/O31xP8hq13jV9oOdwkmS7u7Rw==
X-Received: by 2002:a05:6000:1e85:b0:336:ca46:2ce1 with SMTP id dd5-20020a0560001e8500b00336ca462ce1mr624602wrb.122.1704911041215;
        Wed, 10 Jan 2024 10:24:01 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id r4-20020adff104000000b00336a0c083easm5469692wro.53.2024.01.10.10.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 10:24:00 -0800 (PST)
Date: Wed, 10 Jan 2024 20:23:58 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <20240110182358.ci7pg7ipcbsjxqjf@skbuf>
References: <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
 <90fde560-054e-4188-b15c-df2e082d3e33@moroto.mountain>
 <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
 <9b729dab-aebc-4c0c-a5e1-164845cd0948@suswa.mountain>
 <20231208184652.k2max4kf7r3fgksg@skbuf>
 <c3a0fc6a-825c-4de3-b5cf-b454a6d4d3cf@arinc9.com>
 <48b664fb-edf9-4170-abde-2eb99e04f0e5@suswa.mountain>
 <2ad136ed-be3a-407f-bf3c-5faf664b927c@arinc9.com>
 <20240109145740.3vbtkuowiwedz5hx@skbuf>
 <0a086b5f-b319-4f08-9513-a38c214e1da7@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a086b5f-b319-4f08-9513-a38c214e1da7@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_102404_084370_55978F8B 
X-CRM114-Status: GOOD (  19.63  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Dan Carpenter <dan.carpenter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 10, 2024 at 10:26:54AM +0300, Arınç ÜNAL wrote:
> > Are there existing systems that use PHY muxing? The possible problem I
> > see is breaking those boards which have a phy-handle on gmac5, if the
> > mt7530 driver is no longer going to modify its HWTRAP register.
> 
> Ah see, for PHY muxing, the driver actually wants the phy-handle to be put
> on the SoC MAC, and the PHY to be defined on the SoC ethernet's MDIO bus.
> We don't even define gmac5 as a port on the switch dt-bindings.

I noticed that from the code already. Maybe I shouldn't have said
"gmac5" when I meant "the GMAC attached to switch port 5, aka GMAC0".
I was under the impression that you were also using this slightly
incorrect terminology, to keep a numerical association between the CPU
port number and its directly attached GMAC.

> While none of the DTs on the Linux repository utilise this, some of the
> mt7621 DTs on OpenWrt do. The change in behaviour will only be that phy0/4
> will be inaccessible from the SoC MAC's network interface. I de-facto
> maintain the mt7621 device tree source files there. I intend to revert it
> along with adding port 5 as a CPU port so that the conduit changing feature
> becomes available.

If OpenWrt kernels are always shipped in tandem with updated device
trees (i.e. no Arm SystemReady IR platforms, where the DT is provided by
U-Boot), I won't oppose to retracting features described via DT if their
platform maintainers agree in a wide enough circle that the breakage is
manageable.

BTW, besides OpenWrt, what other software is deployed on these SoCs
typically?

