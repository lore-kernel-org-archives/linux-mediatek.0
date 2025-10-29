Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3472CCF9EB
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Oct 2025 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7JJudnfDv5QPdu5hrZsVzBT2WDQqBEsqAz/usdjoJc=; b=sI1J/fVL1b8PBkX0zFEVszRhuG
	fcCmG+KXPx5vIE7cuhn2FEqTi2UeIID2vSgU2f/FhPvGMQXjc5nqClmAw8JAhokWSubzZigBRI40j
	LpRS3SuVfNcz1rzRjPxXOny3qvNfrWTUooresgkNOpWlb7VA8cFDyov7Nc8NVPJgbkuoEETcOiUl6
	HpYEOtMO2y+P5cWhMI22wB08+JsG3KnG7Xw3sQeTywlaPAm//MUzQiPR12F/qfaY60sxUbyisbrfW
	YKwsBX9kVgT8Va6S/7Vh5AzbvZK+qcLkQ/JFNEP8yljT/RqRYtasNJABvaDMu9ICHAvjX+VzWRqMj
	Y1MxK/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE81z-00000001mNe-1dTF;
	Wed, 29 Oct 2025 15:24:11 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE81w-00000001mMM-3LwD
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Oct 2025 15:24:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 720BE97CC4D;
	Wed, 29 Oct 2025 16:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1761751445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=S7JJudnfDv5QPdu5hrZsVzBT2WDQqBEsqAz/usdjoJc=;
	b=GMzqksbihEI9h21HrYWmiGqL8DwFW+vR30PryrlhdUibq9cgDf5RXlAVc6CRsbNd7zE2X7
	Q68OsUnzXYFdexUShEILw0xgdvIb8L5ItovjpLA2IuNBoSdvljt5puOrcp9NS6dpn1k1j7
	J5bmhNBx58AcIZnFGY8MmcD6s2wfr5V4mpoEuTdQy2dIdEIxO+geBHcBdg1Hz7wqiuB7yV
	9gZjtwZ+OaoYAXNi9l0HWhZQ/+iobzThfmOjFpYF1TC2AEUU6dlbrcjaOq/dsJpso0q2tC
	p3IhzixwYum0ISbxztTdN6bwTR13ijFdQzEflGDbIYKaS+Z2tpyQd7mhR0iKlw==
Message-ID: <4d5fe35f-6841-4b73-9c8c-a1f3bce886c8@cjdns.fr>
Date: Wed, 29 Oct 2025 16:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big
 Endian
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>
References: <20251027171759.1484844-1-cjd@cjdns.fr>
 <CAOiHx=nSEP=4s2xZuPtLEO43YDbkNEYzw6V11JbXG0H2iPn7Ag@mail.gmail.com>
 <096509d1-4af8-4abc-8068-ca27d8ef601e@cjdns.fr>
 <CAOiHx=nqWEdHEMf5immXO0VwyzDakDV9AMsoDETcJ0F4FqUt=w@mail.gmail.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <CAOiHx=nqWEdHEMf5immXO0VwyzDakDV9AMsoDETcJ0F4FqUt=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_082409_219040_80444870 
X-CRM114-Status: GOOD (  45.61  )
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


On 29/10/2025 10:15, Jonas Gorski wrote:
> On Tue, Oct 28, 2025 at 10:42 PM Caleb James DeLisle <cjd@cjdns.fr> wrote:
>>
>> On 28/10/2025 21:19, Jonas Gorski wrote:
>>> Hi,
>>>
>>> On Mon, Oct 27, 2025 at 6:19 PM Caleb James DeLisle <cjd@cjdns.fr> wrote:
>>>> When on a Big Endian machine, PCI swaps words to/from LE when
>>>> reading/writing them. This presents a problem when we're trying
>>>> to copy an opaque byte array such as firmware or encryption key.
>>>>
>>>> Byte-swapping during copy results in two swaps, but solves the
>>>> problem.
>>>>
>>>> Fixes:
>>>> mt76x2e 0000:02:00.0: ROM patch build: 20141115060606a
>>>> mt76x2e 0000:02:00.0: Firmware Version: 0.0.00
>>>> mt76x2e 0000:02:00.0: Build: 1
>>>> mt76x2e 0000:02:00.0: Build Time: 201607111443____
>>>> mt76x2e 0000:02:00.0: Firmware failed to start
>>>> mt76x2e 0000:02:00.0: probe with driver mt76x2e failed with error -145
>>>>
>>>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>>>> ---
>>>>    drivers/net/wireless/mediatek/mt76/mmio.c | 34 +++++++++++++++++++++++
>>>>    1 file changed, 34 insertions(+)
>>>>
>>>> diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/wireless/mediatek/mt76/mmio.c
>>>> index cd2e9737c3bf..776dbaacc8a3 100644
>>>> --- a/drivers/net/wireless/mediatek/mt76/mmio.c
>>>> +++ b/drivers/net/wireless/mediatek/mt76/mmio.c
>>>> @@ -30,15 +30,49 @@ static u32 mt76_mmio_rmw(struct mt76_dev *dev, u32 offset, u32 mask, u32 val)
>>>>           return val;
>>>>    }
>>>>
>>>> +static void mt76_mmio_write_copy_portable(void __iomem *dst,
>>>> +                                         const u8 *src, int len)
>>>> +{
>>>> +       __le32 val;
>>>> +       int i = 0;
>>>> +
>>>> +       for (i = 0; i < ALIGN(len, 4); i += 4) {
>>>> +               memcpy(&val, src + i, sizeof(val));
>>>> +               writel(cpu_to_le32(val), dst + i);
>>>> +       }
>>>> +}
>>>> +
>>>>    static void mt76_mmio_write_copy(struct mt76_dev *dev, u32 offset,
>>>>                                    const void *data, int len)
>>>>    {
>>>> +       if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
>>>> +               mt76_mmio_write_copy_portable(dev->mmio.regs + offset, data,
>>>> +                                             len);
>>>> +               return;
>>>> +       }
>>>>           __iowrite32_copy(dev->mmio.regs + offset, data, DIV_ROUND_UP(len, 4));
>>> Maybe just replace this with memcpy_toio() which does no swapping at
>>> all instead of double swapping on BE?
>>
>> I'm not that informed about how PCI works so I had to test to confirm
>> my understanding, but I can confirm that memcpy_toio() does not solve
>> the problem.
> Ah, right, I misread _iowrite32_copy() to do conversion to LE, but it doesn't.
>
> What architecture is this you have? PowerPC? ARM? MIPS? 32 bit? 64 bit?


