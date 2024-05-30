Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7D1C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 04:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBLzkMhspMVVnxkqgoE5gR4vmWralf60H1wWDRcdvnw=; b=c+fceANzpFfIDB
	4N4iMZp6Tgli2VsDDoc2wRgH4JI1kYy8W++6lt88a9pWoLsEMGAcXPfl5ZWsHRN6/IbCWmDVM9ryu
	zbmm6eTJRNKZLiz5OFR4bsLbSt5OKFSzIufVuWSor8ywhK16vMnUn6UjkIUvCJInY+W4yTSlXFxnG
	n4ZFAvt9PNpASbaubsOwFSqu4x7KMUyOSY8r9w1iCzLA5Ti25FjAT0IZDGqG3UB2xaBMxvSJvH7+/
	YaGfASCe/EoGaFRVNdLLFzExJk5JHNxqbqga9mw7x6EFfa0slCbCHms+Ht5wXwIDcRFkE1896pTBA
	3vJ5Yk/WEkvB5vYEgMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCXIm-00000006Gqw-1RHB;
	Thu, 30 May 2024 04:22:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCXIg-00000006GqD-2BLG;
	Thu, 30 May 2024 04:22:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6f8e9870e72so402748b3a.1;
        Wed, 29 May 2024 21:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717042919; x=1717647719; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xBLzkMhspMVVnxkqgoE5gR4vmWralf60H1wWDRcdvnw=;
        b=abT+ta+E4+VoM3SllOKKCEEiN+JA5sewKYONXjq6iAvAQThvBi6L3RL3x57NAIl/pN
         UWfMxIXGjp/ns85tYCRoUPqbgUm+3JL5yY9NqitIIrqffmDfDinAJERLquzexSnw2T13
         fZW7vmhzzLpkcaUnntg8grbnTKRfV/OBbCyPFhX5a9JOE8zwDe8Bmtc5mlGhQVzQ7Ezu
         QcsaUx7q01bJqFsHR+7K8oL/zIuAiejgJWyKEcUeLRf3TzBztg21R/a7wKBYHTMkWwV0
         6r4X3PHf/miofA8gAI1h572qy/uRPt42FMhdFow70/1d6KXxToGFZsUZYGlnfDvCuDa2
         sEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717042919; x=1717647719;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBLzkMhspMVVnxkqgoE5gR4vmWralf60H1wWDRcdvnw=;
        b=Og3s74U+vBB9g6GaUythAKHY3eIkcrdppxLOgXP4m7HHgeqcMeFckW/WRkK97yvsKc
         HG/O8SZRUslmWm4z3wKWBb854s4S9ROwiajPhjP7dtDhOeknOHIlUqkwMgqgGKUcCj4C
         +eUNWrnr0nTfHVUVf/hCeXSuHSVZyjBW06UwwokEDC/h/az1mTikY+kbY1i6E3Lr5HDP
         7ufB5H4OPPugZM/rpAx0l4MPo8NaBZiJgFqADV0MXdOsZIRUk4yVbLj7St86W/7AGAED
         QTqXCDMUZV4dX/cFaNaB9CcG8EYdw0O9RcQWX3P7ktZB/7EGuqicWM8lSdQaA0IYIuPS
         Rpgg==
X-Forwarded-Encrypted: i=1; AJvYcCX+TPycc0fPLfcfQcvnRpg4LynavphaRDdOJjb5KhdfNPaURyhFylkN/QSLtyzYsB86d5+yIrzA31SO+8MOhYCBtHDmzue3lyt9wWulKST6HAZxwp3x9PbsnSWF0Yk6uHGSqKWsrul8vWRo5Araf95mkAFvaZj1HHk=
X-Gm-Message-State: AOJu0Yxt7LgpOO2MGnQlYgVJXM3whw5CWXAeyPvpO4G9+rBYOh0MH+vY
	SL1ym2aQYaqhTU90Bm3w4LVkACWUhfW02jI8Pr6hiAZ8WRAoqEuJ/9GHRr7y
