Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4917ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX6TuhmFOaQGNc/FIdqB48iuxl4sFFUUsWwmv2XNjFw=; b=iO9f+8syx12I42y1STQlKjhrvP
	tQeCe6x4EUovkkZ9V7wgt0FjXgEuusTwPa1U2NhAG4mgfnHjJOG0q61p+STtnCWciVhugMP5O6NZz
	alTuaoVWwcJsSHKM2ZuhTFq+SyCOab/+aTKIGqWshzbBY+44np/4TyIRpOCo5IRu34uIjZq/0pAt4
	faRL55SbXf3Vbzw7xOMUOcZNQ10b/tMaiwfPIMds8dGG+63Hvb1b2VvN7EJx4NBjzjDARa8BkPLW4
	pU+c0k/rfTEo/ejJWsdEBCxzVbmDPRhZjr148DE6ySnliXzShzCreqiB/qKedxchCVZId6SSSogHK
	wngNdbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSiTq-00C24X-Jz; Mon, 29 Aug 2022 17:23:22 +0000
Received: from smtp-18.smtpout.orange.fr ([80.12.242.18] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSiTl-00C217-Ef
	for linux-mediatek@lists.infradead.org; Mon, 29 Aug 2022 17:23:20 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id SiTaoh2z4tk1aSiTaoL9lM; Mon, 29 Aug 2022 19:23:08 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 29 Aug 2022 19:23:08 +0200
X-ME-IP: 90.11.190.129
Message-ID: <444669a0-6328-0bc4-8073-9ec4baaf893e@wanadoo.fr>
Date: Mon, 29 Aug 2022 19:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] spi: mt7621: Remove 'clk' from 'struct mt7621_spi'
Content-Language: fr
To: Matthias Brugger <matthias.bgg@gmail.com>, broonie@kernel.org,
 gregkh@linuxfoundation.org, neil@brown.name, blogic@openwrt.org
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
 <76ed0ef91479498b9a2d5ef539f80851cffdb4ea.1661599671.git.christophe.jaillet@wanadoo.fr>
 <a8c87417-f37e-7c7a-a4a4-c5a01118e7a8@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <a8c87417-f37e-7c7a-a4a4-c5a01118e7a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_102317_833998_036EAD96 
X-CRM114-Status: GOOD (  13.77  )
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

Le 29/08/2022 à 13:18, Matthias Brugger a écrit :
> 
> 
> On 27/08/2022 13:42, Christophe JAILLET wrote:
>> The 'clk' field in 'struct mt7621_spi' is useless, remove it.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> IMHO should be part of patch 2/4.

Ok, I'll send a v2 of the serie to merge patch 2 & 4.

CJ

> 
> Regards,
> Matthias
> 
>> ---
>>   drivers/spi/spi-mt7621.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
>> index 114f98dcae5e..c4cc8e2f85e2 100644
>> --- a/drivers/spi/spi-mt7621.c
>> +++ b/drivers/spi/spi-mt7621.c
>> @@ -55,7 +55,6 @@ struct mt7621_spi {
>>       void __iomem        *base;
>>       unsigned int        sys_freq;
>>       unsigned int        speed;
>> -    struct clk        *clk;
>>       int            pending_write;
>>   };
>> @@ -361,9 +360,8 @@ static int mt7621_spi_probe(struct platform_device 
>> *pdev)
>>       rs = spi_controller_get_devdata(master);
>>       rs->base = base;
>> -    rs->clk = clk;
>>       rs->master = master;
>> -    rs->sys_freq = clk_get_rate(rs->clk);
>> +    rs->sys_freq = clk_get_rate(clk);
>>       rs->pending_write = 0;
>>       dev_info(&pdev->dev, "sys_freq: %u\n", rs->sys_freq);


