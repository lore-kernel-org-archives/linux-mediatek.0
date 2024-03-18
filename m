Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0989C54E69
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 18:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhmIJSS0MmeG6gI2GaZskyHA3NQtOjY4VOlHtU7hHo0=; b=UWbB0PSvn+MTLkbCLe4kQKG3T3
	lr9YOIxRmGfpkJQf0Df52Snok4XoBC8dOaipfdonRTNAv6epQBU6SaA34kYgYlxyeT8H5Stv+jzjW
	gsi776o4k9GGfx+XZN2zuR3mKiPAdRPUFL414t4msbL4uwQvey4abv6ill++N50+lqeGm85wu9tr2
	oV+2EpdQqh821TKTXxofoy0DZHiiPFBB21dDCitkOw+bV2gCWmBCjqcckG1WHiRaiqxbKlG6XuXpW
	WBU3pwI59ZpXJFPviaFGeJfG3MXhhtzZReYynl5d8VzQpMfKVuKi/Ra0JvdKvJJY1cPS1NwqTGPEX
	QQVvWDcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHJE-00000009Zv2-0t4v;
	Mon, 18 Mar 2024 18:02:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHJB-00000009Zti-0r96;
	Mon, 18 Mar 2024 18:02:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 708D360C85;
	Mon, 18 Mar 2024 18:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2300C433C7;
	Mon, 18 Mar 2024 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1710784919;
	bh=AsJtNv/pnLcwK3yuhNmyxuo7mviUdItkUTqHK8N+CpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wd5cAvKjs7+lgaCUrGw2bcXhS7NFH+TKpo4w2yEqrMXiJCg2xRhMXdZHeZBiuUaoP
	 ZKgj3eAgJWlHNSHBp/Jv0CUkUQL8QpA2oBMzeJ8B7hvq/eUqV5iHrvzt8mZy2a9MDh
	 RDvQTm01LvqUPb7PSe/Se5zM1KYYN5M1piVKDeLY=
Date: Mon, 18 Mar 2024 14:01:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>, 
	Russell King <linux@armlinux.org.uk>, SkyLake Huang <SkyLake.Huang@mediatek.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
Message-ID: <20240318-quizzical-raven-of-plenty-ef21f5@lemur>
References: <65f7f17d.050a0220.3c75a.cde3SMTPIN_ADDED_BROKEN@mx.google.com>
 <5514243b-c795-436e-8628-8f421c900bcb@gmail.com>
 <ea889226-3649-4f74-8c38-67c459e4ea4d@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea889226-3649-4f74-8c38-67c459e4ea4d@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_110201_309009_D9FC9699 
X-CRM114-Status: GOOD (  12.48  )
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

On Mon, Mar 18, 2024 at 05:03:29PM +0300, Arınç ÜNAL wrote:
> > We've received your patch series 4 times and this was the same thing with your previous b4 submission, can you find out what happened? Thanks.
> 
> It looks like my branch name was too long again. b4 0.13.0 cannot handle
> branch names that are too long. I'll keep it shorter for future
> submissions. It'd be great if Konstantin could provide a specific limit.

It's not really b4, it's the web endpoint and the version of python it's
running. I hope to fix it soon by applying the same workarounds as we ended up
doing for b4 itself.

-K

