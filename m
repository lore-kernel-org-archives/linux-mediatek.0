Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B92CC54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaWDM3C4NrbrAUXV6EDAofx5hE7nR6MhxlVcBrFRh+U=; b=zFWfuYSD+0LSpar1tZN2WRpQvF
	r1+S4gUJFgtWN6pUjvgwOmDxUBrwfpLxQo9M0oCsu94CPOwH8cCJtX7xQPBnS8yBJsb3WMwK0uOoA
	Qw/mqNIRZj0GxDDmtuafMu78Bjk73EdTKHjsP5oN10weuHV2N4OMhDmZN4XyhTxhB+KzUBZAB9K/B
	uji5zss7iCpIos1DYuy+1AN1JY0rH8Rhk2FPENTs5QP8Xv/mZO83R12Kv6eOVhFJpUHsq4bmvgbTy
	C49c7NYizGGkKq2VqkdJPaNWfXN6DbvYA+y55+tG2JQv/H9tlC/J7XkXAi+/QlVQcYT/P2D4H1qSx
	1ZMRzvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmr2E-0000000G6rU-3KFc;
	Wed, 20 Mar 2024 08:10:54 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmr2A-0000000G6pF-47Gj;
	Wed, 20 Mar 2024 08:10:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59D56C000D;
	Wed, 20 Mar 2024 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710922246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SaWDM3C4NrbrAUXV6EDAofx5hE7nR6MhxlVcBrFRh+U=;
	b=PfB7bBnliBYXJICYCLKkGAUdhqDbSe1Sjs8BsDpqoiBbXMMZuapjDYLwI4WR3e0HWifNUl
	kcGtmIrXrDK1U2uIGf1sKPv/tyxOpCEgWihHoJuGa166wDxniLBi/4p2bueL2CpFKMMJea
	uJI2T4pzWMw3GtHZaD7swteQgcqm3whZ8mJBLrAGR1s6+2UwZrdkQO9kZJ5896ihbNKkQQ
	JHIfK6+xssnsH+YH/pfk1DC3oZJXhc6xKMBhcQD81kvrSIljRRFZYjfinei42CJ4Io6B2f
	GIaBr1GZkasDCw01DmMlCCE6HZItBsQBLXJjVIPlvsTJ+/EuvnkMEOYHLCl/XQ==
Message-ID: <9d111cc9-c73a-4d3c-83f5-3f59e6c8841f@arinc9.com>
Date: Wed, 20 Mar 2024 11:10:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-0-3f17226344e8@arinc9.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-0-3f17226344e8@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_011051_193790_80DBE189 
X-CRM114-Status: GOOD (  11.55  )
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

On 18.03.2024 10:46, Arınç ÜNAL via B4 Relay wrote:
> Hi.
> 
> This patch series fixes EEE support for MT7531 and the switch on the MT7988
> SoC. EEE did not work on MT7531 on most boards before this, it is unclear
> what's the status on MT7988 SoC switch as I don't have the hardware.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

I see the state of this patch series is deferred on patchwork. I see that I
forgot to delegate this to the net tree. As I don't see any objections in
this series, I'll send v2 with it tomorrow.

Arınç

