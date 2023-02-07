Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6BDC636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i41VXQTAEPg+8Lsuw/dWql3mBmO3aWu46MgGpWWtaQs=; b=TsZaugIwcaXXQMZRrfiPkEmdDb
	+Lfymlp8CfuUq7iq137MoeBh33kMM4KyQpjDaHjefMl9C+nmHASsB/ICQjrT92NiEZ70F7FFMFiiF
	B2WDPTyuUXWMtIhKM+d26VPCYjPhRWAlXwfDpCsVITYXeaDtJ2AhdR032m/Zq8W+iEbPmX3meb974
	cnhjMwrHgdKl/NvsR37ZTocA0eh9tFuWUpnhujWeWqMc7+cdNyQXR2DmxFp457t5e/1SsxZXMeDT2
	WtiPL3IIpee6NiPYErPVqIip77eQIRP3+8R9T/hrLLeytnk7Um/MEbKdG77sw8Ypng0a1NcGpD7M+
	AVAWxP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK5N-00BQ0o-I5; Tue, 07 Feb 2023 09:16:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK5A-00BPvc-Ua; Tue, 07 Feb 2023 09:16:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 00890660206D;
	Tue,  7 Feb 2023 09:16:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675761367;
	bh=zdQ4SNWW8NQ4Lx0RrKv5KAvJWFgOPBJ6A6hrrkNxUKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oEVkQXC/tcnpTYpkkdbQ7P6KVjXQXDRUSrpNiyY+xgwlzQIa+44va/bsVQDR7981f
	 +dInYtP5ePialc2Hksvs14j+nl86QrwrBnj+Dm48OiOzVXw0oOH+TT8TUHjabELOXW
	 FOm0i/mx+/viu5Yekbao6lMBBT2FTWx+AaqjzuqOWxXFlyR8+o8hA8jzjfC9wXWqKj
	 vf05W2ILYDnzehLG7t1c9QWL8f1hUGALi6hbjB457drnsVuLLLjheZZ9M91w28Xgru
	 VAbIV0W6B2wdblkT3DczNyRQJzvfvV0XvLd+EW8TqqYN01jZu9VnyGENSb2SxCHM11
	 BaBI3wpHmEOEA==
Message-ID: <7c8cb8c8-9e53-3c52-37c1-e6a1e165097e@collabora.com>
Date: Tue, 7 Feb 2023 10:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 12/45] clk: mediatek: mt8365: Convert to
 mtk_clk_simple_{probe,remove}()
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 johnson.wang@mediatek.com, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com,
 msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com,
 zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
 yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com,
 sean.wang@mediatek.com, chen.zhong@mediatek.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-13-angelogioacchino.delregno@collabora.com>
 <CAGXv+5G0+pbgz_6ajWOYNLYMOn4a9+pmPKFngUCrQEtwZe8vVg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5G0+pbgz_6ajWOYNLYMOn4a9+pmPKFngUCrQEtwZe8vVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_011609_145005_60EEAF63 
X-CRM114-Status: GOOD (  23.93  )
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

Il 07/02/23 08:28, Chen-Yu Tsai ha scritto:
> On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Change the custom mt8365_simple_gate to be mtk_gate clocks and
>> audio clocks to be composites to be consistent with all of the
>> other MediaTek clock drivers, allowing to convert this entire
>> driver to use the common mtk_clk_simple_probe() mechanism that
>> also allows building this driver as module.
> 
> I think this would be easier to follow if it were split in half:
> the first half migrating mt8365_simple_gate to mtk_gate, and the
> second half converting to mtk_clk_simple_probe.
> 
> I assume git would generate better diffs after that.
> 
>> While at it, also perform some macro compression cleanups and
>> switch to use module_platform_driver().
> 
> This would get split in half as well. The macro cleanups go with the
> first half, and the switch to module_platform_driver goes with the
> second.
> 

I agree, entirely. Will do that on v2.

>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/clk-mt8365.c | 460 ++++++++----------------------
>>   1 file changed, 124 insertions(+), 336 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
>> index 69f293497778..4bd624884b62 100644
>> --- a/drivers/clk/mediatek/clk-mt8365.c
>> +++ b/drivers/clk/mediatek/clk-mt8365.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>>    * Copyright (C) 2022 MediaTek Inc.
>> + * Copyright (C) 2023 Collabora Ltd.
>>    */
>>
>>   #include <dt-bindings/clock/mediatek,mt8365-clk.h>
>> @@ -17,7 +18,6 @@
>>   #include "clk-gate.h"
>>   #include "clk-mtk.h"
>>   #include "clk-mux.h"
>> -#include "clk-pll.h"
> 
> This should be in the previous patch?
> 
> Could you also remove some of the other inclusions that don't get
> referenced after this patch?
> 
>>   static DEFINE_SPINLOCK(mt8365_clk_lock);
>>
>> @@ -383,31 +383,23 @@ static const char * const mbist_diag_parents[] = {
>>          "univpll2_d8"
>>   };
>>
>> -static const char * const apll_i2s0_parents[] = {
>> +static const char * const apll_i2s_parents[] = {
> 
> Misc. unmentioned change. It makes sense, but please mention it.
> 

Yes, definitely.

Thanks!
Angelo




