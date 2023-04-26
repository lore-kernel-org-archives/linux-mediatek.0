Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6993C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 17:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lj3hzEx9aj2YGe6xhhebIwqwsB+duLc+uUUaIkR490=; b=co5+tIEVMQX2Cn0KNL4cMO+LO3
	Gv/+Z653Mhixke1zjlarEQ5LpaPzo06H3vcZ1JaE2YcUo2xAqk6Te0xFrfOyH1DwvQG0j3nbVRDSp
	aBRsMlEB3B+DVpvjP26hj/Fz0K+ULEcIEDRiZXTflwhKOIDgkpI1QyTQWihEf0BeBfB2hxDOSw69G
	KsnYz5BSJ8Y77EJoujtAZ4QummdaN9yEyZSdigAES4adP9FBS2Vz9cFx0Mpo1ZAxFZ4FztI3KPRiE
	pG0pYcl9xAnd7NzU1vugE5Xd8kzUzwc5W8meooAbkV7gF2EiDphjXsexWxFrR1vQTYeKat3NElzDT
	QHh4IrNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prjJI-004Zcm-2n;
	Wed, 26 Apr 2023 17:52:08 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prjJG-004Zc7-1w;
	Wed, 26 Apr 2023 17:52:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682531500; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UCY20pq6hBUDq0BErUNSiq1JHZ08krIPzKXZK7mW/4B2BuIcCj66ICA2dghtnCRJLxvc86ynDnyizCk9nZEmARNqW//E5+jIQmg1fAsZGPBs9iX7xumDZ2hFuNmWAEK4FQLG/uLYfURSCKeVZ8LDoLgmmlOrVp0WgPQyY0mmmfs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682531500; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=4lj3hzEx9aj2YGe6xhhebIwqwsB+duLc+uUUaIkR490=; 
	b=eEAM0y2k8X1ksxQ1DnRUJZAXbzmGMjrE5+W7xFSfZZ9VkYEzgI66FFRxWKa+lBIMv28a3crOWsqmctGkH4JgR+gFLwH9htoLXLFwnLhCSI8jlwbnwhhE8aFYGolb24L55L/+tk6IGiVpUnvCbbSVaddLyC584ZpRDJZWllVDlho=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682531500;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4lj3hzEx9aj2YGe6xhhebIwqwsB+duLc+uUUaIkR490=;
	b=ddav/KHAVz77stAmuPr8bcAfjb9xzsS2PNTT5Nz2hBTOS/cS/e3T52npvHN6oOs/
	qFAtunt4wBYth5yPzcTQ4+R2q2PogL1gEtQFxbG5mTedydRWpGERdZdvaDBocb+wk+k
	9G6wWw4ba44fRRB630eg6Rwiik3QgGFfEQZ27b6I=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1682531497603365.41163959637413; Wed, 26 Apr 2023 10:51:37 -0700 (PDT)
Message-ID: <9f8f082d-7bc7-2271-9b6c-cd7bf96c755b@arinc9.com>
Date: Wed, 26 Apr 2023 20:51:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Aw: Re: [net v2] net: ethernet: mtk_eth_soc: drop generic vlan rx
 offload, only use DSA untagging
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20230426172153.8352-1-linux@fw-web.de>
 <61ea49b7-8a04-214d-ef02-3ef6181619e9@arinc9.com>
 <trinity-bb65fd35-fe52-45d2-975c-230e504cc93f-1682530288982@3c-app-gmx-bs05>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <trinity-bb65fd35-fe52-45d2-975c-230e504cc93f-1682530288982@3c-app-gmx-bs05>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_105206_699418_56919417 
X-CRM114-Status: GOOD (  14.19  )
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

On 26/04/2023 20:31, Frank Wunderlich wrote:
> 
>> Gesendet: Mittwoch, 26. April 2023 um 19:25 Uhr
>> Von: "Arınç ÜNAL" <arinc.unal@arinc9.com>
>> On 26/04/2023 20:21, Frank Wunderlich wrote:
>>> From: Felix Fietkau <nbd@nbd.name>
>>>
>>> Through testing I found out that hardware vlan rx offload support seems to
>>> have some hardware issues. At least when using multiple MACs and when
>>> receiving tagged packets on the secondary MAC, the hardware can sometimes
>>> start to emit wrong tags on the first MAC as well.
>>>
>>> In order to avoid such issues, drop the feature configuration and use
>>> the offload feature only for DSA hardware untagging on MT7621/MT7622
>>> devices where this feature works properly.
>>>
>>> Fixes: 08666cbb7dd5 ("net: ethernet: mtk_eth_soc: add support for configuring vlan rx offload")
>>> Tested-by: Frank Wunderlich <frank-w@public-files.de>
>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> I'm confused by this. What is HW-vlan-untagging, and which SoCs do you
>> think this patch would break this feature? How can I utilise this
>> feature on Linux so I can confirm whether it works or not?
> 
> the feature itself breaks vlan on mac of bpi-r3
> 
> 1 mac is connected to switch and uses dsa tags, the other mac is directly accessible and vlan-tag
> there is stripped by this feature.
> 
> with this patch i can use vlans on the "standalone" mac again (see tagged packets incoming).

Ok, since this patch is disabling the feature, the patch cannot possibly 
break the feature. That's why I was confused as to why you mentioned 
this in a way that gives the impression that this patch may break the 
said feature.

Anyhow:

Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

