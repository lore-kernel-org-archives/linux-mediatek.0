Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8E5C54E68
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 18:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEVpDjnbgSKzUSM/lpuuz1e2ij2JBb/qNmdPEaTjLBY=; b=hXJNmujkWPTtz/Hdzk889ky/i3
	44m6OThvC7bStrZK6lVdaHCCmBDhxwvBeArehgQgRhQtQq2y2GV5VcjzqxccS35QUMzNhynpQiGbN
	u8BCeSUallhxKwAESLfVaglkYleXnLPcL6ltx0dHmqG2Ard7TXaLPIVqAXd0ztcfFz/19dXDA0X6Y
	YM58JL/2ODROSIHkdeXucgZJuaQ0p01Kdv9rzUxEwvLrauIdGdBFWwuZZOXd2FFwFe7Lwy3aDTZWp
	trB57H3+RBGVRypYABRHlk0h/ru0qulER6Pp94jA5SFjPOe+7W5f6E57GlyGeU1RRgCejCN5HMpIH
	jj0Uyf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rme9x-0000000DoRh-36VW;
	Tue, 19 Mar 2024 18:26:01 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rme9u-0000000DoP1-0jsT;
	Tue, 19 Mar 2024 18:25:59 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rme9R-0005tO-32;
	Tue, 19 Mar 2024 18:25:30 +0000
Date: Tue, 19 Mar 2024 18:25:22 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: arinc.unal@arinc9.com
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
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
Message-ID: <ZfnYkuzuvwLepIfC@makrotopia.org>
References: <=?utf-8?q?=3C20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v?=>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <=?utf-8?q?=3C20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v?=>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_112558_269920_945AF24D 
X-CRM114-Status: GOOD (  15.84  )
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

On Mon, Mar 18, 2024 at 10:46:22AM +0300, Arınç ÜNAL via B4 Relay wrote:
> Hi.
> 
> This patch series fixes EEE support for MT7531 and the switch on the MT7988
> SoC. EEE did not work on MT7531 on most boards before this, it is unclear
> what's the status on MT7988 SoC switch as I don't have the hardware.

EEE seems to already work just fine on the MT7988 built-in switch, at least
on the BPI-R4. I don't think the SoC has bootstrap pins related to EEE like
stand-alone MT753x may have.

root@bpi-r4:~# ethtool --show-eee lan1
EEE settings for lan1:
    EEE status: disabled
    Tx LPI: 30 (us)
    Supported EEE link modes:  100baseT/Full
                               1000baseT/Full
    Advertised EEE link modes:  Not reported
    Link partner advertised EEE link modes:  100baseT/Full
                                             1000baseT/Full

root@bpi-r4:~# ethtool --set-eee lan1 eee on
root@bpi-r4:~# ethtool --show-eee lan1
EEE settings for lan1:
    EEE status: enabled - inactive
    Tx LPI: 30 (us)
    Supported EEE link modes:  100baseT/Full
                               1000baseT/Full
    Advertised EEE link modes:  100baseT/Full
                                1000baseT/Full
    Link partner advertised EEE link modes:  Not reported
root@bpi-r4:~# ethtool --show-eee lan1
EEE settings for lan1:
    EEE status: enabled - active
    Tx LPI: 30 (us)
    Supported EEE link modes:  100baseT/Full
                               1000baseT/Full
    Advertised EEE link modes:  100baseT/Full
                                1000baseT/Full
    Link partner advertised EEE link modes:  100baseT/Full
                                             1000baseT/Full

So don't fix if it ain't broken maybe...?

> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> Arınç ÜNAL (3):
>       net: dsa: mt7530: fix enabling EEE on MT7531 switch on all boards
>       net: dsa: mt7530: fix disabling EEE on failure on MT7531 and MT7988
>       net: phy: mediatek-ge: do not disable EEE advertisement
> 
>  drivers/net/dsa/mt7530.c      | 7 +++++++
>  drivers/net/dsa/mt7530.h      | 7 ++++++-
>  drivers/net/phy/mediatek-ge.c | 3 ---
>  3 files changed, 13 insertions(+), 4 deletions(-)
> ---
> base-commit: ea80e3ed09ab2c2b75724faf5484721753e92c31
> change-id: 20240317-for-net-mt7530-fix-eee-for-mt7531-mt7988-a5c5453cc0e8
> 
> Best regards,
> -- 
> Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> 

