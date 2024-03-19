Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEBEC54E71
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 20:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzGva0R26a0eMtGVAxiiPcQ0smxofKXaZ5Q5beavLFk=; b=Yuhg6fSql0sQejFPCv3y8Gqxiz
	6zL1fvUYYd4ZfghhjS+8oyDQjV2ZjlPQYdADNpKEAa+ifgTGWcad+joMvzInHM1SKsuv5SR+fJZ0M
	0URRL/D4U6CoiVfNxymq9gFX6AZv2z6w/8irViVrxoF1HuqLihOoMbmz29YhXebVCTJu3C93h971z
	LQiqPcO4qyHZqoKFJJjKuyTGtzaMzqkJXPJ249/WbihWdAVrxY/bAip199DT1cqP/xE1LubmQLYUz
	Ub+DKc2kUr/EMHYmSGEWyhcpPxzeSwhQTje4u3I8i5rwwsou+MG00vZiTHT6V0HAUcnlut/gM0E20
	LPnSFQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmg3o-0000000E7rk-2TIX;
	Tue, 19 Mar 2024 20:27:48 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmg3k-0000000E7qu-0DbC;
	Tue, 19 Mar 2024 20:27:45 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rmg32-0006OW-1A;
	Tue, 19 Mar 2024 20:27:00 +0000
Date: Tue, 19 Mar 2024 20:26:55 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
Message-ID: <Zfn1DxkEa3u-f7l2@makrotopia.org>
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v>
 <ZfnYkuzuvwLepIfC@makrotopia.org>
 <00ec9779-19ce-4005-83f0-f4abf37350fc@arinc9.com>
 <6cb585f6-6da8-45a2-a28b-2fb556f95672@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cb585f6-6da8-45a2-a28b-2fb556f95672@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_132744_119707_EC266DD6 
X-CRM114-Status: GOOD (  19.34  )
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

On Tue, Mar 19, 2024 at 08:38:03PM +0100, Andrew Lunn wrote:
> > I would argue that EEE advertisement on the PHY should be enabled by
> > default.
> 
> That is an open question at the moment. For some use cases, it can add
> extra delay and jitter which can cause problems. I've heard people
> doing PTP don't like EEE for example.

MediaTek consumer-grade hardware doesn't support PTP and hence that
quite certainly won't ever be an issue with all switch ICs supported
by the mt7530 driver.

I'd rather first change the (configuration) default in OpenWrt (which
is arguable the way most people are using this hardware), also because
that will be more visible/obvious for users. Or even just make EEE
configurable in the LuCI web-UI as a first step so users start playing
with it.

After all, I also have a hard time imagining that MediaTek disabled
EEE in their downstream driver for no reason:

https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/24091177a18ba7f2dd8d928a8f5b27b14df46b16


> 
> The current phylib core code leaves the PHY advertisement whatever its
> reset default is. So we leave it to the manufacture to decide if it
> should be enabled or disabled by default. It is policy, so it should
> really be down to user space to configure EEE how it wants it.

I very much agree with that policy, changing the default definitely
feels like something which could affect quite a lot of people and
should be done very carefully, if at all.

