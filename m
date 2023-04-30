Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B534EC77B60
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 16:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V23TsjyY1dD7n4GR0wkMYD0yPbsZ48d23pahmY6bjZY=; b=CmMAxPyuhDWDeA7jtMkIZbW2Wv
	rQ6AJlW39t7XniWyCk2pK5tgmXoGox7UCnom0yXJXcjNiDyJAHXUx9VM1wR6EyBursFD+KW2cwV4V
	wjQjRwH5aUOWhnLaQn6GTD8eXFfJQQGMYkcObHvC5Oktivqepe6nXbcrnnnnQVRXRNVNAqAP+9jx3
	DPO2XAwynxtHmK/5IF1f8Np3l/lCzDZv0xwZRp2ai5j0EzrV3MVgrWoSd2Mxcnyncaw9nFsQffTVB
	FWGoXI5HZ80Wz0bzcM9l1ygX0MtPSF0Y8RmdRp64amIbEa+NEpm2gr3ovSiN9wP+SIvZ28DBPDRBc
	hIKTIzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pt9kT-00ENv0-1v;
	Sun, 30 Apr 2023 16:18:05 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pt9kO-00ENty-1J;
	Sun, 30 Apr 2023 16:18:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682871453; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RcKG0fq2Np8JTd1gJDHJ3xZGFExtlqzo5T7irO6pWfeZ/2/M2ZDm/jLBhjXs8kSkqYWKltiQnIDcEIfTBO7FtArT7A896bpZWX/bHXkDg1+sETSGhTQpfGWVAB0eCN0DF1yZRCAZon+5uG7q4OXL3GaSDy2zq2ERlpX200I2kq4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682871453; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=V23TsjyY1dD7n4GR0wkMYD0yPbsZ48d23pahmY6bjZY=; 
	b=egBI5N2x2xYD8oG6Kr7GWcgP9HX9ZmakF1ZNRuSnbe2Adsizk6Cd/KsfzZTavi2qqAUbis9aHymScsoIY7Cl8QpEXxKuW9JW/MEn3HvzSTzSD8PHtAzRRg6QyEtX/5W3pYCIJqQQT5LWlxzpfhUDqT2h168wLDyrOlfqDwO/V9E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682871453;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V23TsjyY1dD7n4GR0wkMYD0yPbsZ48d23pahmY6bjZY=;
	b=FFkIp0TaDngLCZzkJ4tp5UabOW70Lfj1EnSKtRxj2nB+3YW1YNS1QrZ8kNC+JliO
	OUTaUiy6xEo6mlWlpI1mzcCGLner8djPP+Lpq8LkAJFYiKG637OUtDZVVOs6EkIEVef
	sklI13M03UKQ6L4dcgDVp7QB2mfB6EADw01b7t/8=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1682871451193369.77097793382404; Sun, 30 Apr 2023 09:17:31 -0700 (PDT)
Message-ID: <396fad42-89d0-114d-c02e-ac483c1dd1ed@arinc9.com>
Date: Sun, 30 Apr 2023 19:17:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] dt-bindings: net: dsa: mediatek,mt7530: document
 MDIO-bus
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: David Bauer <mail@david-bauer.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230430112834.11520-1-mail@david-bauer.net>
 <20230430112834.11520-2-mail@david-bauer.net>
 <e4feeac2-636b-8b75-53a5-7603325fb411@arinc9.com>
Content-Language: en-US
In-Reply-To: <e4feeac2-636b-8b75-53a5-7603325fb411@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_091800_526122_1FB9099A 
X-CRM114-Status: GOOD (  14.84  )
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

On 30.04.2023 15:34, Arınç ÜNAL wrote:
> On 30.04.2023 14:28, David Bauer wrote:
>> Document the ability to add nodes for the MDIO bus connecting the
>> switch-internal PHYs.
> 
> This is quite interesting. Currently the PHY muxing feature for the 
> MT7530 switch looks for some fake ethernet-phy definitions on the 
> mdio-bus where the switch is also defined.
> 
> Looking at the binding here, there will be an mdio node under the switch 
> node. This could be useful to define the ethernet-phys for PHY muxing 
> here instead, so we don't waste the register addresses on the parent 
> mdio-bus for fake things. It looks like this should work right out of 
> the box. I will do some tests.

Once I start using the mdio node it forces me to define all the PHYs 
which were defined as ports.

[    4.159534] mt7530-mdio mdio-bus:1f lan0 (uninitialized): no phy at 1
[    4.166002] mt7530-mdio mdio-bus:1f lan0 (uninitialized): failed to 
connect to PHY: -ENODEV
[    4.174421] mt7530-mdio mdio-bus:1f lan0 (uninitialized): error -19 
setting up PHY for tree 0, switch 0, port 1
[    4.185236] mt7530-mdio mdio-bus:1f lan1 (uninitialized): no phy at 2
[    4.191753] mt7530-mdio mdio-bus:1f lan1 (uninitialized): failed to 
connect to PHY: -ENODEV
[    4.200150] mt7530-mdio mdio-bus:1f lan1 (uninitialized): error -19 
setting up PHY for tree 0, switch 0, port 2
[    4.210844] mt7530-mdio mdio-bus:1f lan2 (uninitialized): no phy at 3
[    4.217361] mt7530-mdio mdio-bus:1f lan2 (uninitialized): failed to 
connect to PHY: -ENODEV
[    4.225734] mt7530-mdio mdio-bus:1f lan2 (uninitialized): error -19 
setting up PHY for tree 0, switch 0, port 3
[    4.236394] mt7530-mdio mdio-bus:1f lan3 (uninitialized): no phy at 4
[    4.242901] mt7530-mdio mdio-bus:1f lan3 (uninitialized): failed to 
connect to PHY: -ENODEV
[    4.251297] mt7530-mdio mdio-bus:1f lan3 (uninitialized): error -19 
setting up PHY for tree 0, switch 0, port 4

We can either force defining the PHYs on the mdio node which would break 
the ABI, or forget about doing PHY muxing this way.

Arınç

