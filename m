Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87731C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 17:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sanDwlKMu1XJbvPWqtzhQXrv5xMEUsJJgfXxkqVcqSs=; b=Kq9wiYyRJsYidC
	l7c1FICfLGavR0H/a1jO6RLcbMfS5keQl0Y7FgFX2+bjzAX8mXWyzyRBCXHSiuQ9mBj9d/OO4cOST
	kwm9gFy2Fh+QqddiJpw2MZwaiNXXE6Tm+z5CHThvz3Cx6Zs9BUOakg0pgN5AB4FoAIg6BCEIm8OOu
	M5ZXr6QxElFDASLSa3VXvJYoCZmKsJD2MtivN76tjpjijTkyxzV8sgOW3r1ogAj3bT0LfNXn7n7P7
	ITkS9M1GsfgGkOJzUGOwyC+WSeHXMxo0qDn11JGzHSb9dmNlg7LakdesmVxNn2mep5FyZHodXwvpR
	sjj7Dv5ugE+YAnLiv0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHNJ-00D6JB-L1; Wed, 01 Feb 2023 17:58:25 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHN9-00D6Gj-MQ; Wed, 01 Feb 2023 17:58:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675274285; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lo9Ml/vQ1/Wtky7jkidoReeOE45KTxClPo73lvQK5Raa38x9za6Hnuur4fVXwlevNoxbGxZaxv+P/UBTLzgMnm9zCehw65xiYN8ok9H3xWfP4qJFf/97GhUBFq7k1dpa6k9dMLcGfJ2xTtLzyPKo8O1C5s4jI77h1AK/2lpIsxo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675274285; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=sanDwlKMu1XJbvPWqtzhQXrv5xMEUsJJgfXxkqVcqSs=; 
	b=bT82x/CIcO360OZamHyzcf4moNj2281Bgg8vjBYchmM1vAafvM2+DDXjx4sSi2hmaHEX4lquAGOIj5SNiVNAKJHKiADr0FLCwRaLI7diQwCqpTUejGWNm0wMh1XLZ+BxZMnyKJDcJCOvWdNumVyLx82/nJAO+/xGAy2taCII+X8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675274285;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sanDwlKMu1XJbvPWqtzhQXrv5xMEUsJJgfXxkqVcqSs=;
	b=WkazmVmtMlgzQ71boLbgGpKLQSsv8JGB50U9Nyq7hbIgESX0tGeF7ObJmjUDLtUW
	KupOLmo5hR3fjutejuQ+ehhW3zKQFvIVRytr2geV0URikSZXQ2OzbLSK08br6rbAjPZ
	SDHBcotATnx23WsZmPfJL0QbojheL+BJ1qi4FYFA=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 167527428298987.0552013678548; Wed, 1 Feb 2023 09:58:02 -0800 (PST)
Message-ID: <5968fa14-e894-7592-c2a4-d3aeaa14174d@arinc9.com>
Date: Wed, 1 Feb 2023 20:57:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: disable hardware DSA
 untagging for second MAC
Content-Language: en-US
To: Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230128094232.2451947-1-arinc.unal@arinc9.com>
 <f753ad2b0c19e085867698f7bbbe37f6d172772e.camel@redhat.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <f753ad2b0c19e085867698f7bbbe37f6d172772e.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_095815_810566_0F5618D5 
X-CRM114-Status: GOOD (  14.49  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31.01.2023 16:00, Paolo Abeni wrote:
> On Sat, 2023-01-28 at 12:42 +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> According to my tests on MT7621AT and MT7623NI SoCs, hardware DSA untagging
>> won't work on the second MAC. Therefore, disable this feature when the
>> second MAC of the MT7621 and MT7623 SoCs is being used.
>>
>> Fixes: 2d7605a72906 ("net: ethernet: mtk_eth_soc: enable hardware DSA untagging")
>> Link: https://lore.kernel.org/netdev/6249fc14-b38a-c770-36b4-5af6d41c21d3@arinc9.com/
>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>
>> Final send which should end up on the list. I tested this with Felix's
>> upcoming patch series. This fix is still needed on top of it.
>>
>> https://lore.kernel.org/netdev/20221230073145.53386-1-nbd@nbd.name/
>>
>> The MTK_GMAC1_TRGMII capability is only on the MT7621 and MT7623 SoCs which
>> I see this problem on. I'm new to coding so I took an educated guess from
>> the use of MTK_NETSYS_V2 to disable this feature altogether for MT7986 SoC.
> 
> Keeping this one a little more on pw. It would be great is someone else
> could validate the above on the relevant H/W.

CC'ing Frank. Frank, could you test this on your Bananapi BPI-R2?

Arınç

