Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0849DC54E60
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOdo/1mCWJYcxEKaBRYTzgE0ZAGk9OmOvt81SZQggfg=; b=y6ZEqn3PSiocihxipW/RXf3Uig
	zPvTJIaxTnJYKsTaA8XM0xRriTkAkmtsHI/HdBkoHWqPzxvUsXdF2NXmTaRjA5nNFKxaP1kPQ9HcC
	PU4InoU60gB1UY83VXARZzadFBq/RleXJTj0B9Q1W74qQobVTIs2c3DYCrIYTndtBNr8bHWp0HPxt
	SWM/E6rm7a3+FV1gZZjIn4+ZZQau1Zaut/qJrIftpM8Fu4V5A8NRr/m0DBHCwM9bW0PzDUbzflqQO
	fAGdZK/Yp9By+3OzzeJG3sYseWQm42RP7AxO14zAa8xzqdppkT+0MrBp//8EW/vGsLnCROpux0+GA
	A4g1t0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk0Co-00000005Vqu-3ZhA;
	Tue, 12 Mar 2024 11:22:02 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk0Ck-00000005Vq6-0sWl;
	Tue, 12 Mar 2024 11:22:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAF94C0002;
	Tue, 12 Mar 2024 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710242515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOdo/1mCWJYcxEKaBRYTzgE0ZAGk9OmOvt81SZQggfg=;
	b=e2rYS5fYWK1UsqRzdoJvxmWsFEW5R/stulHvr/IRvZMqd8xQ1kXaphv1yGlWUkqMm3sbqt
	mDkD+/xCZ19gLSuDFIe4REOLdWMIz6ysjUjOmU5WRdq/breAHOft0O4/yNbdSn4RLibxWz
	l/2UKwNDAgfDaA6Z5EBVyFBs4DgShMIDfuK/HmsYa55/INONdz7yFYMNKlJ2HNNToR1IjL
	hHHyIOQkbMtZjGELXf/D67xTTQjHdEKBllaTjK4ayndNwL+3zawidrcmV+PATJoWbsJJSI
	ZS5Y5uum0JmJi9ELMRMlDZD6g+0DIclL2Bvw4PqpNsT5vPu5WkhZZR92L/sTPg==
Message-ID: <941e7c70-a90f-4e6b-a2b7-867fc798d693@arinc9.com>
Date: Tue, 12 Mar 2024 14:21:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: dsa: mt7530: disable LEDs before reset
Content-Language: en-US
To: Paolo Abeni <pabeni@redhat.com>, patchwork-bot+netdevbpf@kernel.org,
 Justin Swartz <justin.swartz@risingedge.co.za>
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
 <171019143163.14853.15330891015381229970.git-patchwork-notify@kernel.org>
 <7780460c-abc3-4009-9f95-28d123a9a23d@arinc9.com>
 <4fb0b96fe4049578718befc41f2121ce18c30fbe.camel@redhat.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <4fb0b96fe4049578718befc41f2121ce18c30fbe.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_042158_797077_BDB3CC68 
X-CRM114-Status: GOOD (  21.68  )
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

On 12.03.2024 13:46, Paolo Abeni wrote:
> On Tue, 2024-03-12 at 11:38 +0300, Arınç ÜNAL wrote:
>> I am once again calling for this patch to be reverted on the net-next tree
>> on the basis of:
>>
>> - This patch did not go through a proper reviewing process. There are
>>     proposed changes on the code it changes regarding the scope and the
>>     method of the patch, and improvements to be made on the patch log.
>>
>> - This patch should be backported to stable releases, therefore it
>>     shouldn't be on the net-next tree and should be submitted to the net tree
>>     instead.
> 
> The net-next pull request is out:
> 
> https://lore.kernel.org/netdev/20240312042504.1835743-1-kuba@kernel.org/
> 
> at this point I believe we can't retract it unless there is a very
> serious regression affecting most/all users. This does not look such
> case.

It seems so. This patch was not tested on standalone MT7530 at submission.
Whilst the patch is useless for standalone MT7530, it doesn't seem to break
anything either, from my simple test on a board with it.

> 
> I think the better option is follow-up on net with follow-up fixes if
> any.
> 
> All the relevant patches could be sent to the stable tree later:
> 
> https://elixir.bootlin.com/linux/latest/source/Documentation/process/stable-kernel-rules.rst#L47
> 
> To try to reduce the possibilities of this kind of situation in the
> future, may I kindly ask you to invest some more little time to help
> the reviewers and the maintainers? e.g. trimming the replies explicitly
> cutting all the unneeded parts in the quoted code/text would make the
> whole conversation much easier to follow (at least to me). The netdev
> volume is insane, it's very easy to get lost in a given thread and miss
> relevant part of it.

I already try to do this. Here's my proposal that would not reduce but
completely avoid this kind of situation in the future, and at the same time
reduce the workload of the netdev maintainers. Do not apply patches without
ACKs. Ask for reviews at least once if the patch had been stale for a
while, and wait a bit for reviews. Only then apply the patch with/without
ACKs.

Arınç