MIPS32 (EcoNet EN751221 34Kc)


>
> So the differences I see are:
>
> 1. __iowrite32_copy() uses __raw_writel(), which has different memory
> semantics than writel()
> 2. __iowrite32_copy() assumed src is aligned to 32 bit, while you
> explicitly align it
> 3. memcpy_toio() will handle unaligned src properly, but does 64 bit
> accesses on 64 bit systems (and uses __raw* again).
>
> Is src aligned? If not, then the issue might be 2. And if your system
> is 64 bit, it would explain why 3 didn't help.


I'm not a regular developer of mt76 so I wasn't sure if that was
guaranteed and I just wanted to code for safety.

After reviewing the code, I see that there are a few places where
mt76_mmio_write_copy is being called with stack-allocated u8 arrays
so it's pretty clear to me that this is being treated as a memcpy-like
function and we should be handling unaligned inputs.


>
> As a first step you could try to replace the writel(cpu_to_le32(val)
> with a iowrite32be(val, ...) which should do the same except avoiding
> the doubled byte swapping. If that works, you can try to replace it

This works.

These symbols are a bit of a nightmare to trace, so I ended up making
an .i file so I could confirm what's happening.

iowrite32be() uses the version in iomap.c so I understand that's using 
writel(swab32(val),port), so a writel with an unconditional byte swap.

writel() is more complicated, it's an inline function that is generated 
in a rat's nest of preprocessor macros in mips/include/asm/io.h

The preprocessed is this:

__mem = (void *)((unsigned long)(mem)); __val = (val); if (sizeof(u32) 
!= sizeof(u64) || sizeof(u64) == sizeof(long)) { *__mem = __val;

The source is this:

     __mem = (void *)__swizzle_addr_##bwlq((unsigned long)(mem));    \
     __val = pfx##ioswab##bwlq(__mem, val);                \
     if (sizeof(type) != sizeof(u64) || sizeof(u64) == sizeof(long)) \
         *__mem = __val;                        \

The line "pfx##ioswab##bwlq(__mem, val);" is ioswabl() and the source
of that explains the issue:

  * Sane hardware offers swapping of PCI/ISA I/O space accesses in hardware;
  * less sane hardware forces software to fiddle with this...

So this confirms my initial understanding, the PCI hardware is doing the
byte swapping unconditionally.


> with __raw_writel(), which then would make this the same as
> __iowrite32_copy, except making sure that src is aligned.


This fails.

Since I'm the maintainer of this SoC and it's still fairly new, I wrote
a trivial kmod to verify that unaligned access is not just silently
returning trash, it works as though it were aligned so alignment is
not the issue.


>
> Also you could replace your memcpy() with get_unaligned((u32 *)(src +
> i)); Should do the same but inline.
Good idea, I will do this.
>> The issue as I understand it is that rather than making every driver
>> carefully call cpu_to_le*() every MMIO write, someone decided to make
>> the PCI host bridge itself transparently byte-swap all MMIO on the
>> wire. Since most MMIO is hitting registers and most buffers are
>> transferred by DMA, for the most part everything works and nobody
>> notices.
>>
>> But in the rare case that we need to write a blob to MMIO, it gets
>> transparently swapped in hardware so you need to use cpu_to_le in that
>> case. Doing a search of ./drivers for write.*cpu_to_le I can see this
>> issue comes up a bit.
> Every (PCI) driver does conversion to LE implicitly by using
> writel/readl (or iowrite32/ioread32) etc do the conversion to/from LE.
> So writel(foo, dst )is a __raw_writel(cpu_to_le32(foo), dst) etc. PCI
> memory is assumed to be in LE. If you are on a little endian system,
> then no byte swapping happens, and on BE it will do byte swapping
> before writing the value.

Okay so it seems that in the case of MIPS, that's not always how it
works.

https://github.com/torvalds/linux/blob/e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6/arch/mips/include/asm/mach-generic/mangle-port.h#L17

Since we don't know if the swap will happen in hardware or software
and (AFAIK) this is not a hot enough path that double-swapping will
have a notable performance penalty, I think the most sane thing to
do is use writel(cpu_to_le32()) and not care if it's swapped back
in the kernel or hardware.

I've just tested writel(get_unaligned_le32(src + i), dst + i);
and confirmed this is working.

Lastly, I'd like to just move everybody over rather than
special-casing Big Endian, but I don't have a Little Endian board
with an mt75x2e on it and no matter how trivial it is, I loathe to
submit a patch that hasn't been tested.

Is there somebody here who can get me a Tested-by for LE ?


Thanks,

Caleb


>
> Best regards,
> Jonas

