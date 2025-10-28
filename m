Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00468CCD1BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Oct 2025 21:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZ5NbpYQJrK4cD/+AbyhMOYq6Bv8S/UjgbyYkKNU+Oo=; b=RTS2kkQL9Y4QSt+WeFkRMprhPv
	K1tOZArKk+Pgr+P4xcqPez411eYkBBMfkzyA6V3CeJcjIO6/dnHtGDILUVgUc828SiJdzBttjYZ4o
	zS3s5y6HEVo5QCyLHdFOyYOGcqRncjiblluud6kEkVISYqnyCaN7lOPa9lxjAUSQZcCBNgwYYLh6Y
	LH877P6bxtAIIn7991DnXZDalkrCCYqV/0kvpV8fc57+sru5mU7vTxB0Y7mzDHCPXvzPflKuk0C7m
	TieUxDeeV6ePUnxhffI/wcp2MySvyobffxpAhVISO231t48JAh2jmEV4v0egV39U/OtwozuAiJoWx
	cCS14xKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrSB-0000000GiBy-2WK0;
	Tue, 28 Oct 2025 21:42:07 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrS8-0000000GiB6-3mnq
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Oct 2025 21:42:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35D6896376D;
	Tue, 28 Oct 2025 22:41:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1761687718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gZ5NbpYQJrK4cD/+AbyhMOYq6Bv8S/UjgbyYkKNU+Oo=;
	b=inp9/OsLLdIqL8yyl4LVrqRp7grNsLNrIOtcJILxcGEu/QUVCKR9ud7G174KyZVXqm1xzA
	EXUJfGhDh9E1YpGwn3jyzJg6/GQHDb/pnME1+IGe/tA3zpyXJwKBRK56OK6b3I0dD/iy2M
	Cr4xYL0mDojMOuPbAvRj1Yvvmz0EivIT/jvRpsLOU366duDdg9ouea40+CvU8BNsdhrU8L
	vWctRfTHt6c65LkpEQqilThB6hE1j1jnwOyKR/+jZXW8J0gndcAXUGa1yAilqmkfxoNLtL
	vLvOUj/0Hted5+u0GOrjO4mCTPpUAwox8n44YbVFZdbhgy7k0VPceUcgLdq7Qg==
Message-ID: <096509d1-4af8-4abc-8068-ca27d8ef601e@cjdns.fr>
Date: Tue, 28 Oct 2025 22:41:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big
 Endian
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20251027171759.1484844-1-cjd@cjdns.fr>
 <CAOiHx=nSEP=4s2xZuPtLEO43YDbkNEYzw6V11JbXG0H2iPn7Ag@mail.gmail.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <CAOiHx=nSEP=4s2xZuPtLEO43YDbkNEYzw6V11JbXG0H2iPn7Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_144205_376403_4ACF576A 
X-CRM114-Status: GOOD (  19.12  )
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


On 28/10/2025 21:19, Jonas Gorski wrote:
> Hi,
>
> On Mon, Oct 27, 2025 at 6:19 PM Caleb James DeLisle <cjd@cjdns.fr> wrote:
>> When on a Big Endian machine, PCI swaps words to/from LE when
>> reading/writing them. This presents a problem when we're trying
>> to copy an opaque byte array such as firmware or encryption key.
>>
>> Byte-swapping during copy results in two swaps, but solves the
>> problem.
>>
>> Fixes:
>> mt76x2e 0000:02:00.0: ROM patch build: 20141115060606a
>> mt76x2e 0000:02:00.0: Firmware Version: 0.0.00
>> mt76x2e 0000:02:00.0: Build: 1
>> mt76x2e 0000:02:00.0: Build Time: 201607111443____
>> mt76x2e 0000:02:00.0: Firmware failed to start
>> mt76x2e 0000:02:00.0: probe with driver mt76x2e failed with error -145
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   drivers/net/wireless/mediatek/mt76/mmio.c | 34 +++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/wireless/mediatek/mt76/mmio.c
>> index cd2e9737c3bf..776dbaacc8a3 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mmio.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mmio.c
>> @@ -30,15 +30,49 @@ static u32 mt76_mmio_rmw(struct mt76_dev *dev, u32 offset, u32 mask, u32 val)
>>          return val;
>>   }
>>
>> +static void mt76_mmio_write_copy_portable(void __iomem *dst,
>> +                                         const u8 *src, int len)
>> +{
>> +       __le32 val;
>> +       int i = 0;
>> +
>> +       for (i = 0; i < ALIGN(len, 4); i += 4) {
>> +               memcpy(&val, src + i, sizeof(val));
>> +               writel(cpu_to_le32(val), dst + i);
>> +       }
>> +}
>> +
>>   static void mt76_mmio_write_copy(struct mt76_dev *dev, u32 offset,
>>                                   const void *data, int len)
>>   {
>> +       if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
>> +               mt76_mmio_write_copy_portable(dev->mmio.regs + offset, data,
>> +                                             len);
>> +               return;
>> +       }
>>          __iowrite32_copy(dev->mmio.regs + offset, data, DIV_ROUND_UP(len, 4));
> Maybe just replace this with memcpy_toio() which does no swapping at
> all instead of double swapping on BE?


I'm not that informed about how PCI works so I had to test to confirm
my understanding, but I can confirm that memcpy_toio() does not solve
the problem.

The issue as I understand it is that rather than making every driver
carefully call cpu_to_le*() every MMIO write, someone decided to make
the PCI host bridge itself transparently byte-swap all MMIO on the
wire. Since most MMIO is hitting registers and most buffers are
transferred by DMA, for the most part everything works and nobody
notices.

But in the rare case that we need to write a blob to MMIO, it gets
transparently swapped in hardware so you need to use cpu_to_le in that
case. Doing a search of ./drivers for write.*cpu_to_le I can see this
issue comes up a bit.


Thanks,

Caleb


>
>>   }
>>
>> +static void mt76_mmio_read_copy_portable(u8 *dst,
>> +                                        const void __iomem *src, int len)
>> +{
>> +       u32 val;
>> +       int i;
>> +
>> +       for (i = 0; i < ALIGN(len, 4); i += 4) {
>> +               val = le32_to_cpu(readl(src + i));
>> +               memcpy(dst + i, &val, sizeof(val));
>> +       }
>> +}
>> +
>>   static void mt76_mmio_read_copy(struct mt76_dev *dev, u32 offset,
>>                                  void *data, int len)
>>   {
>> +       if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
>> +               mt76_mmio_read_copy_portable(data, dev->mmio.regs + offset,
>> +                                            len);
>> +               return;
>> +       }
>>          __ioread32_copy(data, dev->mmio.regs + offset, DIV_ROUND_UP(len, 4));
> And memcpy_fromio() here.
>
> Best regards,
> Jonas

