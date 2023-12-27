Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876C4C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 20:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/knE1RdGvxQU+ZfFNTNGYvbGggyDmP5kq99ZSddVPc=; b=Ij+fGvEwcJE0DBx3ITGT24vyHS
	GA2Ph0Gsa2aaYwK7ggZs8vKtekdnYIY/DEwpTtBJWJH2sNIzWS1jb0Tr87LssQlQMKU4xH+Ipicne
	kyUPlbmqnlz/jJ9qNkyv7ZV74pQENE1Kk5nKR5pRYK4UypOlZF0pEz78Xo9ZQEDlTkSA4GkTFqNkY
	jzBTq2xS3ZQyfGYLkUkbAeCq65etQZfKdvVMcCRCg1nXaFSE0wu1KeJD++/eqjzr/sNNGRh7BxAwF
	KhcTW1MRrvITPw+UeRlFtSse9NYl/GhF22Q2zrwb4iDexpuVXiJwbQG37NSkiy3jxsmGiVHZJKqKf
	6gMSNjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIa6k-00FQH8-1D;
	Wed, 27 Dec 2023 20:02:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIa6g-00FQFy-2f;
	Wed, 27 Dec 2023 20:02:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40d2e56f3a6so30951795e9.1;
        Wed, 27 Dec 2023 12:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703707341; x=1704312141; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/knE1RdGvxQU+ZfFNTNGYvbGggyDmP5kq99ZSddVPc=;
        b=QyI+Os3xVmdmmucWGneGf18kzkk+J/qpocWJJuForb5ZpZtahbD/MTkb5nn7PGzxFQ
         puCRZw+zsKp/ZoS2LNQFGgP53TsHPxxkZnQUZ5zWpRbst5RC5+2v3Wah7irPFrZjGgnF
         LBbvt9zjBIin2YAZlsxjFxpOt1Fdknnoe2iCWfe25y37s3D0QOZcdFf8KoAAETWzaeNw
         P/HqJM/yhvV2l2KyO9D1TvCzXTVcNXubFkfCGUp5YesIbguMsrHs3ZQaVmX2ma1SsSPE
         AWZEsPhYaYM7BIwCredssRrZLcVuq2kEfrR2DFRHSHCjCkNi918+34F+HA9kIm7ZA044
         Yfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703707341; x=1704312141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/knE1RdGvxQU+ZfFNTNGYvbGggyDmP5kq99ZSddVPc=;
        b=gvw5k8N9qJI11svxwfxFim5N88qOnnt18Hh1qN8Y4lrLGB7nmBdLPkr4/+qxBPWSkB
         bBqodKo6WtV3ox4Wj4Ej9bFTT501If3i0t2pOcz31NeIU666noxX2Cn39Huq20iHuCOf
         qPyWIgDGpHbwVIKHtAOcU1kYG+YtWYrp3hS/ZpICRbVNz9F8DagtI3m4+LQZtT6xcU1v
         YVgF3LrPJNy4ljo0jLPHOxJIJWKn6uWfDpJ6yHrKg6gS3Hq8nOme3Ftf2kzlCoHNmHdz
         luc14KmzwHMBVjNV/WYAEIuOIkWlCYZGO972ViD3CN6ht9A9/cbvOu4GcWPks3KDfzsp
         oBuQ==
X-Gm-Message-State: AOJu0Yz96IewWxzh8NR6Dwtwo0nUp9YJE79x2N05jRTah7QKYbxot7SO
	g5Q+oM81LscN950xFEseKCI=
X-Google-Smtp-Source: AGHT+IG11a2jEJ56aVZt743+Urcm+oZvsgxk0OjEW0YCylo3AApnPF7ZuFFcQ/IqgS9k8gVkMvV36A==
X-Received: by 2002:a05:600c:4503:b0:40d:3eb8:580f with SMTP id t3-20020a05600c450300b0040d3eb8580fmr4726111wmo.14.1703707340716;
        Wed, 27 Dec 2023 12:02:20 -0800 (PST)
Received: from skbuf ([188.25.254.72])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c4f5300b0040d5b849f38sm5739904wmq.0.2023.12.27.12.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 12:02:20 -0800 (PST)
Date: Wed, 27 Dec 2023 22:02:17 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Bauer <mail@david-bauer.net>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: register OF node for internal
 MDIO bus
Message-ID: <20231227200217.kdltxpmhvlp6z4cd@skbuf>
References: <20231220173539.59071-1-arinc.unal@arinc9.com>
 <20231220173539.59071-1-arinc.unal@arinc9.com>
 <20231221151607.ujobhh4aet4obxdz@skbuf>
 <6600c6b1-2230-4963-940c-8b95a01750fd@arinc9.com>
 <20231227191154.6jkqdlqdxciidpfw@skbuf>
 <bdbe24b2-30f6-48fa-b6eb-a1ae3afe9076@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdbe24b2-30f6-48fa-b6eb-a1ae3afe9076@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_120222_878014_EC29F8EF 
X-CRM114-Status: GOOD (  12.91  )
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

On Wed, Dec 27, 2023 at 10:51:08PM +0300, Arınç ÜNAL wrote:
> I didn't realise ds->user_mii_bus is also used to store irq mapping for
> each PHY.

It needs to, if the MDIO bus does not have an OF description through
which PHYs can have an 'interrupts' property. But if there is an OF
description for the MDIO bus and the PHYs, I think it is strange to
expect PHYs to have interrupts if they aren't described in OF.

> Should we agree that user_mii_bus is needed for all cases or make
> another way to store the irq mappings?

I looked at the upstream device trees:
- users of arch/mips/boot/dts/ralink/mt7621.dtsi
- arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
- arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dts
- arch/arm/boot/dts/mediatek/mt7623a.dtsi
- arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
- arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
- arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
- arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts

and without exception, none of these have the MDIO bus described in OF.
I'm not sure about other device trees. But it may well be that the
situation where "MDIO buses present in OF need an IRQ mapping for their
PHYs" does not need to be handled.

