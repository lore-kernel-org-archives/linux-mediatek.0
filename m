Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A47AC77B70
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dY6OdK8Qxe58n3zh/amuYn/epx3ZaA+g2MhS9h/rQa4=; b=LdkivGuE30GVsa
	xW46OP8GdZ0NHBlNJrM6SVILKwHhMuo2wHDKGXs25fwwwaBui1QzLuUgU02ZhIRFxxaqKFvZFkbUl
	aIrzviSS3Aemtj4rWRuOw6tZIZ8rD6fq08GdmjJtREL8VGIByqJH7IxRYIWIU4StElX5Ca32oiyBY
	xOEVKsKrjDUQ8+752KcSF9P+SGi3jCoYsTRYOClwKN8txSK5qpMJDlFLBOlgwoJTZuixB8dsACIpY
	MotcbFYXVLs3TQ5oTLODmABbh37IhXV/yo9NHGxOkbXohTzzwlvzpZobQlf26JHkd3QQgxu6lh2wt
	HkY1yfqMKwKG2L4Hw0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plsuG-00FP1Y-0Q;
	Mon, 10 Apr 2023 14:54:08 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plsuB-00FP0x-1u;
	Mon, 10 Apr 2023 14:54:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1681138399; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J6MCuVdGQQF5zdoIjrIsl7e2AYlUHKFWDp2E4Sb1caHAB1zyBJ6tNdP3dGdy4WhiTUUaL9zsx/KCBSjL+JPnOzp1YVzzlms+rog3UCXd2TmZhC2GCg7iJcx44addsfr0A+g/cvuCytsmP5eh+vxkYxx82G3VZidkqbB8360bMrY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1681138399; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dY6OdK8Qxe58n3zh/amuYn/epx3ZaA+g2MhS9h/rQa4=; 
	b=BaZGo00Jl/FMcG5hX1YAwpHmaKqP9yGO7rIe4zX9eA3j9GpdVtBbfMguPccU8hrAyqoFHPEGEp+TWJGgcsJ75hnZg/k9fMjLWpU+4mS9vBqLQBq+hWyzRDeqWlVmCzCFPIcR8CJ1RyaU1tmyBhppJhcDmAUsyudnYA60k8M/adw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1681138399;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dY6OdK8Qxe58n3zh/amuYn/epx3ZaA+g2MhS9h/rQa4=;
	b=TDBx20RAzQVPDVTsC+bpcD+SzC3jUdWHnb9GPLkBhDqsmcUjNYq82asLIJpK5Nor
	GPKL/KUBHanYRA1Ydq5Qp6tIrJxdEB8l3gmXk7Ss4lSHZqmpxKAQxpB/S57SUNOPQ6K
	Yrjvhg8LbU9kyx1egHzBQ8PRTBZ+ZfZw6HEitz48=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1681138397321372.7074583053213; Mon, 10 Apr 2023 07:53:17 -0700 (PDT)
Message-ID: <2dfa9c4c-fb7a-142b-b2e7-6a1564ab4f80@arinc9.com>
Date: Mon, 10 Apr 2023 17:53:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 net-next 01/14] net: dsa: mt7530: fix comments
 regarding port 5 and 6 for both switches
To: Daniel Golle <daniel@makrotopia.org>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
 <20230407134626.47928-2-arinc.unal@arinc9.com>
 <ZDQdmih4aHdrUvqr@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZDQdmih4aHdrUvqr@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_075403_821661_61239BF5 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Richard van Schagen <vschagen@cs.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10.04.2023 17:30, Daniel Golle wrote:
> On Fri, Apr 07, 2023 at 04:46:13PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> There's no logic to numerically order the CPU ports. State the port number
>> and its being a CPU port instead.
> 
> Port 5 is often used as a user port as well, eg. on the BPi-R3 where
> it serves to provide SerDes for the 2nd SFP cage.
> On other boards (e.g. Netgear WAX-206) it is used to connect a 2.5G
> PHY used as WAN port.
> 
> Hence just stating that port 5 "a CPU port" could be a bit misleading
> as it is not always used as a CPU port.

Makes sense. I was not using the DSA term, so the "a CPU port" here 
rather meant that the port connects to the CPU. I'll change it to "which 
can be used as a CPU port" on both ports, that should explain that it 
can be used as other than a CPU port, and it does not necessarily 
connect to a CPU MAC.

Thanks.
Arınç

