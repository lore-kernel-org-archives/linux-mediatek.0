Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68D3C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=admShfSykcaAtbel+tfZWUdxGTiA82izBewytBKFlQ8=; b=F1aHJ6TEazJc1Gu501BdIIjxVW
	PuSf6KFF0RU42XRQNy0NvWxpM3oZ4kFegrCzf5xPYYJtRCzylsIFN0Zuy1t+l+gPBRGdkiLB5ePXe
	JCKkUY+yxnZNdlI+gMQWuyFVMpPMoL+F18y5idDm7f+JfpLWe51oGrp628uU/sQw7UfRJoalRRySQ
	9CeAAUtRj00CKUeaR/T0oJitZWOX4aVkGpWHING83N0P2tDiuw8XVw9ARc/pxtjLwYiocvGUidlHR
	h8qbqIX4R0KGhygTHdD95vCMWG0Tq4CeTPc0YV7EEPBsPBGgoPyCsojibS73dcormIj1RW8tPftWc
	d4apBS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUVG4-00B95S-2k;
	Fri, 11 Aug 2023 16:45:04 +0000
Received: from out-105.mta1.migadu.com ([95.215.58.105])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUVG2-00B93l-1J
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Aug 2023 16:45:03 +0000
Message-ID: <03763b62-8d49-6fbf-5ce9-21c334c9aac2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1691772299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=admShfSykcaAtbel+tfZWUdxGTiA82izBewytBKFlQ8=;
	b=RIok6yu/Auqn0MWP4OKNMvm04myfUt1AS598KaVNv0crBmVGWPuLF/VrUoacz0fJcmspTE
	b6+9STyNuUxLP6a2PcQyjSNhMw68Tj+mCkXjOXWNIrpY5VI3s/I8u0LCmV1y6s5N3znJ0x
	hYMMwEvvVarUEoJ8BNStd3ucIvWQ2Qs=
Date: Fri, 11 Aug 2023 17:44:55 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: phy: mediatek-ge-soc: support PHY LEDs
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <a21288bf80f26dda6c9729edb5b25d0995df5e38.1691724757.git.daniel@makrotopia.org>
 <ac6a4318-3a47-2c77-6b81-b5f04765c04e@linux.dev>
 <ed096dfe-6a42-4838-972b-7a28afaf2f6e@lunn.ch>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <ed096dfe-6a42-4838-972b-7a28afaf2f6e@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_094502_592788_0988C613 
X-CRM114-Status: GOOD (  10.22  )
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

On 11/08/2023 17:39, Andrew Lunn wrote:
>>> +	/* Only now setup pinctrl to avoid bogus blinking */
>>> +	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");
>>
>> This function gets reference on phydev->mdio.dev, but there is no code
>> to release it. It looks like a leak which will prevent module unload,
>> but I don't have hardware now to prove it.
> 
> Since it is a devm_ function, it should get released when the device
> is destroyed. Or am i missing something?
> 

Oh, got it. Yeah, resource managed code needs no explicit *put() calls.
Thanks for the clarification.


