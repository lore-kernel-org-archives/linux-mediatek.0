Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC16C54E71
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 18:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqjw5/4OqJvrXdntVY+Zb5+0XQA0wPKvw3S8mwvRbX4=; b=hnOsQQTS6co6BY5EFYpkyNuto8
	61OM7bkxnkZsuF89os3MdAwZNCKsAeCEBeeK+oYiIrgEkc1rKYKkHlEgMkXZpfB6lhHmZPnvNJm52
	hHr7//g28+vBG28JQk1SUnmEorkA4A1VnWseRDPESCzhlaMMOQd7zQc+36OMEq3wil7gtcbpQ0nXc
	FCdwbzGhGY3ESCmWEPCrtvIzlhUa8moBCmkspMmM3I2Hd9SQ6Y6PCaoEFLSVDS1sl4XeqTYZih7Au
	sX33d+5BOnhbV/j215Z1f1SC7/SVWPuQFjoVFZoQ+h37029xM7aQX/P2NV3/3iY8kDtmQA7MGynRr
	NUgf2rcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmeUK-0000000Ds93-0N2G;
	Tue, 19 Mar 2024 18:47:04 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmeUF-0000000Ds74-2Bzw;
	Tue, 19 Mar 2024 18:47:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 296531C0005;
	Tue, 19 Mar 2024 18:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710874015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hqjw5/4OqJvrXdntVY+Zb5+0XQA0wPKvw3S8mwvRbX4=;
	b=lM95JhmQPcXUfhGSFLijlkAHQxEuDJdCn0ODi7c+UcwmmUpfUz5Jmcfdg8whXK6f/RpGEz
	DILnO21s+QISwJhhIFPHDkahn+GFdTsYGh6fxmQmpGZ0YCAd3vxPHpNhL4pPLDLYClVeOy
	j/f4yJWXq3s+SSYUK878yVsGwlXhEOl54UiFd63sqdK32b4vlVvIYOa8tznzL60IRo9y6W
	9XAA6+IHnK5e6c5jLGmHIVBP3iT+W3BTBlSsyGVxDaclnM0j2niazvM3zEByu9j3Yh3W2q
	xfVvLW2p+YEmJPJCzvdv1MBwTpN/K/nGFn5NzfcpQbnNeVDfqWTT6Cs5oi5APw==
Message-ID: <00ec9779-19ce-4005-83f0-f4abf37350fc@arinc9.com>
Date: Tue, 19 Mar 2024 21:46:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <<20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v>
 <ZfnYkuzuvwLepIfC@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZfnYkuzuvwLepIfC@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_114659_869191_42F5F3AB 
X-CRM114-Status: GOOD (  16.90  )
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

On 19.03.2024 21:25, Daniel Golle wrote:
> On Mon, Mar 18, 2024 at 10:46:22AM +0300, Arınç ÜNAL via B4 Relay wrote:
>> Hi.
>>
>> This patch series fixes EEE support for MT7531 and the switch on the MT7988
>> SoC. EEE did not work on MT7531 on most boards before this, it is unclear
>> what's the status on MT7988 SoC switch as I don't have the hardware.
> 
> EEE seems to already work just fine on the MT7988 built-in switch, at least
> on the BPI-R4. I don't think the SoC has bootstrap pins related to EEE like
> stand-alone MT753x may have.
> 
> root@bpi-r4:~# ethtool --show-eee lan1
> EEE settings for lan1:
>      EEE status: disabled
>      Tx LPI: 30 (us)
>      Supported EEE link modes:  100baseT/Full
>                                 1000baseT/Full
>      Advertised EEE link modes:  Not reported
>      Link partner advertised EEE link modes:  100baseT/Full
>                                               1000baseT/Full
> 
> root@bpi-r4:~# ethtool --set-eee lan1 eee on
> root@bpi-r4:~# ethtool --show-eee lan1
> EEE settings for lan1:
>      EEE status: enabled - inactive
>      Tx LPI: 30 (us)
>      Supported EEE link modes:  100baseT/Full
>                                 1000baseT/Full
>      Advertised EEE link modes:  100baseT/Full
>                                  1000baseT/Full
>      Link partner advertised EEE link modes:  Not reported
> root@bpi-r4:~# ethtool --show-eee lan1
> EEE settings for lan1:
>      EEE status: enabled - active
>      Tx LPI: 30 (us)
>      Supported EEE link modes:  100baseT/Full
>                                 1000baseT/Full
>      Advertised EEE link modes:  100baseT/Full
>                                  1000baseT/Full
>      Link partner advertised EEE link modes:  100baseT/Full
>                                               1000baseT/Full
> 
> So don't fix if it ain't broken maybe...?

I would argue that EEE advertisement on the PHY should be enabled by
default. I guess we're supposed to supply that on the PHY driver. Can you
test with this diff applied and see if it works without manually enabling
EEE using ethtool?

diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek-ge-soc.c
index 0f3a1538a8b8..5f482c12018a 100644
--- a/drivers/net/phy/mediatek-ge-soc.c
+++ b/drivers/net/phy/mediatek-ge-soc.c
@@ -978,6 +978,9 @@ static void mt798x_phy_eee(struct phy_device *phydev)
  		       MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG122,
  		       MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK,
  		       FIELD_PREP(MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK, 0xff));
+
+	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, MDIO_EEE_100TX |
+		      MDIO_EEE_1000T);
  }
  
  static int cal_sw(struct phy_device *phydev, enum CAL_ITEM cal_item,

Arınç

