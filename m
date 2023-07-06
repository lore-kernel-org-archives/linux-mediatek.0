Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0328FEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmdxVyEV5lggCCeYaBLl2W3eSLPMCAciQd6+9Y/5iaE=; b=fidv+GJK6nKCLlAeVLhzWnWFDG
	rjThP7CPPklrar1gvvZbj8B8HphweCN8OPprGgw4Bljp1IzuONbyIFhNOtP+WAsP1Y4Tr1clNWIou
	vO3qU/aTWlM+M7RksMPBlEOMObdI0/OfxTfJXENypxUsbsFBO6xwu576aVh1tJx2Axm2UZw1FTYHW
	vA8r92fa+OTa/5s9MJdrGoO/Bdi8hbdWPyxdRAMRNFOhdaCdbbfDM5SZK2GqmamEnISPytPj39Hq8
	zlZxmdXO9j0ghOp09NisaVwUkDCBWRUYakBEOdjb4Q//bGNRVQCQPr/Dheijr3BiPCLVXvVfcpahv
	/UgAbbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHPH8-001na9-0E;
	Thu, 06 Jul 2023 13:44:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHPH7-001nZa-11;
	Thu, 06 Jul 2023 13:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NmdxVyEV5lggCCeYaBLl2W3eSLPMCAciQd6+9Y/5iaE=; b=V9Za9n0WmHGp9pWTdcCMwVmAcs
	MjGfvocZOlDMy6jM8gNvrdOWxyRMCASWvTLiRSL671WIFgMCzS8kPXzp8ah0LjeYziFolBmNgtik+
	fBXJr3pNg4k/kGVhqzqliyzlKPiSE9LJiIMlJ5AFekNhTFERnukeR2OX9rgTbzcsF98TCc8+ybXDk
	djBmsiRH6CY4WCdYG6wWeeMFVm17conLpMidwtG1fLKWcJsIw6lkF08Rxq0UQnuCtxJdvzn1W3KFv
	mD7pXT3mtPw6Afxu2gE6tDjk6QkL3xplD+sMz5NzXQqFycePS9sAn6o4M30QE9qFeVpwL5ehrlB9S
	duVOJ+YQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHPH2-00Dalc-0t;
	Thu, 06 Jul 2023 13:43:59 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8DxRvEPxaZkR_gAAA--.3941S3;
	Thu, 06 Jul 2023 21:43:43 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c4OxaZkq_ceAA--.27112S3;
	Thu, 06 Jul 2023 21:43:42 +0800 (CST)
Message-ID: <7869d9d7-1763-58d8-119f-08befff9615e@loongson.cn>
Date: Thu, 6 Jul 2023 21:43:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/mediatek: Fix potential memory leak if vmap() fail
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongson-kernel@lists.loongnix.cn
References: <20230626185801.684451-1-suijingfeng@loongson.cn>
 <be63fd1b-7659-75b8-e037-38528e8a8276@collabora.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <be63fd1b-7659-75b8-e037-38528e8a8276@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Ax3c4OxaZkq_ceAA--.27112S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww1rCFWxZF1kWrykWFWDWrX_yoW8Xr4fpF
	4ktay5ArWjkr4FqF1Iy3WqvFy5A3WFga1DGr1Iqa1qvr1DAF10qFyUZ34jgrW2vr4Ikw47
	tw1DXr9xur1qyFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4AhLUUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_144357_059876_FF6E837B 
X-CRM114-Status: GOOD (  13.46  )
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

Hi,

On 2023/7/6 20:47, AngeloGioacchino Del Regno wrote:
> Il 26/06/23 20:58, Sui Jingfeng ha scritto:
>> Also return -ENOMEM if such a failure happens, the implement should take
>> responsibility for the error handling.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>
> This commit needs a Fixes tag. Please add the relevant one and resend.
>
Done at [1],


Thanks for point this out, I got it.

[1] https://patchwork.freedesktop.org/patch/545843/?series=119885&rev=2


> Thanks,
> Angelo
>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c 
>> b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> index a25b28d3ee90..9f364df52478 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> @@ -247,7 +247,11 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object 
>> *obj, struct iosys_map *map)
>>         mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
>>                      pgprot_writecombine(PAGE_KERNEL));
>> -
>> +    if (!mtk_gem->kvaddr) {
>> +        kfree(sgt);
>> +        kfree(mtk_gem->pages);
>> +        return -ENOMEM;
>> +    }
>>   out:
>>       kfree(sgt);
>>       iosys_map_set_vaddr(map, mtk_gem->kvaddr);
>
>


