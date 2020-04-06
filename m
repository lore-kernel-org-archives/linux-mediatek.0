Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B6AC2BA1E
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 14:48:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A584B2470A
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 14:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tw2CZgKm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="uenn7vmk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A584B2470A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xQpcTNfEpggXcs4+i9xswPHuOziTeni7Gs6tlNyPZ0=; b=Tw2CZgKmc1v/qY
	YaG5jLYUJD9U/UmVuRmPHo7w/foQk/gu+SX5QbPMfxT0l7zVu4E/gX5u9M1vKHWVvcPNMAed+pdFY
	1SJsVHBcyrMFeA3lqaasXFqGkR0f5CVOksMiC0z7vfZcmqDEgLKbSb4Rm5nnxlmIg8eHFHdRb58jT
	PaPsDOMUZe+EP1dS3ZzgMvpsuhClR05HaTQzssI2mAt3N5aOPGxG9dPnDJX3k/uwVTGvGAxWsQxN4
	fKlYRTRAjH7KGQ2dBREOysvopnV8LYMdHJvdCcl9k0hWFOdgsWG3FyhyPeM1TXZlFCwEBh0H5p87a
	gUsfiVHoM+7MQP9YWquQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLT33-0003qF-Q4; Mon, 06 Apr 2020 14:48:25 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLT30-0003pD-Tc; Mon, 06 Apr 2020 14:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jndYh7GlwNS3Suqwh3rj4zu5D8kBRWnhUuUbjJc1gaY=; b=uenn7vmk6Yn/aMdzsb5yOlZEQg
 lmUvAB9L8kZcEAW7MJWAVVXcYp1+GBAIwLi8LhwAV/FaBpePG5WM97NOX9y6nSyonXUXC6+NHwot1
 dmw7unMoScx35Irnh5jLDmwtEB9ck2xeUJPQP0Y6+rmARhSanowU7kPspgLzREWlV5oQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jLT2c-001HDo-6R; Mon, 06 Apr 2020 16:47:58 +0200
Date: Mon, 6 Apr 2020 16:47:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Lobakin <79537434260@yandex.com>
Subject: Re: [PATCH net-next] net: dsa: add GRO support via gro_cells
Message-ID: <20200406144758.GC301483@lunn.ch>
References: <20200406105910.32339-1-79537434260@yandex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200406105910.32339-1-79537434260@yandex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_074822_955848_2D95D23B 
X-CRM114-Status: GOOD (  14.58  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Woojung Huh <woojung.huh@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Hauke Mehrtens <hauke@hauke-m.de>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Oleksij Rempel <linux@rempel-privat.de>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Mao Wenan <maowenan@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 06, 2020 at 01:59:10PM +0300, Alexander Lobakin wrote:
> gro_cells lib is used by different encapsulating netdevices, such as
> geneve, macsec, vxlan etc. to speed up decapsulated traffic processing.
> CPU tag is a sort of "encapsulation", and we can use the same mechs to
> greatly improve overall DSA performance.
> skbs are passed to the GRO layer after removing CPU tags, so we don't
> need any new packet offload types as it was firstly proposed by me in
> the first GRO-over-DSA variant [1].
> 
> The size of struct gro_cells is sizeof(void *), so hot struct
> dsa_slave_priv becomes only 4/8 bytes bigger, and all critical fields
> remain in one 32-byte cacheline.
> The other positive side effect is that drivers for network devices
> that can be shipped as CPU ports of DSA-driven switches can now use
> napi_gro_frags() to pass skbs to kernel. Packets built that way are
> completely non-linear and are likely being dropped without GRO.
> 
> This was tested on to-be-mainlined-soon Ethernet driver that uses
> napi_gro_frags(), and the overall performance was on par with the
> variant from [1], sometimes even better due to minimal overhead.
> net.core.gro_normal_batch tuning may help to push it to the limit
> on particular setups and platforms.
> 
> [1] https://lore.kernel.org/netdev/20191230143028.27313-1-alobakin@dlink.ru/

Hi Alexander

net-next is closed at the moment. So you should of posted this with an
RFC prefix.

The implementation looks nice and simple. But it would be nice to have
some performance figures.

     Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