X-Google-Smtp-Source: AGHT+IELWc+Ian0RzmubNr/PJ38WEIz0KL3Ieb7m/tuYvJNFgMjfxZG8fmC9atETuYx6gTQgx8Gu6Q==
X-Received: by 2002:a05:6a00:3485:b0:6f8:effd:7942 with SMTP id d2e1a72fcca58-702310daf06mr1253461b3a.2.1717042919124;
        Wed, 29 May 2024 21:21:59 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcfe6cd2sm8765866b3a.162.2024.05.29.21.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 21:21:58 -0700 (PDT)
Message-ID: <ce9fe740-8c9a-4fc0-a65d-464f2c7da377@gmail.com>
Date: Wed, 29 May 2024 21:21:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net v2] net: ethernet: mtk_eth_soc: handle dma buffer size soc
 specific
To: =?UTF-8?B?QmMtYm9jdW4gQ2hlbiAo6Zmz5p+P5p2RKQ==?=
 <bc-bocun.chen@mediatek.com>, "daniel@makrotopia.org"
 <daniel@makrotopia.org>, "sgoutham@marvell.com" <sgoutham@marvell.com>
References: <20240527142142.126796-1-linux@fw-web.de>
 <BY3PR18MB4737D0ED774B14833353D202C6F02@BY3PR18MB4737.namprd18.prod.outlook.com>
 <kbzsne4rm4232w44ph3a3hbpgr3th4xvnxazdq3fblnbamrloo@uvs3jyftecma>
 <395096cbf03b25122b710ba684fb305e32700bba.camel@mediatek.com>
 <BY3PR18MB4737EC8554AA453AF4B332E8C6F22@BY3PR18MB4737.namprd18.prod.outlook.com>
 <4611828c0f2a4e9c8157e583217b7bc5072dc4ea.camel@mediatek.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <4611828c0f2a4e9c8157e583217b7bc5072dc4ea.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_212202_592966_FF8D82BB 
