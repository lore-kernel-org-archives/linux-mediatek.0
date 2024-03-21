Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B513C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 16:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrChM2bMyOZ06ublb4gFN2AgR2OzWBbSVut/5tc1iQ8=; b=r5IBKVJAPWzAeHWO4VNX1SQtjt
	HT0Uk9wQ98kvoA3NA+SyJgVp+sxz/jWju35dJwGu10F6QKXep8W/7AZqDtKQtqzPUZcfcAzBWAil0
	IyhZ4UKbX9dqmddXRU+z7j4fsTlJEuTCZb1C3FRiChG58jxhilLZHdXiAAd4URenrnF7JFir5gLql
	acyIbR81wkTO4qlsbswap82KYr7MkeJFY0zXSG3lYVJcUby0pJbttIZE/a90K2AxDsO9GokBRjUXO
	1hPPU0W/mWdsPdIMp2CNdUXuOiwtOhgPqweqgidMNTn4UenJ3g7zr+yHEJL2quVunV9vu5IOPYbvq
	TzRHLgWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnKzR-00000003imD-0TWF;
	Thu, 21 Mar 2024 16:10:01 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnKzM-00000003ijJ-1prc;
	Thu, 21 Mar 2024 16:09:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 458D240008;
	Thu, 21 Mar 2024 16:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1711037391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrChM2bMyOZ06ublb4gFN2AgR2OzWBbSVut/5tc1iQ8=;
	b=UIyozjziieWmwYdBiKJK/bXdSKQEvgtMNVegmQmAe4mwYJCgXOAcMxQvzG/DPZ+XWLySwG
	pNYm2J+wW5gZocJM+aMbHexmQsarqcic1FreLWeSQcv/adAf1+zEBm9morWBlpBTtjmzaM
	jEyUrtNPdC/7tmq/ZMpdzYUbmUVhrVIHvtYvbl0OQTMlEf/BCKEymvLVx74RI3wAp7kzPW
	HamM2GmpYUIWzXrZHsiovGBhJ0C/Qa3osDjZwLWmXEx0n81f1ncu5iW/T9W+Zif/uoHtAG
	8HcSm9MGLTbFzIa88JkwITb5Ur/PiTQ5p1VUbReXCsxWNOxvua0UyZY8/IR9qQ==
Message-ID: <0fbe7ba2-6529-4118-b050-8ea76d28b712@arinc9.com>
Date: Thu, 21 Mar 2024 19:09:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
To: Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
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
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v>
 <ZfnYkuzuvwLepIfC@makrotopia.org>
 <00ec9779-19ce-4005-83f0-f4abf37350fc@arinc9.com>
 <6cb585f6-6da8-45a2-a28b-2fb556f95672@lunn.ch>
 <Zfn1DxkEa3u-f7l2@makrotopia.org>
 <38798882-c033-4949-9446-4c6f15c25ebe@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <38798882-c033-4949-9446-4c6f15c25ebe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_090956_799558_A04A8E55 
X-CRM114-Status: GOOD (  23.05  )
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

On 20.03.2024 00:31, Florian Fainelli wrote:
> On 3/19/24 13:26, Daniel Golle wrote:
>> On Tue, Mar 19, 2024 at 08:38:03PM +0100, Andrew Lunn wrote:
>>>> I would argue that EEE advertisement on the PHY should be enabled by
>>>> default.
>>>
>>> That is an open question at the moment. For some use cases, it can add
>>> extra delay and jitter which can cause problems. I've heard people
>>> doing PTP don't like EEE for example.
>>
>> MediaTek consumer-grade hardware doesn't support PTP and hence that
>> quite certainly won't ever be an issue with all switch ICs supported
>> by the mt7530 driver.
>>
>> I'd rather first change the (configuration) default in OpenWrt (which
>> is arguable the way most people are using this hardware), also because
>> that will be more visible/obvious for users. Or even just make EEE
>> configurable in the LuCI web-UI as a first step so users start playing
>> with it.
>>
>> After all, I also have a hard time imagining that MediaTek disabled
>> EEE in their downstream driver for no reason:
>>
>> https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/24091177a18ba7f2dd8d928a8f5b27b14df46b16
> 
> EEE tends to be an interoperability trap and typically results in unexplained link drops with different link partners which are difficult to debug and root cause. It would be great to have more context as to why it was disabled in the downstream tree to know what we are up against, though I would not be surprised if there had been a number of issues reported.

I have started testing MT7531 with EEE enabled and immediately experienced
frames that wouldn't egress the switch or improperly received on the link
partner.

SoC MAC       <-EEE off-> MT7531 P6 MAC (acting as PHY)
MT7531 P0 MAC <-EEE on -> MT7531 P0 PHY
MT7531 P0 PHY <-EEE on -> Computer connected with twisted pair

