Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5B5C77B76
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Apr 2023 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V97CTbRRx60wlBMlbpYx7Tf+OkDSsIy8nufSdDeF6Cw=; b=OWkMB5Ig8F1HebTsE26p95yPa7
	RFDBfCGeAIg+6bnPXBHP4IJWwd92Ou8qCwPDHY0xcuMxYhIhzIJwD0Y6tKPZfxzIMwnjZInTb0GwD
	ax68F/2oMZInZ1looTwsvgzF3s+lzVWd5URexm9J/KfqWn2PFmNtSwyNhvYRzIxh4PudNQ6yQFLpT
	thfWmPtiYOGbiRhort71ZBZjccAt9esuz8R9cmV/GKet3enlPtH/ahuGr1KHMj6t3sQXvJIFVaAgM
	3mGNG6lVx9NzgjKfDVd17XEqtfS+7H3PiLJJmu7/hLBb+pu2zXEHMOjHpZtEQb37yTcnXLv0ZxYdy
	fkrya2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po03D-00Dh0Y-2t;
	Sun, 16 Apr 2023 10:56:07 +0000
Received: from sender3-op-o17.zoho.com ([136.143.184.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po03A-00DgzD-1G;
	Sun, 16 Apr 2023 10:56:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1681642533; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UqMHckyXcIFHfoaEyjSWBgSItMRDJGCT/lSiPfTTztXU+esoRDFCPNG5VHTVWdI5yeXwkF+ThMd5wZeHhf+vFczNpbnVNQ8qi9dLDfbbxOP2HQm0elNaagkpvf2jtfGGp5By6juMKOEWrB3wb4oK7M4pVwEUvS9dR0BPsxw2+B4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1681642533; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=V97CTbRRx60wlBMlbpYx7Tf+OkDSsIy8nufSdDeF6Cw=; 
	b=UttCBE28loNQMpNq3POemwT5lMIKSTAntgb+F25KGLPAqug6yp9AvaPpVD0Ite22J0zgDWSb9l+mr+ZITCCGZbpOEJSkWmPW2Lrw7ld3hKVPQZK6nak9T/rX1HKPeM7BoofWv/XFabQmD2mPOyGVT9edtR6t6uVpdlCPag1Y4RM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1681642533;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V97CTbRRx60wlBMlbpYx7Tf+OkDSsIy8nufSdDeF6Cw=;
	b=W5VPss4P6cukgI3IUb1vyNbj3IP6miJhzJFQ2Taq9S6XOCsbGKaCIukbHiRz4rcy
	eRaECDM3thiWG0oFsGwgQwQknnI12pTaZyf1hI/mMWOJazcYvkD6o7FXZXgN1kknWvb
	PlfRqSvpDyOfIASd160zpIsT6COPO918w3NgkKlo=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1681642532775839.6157058403239; Sun, 16 Apr 2023 03:55:32 -0700 (PDT)
Message-ID: <2ad08330-59a0-d3b2-214e-13d93dbe35a1@arinc9.com>
Date: Sun, 16 Apr 2023 13:55:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC/RFT v1] net: ethernet: mtk_eth_soc: drop generic vlan rx
 offload, only use DSA untagging
Content-Language: en-US
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Felix Fietkau <nbd@nbd.name>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Daniel Golle <daniel@makrotopia.org>
Cc: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230416091038.54479-1-linux@fw-web.de>
 <c657f6a2-74fa-2cc1-92cf-18f25464b1e1@arinc9.com>
 <161044DF-0663-42D4-94B8-03741C91B1A4@public-files.de>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <161044DF-0663-42D4-94B8-03741C91B1A4@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_035604_480648_F1E6013E 
X-CRM114-Status: GOOD (  16.81  )
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

On 16.04.2023 13:15, Frank Wunderlich wrote:
> Am 16. April 2023 11:52:31 MESZ schrieb "Arınç ÜNAL" <arinc.unal@arinc9.com>:
>> On 16.04.2023 12:10, Frank Wunderlich wrote:
>>> From: Felix Fietkau <nbd@nbd.name>
>>>
>>> Through testing I found out that hardware vlan rx offload support seems to
>>> have some hardware issues. At least when using multiple MACs and when receiving
>>> tagged packets on the secondary MAC, the hardware can sometimes start to emit
>>> wrong tags on the first MAC as well.
>>>
>>> In order to avoid such issues, drop the feature configuration and use the
>>> offload feature only for DSA hardware untagging on MT7621/MT7622 devices which
>>> only use one MAC.
>>
>> MT7621 devices most certainly use both MACs.
>>
>>>
>>> Tested-by: Frank Wunderlich <frank-w@public-files.de>
>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>> used felix Patch as base and ported up to 6.3-rc6 which seems to get lost
>>> and the original bug is not handled again.
>>>
>>> it reverts changes from vladimirs patch
>>>
>>> 1a3245fe0cf8 net: ethernet: mtk_eth_soc: fix DSA TX tag hwaccel for switch port 0
>>
>> Do I understand correctly that this is considered being reverted because the feature it fixes is being removed?
> 
> As far as i understood, vladimirs patch fixes one
> cornercase of hw rx offload where felix original
> patch was fixing more..sent it as rft to you to test
> if your bug (which vladimir fixed) is not coming in
> again. If it does we can try to merge both
> attempts. But current state has broken vlan on
> bpi-r3 non-dsa gmac1 (sfp-wan).

I tested this patch on MT7621AT and MT7623NI SoCs on the current 
linux-next. Port 0 keeps working fine.

So when you use VLANs on non-DSA gmac1, network connectivity is broken?

I've got an MT7621AT device which gmac1 is connected to an external phy 
(sfp-wan, the same case as yours). I'll test VLANs there. See if MT7621 
is affected by this as well since the patch log here states this feature 
is kept enabled for MT7621 because only gmac0 is used which is false.

Arınç

