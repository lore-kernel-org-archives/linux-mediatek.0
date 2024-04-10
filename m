Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDAECD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 18:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u04ty4XeC+ToVpbCTU/qMTm1yQRrPUKOYomefkfVDGA=; b=BPzNRQWMOVnkGXDcn7SBn4AigY
	JJNXd/uxSbhvdfyfiUdK1v9yesWJ1gTqNMf+l4rx+uJFVOQUlUIAcGhm671OBTdn3ShnEhccmCguu
	eTQ4fYW/GAXjOoAHdzF9OWXqBJ60svRyz9KyTAwx6v4Vu2tFhD83q6FXQP2E+OeiD2j7jRu24GyoI
	thcRajPVdQ96y/1dNQg++/tVSXH8fxv9lXI/i1v67Hk7nt4DyU5omskShvtPLo+84pXSBjVm730lB
	EIFpvMmsfPVEQQwTg8eDNhs4PTVq4xKp60xFAdvn58vZyiEWATkQV7FJlIkezBXcxgfE5xcr5cGcF
	VzkabNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rud4D-00000008YgT-3tBw;
	Wed, 10 Apr 2024 18:53:05 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rud4A-00000008Yde-0qrE;
	Wed, 10 Apr 2024 18:53:03 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rud3c-0001D4-1U;
	Wed, 10 Apr 2024 18:52:28 +0000
Date: Wed, 10 Apr 2024 19:52:24 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: arinc.unal@arinc9.com, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
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
	linux-mediatek@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix enabling EEE on MT7531
 switch on all boards
Message-ID: <Zhbf6AtfBfxXMIGc@makrotopia.org>
References: <20240408-for-net-mt7530-fix-eee-for-mt7531-mt7988-v3-1-84fdef1f008b@arinc9.com>
 <1f2bc5416a0a73756cc1f45f3300619eb201b0a4.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f2bc5416a0a73756cc1f45f3300619eb201b0a4.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_115302_340516_B7CE49F2 
X-CRM114-Status: GOOD (  33.82  )
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

On Tue, Apr 09, 2024 at 01:58:56PM +0200, Paolo Abeni wrote:
> On Mon, 2024-04-08 at 10:08 +0300, Arınç ÜNAL via B4 Relay wrote:
> > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > 
> > The commit 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
> > brought EEE support but did not enable EEE on MT7531  MACs. EEE is
> > enabled on MT7531 switch MACs by pulling the LAN2LED0 pin low on the board
> > (bootstrapping), unsetting the EEE_DIS bit on the trap register, or setting
> > the internal EEE switch bit on the CORE_PLL_GROUP4 register. Thanks to
> > SkyLake Huang (黃啟澤) from MediaTek for providing information on the
> > internal EEE switch bit.
> > 
> > There are existing boards that were not designed to pull the pin low.
> > Because of that, the EEE status currently depends on the board design.
> > 
> > The EEE_DIS bit on the trap pertains to the LAN2LED0 pin which is usually
> > used to control an LED. Once the bit is unset, the pin will be low. That
> > will make the active low LED turn on. The pin is controlled by the switch
> > PHY. It seems that the PHY controls the pin in the way that it inverts the
> > pin state. That means depending on the wiring of the LED connected to
> > LAN2LED0 on the board, the LED may be on without an active link.
> > 
> > To not cause this unwanted behaviour whilst enabling EEE on all boards, set
> > the internal EEE switch bit on the CORE_PLL_GROUP4 register.
> > 
> > My testing on MT7531 shows a certain amount of traffic loss when EEE is
> > enabled. That said, I haven't come across a board that enables EEE. So
> > enable EEE on the switch MACs but disable EEE advertisement on the switch
> > PHYs. This way, we don't change the behaviour of the majority of the boards
> > that have this switch. The mediatek-ge PHY driver already disables EEE
> > advertisement on the switch PHYs but my testing shows that it is somehow
> > enabled afterwards. Disabling EEE advertisement before the PHY driver
> > initialises keeps it off.
> > 
> > With this change, EEE can now be enabled using ethtool.
> > 
> > Fixes: 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
> > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > ---
> > Here's some information for the record. EEE could not be enabled on MT7531
> > on most boards using ethtool before this. On MT7988 SoC switch, EEE is
> > disabled by default but can be turned on normally using ethtool. EEE is
> > enabled by default on MT7530 and there's no need to make changes on the DSA
> > subdriver for it.
> > ---
> > Changes in v3:
> > - Remove patch 2, it was revealed that it doesn't fix a bug.
> > - Patch 1
> >   - Use the internal EEE switch bit provided by SkyLake Huang (黃啟澤). It
> >     is a better method compared to unsetting the EEE_DIS bit of the trap as
> >     the latter method causes unwanted behaviour on the LED connected to the
> >     pin that pertains to the EEE_DIS bit.
> 
> Since this leverages something relatively obscure, it would be great if
> someone in the CC list could independently test it. Let's wait a bit
> more.

I've excessively tested this patch on MT7531 today, and reviewed it
today and yesterday. I've also picked it as downstream patch[1] to
OpenWrt, so an even wider audience will have the pleasure of working
EEE on those switch ICs and in-SoC switches.

Tested-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Daniel Golle <daniel@makrotopia.org>

[1]: https://git.openwrt.org/?p=openwrt/openwrt.git;a=commit;h=98f9154316fe8371c709bd11ae8f263e22075ec6

