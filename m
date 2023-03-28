Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C4EC761A6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 21:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=216yHcA8x4BBiXEtPNb5Z1HZcpaVnTlZrWA256lPvm4=; b=b19tkxvct7/10W
	OhutjV7WgZwlCAtxZ3k4WZLIViQbyQEh3Zc7+E33qm0CdSILYl8cukgdUMmjmqs1nbSh7VTbwblln
	pkEM51R+zQdvF8fVa8/DYS9K1iKx4MEOf68pHExuvurf9W5U3u30W2l9FbR71bttYcFChfPnziG1o
	uxW5WvOoT9kiPqBGdvQqBkPQsVgYUqQBM9LFwW8ygCpa5rDj9K846klwr4zryZESQ7RA9I8PKn+Re
	TNdQQpESHxWKGlaJOsvgZSCbSKk4VdKFaYNk/eKGCFkxVKuNAi34sFkpcOc36+Gqq9OMYJK5vUKsH
	GL6T6C2NP3lATEEWTjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phGrJ-00Fv5W-2a;
	Tue, 28 Mar 2023 21:28:01 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phGrD-00Fv3W-0v;
	Tue, 28 Mar 2023 21:27:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1680038816; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PnouysK2RiQy9g3ziDMnJc7UcIHUsleCvfS3AhgH7czC68UV9P1d8JmVLI5hCez4lesYTbPBmCsQRUIGTjQ0TbFOYoOw4R/AQfbl7sSoVQHqfmo4OrQmyFUWRBURc/GGM2UZGj5r31ChMrZ/QfgmZOElu4JlQhATIxaVft0b/UU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1680038816; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=216yHcA8x4BBiXEtPNb5Z1HZcpaVnTlZrWA256lPvm4=; 
	b=ngzv0W+GFtP1wYTdGfBr4jZ3zBCa3R7dC0JGXKVl0soGCOdBvEK474gon6atqrLtIVLKETxdaHNcZd7SSb9eOHr7rd2RHiFdrJM+bWYE8i7wlarqR3K5UvNudVAJ8XNqlQnG4i1Wc1jsFkIxAmLZHxmcmg8eynwAe4nvROi15K4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1680038816;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=216yHcA8x4BBiXEtPNb5Z1HZcpaVnTlZrWA256lPvm4=;
	b=dgcau5B3k73KYNddc5m4pQJEmGwFZPO9d4Wn6sx+0bGPmqKIcQOibYm3a4bprryz
	MJe6H50Q/8/5StUxVTdYXXMdAr6GoGZ6pAc0P5AYuoq1jrVVxSRk/Lz+Cv+QTwUCpCP
	OpcY3fOOIsZBfiqMJsyHjWLVvfdrCO++zWywgarY=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 16800388141891.6636646410993308; Tue, 28 Mar 2023 14:26:54 -0700 (PDT)
Message-ID: <1aadcc20-4ee7-af56-36db-1d036c7747c5@arinc9.com>
Date: Wed, 29 Mar 2023 00:26:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH net 4/7] net: dsa: mt7530: set both CPU port interfaces to
 PHY_INTERFACE_MODE_NA
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
 <20230326140818.246575-5-arinc.unal@arinc9.com>
 <20230327191242.4qabzrn3vtx3l2a7@skbuf>
 <8450084e-1474-17fa-32c2-a4653b74ff17@arinc9.com>
 <20230328112002.2p7r6estix3dpijm@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230328112002.2p7r6estix3dpijm@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_142755_374442_87DE824A 
X-CRM114-Status: GOOD (  27.37  )
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

On 28/03/2023 14:20, Vladimir Oltean wrote:
> On Tue, Mar 28, 2023 at 12:57:57AM +0300, Arınç ÜNAL wrote:
>> I don't appreciate your consistent use of the word "abuse" on my patches.
> 
> Consistent would mean that, when given the same kind of input, I respond
> with the same kind of output. I'm thinking you'd want a reviewer to do that?

Of course.

> 
> Last time I said: "It's best not to abuse the net.git tree with non-bugfix patches."
> https://patchwork.kernel.org/project/netdevbpf/patch/20230307220328.11186-1-arinc.unal@arinc9.com/
> 
> If anything, Jakub was/is slightly inconsistent by accepting those previous
> non-bugfix patches to the net.git tree, and then agreeing with me. He probably
> did that thinking it wasn't a hill worth dying on, which I can agree with.
> But I'm afraid that this didn't help you realize that yes, maybe you really
> are abusing the process by submitting exclusively non-bugfix commits to the
> net tree. There's a fine balance between trying to be nice and trying not to
> transmit the wrong message.
> 
> It would be good if you could clarify your objection regarding my consistent
> use of the word "abuse" on your patches.
> 
> There is a document at Documentation/process/stable-kernel-rules.rst
> which I remember having shared with you before, where there are some
> indications as to what constitutes a legitimate candidate for "stable"
> and what does not.

I forgot this existed, sorry about that. I had this thought left in my 
mind that "any changes that are not new features must go to the net 
tree", which clearly is not the case. I see what you mean now. None of 
my patches on the series satisfy all of the rules specified on the document.

I just think your response could've been less harsh considering I didn't 
intentionally do this. Anyway, it's all resolved now so let's not drag 
this further.

> 
>> I'm by no means a senior C programmer. I'm doing my best to correct the
>> driver.
>>
>> Thank you for explaining the process of phylink with DSA, I will adjust my
>> patches accordingly.
>>
>> I suggest you don't take my patches seriously for a while, until I know
>> better.
> 
> Whether you're a junior or a senior C programmer is entirely irrelevant
> here. I have no choice but to take your patches seriously unless otherwise
> specified, in the commit message, cover letter, or by marking them as
> RFC/RFT (but even then, their intention must be very clearly specified,
> so that I know what to comment on, or test).
> 
> I don't think you really want what you're asking for, which is for
> people to not take your patches seriously. I recommend forming a smaller
> community of people which does preliminary patch review and discusses
> issues around the hardware you're working on, prior to upstream submission.
> That would, at least, be more productive.

Yes, of course. I'm actually planning something similar that involves 
OpenWrt, thanks.

Arınç

