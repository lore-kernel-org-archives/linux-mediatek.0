Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C220C3ABC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 May 2025 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuqyAAuoDMtQl7aHc6ogdkm/UKwvvmnE5+dcBd3QudM=; b=ra3998hgLFDowuYvGBqn6XaqmC
	p8264iPoD9mvKxMB/tAwtQWAy1RyRpUrS8vs2WhGkJbw12VKLsfTIENU8QVVBYI+un7Wi3yQ9roPn
	SV5tdTl47UWG0HvAYDGbDIlp/rXbVkVYfH/7w6ZMY65m4gzXdbBI/b145W0xvBaANfNY4yk9xjNAy
	cmxIJ/yWz3YMTyNUTVT9Jw3YilgX7rSWnVhRtXeUAesDmQuQsztS3Bl65HYiFh9qeJnxMzjxw1qZo
	uxRJM00W8kDSdbqobx1coNdcxImsihJ/XjguQxZG9ON4sHb6AY5KvPIWoXS77g8IX+8btnFaSRQaz
	Eo8lHecA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEryh-0000000CrCp-2BJj;
	Tue, 13 May 2025 15:55:35 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErwg-0000000Cqt1-2UVl
	for linux-mediatek@lists.infradead.org;
	Tue, 13 May 2025 15:53:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBEC8135653;
	Tue, 13 May 2025 17:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1747151608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xuqyAAuoDMtQl7aHc6ogdkm/UKwvvmnE5+dcBd3QudM=;
	b=IkMrIhBnJaCErPFw1yEBeZgaFvMO39PNrFDmmXYjXNLBaKjIzoJtB8wGIinVp1i4Yj3QH0
	/aKR23//abEyMb0eAe/tWrVJ9qjo4gGwHrsE1QahL6HoGVYmXqTGGFFAMoDMFGu12nmghF
	su6eAIAPrpv7DR9A/r/4SGsvKzJCnA2KIfQWH7vaQwV318LY9HfR80aCgZcvN9Sl/+bjLb
	cOiPpxnWB2n+tBdvSXOgVW8dyDg6EGzYk7blIC1oMCL0Ux/+NQELPeIXMzFSicj4lQlGtI
	Gq5waCU93MqwSSpb/jHufZOEqFgphhPRotzJOkuxqJfkvDsXP+Kq9+RsrtmM4Q==
Message-ID: <927c8a59-ac1b-49dc-b889-22c3a65bb49c@cjdns.fr>
Date: Tue, 13 May 2025 17:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250507134500.390547-1-cjd@cjdns.fr>
 <aCNWM5Xq7wnHVCrc@mai.linaro.org>
 <45166de2-8504-484d-90f6-6ef97c650b61@cjdns.fr>
 <aCNkmCJK1wOLGmgy@mai.linaro.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <aCNkmCJK1wOLGmgy@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_085330_829423_476CC8EF 
X-CRM114-Status: GOOD (  15.73  )
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


On 13/05/2025 17:26, Daniel Lezcano wrote:
> On Tue, May 13, 2025 at 04:31:05PM +0200, Caleb James DeLisle wrote:
>> On 13/05/2025 16:24, Daniel Lezcano wrote:
>>> On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
>>>> EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
>>>> processors. They are found in xDSL and xPON modems, and contain PCM
>>>> (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
>>>>
>>>> The EcoNet MIPS SoCs are divided broadly into two families, the
>>>> EN751221 family based on the 34Kc, and the EN751627 family based on
>>>> the 1004Kc. Individual SoCs within a family are very similar, only
>>>> with different peripherals.
>>>>
>>>> This patchset adds basic "boots to a console" support for the EN751221
>>>> family and adds SmartFiber XP8421-B, a low cost commercially available
>>>> board that is useful for testing and development.
>>>>
>>>> Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
>>>> peripherals, and for historical reasons Airoha chips are sometimes
>>>> referred to with the EN75xx prefix. However this is a different
>>>> platform because Airoha chips are ARM based.
>>>>
>>>> This patchset is against mips-next.
>>>>
>>>> v4 -> v5
>>>> * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
>>>>     * Improve explanation of HPT timer in changelog
>>>>     * Move pr_info to pr_debug per recommendation
>>>>     * Remove pointless debug on spurious interrupt
>>>>     * Small code-style change
>>> Shall I pick the clocksource + bindings changes through my tree ?
>>>
>> I'm new here so I don't know what that means for the merges which
>> will happen later, but I don't see any reason to do otherwise.
> The series introduces a new platform. The patches are touching
> different susystems managed by different maintainers.
>
> Usually, the changes are per subsystem, except when they are
> interdependant.
>
> Here you can choose to merge all the patches through the mips tree or
> let the different maintainers to pick the changes related to the
> subsystems they handle. You should clarify that in the cover
> letter. If you choose the first alternative, then before merging the
> changes, all maintainer should have blessed the patches with their
> acked-by.
>
Thank you for the explanation, this patchset has already started to be
taken piece-wise, and the only dependency that comes to mind
is the econet vendor prefix which Rob Herring took few weeks ago.

With that said, I see no reason not to continue taking it piece-wise.

Thanks,

Caleb


