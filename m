Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0C71088E43
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 22:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlCNKNDd57xlnLgcJUum35WbvlkNpratfPUD2tOhhGA=; b=GeUbxFlCRJinsd4MOT7uetvzHb
	DNcpWkMSdMptD48IUn/uviya5SHxwnpSyqHP53PDAPWXtUKc7AVNw4GMCOMtjpA4cIDuwckE6jzQ2
	CmeX9wmCr1Y9v+F+PaIkqKKCItJXeDPKD7426Svb9S4bIfjuTvHmj1gL+3mlV70+oR5l8MpMpc5rR
	GcniAg+1H2sD6Fj2EvAP5Cw0tSdLCtbS8oaJi3ZymBUVc12Quu9PaOHjcPdQeyv74anbabf4ZNi3N
	cYpG6heCd2xIrNoz22i7oXRpmvEVfogzelwnvkH/OadQDCah9hZP6ipGVQ2hWNQVve5sE9+FJzPxh
	2kOPGHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zDm-00000009QhO-3A5i;
	Wed, 18 Mar 2026 22:18:34 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zDj-00000009Qgq-3Cdg
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 22:18:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43A79339B4A;
	Wed, 18 Mar 2026 23:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773872308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JlCNKNDd57xlnLgcJUum35WbvlkNpratfPUD2tOhhGA=;
	b=s825/BBdx0+wDRw7pbk+a+cOTbaSr3+WuOfzHLBQATxbf7Y1o11g8OkJ+dFPZR0w1s1fCu
	UAffRz25YzQmxFNgnfPqU0wXMTFkKnp4njOqHnASpIxlocBISbtHvZdYsJNqOajddB6VFT
	HrQqPbhKPX/pwJNy0mYlPgNSysOLbtiR93F7NLpxCuBSH8xM7QeYwJkB7KtzMiFivOJT9u
	ntoclRIe+sEhXbAe1Mo5mnzmJP7khvWA8IS12IpiFnsq09xwyluvbGhVdWDmYQ5v7Ft3L+
	yHZnbw0DGWcD3cskxL5XC/NwCVw+gr+HEOGS4OzRyqakMviG2ErYY2JBPnlxxA==
Message-ID: <e154155d-b525-4abc-a8f3-41ac0ead1875@cjdns.fr>
Date: Wed, 18 Mar 2026 23:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 3/3] PCI: Skip bridge window reads when window is not
 supported
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318215832.GA476412@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260318215832.GA476412@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_151832_199143_3ED30782 
X-CRM114-Status: GOOD (  23.16  )
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


On 18/03/2026 22:58, Bjorn Helgaas wrote:
> On Mon, Mar 16, 2026 at 03:51:57PM +0000, Caleb James DeLisle wrote:
>> pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
>> registers unconditionally. If the registers are hardwired to zero
>> (not implemented), both base and limit will be 0. Since (0 <= 0) is
>> true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
>> gets created.
>>
>> pci_read_bridge_windows() already detects unsupported windows by
>> testing register writability and sets io_window/pref_window flags
>> accordingly. Check these flags at the start of pci_read_bridge_io()
>> and pci_read_bridge_mmio_pref() to skip reading registers when the
>> window is not supported.
>>
>> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
>> Link: https://lore.kernel.org/all/20260113210259.GA715789@bhelgaas/
>> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> I applied this to pci/resource for v7.1 with the following commit log:
>
>    PCI: Prevent assignment to unsupported bridge windows
>
>    Previously, pci_read_bridge_io() and pci_read_bridge_mmio_pref()
>    unconditionally set resource type flags (IORESOURCE_IO or IORESOURCE_MEM |
>    IORESOURCE_PREFETCH) when reading bridge window registers. For windows that
>    are not implemented in hardware, this may cause the allocator to assign
>    space for a window that doesn't exist.
>
>    For example, the EcoNET EN7528 SoC Root Port doesn't support the
>    prefetchable window, but since a downstream device had a prefetchable BAR,
>    the allocator mistakenly assigned a prefetchable window:
>
>      pci 0001:00:01.0: [14c3:0811] type 01 class 0x060400 PCIe Root Port
>      pci 0001:00:01.0: PCI bridge to [bus 01-ff]
>      pci 0001:00:01.0: bridge window [mem 0x28000000-0x280fffff]: assigned
>      pci 0001:00:01.0: bridge window [mem 0x28100000-0x282fffff pref]: assigned
>      pci 0001:01:00.0: BAR 0 [mem 0x28100000-0x281fffff 64bit pref]: assigned
>
>    pci_read_bridge_windows() already detects unsupported windows by testing
>    register writability and sets dev->io_window/pref_window accordingly.
>
>    Check dev->io_window/pref_window so we don't set the resource flags for
>    unsupported windows, which prevents the allocator from assigning space to
>    them.
>
>    After this commit, the prefetchable BAR is correctly allocated from the
>    non-prefetchable window:
>
>      pci 0001:00:01.0: bridge window [mem 0x28000000-0x281fffff]: assigned
>      pci 0001:01:00.0: BAR 0 [mem 0x28000000-0x280fffff 64bit pref]: assigned
>
> I also set the author to "Ahmed Naseef <naseefkm@gmail.com>" per
> https://lore.kernel.org/all/abRQYM1If/6Vv/tI@DESKTOP-TIT0J8O.localdomain
>
> You can make this work correctly next time by including a
> "From: Ahmed Naseef <naseefkm@gmail.com>" line as the very first line
> in the message body; see
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=v6.19#n723

Thank you very much. I wasn't quite sure how to submit this so thanks 
and I will keep that in mind.

Thanks,

Caleb

>> ---
>>   drivers/pci/probe.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index bccc7a4bdd79..4eacb741b4ec 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>> @@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
>>   	unsigned long io_mask, io_granularity, base, limit;
>>   	struct pci_bus_region region;
>>   
>> +	if (!dev->io_window)
>> +		return;
>> +
>>   	io_mask = PCI_IO_RANGE_MASK;
>>   	io_granularity = 0x1000;
>>   	if (dev->io_window_1k) {
>> @@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
>>   	pci_bus_addr_t base, limit;
>>   	struct pci_bus_region region;
>>   
>> +	if (!dev->pref_window)
>> +		return;
>> +
>>   	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
>>   	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
>>   	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
>> -- 
>> 2.39.5
>>

