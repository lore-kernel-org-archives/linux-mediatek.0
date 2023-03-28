Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B24C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 21:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+y0Ba+KFp0LIEVnL+sMXDfVh8ybd+Bu3l5NO3YH+4Pw=; b=ha2+YD5ybSMB+Y
	DpbcLEFZI1EYQ8ruf2ZUm/3O8n2PHFL5kKaVIW922eWy9lpYWUScqFGVHBdKXMuC8pVRaNu6V3NYf
	YnjdG0XAPdIFcICzHl813kcmjVsEISzAEM1mCXTbT7Q7A3NtsDAu2Y19tsPzdIq27fGPEzvCGTZ0c
	B8IDtUi/f+VCR8ueFxgLvvgqtXN8kq0sfZyFv0yj5Tl+211ziz++PoFmJzWOn2Ch1ZWpkyOdeIOuF
	a0whLmxtXznvrIayKweJXc0mfC3lcmwfRVkhiiFGoThMxH2PrwyIEzBaYWuTMny2bLwIKY9g78O7P
	ypbItPjR1In6UuHiIn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phGr8-00Fv2m-0u;
	Tue, 28 Mar 2023 21:27:50 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phGr4-00Fv1o-16;
	Tue, 28 Mar 2023 21:27:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1680038840; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mm+Vi7gRsZCWnfYtjcfvIpt/YbzZ+Wn3MKA3cJtIlZwSUmp1tygyxI2OkYL913cFizn+4Y5MhitdhOXjyTAJ+DBKCvpjUee8ag2Q01ShtKDqZ5loTGSQ/9tsE4aDJqutfGiNogzR/uA4dqps2oi/A5LddDIIy+HlWTGzeIbUbEA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1680038840; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+y0Ba+KFp0LIEVnL+sMXDfVh8ybd+Bu3l5NO3YH+4Pw=; 
	b=ELEtOeuq9Um9ZX45dqpJ4g67JJDXbwQgMyrVgXiyS3KfI31P0E6HNukQ5kWtNtYmgK3npihvuK4yNePhaJ00e3cOCUxSvejurlb3h0HVCeEZfNyl1e9DETxelfRkXNiu2+4VUZkFkuGVZ9q/OosYc3kTDlOEMTNELYaYdeKogRk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1680038840;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+y0Ba+KFp0LIEVnL+sMXDfVh8ybd+Bu3l5NO3YH+4Pw=;
	b=MQsoRsrShXwj3VYTDgfV4SV8HGAegWDWQP6rrc85bQl1FQslEn3esImY6cYenis/
	bknzoo7DN9guOGFlLLNtGKWKTgGr/aeJGhTH+NOU1TN7g5BE1UhOY06kQmbpxmwK7hO
	ljIzdhQ0mPIIJ67pOM6Ka89RRT+p+crG3/nPM4Ds=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1680038838686721.2602700369897; Tue, 28 Mar 2023 14:27:18 -0700 (PDT)
Message-ID: <ab68cc01-e962-74c1-f22a-de5df42cc7d2@arinc9.com>
Date: Wed, 29 Mar 2023 00:27:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/7] net: dsa: mt7530: fix port 5 phylink, phy muxing, and
 port 6
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
 <20230328112154.qk5fwqaig4sit3ho@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230328112154.qk5fwqaig4sit3ho@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_142746_462799_BE781801 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 28/03/2023 14:21, Vladimir Oltean wrote:
> On Sun, Mar 26, 2023 at 05:08:11PM +0300, arinc9.unal@gmail.com wrote:
>> Hello!
>>
>> This patch series is mainly focused on fixing the support for port 5 and
>> setting up port 6.
>>
>> The only missing piece to properly support port 5 as a CPU port is the
>> fixes [0] [1] [2] from Richard.
>>
>> Russell, looking forward to your review regarding phylink.
>>
>> I have very thoroughly tested the patch series with every possible mode to
>> use. I'll let the name of the dtb files speak for themselves.
> 
> This patch needs to be resubmitted (potentially as RFC) to the net-next
> tree, and the commits readjusted to clarify what are fixes and what is
> pure refactoring. With the mentioned that I have not reviewed the entire
> series and I will not do that, either.

Makes sense, will do.

Arınç

