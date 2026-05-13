Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB25CD37AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 22:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDpeY0azgQhPIjMW6FFMgw4pOGnlBJkPZ7F8T8UR+wU=; b=WUvTssI/wEQi00vWjL1B0EL9yn
	0HpUz6UiQyFcWUaHWcZjYgnGsOfuXPMKwflJnkValVdD1DYhMb9aFK0M721T5Myqk25SmJ2B2Ad8d
	/o4mKb5UBeU5JhyIX7Q4oLHr4OEyTJ4cNtRDVyNSr+nm+NT4Fo7OIHcaNeQfrh4r+eopz3Uwt0qEh
	ZrQjfjCJ5SnFVwfJLueU26EziOrFY6DSU8qwdfdYQCCAtccGOtyGLh0jQL6SVv6zw/LBBpB4qFV24
	3k5X3bfYLbprhDCpu87KhskqGePHS2n54DvKoXdLz75ky7DNKFlSPIuqKP+KqBeW4st8eXzY8rwH7
	FuI6T4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHtg-00000003tzq-1rHf;
	Wed, 13 May 2026 22:17:44 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHtd-00000003tz9-3rvu
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 22:17:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 459783C8F22;
	Thu, 14 May 2026 00:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778710657; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rDpeY0azgQhPIjMW6FFMgw4pOGnlBJkPZ7F8T8UR+wU=;
	b=fe/S48NXC9NYKwChLEwX2ExRJRHkb/3N6Q7wdjxH/mS4vhdNVQUVRVTFFFR12Ii0UZSmQI
	6zUZPj6aY4WwNVZczx0x0UvRJtvShWe5U6Gj3JVBKlVNdDsO1bkuf+uUAKNVGZkzr7NSSC
	YOG+tGwsWAl0WRqx/idbRUUuWaAB9PZHLG0ItZJmfBM/He6KAQQySJ0NqAEc2g2JnAp8a1
	jPeDtXchccYB1U5nSQPmmST0MvNy91a0iXH1IRr2mgvxJOgCi/xY7fdlTe8lHaOgutq7r9
	W4tq0E9umhZmxyB5WTjiDe48fO14sRdHwWpHUzzsH23GkZTOkTiJ6y2i+SDqog==
Message-ID: <64d29cc5-8021-402c-b6c4-47bcf4c4f814@cjdns.fr>
Date: Thu, 14 May 2026 00:17:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v6 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260513220610.GA341225@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260513220610.GA341225@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_151742_208880_512ECDBF 
X-CRM114-Status: GOOD (  15.59  )
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


On 14/05/2026 00:06, Bjorn Helgaas wrote:
> On Wed, May 13, 2026 at 11:39:25PM +0200, Caleb James DeLisle wrote:
>> On 13/05/2026 23:07, Bjorn Helgaas wrote:
>>> On Wed, May 13, 2026 at 07:16:52PM +0000, Caleb James DeLisle wrote:
>>>> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
>>>>
>>>> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
>>>> require re-training after startup.
>>>> +found_port:
>>>> +	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK)) {
>>>> +		/* Let it go because the device will work as Gen1 */
>>>> +		dev_warn(dev, "module must be built-in to retrain to Gen2\n");
>>> I suppose this will cause a warning even in cases where Gen2 is
>>> impossible, e.g., the endpoint only supports Gen1?
>> Correct indeed.
>>
>> I imagine in most cases, if the port is Gen1 only then board integrator uses
>> a Gen1 card as well, so I could try being fancy and probe the card to see if
>> it supports Gen2. In OpenWrt the PCI driver is always built-in so I didn't
>> really consider this something to worry about.
> Probing the downstream device sounds like overkill because it hasn't
> been enumerated yet and there's no good place to check after it is
> enumerated.  I would consider just logging one message as "info"
> instead of "warn", maybe in mtk_pcie_startup_port_en7528()?


Works for me, worth noting if anybody adds a startup for another device 
which has this quirk, they'll also need to copy the log line - but it's 
highly likely that no other such device exists, and duplicating 3 lines 
of code is not the end of the world.


Thanks,

Caleb


