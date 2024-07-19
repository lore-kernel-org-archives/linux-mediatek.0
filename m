Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D742C3DA59
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkebF+QRKvuqq0XH6iP+oTbesF+yos2yFdulHY2dNYo=; b=f5k3oeR28mja5wGYcNC88NjJqW
	1KQfPOJOOARjpXCQMe+dXCWvZbuD1U+mwOFQx3Yx6ecFAjfBXlBjmNgclwArQMlDmcRbE6pU/28Yp
	IvdV2TSjf0h8I875LPJ0s9e5x45sGQtUY9gyH+keaDCDSx4AemCaSMxoh+r/ZCFbDu9SUTWJaCtR2
	pEsIq4m6jjs/XgkvqihUESbRfp0L6pZjsU6AfMa49LVxYKz49NGpI+pbrJ3L6kKS9UkEeMik/9c3S
	zGpLBztMXX2PKLs/ML6wN1QjTYQ1HoPO5f2+JPGdBT64S0dgzWC2md6XImG7ixRYeHBGuAgGqI6ic
	QS3lKBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjvd-00000002EYY-0njy;
	Fri, 19 Jul 2024 09:29:29 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjvF-00000002EUJ-45wB;
	Fri, 19 Jul 2024 09:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721381344;
	bh=vZwrMxjWIaAJGR0U2tTRVxoypX67g1WUlixhrZh3264=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FiQ8FL8nWP7zR8X2jVpTZnOsAvmPhv/JTHd+UoJIe7JyTzdUYinXEgAbHJ8sWxBF8
	 mv7RcWSi1mdOVkk/23aPcV4V9MBS4L3NdAKz8ZH0pZkBY94GaJHSVqXCh6qXbFEgpv
	 7mvzsDUtQZroxCOXNgpksrXQIQmST0wcDBD8Khp6C3kbkjUOaGsHzErYkLa+ZCzIFA
	 JMUHdmUkJHCA/DlCaT69kXAIqMp6L30lPyrn9KOmZfQUcjHNkERG/gA/zgSh7ygS88
	 dk+NXMyNwM+Ateh5ZhY5B/m1M+2rh81ikNyKRQooR5SOje69il+UL7DZSHIIeW1xbX
	 3BKX/iE4ytVAw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0838F3782063;
	Fri, 19 Jul 2024 09:29:03 +0000 (UTC)
Message-ID: <e1e1b618-b505-482a-b556-99c6d42fd581@collabora.com>
Date: Fri, 19 Jul 2024 11:29:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvmem: mtk-efuse: Only register socinfo device if
 needed cells are there
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 William-tw Lin <william-tw.lin@mediatek.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240708-mtk-socinfo-no-data-probe-err-v2-1-7ae252acbcc2@collabora.com>
 <a1914f2b-93f2-4de4-9c4b-2e1f6b39cf3a@collabora.com>
 <05dd24ec-d084-4708-a241-b4714391118a@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <05dd24ec-d084-4708-a241-b4714391118a@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_022906_179349_720105F8 
X-CRM114-Status: GOOD (  28.07  )
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

Il 19/07/24 00:07, Nícolas F. R. A. Prado ha scritto:
> On Wed, Jul 10, 2024 at 11:31:11AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 08/07/24 21:43, Nícolas F. R. A. Prado ha scritto:
>>> Not every efuse region has cells storing SoC information. Only register
>>> an socinfo device if the required cells are present.
>>>
>>> This prevents the pointless process of creating an socinfo device,
>>> probing it with the socinfo driver only to ultimately error out like so
>>>
>>>     mtk-socinfo mtk-socinfo.0.auto: error -ENOENT: Failed to get socinfo data
>>>     mtk-socinfo mtk-socinfo.0.auto: probe with driver mtk-socinfo failed with error -2
>>>
>>> This issue is observed on the mt8183-kukui-jacuzzi-juniper-sku16
>>> platform, which has two efuse regions, but only one of them contains the
>>> SoC data.
>>>
>>
>> I think that we should rather remove or disable the first eFuse region, as
>> even though that is enabled:
>>
>>   - This is the only SoC having two regions
>>     - I'm not even sure that the region at 0x8000000 is really efuse
>>     - Not even referenced in datasheets....
>>   - It's unused, as in, it's not exposing any information and no declared cells
>>
>> Don't misunderstand me, this is not an invalid change, but I rather prefer
>> to resolve this by disabling that (effectively unused!) node, avoiding to
>> add more lines to this driver that would be useless after fixing that small
>> single thing.
> 
> I'm not confident that we can say that that efuse is not exposing any
> information. Indeed there are no cells so it's not used by any other driver, but
> the efuse contents are still exposed to userspace if CONFIG_NVMEM_SYSFS is
> enabled.
> 
> I dumped it on one of the mt8183-kukui-jacuzzi-juniper-sku16 units:
> 
>    $ ls -l /sys/bus/nvmem/devices/
>    total 0
>    lrwxrwxrwx    1 root     root             0 Jul 18 21:43 mmtd0 -> ../../../devices/platform/soc/11010000.spi/spi_master/spi1/spi1.0/mtd/mtd0/mtd0
>    lrwxrwxrwx    1 root     root             0 Jul 18 21:43 nvmem0 -> ../../../devices/platform/soc/8000000.efuse/nvmem0
>    lrwxrwxrwx    1 root     root             0 Jul 18 21:43 nvmem1 -> ../../../devices/platform/soc/11f10000.efuse/nvmem1
>    
>    $ hexdump -C /sys/bus/nvmem/devices/nvmem0/nvmem
>    00000000  88 07 00 00 00 8a 00 00  00 ca 00 00 00 00 00 00  |................|
>    00000010
> 
> I power cycled the unit and ran this again and it still showed the same
> contents. I also ran the same on a different unit of the same model and it
> showed the same contents. Of course this doesn't prove anything, but given that
> the contents seem to be constant across reboots and even different units, it
> does look like it could be an efuse to me. :)
> 
> As to whether the contents are useful at all, or if there are
> userspace applications making use of it I have no clue. But if in doubt,
> shouldn't we keep it around?

(Added William-tw Lin from MediaTek to the loop)

I'll say yes only if MediaTek (please!) says that this region has useful
information, and only if MediaTek actually tells us what those fuses are.

The reason is that sometimes when SoCs have multiple efuse regions, one contains
uncalibrated data for factory calibration (etc etc), one contains data that derives
from the uncalibrated regions and that is supposed to be used by the OS.

If we got the uncalibrated data that is *not* for OS usage in the MT8183 DT, then
we can as well just remove it.

Besides, I have no concern about any userspace application using that.

Cheers!

> 
> Thanks,
> Nícolas


