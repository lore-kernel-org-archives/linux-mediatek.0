Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDB7C7EE29
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 09:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fr/61BSJkRBxnPIU/JaeVp9SfOJCht1lutLoKEyNQ14=; b=fQafcbLR54S9h1
	xB7fs0kpGWYWbxx7mEeXFEk2OYObFT41p/0QjFvXDlhRSv3mqDScSzuQKIX+7S1HKs2wHOUOMl1lB
	cB0t+t1WwNm8rAUu8yg3qvrjtr7A8QOvAg8M84G5SHOLlPv4gzSAeVDp79Aj53c+ho6HFu7zIsquZ
	RmgFETBz4qacUBtFNA+0+OY6DrHiADCytSB3fQvD3cSPB+cCEgOVe/0n1GzApg58CnnHoLU8frJlm
	xodk2QpGj84qY1bVZJvWgWZhhxh4ZlPJ69D32bhYgt3FviEYUJRgDxa0Hx7h3nNAl7OoDWxDMRTAd
	oBXv8++JSVP2JSTmUoUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5kDq-00BkRi-06;
	Sun, 04 Jun 2023 09:40:26 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5kDm-00BkQg-1n;
	Sun, 04 Jun 2023 09:40:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685871585; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gSgzJn5CL+O8JRGQl9k63DOoj9fWKcId1L3nQggvd1gIHzIwYxWTywtLT/a02TJ7LRrecXnCC5c0dpEhZ8RSxBqZ/OjLSwZRIfpd8GOI9H6HafFgA6uVsz7ttsQWKJk0BS6JJxg6+l0Fj/9M56+7pBbcTXlfvYyzJgGN8EpIzAQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685871585; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Fr/61BSJkRBxnPIU/JaeVp9SfOJCht1lutLoKEyNQ14=; 
	b=Pwa4aYUItn0lfVIAXIIQnf2PlKXweoSkeHOsX49H7wIgV177CfEaKoNKBTzfnYEtNnyq11QSRdyn3JCrLYF/8wIvAJg36yMkwyGK6MMrPRPX5Tbncl2UdmydgjidE/oPKMwK7Ul7HN1VF95Ps/VAH+8vDBZpogsN1V4gPafFdKE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685871585;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Fr/61BSJkRBxnPIU/JaeVp9SfOJCht1lutLoKEyNQ14=;
	b=XvCCgXYOXJbcaYICu8ov2yD6s6INX/5B14mgo4bFrS7DKgv688oGNU6UrBl7guFo
	qf+VcpMlYJ3R+o34qTJEl8bHvzmL6fEffBFca7Mr5rbql59/kemX2VRIJts8NGkoedR
	w6MH1IK7sKpbHy0T8Sn3cFFvoqjo5ku5EeACGQoY=
Received: from [192.168.99.249] (178-147-169-233.haap.dm.cosmote.net [178.147.169.233]) by mx.zohomail.com
	with SMTPS id 168587158327044.95124558097791; Sun, 4 Jun 2023 02:39:43 -0700 (PDT)
Message-ID: <cc21196b-a18a-ce3c-e3f3-4303abf4b9a3@arinc9.com>
Date: Sun, 4 Jun 2023 12:39:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 27/30] net: dsa: mt7530: introduce BPDU trapping
 for MT7530 switch
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-28-arinc.unal@arinc9.com>
 <20230526170223.gjdek6ob2w2kibzr@skbuf>
 <f22d1ddd-b3a4-25da-b681-e0790913f526@arinc9.com>
 <20230604092304.gkcdccgfda5hjitf@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230604092304.gkcdccgfda5hjitf@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_024022_652962_75B9F088 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4.06.2023 12:23, Vladimir Oltean wrote:
> On Sun, Jun 04, 2023 at 11:51:33AM +0300, Arınç ÜNAL wrote:
>>> If the switch doesn't currently trap BPDUs, isn't STP broken?
>>
>> No, the BPDU_PORT_FW bits are 0 after reset. The MT7620 programming guide
>> states that frames with 01:80:C2:00:00:00 MAC DA (which is how the BPDU
>> distinction is being made) will follow the system default which means the
>> BPDUs will be treated as normal multicast frames.
>>
>> Only if all 3 bits are set will the BPDUs be dropped.
> 
> Right, if you don't trap BPDUs just to the CPU but flood them, I believe
> the STP protocol won't behave properly with switching loops. Worth testing.

I've got no interest spending time playing around with STP at the moment 
so I'm going to pass.

Arınç

