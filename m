Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C9ACD1296
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQdQd64+35SNI/x7FIApQgWkETGlR13A7QDrs/n7yMA=; b=4TVxX2xG60CF0ALxsU0MKidJZu
	U/Nub+EbnByUieJAcMdTGHVR0g611uBnsu6xQiJcp825h9D7OExGOnhk0EtbFARzqBdobJFePk3t4
	MAHWSNCV0HvaxWVaDVeUErEpdI+y0IgxVL1QcHUGZmAhPHE298CjUgHDd3hwB3NmsRULAgrYBzQzU
	dP+qe5D0Z0kxUxqCIYApl6HC91AGEYbBnoNjZ1WrTYoDi/Nn03rcHD8IYRyL41yGSjBNTTUUaWEC6
	03NcfMl76ZnbRK/rPtkssIV4s4r5aA4XUNcPg93ER2pJ3mVvRYJWm07wyAwsjXgw82r2Q5IXqp2K/
	R8sMVN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtqQ2-0000000Fwoa-3h6C;
	Mon, 08 Apr 2024 14:56:25 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtqPf-0000000FwgU-3Ott;
	Mon, 08 Apr 2024 14:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712588141;
	bh=8ixhDcDmRfYWm6cJvXx1rMiBFBKX7dAZIjKBVgAAibo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UY1JEUrimRA0o/tOLLf1B9XqrzwKdBym7ujw+wQmPRF27rQSSvefyT1VXKWPiA4Vb
	 nrNHd6GyFZVfIxDD713W83E6CS/IMLTTxTgOXzQXUCbj+zu3JwrFiv1IOOHUzqpJTh
	 B4/ecK4Bh7FUYmBeMY+ioThPFU5B5DbJvcniTZgaXrleMg7LcofijyBqHDRuFygzAs
	 oZT6hh0o905IDGt8qGASHfBx7aDBSc5EOKt+94K1PBa1Duqr3uA+YYfJeVog4yiVbo
	 Br/E8/p/vQ2hoTzx6igY0MLO9TZ2eTGI5ZOhxOU/Tf2nyqkIM1RZwIClV6wEGytm3I
	 Ova4zrD4Aoe3w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A247F3780C39;
	Mon,  8 Apr 2024 14:55:40 +0000 (UTC)
Message-ID: <23d98db0-a4a8-4453-95be-1a0982dd66a0@collabora.com>
Date: Mon, 8 Apr 2024 16:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: select CONFIG_SOC_BUS
To: Daniel Golle <daniel@makrotopia.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 William-tw Lin <william-tw.lin@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240408125506.1594257-1-arnd@kernel.org>
 <ZhPqLGYxK3NRCSXl@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ZhPqLGYxK3NRCSXl@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_075600_820601_1724C6FC 
X-CRM114-Status: GOOD (  15.90  )
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

Il 08/04/24 14:59, Daniel Golle ha scritto:
> Hi,
> 
> On Mon, Apr 08, 2024 at 02:55:00PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> This is needed to avoid a link failure:
>>
>> ERROR: modpost: "soc_device_register" [drivers/soc/mediatek/mtk-socinfo.ko] undefined!
>> ERROR: modpost: "soc_device_unregister" [drivers/soc/mediatek/mtk-socinfo.ko] undefined!
>>
> 
> I've tried to take care of this in the exact same way a long time
> ago. Don't ask me why it didn't find it's way into stable yet
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/cc8f7f7da5bdccce514a320e0ae7468659cf7346.1707327680.git.daniel@makrotopia.org/
> 
> 

Sorry, went out of my radar for reasons.
Your commit should take precedence.

Angelo

> Cheers
> 
> 
> Daniel
> 
>> Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting chip information")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/soc/mediatek/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
>> index 50c664b65f4d..1b7afb19ccd6 100644
>> --- a/drivers/soc/mediatek/Kconfig
>> +++ b/drivers/soc/mediatek/Kconfig
>> @@ -72,6 +72,7 @@ config MTK_SOCINFO
>>   	tristate "MediaTek SoC Information"
>>   	default y
>>   	depends on NVMEM_MTK_EFUSE
>> +	select SOC_BUS
>>   	help
>>   	  The MediaTek SoC Information (mtk-socinfo) driver provides
>>   	  information about the SoC to the userspace including the
>> -- 
>> 2.39.2
>>
>>


