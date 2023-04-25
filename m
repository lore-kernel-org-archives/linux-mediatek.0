Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EDBC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2gy5ow7cG2NlnMJB2Q2VwlBrlh2rFjQI9/JeOXmqJI=; b=sx8HS0ieP5IRtPMmJ98GaZe0oS
	FxR7XM2vcgmmbRrbhbZ9ODCin5Gcx/E5hhbu94eNWrhEdtBU08bn2mtlMVu/ZWBAXUzTuKakTAQEJ
	S49treBXuJsnq9pvW2fHX9m8dg7Z7MuDdsVnBYAFXd9fS1VlhFhmeiikHb7C4EzZEI4jlEJ60GHed
	q6wPQfRT09NgJB7fqLDYs6I+mjkXjmRQAhuDbqnwwFIFb1ioahZscPH8QLJDmqDdxE5I3HlqAQmGp
	DJpeFdOVZ78OUslgyzmS15wzqBWDmu3ZzaT3gbV2/5+cgORBhFydrLWS0z7z2RFXYFss8wHlX/xdU
	EbLR+y0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prJaV-001Nh0-2i;
	Tue, 25 Apr 2023 14:24:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prJaR-001Nfw-12;
	Tue, 25 Apr 2023 14:24:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2F0A60A13;
	Tue, 25 Apr 2023 14:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE62C433D2;
	Tue, 25 Apr 2023 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682432646;
	bh=yliYoqpOgm0dIutKl8oAPe72ftrxSi7X6V4lwrOfkLA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cYe0gfy7XAzZ49rDBexhAmSFOO5duqhrkvX08mLuEdSLlIZuvrEUA0wnABu7Go3Ei
	 pZOaYTqCP4I9mms9GBI+RAhoaNcVT25ExCJwHZF2pSOVsvSsm5BXiupNAfXCUWZaIG
	 N706B/E1DNAwz8eaTZ5/3E8+GGvV6tdTaaabFLCaP4cxnyqlxubcJobnU/2X16Vb5O
	 aE0OULprxkOs3j7ej1xl8ug2/CULqKkDjJvAIQoxw4gP25z2IyIbhpc9ATFUga+6YK
	 qHbnt1NDX7BkackKR5Fy0X2BHtMBT7ypthSvAK75DxIDkaub6mmZGhJqItZGZzumR6
	 UbWnWqwnl3CtQ==
Date: Tue, 25 Apr 2023 07:24:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno        
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] net: phy: add driver for MediaTek SoC built-in GE
 PHYs
Message-ID: <20230425072404.28b798e1@kernel.org>
In-Reply-To: <ZEePDK2oW5xkiEIv@makrotopia.org>
References: <ZEPU6oahOGwknkSc@makrotopia.org>
	<20230424183755.3fac65b0@kernel.org>
	<ZEePDK2oW5xkiEIv@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_072407_420888_383041C4 
X-CRM114-Status: GOOD (  19.50  )
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

On Tue, 25 Apr 2023 09:27:56 +0100 Daniel Golle wrote:
> > Daniel, is it high prio for you to get it into 6.4 or 6.5 is okay?  
> 
> No rush, as this is mostly relevant for OpenWrt the thing which matters
> most to me is having it in the next LTS kernel, so 6.5 should still be
> fine I suppose.
> 
> > 
> > I'm trying to get a read on whether we should merge it because it's 
> > kind of on the goal line for this merge window. 
> > 
> > If nobody feels strongly we can do this the traditional way - I'll 
> > just complain about RCT, hence kicking it back out into the field :)  
> 
> I understand Andrew's concerns and will resubmit for the next merge
> window in 2 weeks, and without the LED part for now until PHY LED
> infrastructure is more ready (ie. able to offload 'netdev' trigger
> to hardware)

Perfect, thanks!

