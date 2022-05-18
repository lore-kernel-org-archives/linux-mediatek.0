Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF30C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O80nbrLaDw0byXGzIwOZqU/i/q6uyIAYWDlAnlJFEEQ=; b=HkfQKKaVQ0RPue
	qqeQQ4XfldT/9HqEFvyG8lm72XhcGdATaowIKRt3mjW8oUhvebvMSLDNmRPA+xe+ktDtRW0xfrbas
	pTvWOqN+XV39gDZOX+5P/CQnhfDWU4IyonqSQvLQCR/zXRyxRv/uK7/Q26Se9SxzFKIOmRqNz2Dak
	vFVCx0LyrkvW5vIp0BR/guwrndtVw8weQImdoIUFkILtI8tchw1logW3tD3mes2/WwyvfwCu87JlV
	tTAH2NCOa6iuJEFLMYIhWytPcySezLTLRRZDf3B8Qp9lXAigCPsZDJEsy9PF3Achwh4sWKncKbqdi
	9j08PBw8bnF4cRLYipqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrLwQ-002uxp-AB; Wed, 18 May 2022 15:50:26 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrLwO-002uwO-3S
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 15:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AxGKppWlRg07ibPtm9JtC/mczsyRpsvSQ8tFDglsXkw=; b=gLgVc4J/yJJ6I9i9le3X3m8ocP
 g8B0aRhnJJKgV/FnkAQ8YDl1dsHgwts2s2Rk0L99d//q1BnosO5EFzL1iZdoOI0wx4ABtIcrlNw3j
 T+1t5YsxXZTouDGmLUoHYqZ4z9bY0oCtJsR6BeNWJ6uxSAgyoXtGkMLq4OLWck4KlbyI=;
Received: from p200300daa70ef200246e420c06f77770.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:246e:420c:6f7:7770] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nrLwD-0007J1-I9; Wed, 18 May 2022 17:50:13 +0200
Message-ID: <4b3283c7-772f-9969-b3c6-d28b4c032326@nbd.name>
Date: Wed, 18 May 2022 17:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 net-next 12/15] net: ethernet: mtk_eth_soc: introduce
 MTK_NETSYS_V2 support
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
References: <cover.1652716741.git.lorenzo@kernel.org>
 <cc1bd411e3028e2d6b0365ed5d29f3cea66223f8.1652716741.git.lorenzo@kernel.org>
 <20220517184433.3cb2fd5a@kernel.org> <YoTCCAKpE5ijiom0@lore-desk>
 <20220518084740.7947b51b@kernel.org>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20220518084740.7947b51b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_085024_460968_6BA24448 
X-CRM114-Status: GOOD (  12.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 18.05.22 17:47, Jakub Kicinski wrote:
> On Wed, 18 May 2022 11:53:12 +0200 Lorenzo Bianconi wrote:
>> > > +	WRITE_ONCE(desc->txd7, 0);
>> > > +	WRITE_ONCE(desc->txd8, 0);  
>> > 
>> > Why all the WRITE_ONCE()? Don't you just need a barrier between writing
>> > the descriptor and kicking the HW?   
>> 
>> I used this approach just to be aligned with current codebase:
>> https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/mediatek/mtk_eth_soc.c#L1006
>> https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/mediatek/mtk_eth_soc.c#L1031
>> 
>> but I guess we can even convert the code to use barrier instead. Agree?
> 
> Oh, I didn't realize. No preference on converting the old code
> but it looks like a cargo cult to me so in the new code let's
> not WRITE_ONCE() all descriptor writes unless there's a reason.
If I remember correctly, the existing places use WRITE_ONCE to prevent 
write tearing to uncached memory.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
