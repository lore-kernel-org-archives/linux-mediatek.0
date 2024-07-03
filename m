Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C10C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBX2/MGaOS1ZkS0ejeTXdSBLBk8fKts4uFWqlOjCCxY=; b=A0CPv5Z7MfWgmyacami2BnbLHc
	yLzvtzl3pIJi6HEUbjrmJFv1Ap9gKIG0DCw8/7WuBwk2wjBBCdUsgy1dgli7Yej3SUb/l5U8Mb3C9
	kxFOAFnG1vGCm3vNgdfIVm2H5N2bpR78q8ZponOw/KvHsQX/Gvwzjsifa4wpqWaTmtS6TSjXLvHzu
	hXux9C2xUlA3dQFQYJTqn7lPqmRJhwqBlcbOgG6CgMP1NbIczbnNEdAz1vIcRBMFGgLbLn9uTNppt
	lhL3ZBoB6aDwfgJRz52wp6MQYpPTS8s6kwmVRnFwaFmcfbU/sZzM9Ny1unbqlkQiGoe2ORGBcM4O8
	PurS+tfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOu1b-00000009HUf-1ExG;
	Wed, 03 Jul 2024 07:03:31 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOu1P-00000009HQZ-01Am;
	Wed, 03 Jul 2024 07:03:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E3A940008;
	Wed,  3 Jul 2024 07:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1719990194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBX2/MGaOS1ZkS0ejeTXdSBLBk8fKts4uFWqlOjCCxY=;
	b=QLU8n0pp4oKXT2jnEnw/2NUh5RoMDi+EnE/qwfSgtYP3e49V46R183fl57FUe4yyrtm2j0
	xZ3gX54HYsBb5ZzK4KQIjQl6nNayGvWhOEVqUFuzPEadVNSwnxrpIaTBH6AVevCOmz+GQa
	DRNh3Veg72O7SnHljex3H2G5ECbKNiB/+yzP+D1P0HOsqPN/gW2kYu+V8+WvdUWRSXaMzZ
	Ca+3mlMJlQdMl/xD/nB3dd9csjM45OJwqEhrfkxFIo4vhkAjJXzDsqw/Xf92vL6k1BV9EP
	obgXugHip14iaC35LvDWSSWkvlveobMkbIa2EDaOX2WjsAprOPsenCl3TiWmlQ==
Message-ID: <d3ac5584-8e52-46e0-b690-ad5faa1ede61@arinc9.com>
Date: Wed, 3 Jul 2024 10:03:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 regressions@lists.linux.dev
References: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_000319_348076_BB231324 
X-CRM114-Status: GOOD (  20.70  )
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

On 03/07/2024 02:44, Daniel Golle wrote:
> The MDIO address of the MT7530 and MT7531 switch ICs can be configured
> using bootstrap pins. However, there are only 4 possible options for the
> switch itself: 7, 15, 23 and 31. As in MediaTek's SDK the address of the
> switch is wrongly stated in the device tree as 0 (while in reality it is
> 31), warn the user about such broken device tree and make a good guess
> what was actually intended.
> 
> This is imporant also to not break compatibility with older Device Trees
> as with commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of
> switch from device tree") the address in device tree will be taken into
> account, while before it was hard-coded to 0x1f.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> Only tested on BPi-R3 (with various deliberately broken DT) for now!
> 
> Changes since v2 [2]:
>   - use macros instead of magic numbers
>   - introduce helper functions
>   - register new device on MDIO bus instead of messing with the address
>     and schedule delayed_work to unregister the "wrong" device.
>     This is a slightly different approach than suggested by Russell, but
>     imho makes things much easier than keeping the "wrong" device and
>     having to deal with keeping the removal of both devices linked.
>   - improve comments
> 
> Changes since v1 [1]:
>   - use FW_WARN as suggested.
>   - fix build on net tree which doesn't have 'mdiodev' as member of the
>     priv struct. Imho including this patch as fix makes sense to warn
>     users about broken firmware, even if the change introducing the
>     actual breakage is only present in net-next for now.
> 
> [1]: https://patchwork.kernel.org/project/netdevbpf/patch/e615351aefba25e990215845e4812e6cb8153b28.1714433716.git.daniel@makrotopia.org/
> [2]: https://patchwork.kernel.org/project/netdevbpf/patch/11f5f127d0350e72569c36f9060b6e642dfaddbb.1714514208.git.daniel@makrotopia.org/

Works on standalone MT7530, MT7621's MCM MT7530, and MT7531. From MT7621's
MCM MT7530:

[    1.357287] mt7530-mdio mdio-bus:1f: MT7530 adapts as multi-chip module
[    1.364065] mt7530-mdio mdio-bus:00: [Firmware Warn]: impossible switch MDIO address in device tree, assuming 31
[    1.374303] mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with error -14
[...]
[    1.448370] mt7530-mdio mdio-bus:1f: MT7530 adapts as multi-chip module
[    1.477676] mt7530-mdio mdio-bus:1f: configuring for fixed/rgmii link mode
[    1.485687] mt7530-mdio mdio-bus:1f: Link is Up - 1Gbps/Full - flow control rx/tx
[    1.493480] mt7530-mdio mdio-bus:1f: configuring for fixed/trgmii link mode
[    1.502680] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=17)
[    1.513620] mt7530-mdio mdio-bus:1f: Link is Up - 1Gbps/Full - flow control rx/tx
[    1.519671] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=18)
[    1.533072] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=19)
[    1.545042] mt7530-mdio mdio-bus:1f lan4 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=20)
[    1.557031] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=21)

I'm not fond of the use of the non-standard term, MDIO address, instead of
"PHY Address" as described in 22.2.4.5.5 of IEEE Std 802.3-2022.
Regardless:

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

