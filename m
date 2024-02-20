Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767D6C48BC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 08:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqxWaUwPoW3NQVWuwD2m9C19qwV3DwfPJhOURF6bWhM=; b=O9O/5AAYAchAOtAVMnOg8Kho9v
	lmChXyVFswQGgWd/3Xbxisb0K9sAjxrJ8OILzEFUinSXfbZXxUW/MvN+wsF4pSwWnaIPbto/i1/nn
	BgK2g/Zxt7EXGXtmzYvrJXkZzTnobkoM5My+j9WQW145FAmbCFDhcgXVSMDlOdNbgD5Nt2P1KJ7QD
	MugdteNuBBjlsbFIAtIIFYUVmS8AVRd7O8WMxNqteHLBl4d2q35yM8sm+2aFRtvZSNElmTi1P6KyL
	m6UBuzCeCRjfbLgaSvz2SgoG+S0e0DlArlP8F2d2ZJKi7Rn3qDcI4HYw20tvBz6o6YAyuafkifbrr
	y+5S8CPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLv9-0000000DpcB-45n6;
	Tue, 20 Feb 2024 08:56:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLv6-0000000DpaA-1Qex;
	Tue, 20 Feb 2024 08:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708419367;
	bh=6LN+anVhIs46gCoUM3PrXmdfnXZO8f3moMRt0c1d/S8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ECln5RxCydHLZFsD2Msh8x4Dpp5/8+AsnlAH0tcpHO7bRU+fcbo2MQ0mQm3WhJPtk
	 4K6OcR3vjMYPZ70GlSdExViGFtnCRHYa/kMFq7qGfBcm8HW+qlz8UUcXBKKIx1RJnq
	 igS+6xw/qUZ5UtAvj2jCW6iLIlPOWvGZVqfpOUYIbo5B9wRQuFpglpVMrJWITbY5wd
	 72E5OtOLbA6qTVUrkMH9fJAXNVXEgypOEdnOSNw9RAkaJzMw9OIL9GjD96DTjjWdbB
	 JZLkPe8Rni+AoB2nLwS7ZjKkyE+6NOCruKMk3F/HmR+HlsESwS/+ajnbLFJibOqUBE
	 tLFSwdFA23f3g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8897C3781FD9;
	Tue, 20 Feb 2024 08:56:06 +0000 (UTC)
Message-ID: <f1fc67d4-f979-4c3e-988f-a803b7b11c46@collabora.com>
Date: Tue, 20 Feb 2024 09:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: depends on CONFIG_SOC_BUS
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 William-tw Lin <william-tw.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <cc8f7f7da5bdccce514a320e0ae7468659cf7346.1707327680.git.daniel@makrotopia.org>
 <CAGXv+5EKCrvsvZwc2zYiMWAeT9vqvU0JnDrz=WBoebBBbcgp0g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EKCrvsvZwc2zYiMWAeT9vqvU0JnDrz=WBoebBBbcgp0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_005608_543674_0266BD03 
X-CRM114-Status: GOOD (  16.71  )
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

Il 20/02/24 07:40, Chen-Yu Tsai ha scritto:
> On Thu, Feb 8, 2024 at 1:43 AM Daniel Golle <daniel@makrotopia.org> wrote:
>>
>> The mtk-socinfo driver uses symbols 'soc_device_register' and
>> 'soc_device_unregister' which are part of the bus driver for
>> System-on-Chip devices.
>>
>> Select SOC_BUS to make sure that driver is built and the symbols are
>> available.
>>
>> Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting chip information")
>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Angelo, I believe this should be picked up for -next?
> 

I'll pick this up for fixes, as I've already sent the PRs for v6.9.

> Also, mediatek/v6.8-next/soc is missing from mediatek/for-next in today's
> linux-next.
> 

Fixing immediately.

>> ---
>>   drivers/soc/mediatek/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
>> index 50c664b65f4d4..1b7afb19ccd63 100644
>> --- a/drivers/soc/mediatek/Kconfig
>> +++ b/drivers/soc/mediatek/Kconfig
>> @@ -72,6 +72,7 @@ config MTK_SOCINFO
>>          tristate "MediaTek SoC Information"
>>          default y
>>          depends on NVMEM_MTK_EFUSE
>> +       select SOC_BUS
>>          help
>>            The MediaTek SoC Information (mtk-socinfo) driver provides
>>            information about the SoC to the userspace including the
>> --
>> 2.43.0
>>
>>



