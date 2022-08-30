Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17675ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMdTjnFnN0/iD9os2EOwfZI3kS63atNmjYKecghV3tQ=; b=RnsqAV3nuaHY2Tdd83KWjayoeb
	lGKgpnHkYHXdQt9rNtJ+DwXUajoAGaMYjveU2woaUojJWHpGWq6/V2d31+mKscrtKov1tHxae9gf2
	SH94mgWQ21UgmfzD8ZHKad3QDwj0WLc51mu8e8hvMfYuyix0uBeIfIgupm956Rwns0X+LFGWEyVMm
	Acd/DNIvtJqym0UCM1ViXD15PLD3jfKfDOKXTldQ/SWVjWyN5tkcD3pKAWoW1wt2Mn+jhiP0IIOoj
	SET+/uWwlYTpLPFiozYewfECzWdyhMyMLp9UzjyGp2Nt8Gsk59m1eOc/YhFVQL72Oh42Tif/jcJlX
	RCG5ytoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwMW-00F5fD-Vm; Tue, 30 Aug 2022 08:12:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwGX-00F2kE-I3; Tue, 30 Aug 2022 08:06:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1BFD6601E8E;
	Tue, 30 Aug 2022 09:06:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661846792;
	bh=q3hz6lam6ByJZFG8AQKAq6AKbuWIaklHb+CToWCW60Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=elOrtcVL18D5qLmrky4vEOBy9QkcMtBFUGfLp8RpLC97BehAQhqmFtweput3RR/J6
	 LPIjesKRFEIeGOQVSwTdJLJ+V4yijxQAb4CXzj4Hfk+jz6AkRakIBFC+FCXPgl653s
	 yd8MaMrED5m/yZMG1ycFCE+e90RCxssUSsip5m6v8qIXxjVZERER8p+8WaAtG9fadi
	 lM42gcshgTQM7MXuTVwQkVc38D9fNI5WNEkPcn6ZtcfNENZPtMgTuHpsqBgqHeB9ed
	 DzsWtupeyrR1vfi/rE2BJAgfiKXlMtrPkDFoNaVBe35GqHGV0yRRUZQnGFshHMb5X6
	 wy4uSSlCLfy/g==
Message-ID: <ea7b7b08-cb9a-b6a3-bc7a-050616696e89@collabora.com>
Date: Tue, 30 Aug 2022 10:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] soc: mediatek: mtk-svs: Explicitly include bitfield
 header
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220829204439.3748648-1-nfraprado@collabora.com>
 <5a8a2b0d-fa7c-e8c6-bb04-152f8c17aa76@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5a8a2b0d-fa7c-e8c6-bb04-152f8c17aa76@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_010633_760831_863569A1 
X-CRM114-Status: GOOD (  14.04  )
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

Il 30/08/22 09:37, Matthias Brugger ha scritto:
> 
> 
> On 29/08/2022 22:44, Nícolas F. R. A. Prado wrote:
>> Commit a92438c5a30a ("soc: mediatek: mtk-svs: Use bitfield access macros
>> where possible") introduced the use of FIELD_GET and FIELD_PREP macros,
>> which are defined in the bitfield header. Add an explicit include for it
>> so we're sure to have the symbols defined independently of the config.
>>
>> Fixes: a92438c5a30a ("soc: mediatek: mtk-svs: Use bitfield access macros where 
>> possible")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>> ---
>>
>>   drivers/soc/mediatek/mtk-svs.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
>> index 64dba9f830f3..f67f3e971653 100644
>> --- a/drivers/soc/mediatek/mtk-svs.c
>> +++ b/drivers/soc/mediatek/mtk-svs.c
>> @@ -3,6 +3,7 @@
>>    * Copyright (C) 2022 MediaTek Inc.
>>    */
>> +#include <linux/bitfield.h>
>>   #include <linux/bits.h>
> 
> What do we need the bits.h for?
> 

bits.h has the definition for GENMASK(h, l), used in this file :-)

Cheers,
Angelo

> Regards,
> Matthias
> 
>>   #include <linux/clk.h>
>>   #include <linux/completion.h>



