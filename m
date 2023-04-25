Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D60C7618E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 01:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkwYrIv5uujtr1ZziMGsLsTn/EGkFinICAzZhZAREks=; b=NDxgJ0DLPPRIy9ve/uwjwQCOrY
	2Dj6O4GOmXxVKclsbqHKkLCzVHVHycbciccY2rwrY1cIC2mm4UNxlxHL2OVr0fRtB0aEig3LWpXmT
	wYRS6y5VDhEO8d4Iy2SwULeHkmH4gyKu4Mhalx30NpxoXiLXA/SYqRw8gctQJQCd0ItJRWwgwwqch
	TpnBBdKBKk6DttvEX0ZvwOXRAJbL3I5mzOefQs7zhiLs/yXxq7z4ckBtKtkid8vwi5XdtOwkxMwg0
	5W+TP8uES/9vWUM43DHW06iUMP3vPoznMCkYKSEY85IwYQvyIIs6sIcldSz0cifDUzXC4Sj3I2P+i
	F1b9wQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr7d4-00HaPw-0i;
	Tue, 25 Apr 2023 01:38:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr7d0-00HaOv-2G;
	Tue, 25 Apr 2023 01:37:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF3A86203D;
	Tue, 25 Apr 2023 01:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC74BC433D2;
	Tue, 25 Apr 2023 01:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682386677;
	bh=Dd+xH5T/3keBxTnmEdhZPmDsUyzc5etpZu0dXdX4naE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L4vUkxIi+otlJp3vwFIi8e/qNDuiVshLO2vgaPDCkmXjSf/qwM0cs2q1xvhr2btt3
	 xoab+9Uz+CrwgLN7FduqCb25A01CkLl44UQyCJ42bF2CjCMnSKrJsedY/PzUEDu897
	 lwHNrRPpBsvjvjoysVd0VKnj6IAiF6o7mmB93CMWt3e9bJ3jKZQ18GmI5nxtbPWAAi
	 I4pTusabu/OfjPAVgt9hjteP+hOfh/2IvUW7HGBTW8U/5dTEi1WHSjv9Pp/a7N/Wgf
	 IvS2jlgC5R9BMxYOPq4RYJeVUOaXDeBwVvR0wzBcDWGx1jf5n82CBTqAKtkKZKjb/k
	 SLAHkFOx/b7WQ==
Date: Mon, 24 Apr 2023 18:37:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell
 King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Qingfang
 Deng <dqfext@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] net: phy: add driver for MediaTek SoC built-in GE
 PHYs
Message-ID: <20230424183755.3fac65b0@kernel.org>
In-Reply-To: <ZEPU6oahOGwknkSc@makrotopia.org>
References: <ZEPU6oahOGwknkSc@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_183758_802593_B9A88705 
X-CRM114-Status: GOOD (  15.01  )
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

On Sat, 22 Apr 2023 13:36:58 +0100 Daniel Golle wrote:
> Some of MediaTek's Filogic SoCs come with built-in gigabit Ethernet
> PHYs which require calibration data from the SoC's efuse.
> Despite the similar design the driver doesn't share any code with the
> existing mediatek-ge.c, so add support for these PHYs by introducing a
> new driver for only MediaTek's ARM64 SoCs.

Andrew, Heiner, how do you feel about this driver?

Daniel, is it high prio for you to get it into 6.4 or 6.5 is okay?

I'm trying to get a read on whether we should merge it because it's 
kind of on the goal line for this merge window. 

If nobody feels strongly we can do this the traditional way - I'll 
just complain about RCT, hence kicking it back out into the field :)

