Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86A5C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrqDnErsABHH9Z+PLoa6M6dkuvBdvCyk/vTVtwMDfQY=; b=TDN3qDBL6bcT0EcxqfxGc/Cbh2
	bnLu7MAn17RzdxC8bFH+ObQrWFYmbSJ0PcRAGPX7/30B91DoiZJ98t/wHeYu/lHGXiBBEug8LGV1E
	BzdfNRvMQh0cNU9/zLJpcN4sL3v4JM4Z1lPoYe5IY0bobhW4xX4XEEDrbL5sYfDc+tFvNzY0VuclW
	TA6uU5B01HHl2oZftTw/zrEVIpWpi7WMNDjma07qECbA8AuT8BaecIwQoIhMUTDEK0njR4RasAJ78
	dqH8jLsBVktLZZIJKZjPzEEpyNxFNY3FDAxHOAdDrYqjKFlgSPz6WIRvrnmn0GGVaZ+czh4HBJy57
	9Oul/oJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1M3o-00000001uah-0m3y;
	Mon, 29 Apr 2024 08:08:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1M3k-00000001ua3-3oWm;
	Mon, 29 Apr 2024 08:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714378102;
	bh=pTjfAPq13MjrIZFyd2W2RPgVaYx79/VZ4aaxirIjUNo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DBlSfx9abwJOPEHMh/Y9whzwSrts1w/5CpjQJgw9zT6GTidmxkP6wlsMfPqxek9nz
	 o0H9CpCNFL6/kWNK1gyPD0An9BQVGGlTtQ15KNZgskWP9ZCM0tbnX8igIDccg4fzxQ
	 lpgMVYh92QIS4eiMxfG7vB82HC+yvpnSyutXs5ztyNBooLWmqksPWsnf2EpHs06NSG
	 GqRHvwb6nmL30/e9cx3IzTuuMZDWBEv6v4HQtkzuPWfqqewqFlCgAGu6U/vAxpHqJZ
	 qaO3mPFhIqNU5BNzIzTR6e22k4663rQq21eLqYmT8qHuuXbd+nAPv/XM7lcC6kPYFL
	 WrpS4Pt2noJVA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 74902378134F;
	Mon, 29 Apr 2024 08:08:21 +0000 (UTC)
Message-ID: <57529d24-8b46-4eed-95ed-463ad3f4190e@collabora.com>
Date: Mon, 29 Apr 2024 10:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] soc: mediatek: Add MediaTek DVFS Resource
 Collector (DVFSRC) driver
To: Nathan Chancellor <nathan@kernel.org>
Cc: djakov@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, keescook@chromium.org, gustavoars@kernel.org,
 henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org, amergnat@baylibre.com,
 Dawei Chien <dawei.chien@mediatek.com>
References: <20240424095416.1105639-1-angelogioacchino.delregno@collabora.com>
 <20240424095416.1105639-5-angelogioacchino.delregno@collabora.com>
 <20240424190405.GA2803128@dev-arch.thelio-3990X>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240424190405.GA2803128@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_010825_388111_945FE54A 
X-CRM114-Status: GOOD (  19.84  )
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

Il 24/04/24 21:04, Nathan Chancellor ha scritto:
> Hi Angelo,
> 
> On Wed, Apr 24, 2024 at 11:54:13AM +0200, AngeloGioacchino Del Regno wrote:
>> The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC) is a
>> Hardware module used to collect all the requests from both software and the
>> various remote processors embedded into the SoC and decide about a minimum
>> operating voltage and a minimum DRAM frequency to fulfill those requests in
>> an effort to provide the best achievable performance per watt.
>>
>> This hardware IP is capable of transparently performing direct register R/W
>> on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
>>
>> This driver includes support for MT8183, MT8192 and MT8195.
>>
>> Co-Developed-by: Dawei Chien <dawei.chien@mediatek.com>
>> [Angelo: Partial refactoring and cleanups]
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ...
>>   drivers/soc/mediatek/mtk-dvfsrc.c        | 551 +++++++++++++++++++++++
> ...
>> +#define KBPS_TO_MBPS(x)			((x) / 1000)
> ...
>> +static void __dvfsrc_set_dram_bw_v1(struct mtk_dvfsrc *dvfsrc, u32 reg,
>> +				    u16 max_bw, u16 min_bw, u64 bw)
>> +{
>> +	u32 new_bw = (u32)div_u64(KBPS_TO_MBPS(bw), 100);
>> +
>> +	/* If bw constraints (in mbps) are defined make sure to respect them */
>> +	if (max_bw)
>> +		new_bw = min(new_bw, max_bw);
>> +	if (min_bw && new_bw > 0)
>> +		new_bw = max(new_bw, min_bw);
>> +
>> +	dvfsrc_writel(dvfsrc, reg, new_bw);
>> +}
> 
> Using KBPS_TO_MBPS here results in
> 
>    ERROR: modpost: "__aeabi_uldivmod" [drivers/soc/mediatek/mtk-dvfsrc.ko] undefined!
> 
> when building ARCH=arm allmodconfig with clang. I did not check to see
> if this is visible with GCC but if it is not, it is only because GCC
> implements certain transformations for constant division that clang may
> or may not have implemented (there was some work on getting all
> transformations that GCC has supported in clang as well but I do not
> think was ever completed). Perhaps KBPS_TO_MBPS() should be dropped and
> the new_bw assignement turned into
> 
>    u32 new_bw = (u32)div_u64(bw, 100 * 1000); /* Multiply divisor by 1000 to convert bw from Kbps to Mbps */

Thanks, I honestly didn't check clang.

Your suggestion looks good, I'll do exactly that.

Cheers!
Angelo

> 
> or something like that.
> 
> Cheers,
> Nathan