I've tested pinging from the SoC's CPU. Packet capturing on the twisted
pair computer showed very few frames were being received.

# ping 192.168.2.2
PING 192.168.2.2 (192.168.2.2): 56 data bytes
64 bytes from 192.168.2.2: seq=36 ttl=64 time=0.486 ms
^C
--- 192.168.2.2 ping statistics ---
64 packets transmitted, 1 packets received, 98% packet loss
round-trip min/avg/max = 0.486/0.486/0.486 ms

It seems there's less loss when frames are passed more frequently.

# ping 192.168.2.2 -i 0.06
PING 192.168.2.2 (192.168.2.2): 56 data bytes
64 bytes from 192.168.2.2: seq=5 ttl=64 time=0.285 ms
64 bytes from 192.168.2.2: seq=6 ttl=64 time=0.155 ms
64 bytes from 192.168.2.2: seq=7 ttl=64 time=0.243 ms
64 bytes from 192.168.2.2: seq=8 ttl=64 time=0.139 ms
64 bytes from 192.168.2.2: seq=9 ttl=64 time=0.224 ms
64 bytes from 192.168.2.2: seq=68 ttl=64 time=0.350 ms
64 bytes from 192.168.2.2: seq=69 ttl=64 time=0.242 ms
64 bytes from 192.168.2.2: seq=70 ttl=64 time=0.230 ms
64 bytes from 192.168.2.2: seq=71 ttl=64 time=0.242 ms
64 bytes from 192.168.2.2: seq=72 ttl=64 time=0.276 ms
64 bytes from 192.168.2.2: seq=101 ttl=64 time=0.224 ms
64 bytes from 192.168.2.2: seq=102 ttl=64 time=0.238 ms
64 bytes from 192.168.2.2: seq=103 ttl=64 time=0.240 ms
...
--- 192.168.2.2 ping statistics ---
214 packets transmitted, 32 packets received, 85% packet loss
round-trip min/avg/max = 0.099/0.225/0.350 ms

# ping 192.168.2.2 -i 0.05
PING 192.168.2.2 (192.168.2.2): 56 data bytes
64 bytes from 192.168.2.2: seq=1 ttl=64 time=0.277 ms
64 bytes from 192.168.2.2: seq=2 ttl=64 time=0.240 ms
64 bytes from 192.168.2.2: seq=3 ttl=64 time=0.133 ms
64 bytes from 192.168.2.2: seq=4 ttl=64 time=0.233 ms
64 bytes from 192.168.2.2: seq=5 ttl=64 time=0.223 ms
64 bytes from 192.168.2.2: seq=6 ttl=64 time=0.228 ms
64 bytes from 192.168.2.2: seq=7 ttl=64 time=0.236 ms
64 bytes from 192.168.2.2: seq=8 ttl=64 time=0.150 ms
...
--- 192.168.2.2 ping statistics ---
41 packets transmitted, 40 packets received, 2% packet loss
round-trip min/avg/max = 0.112/0.206/0.277 ms

> 
> That said as an user, if someone has a well controlled environment, they should absolutely be able to turn on EEE and see how stable it holds in their environment.

Looks like this is the way to go. I'm planning to submit v2 with patch 1
as:

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 678b51f9cea6..6aa99b590329 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2458,6 +2458,20 @@ mt7531_setup(struct dsa_switch *ds)
  	/* Reset the switch through internal reset */
  	mt7530_write(priv, MT7530_SYS_CTRL, SYS_CTRL_SW_RST | SYS_CTRL_REG_RST);
  
+	/* Allow modifying the trap and enable Energy-Efficient Ethernet (EEE).
+	 */
+	val = mt7530_read(priv, MT7531_HWTRAP);
+	val |= CHG_STRAP;
+	val &= ~EEE_DIS;
+	mt7530_write(priv, MT7530_MHWTRAP, val);
+
+	/* Disable EEE advertisement on the switch PHYs. */
+	for (i = MT753X_CTRL_PHY_ADDR;
+	     i < MT753X_CTRL_PHY_ADDR + MT7530_NUM_PHYS; i++) {
+		mt7531_ind_c45_phy_write(priv, i, MDIO_MMD_AN, MDIO_AN_EEE_ADV,
+					 0);
+	}
+
  	if (!priv->p5_sgmii) {
  		mt7531_pll_setup(priv);
  	} else {
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index a71166e0a7fc..509ed5362236 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -457,6 +457,7 @@ enum mt7531_clk_skew {
  #define  XTAL_FSEL_M			BIT(7)
  #define  PHY_EN				BIT(6)
  #define  CHG_STRAP			BIT(8)
+#define  EEE_DIS			BIT(4)
  
  /* Register for hw trap modification */
  #define MT7530_MHWTRAP			0x7804

Arınç