X-CRM114-Status: GOOD (  22.20  )
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
Cc: =?UTF-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu@mediatek.com>, =?UTF-8?B?U2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKQ==?= <SkyLake.Huang@mediatek.com>, =?UTF-8?B?U2FtIFNoaWggKOWPsueiqeS4iSk=?= <Sam.Shih@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "john@phrozen.org" <john@phrozen.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "kuba@kernel.org" <kuba@kernel.org>, "linux@fw-web.de" <linux@fw-web.de>, "pabeni@redhat.com" <pabeni@redhat.com>, "lorenzo@kernel.org" <lorenzo@kernel.org>, =?UTF-8?B?TWFyay1NQyBMZWUgKOadjuaYjuaYjCk=?= <Mark-MC.Lee@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "nbd@nbd.name" <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 5/29/2024 6:46 PM, Bc-bocun Chen (陳柏村) wrote:
> On Wed, 2024-05-29 at 17:50 +0000, Sunil Kovvuri Goutham wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   On Mon, 2024-05-27 at 17:13 +0100, Daniel Golle wrote:
>>>> On Mon, May 27, 2024 at 03:55:55PM GMT, Sunil Kovvuri Goutham
>>> wrote:
>>>>>>
>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Frank Wunderlich <linux@fw-web.de>
>>>>>>>> Sent: Monday, May 27, 2024 7:52 PM
>>>>>>>> To: Felix Fietkau <nbd@nbd.name>; Sean Wang <
>>>>>>>> sean.wang@mediatek.com>;
>>>>>>>> Mark Lee <Mark-MC.Lee@mediatek.com>; Lorenzo Bianconi
>>>>>>>> <lorenzo@kernel.org>; David S. Miller <
>> davem@davemloft.net>
>>>>> ; Eric
>>>>>>>> Dumazet
>>>>>>>> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>;
>>>>> Paolo
>>>>>>>> Abeni
>>>>>>>> <pabeni@redhat.com>; Matthias Brugger <
>>>>> matthias.bgg@gmail.com>;
>>>>>>>> AngeloGioacchino Del Regno <
>>>>>>>> angelogioacchino.delregno@collabora.com>
>>>>>>>> Cc: Frank Wunderlich <frank-w@public-files.de>; John
>>>>> Crispin
>>>>>>>> <john@phrozen.org>; netdev@vger.kernel.org;
>>>>>>>> linux-kernel@vger.kernel.org;
>>>>>>>> linux-arm-kernel@lists.infradead.org;
>>>>>>>> linux-mediatek@lists.infradead.org;
>>>>>>>> Daniel Golle <daniel@makrotopia.org>
>>>>>>>> Subject: [net v2] net: ethernet: mtk_eth_soc: handle dma
>>>>> buffer
>>>>>>>> size soc specific
>>>>>>>>
>>>>>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>>>>>>
>>>>>>>> The mainline MTK ethernet driver suffers long time from
>>>>> rarly but
>>>>>>>> annoying tx
>>>>>>>> queue timeouts. We think that this is caused by fixed dma
>>>>> sizes
>>>>>>>> hardcoded for
>>>>>>>> all SoCs.
>>>>>>>>
>>>>>>>> Use the dma-size implementation from SDK in a per SoC
>>>>> manner.
>>>>>>>>
>>>>>>>> Fixes: 656e705243fd ("net-next: mediatek: add support for
>>>>> MT7623
>>>>>>>> ethernet")
>>>>>>>> Suggested-by: Daniel Golle <daniel@makrotopia.org>
>>>>>>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>>>
>>>>>>
>>>>>> ..............
>>>>>>>>
>>>>>>>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>>>>>>>> b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>>>>>>>> index cae46290a7ae..f1ff1be73926 100644
>>>>>>>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>>>>>>>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>>>>
>>>>>>
>>>>>> .............
>>>>>>>> @@ -1142,40 +1142,46 @@ static int mtk_init_fq_dma(struct
>>>>> mtk_eth
>>>>>>>> *eth)
>>>>>>>>                              cnt * soc-
>>>>>>>>> tx.desc_size,
>>>>>>>>                              &eth-
>>>>>>>>> phy_scratch_ring,
>>>>>>>>                              GFP_KERNEL);
>>>>
>>>>>>
>>>>>> ..............
>>>>>>>> -  for (i = 0; i < cnt; i++) {
>>>>>>>> -      dma_addr_t addr = dma_addr + i *
>> MTK_QDMA_PAGE_SIZE;
>>>>>>>> -      struct mtk_tx_dma_v2 *txd;
>>>>>>>> +      dma_addr = dma_map_single(eth->dma_dev,
>>>>>>>> +                  eth->scratch_head[j], len *
>>>>>>>> MTK_QDMA_PAGE_SIZE,
>>>>>>>> +                  DMA_FROM_DEVICE);
>>>>>>>>
>>>>
>>>>>>
>>>>>> As per commit msg, the fix is for transmit queue timeouts.
>>>>>> But the DMA buffer changes seems for receive pkts.
>>>>>> Can you please elaborate the connection here.
>>>
>>>>
>>>> *I guess* the memory window used for both, TX and RX DMA
>>> descriptors
>>>> needs to be wisely split to not risk TX queue overruns, depending
>>> on
>>>> the
>>>> SoC speed and without hurting RX performance...
>>>>
>>>> Maybe someone inside MediaTek (I've added to Cc now) and more
>>>> familiar
>>>> with the design can elaborate in more detail.
>>   
>>> We've encountered a transmit queue timeout issue on the MT79888 and
>>> have identified it as being related to the RSS feature.
>>> We suspect this problem arises from a low level of free TX DMADs,
>> the
>>> TX Ring alomost full.
>>> Since RSS is enabled, there are 4 Rx Rings, with each containing
>> 2048
>>> DMADs, totaling 8192 for Rx. In contrast, the Tx Ring has only 2048
>>> DMADs. Tx DMADs will be consumed rapidly during a 10G LAN to 10G WAN
>>> forwarding test, subsequently causing the transmit queue to stop.
>>> Therefore, we reduced the number of Rx DMADs for each ring to
>> balance
>>> both Tx and Rx DMADs, which resolves this issue.
>>
>> Okay, but it’s still not clear why it’s resulting in a transmit
>> timeout.
>> When transmit queue is stopped and after some Tx pkts in the pipeline
>> are flushed out, isn’t
>> Tx queue wakeup not happening ?
>>   
> Yes, the transmit timeout is caused by the Tx queue not waking up.
> The Tx queue stops when the free counter is less than ring->thres, and
> it will wake up once the free counter is greater than ring->thres.
> If the CPU is too late to wake up the Tx queues, it may cause a
> transmit timeout.
> Therefore, we balanced the TX and RX DMADs to improve this error
> situation.

All of this needs to go into the commit message please, thanks!
-- 
Florian

