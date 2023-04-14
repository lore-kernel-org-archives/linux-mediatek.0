Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9ABC77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 12:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2XOASLEKsa7wqjYtuo8NoqmkS3+OiypWGH4rl3hN5o=; b=iYEIWFLNxEl06w
	3MmuITAy3gJM5lWDjW85PzExEZrz2rzHgKU6/S+pNSF0GMBtkQXd9WPG/0k5jxfOqCjymVa/7vLd7
	uIxrJ6oJdoRYfCR2YI8aOJQWrsXFnU4DlXuOp12e3pH9M4M3/MCF4DoYJxjaBaQZ4xxAESDIYEtjs
	Reiv5U6GewywtbF4nCtbjhzHDE9VhJHKT/iE1YGoavpXulVclAGHGcG9Q7TMPhn00C+nCh+Nf59MO
	ZZiYpeLfkgUSdc2slDGGhesreFeoIUMHpGEPnWjzMASWKHwizIy3OwCApFuvmMTZ1l+yW4qJyVPl5
	AhwZhUqqzizOavTQucMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnIX7-009WLr-2B;
	Fri, 14 Apr 2023 12:28:05 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnIX2-009WJG-2D;
	Fri, 14 Apr 2023 12:28:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1681475224; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=muEMiNc6X4kpwNuB2j+lTCvzYfl6q+EGl/it36G5HLiA3/9geCnrIwoZS+5IMBjFrMD6I9JS3J/QHnPeqgWqlsKMWC4PTc0XHqhXpI4GcfCtWDB6eFUWkU1omEqhge7ytalffWzH/IKHufx79x5QLPriEoPt1K7VFJooQ1SfnuE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1681475224; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=z2XOASLEKsa7wqjYtuo8NoqmkS3+OiypWGH4rl3hN5o=; 
	b=DAUZoXsgTbfo69eoDV4OtSGZn5XHU3YCDAInDfEWFcmX9w13n8n/2kyMXSBe46FopoaxOr6IvRxO1SZYot+8vsqpHjtkZPnlrmM0DnqrwxA+cQsELSrw6GWjuG7vJWpHkxry7BKHSANntEO9M1iIYdbzQ+d8I6YegrwoKUxFXA0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1681475224;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=z2XOASLEKsa7wqjYtuo8NoqmkS3+OiypWGH4rl3hN5o=;
	b=DjqWN6YlqTqNN4n1AGNJz1sT6czOolvvH75qmlhf+KpyMwkRDxemDPPSA5W3UUcW
	RJbXmLviSSPQr62y2I1GQA8farT0tSXq82a9RW6Ib6zTCt+TSqvGI2uF5LrM8tkP2Jc
	ntCwcyFDSZJvuWb3h4eh0+mxQDnS7BGuk0DkUqFM=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1681475222132610.1878987362392; Fri, 14 Apr 2023 05:27:02 -0700 (PDT)
Message-ID: <60d11eba-9532-48ea-b4ce-28a332f2b7df@arinc9.com>
Date: Fri, 14 Apr 2023 15:26:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH net] net: dsa: mt7530: permit port 5 to work without port
 6 on MT7621 SoC
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
References: <20230307155411.868573-1-vladimir.oltean@nxp.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230307155411.868573-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_052800_797299_E871FF5E 
X-CRM114-Status: GOOD (  16.50  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Greg Ungerer <gerg@kernel.org>, arinc9.unal@gmail.com, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7.03.2023 18:54, Vladimir Oltean wrote:
> The MT7530 switch from the MT7621 SoC has 2 ports which can be set up as
> internal: port 5 and 6. Arınç reports that the GMAC1 attached to port 5
> receives corrupted frames, unless port 6 (attached to GMAC0) has been
> brought up by the driver. This is true regardless of whether port 5 is
> used as a user port or as a CPU port (carrying DSA tags).
> 
> Offline debugging (blind for me) which began in the linked thread showed
> experimentally that the configuration done by the driver for port 6
> contains a step which is needed by port 5 as well - the write to
> CORE_GSWPLL_GRP2 (note that I've no idea as to what it does, apart from
> the comment "Set core clock into 500Mhz"). Prints put by Arınç show that
> the reset value of CORE_GSWPLL_GRP2 is RG_GSWPLL_POSDIV_500M(1) |
> RG_GSWPLL_FBKDIV_500M(40) (0x128), both on the MCM MT7530 from the
> MT7621 SoC, as well as on the standalone MT7530 from MT7623NI Bananapi
> BPI-R2. Apparently, port 5 on the standalone MT7530 can work under both
> values of the register, while on the MT7621 SoC it cannot.

I finally found out why. Looking at gsw_mt7623.c [0], setting the core 
clock into 500Mhz is done for 40MHz XTAL. With some dev_info code, I was 
able to confirm that the MCM MT7530 on my MT7621 board runs at 40MHz 
whilst the standalone MT7530 on my Bananapi BPI-R2 runs at 25MHz.

[0] 
https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/master/linux-mt/drivers/net/ethernet/mediatek/gsw_mt7623.c#L1039

Arınç

