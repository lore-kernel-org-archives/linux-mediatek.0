Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB447C636D3
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kOUU24RP+m6mL6JWbSnsV+ayZgFgt6Mmw6zP6zd3JE=; b=w7tL3+ma3VH3ma
	XulX+1IZAApAEluKTucIK0YuOFPpzrWX2RgI8NA9LpQiaZ8Qod2Izdsy/04/zMrTbzGdvcB7Wbv4q
	EiFJ8yf8WESGmelUfJmWYdXEQ6q8KDnBfSZVKEQJRb5mnlvRlHkysHNJfSb87oVNt3CYRxIUiw+Hs
	t9NH0dlckW/dxIc/j61ADadcbI3V3naVeT1fnm+cqp2h4+1nDmrQtPz8u6MwMRti+KesarWXKhHMT
	ixBczVYz19UBGTdWZ0Q1q0SlBUAFVTe5aPUqPcekyw6H/YX0znL5Fzl3qcro4x8AfRA+N/lGLfqpY
	SjTiJdmxLQ3wOfXo2nXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP8E5-009rzl-PI; Mon, 06 Feb 2023 20:36:33 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP8Dv-009rxr-60; Mon, 06 Feb 2023 20:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675715759; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FAnsFNqlGZU7TNN7zUIOAANQSxRgoy/H2OjNGK+mwkyLYT88VertW8/bXvwAcmbUyb5l7pcCL43yzKLs89gsoudHkQcKQUoxQlLtSbbnLXuwq4iDXOxMUU5+SdpS9pxWd0qezKtAyUUXA9RU24hQjcJcIbU5wAflcnLIHHKWbB4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675715759; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/kOUU24RP+m6mL6JWbSnsV+ayZgFgt6Mmw6zP6zd3JE=; 
	b=JOaTJcqQ7OUYs8/jspsffSR2OErth1gmp+0PDsXc3HhtAaUdqZyimks3IyDi1LHzoJ6hiwq2VSqFmr1NvsOJbuLmmM0cJmMw807FzCreV2lwGg+3baZc8RNBnAebD+kouHLrs6mrtniuEUQVh9YkBxsMNDkrAqJ6aju6XgizoaM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675715759;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/kOUU24RP+m6mL6JWbSnsV+ayZgFgt6Mmw6zP6zd3JE=;
	b=JKFnMrrruUvsUuXNpYd+YcArW5UcpC36HXksIGqANL4dTmTkzqo2Q0KdorJYgt2q
	Vl1k3eBcaSm3Y2A8MP0qdVrYw3lIdq2P23T/PPWdvhmZU3ehaOknvFYH0t3hoE3nwWe
	zoNkDr96bDNlpBFrilUhc4bEEaR1xBRc6TYHkSJk=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 16757157573215.933846910490274; Mon, 6 Feb 2023 12:35:57 -0800 (PST)
Message-ID: <4ee5df8d-618b-db78-9c14-17a45e383b67@arinc9.com>
Date: Mon, 6 Feb 2023 23:35:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH net] net: dsa: mt7530: don't change PVC_EG_TAG when CPU
 port becomes VLAN-aware
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
 <3649b6f9-a028-8eaf-ac89-c4d0fce412da@arinc9.com>
 <20230205203906.i3jci4pxd6mw74in@skbuf>
 <b055e42f-ff0f-d05a-d462-961694b035c1@arinc9.com>
 <20230205235053.g5cttegcdsvh7uk3@skbuf>
 <116ff532-4ebc-4422-6599-1d5872ff9eb8@arinc9.com>
 <20230206174627.mv4ljr4gtkpr7w55@skbuf>
 <5e474cb7-446c-d44a-47f6-f679ae121335@arinc9.com>
 <f297c2c4-6e7c-57ac-2394-f6025d309b9d@arinc9.com>
 <f297c2c4-6e7c-57ac-2394-f6025d309b9d@arinc9.com>
 <20230206203335.6uxfiylftyktut5u@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230206203335.6uxfiylftyktut5u@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_123623_302235_64CB07A0 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, richard@routerhints.com, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06/02/2023 23:33, Vladimir Oltean wrote:
> On Mon, Feb 06, 2023 at 10:41:47PM +0300, Arınç ÜNAL wrote:
>> One last thing. Specific to MT7530 switch in MT7621 SoC, if port@5 is the
>> only CPU port defined on the devicetree, frames sent from DSA master appears
>> malformed on the user port. Packet capture on computer connected to the user
>> port is attached.
>>
>> The ARP frames on the pcapng file are received on the DSA master, I captured
>> them with tcpdump, and put it in the attachments. Then I start pinging from
>> the DSA master and the malformed frames appear on the pcapng file.
>>
>> It'd be great if you could take a look this final issue.
> 
> What phy-mode does port@5 use when it doesn't work? What about the DSA master?

It's rgmii on port@5 and gmac1.

Arınç

