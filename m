Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689E4EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmmmffhcpS4Du3cVEZscoQLE9fBAXugpgGg3VNfuqa8=; b=HFbRzRSnG5SFXoterWTLu3yA5q
	zFCbEq5lRsR+njn4gSmmhUSfUiPLcPhwwBz3Gs7tBoNrJpAkJ/q9nM0dwscRFzxWKbYjIIPLbQCWh
	iz/6WMOEeExmR2UpkcOAc70uvTaZ0xpgntirAng2DE9LNN4hv11gnzPNEb3i1ZTsGo+uSGJDI+/wl
	6tQykATUgYTvW8nI3yygtkB8hdOrSz1YVILtRnkPkmMCFWZnkStnHtnObXPKbk7REuR/PcCTELTXI
	mVvtHGumSDKA0NcohQs7lpQDyrVGzWszbrEOw/2H9Bk9HUEWjjNCJSQzIN1KiA7ZwuHvYvLmNX8cz
	QLomtJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHONe-001gEv-1R;
	Thu, 06 Jul 2023 12:46:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHONd-001gEH-1a;
	Thu, 06 Jul 2023 12:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=WmmmffhcpS4Du3cVEZscoQLE9fBAXugpgGg3VNfuqa8=; b=nznjOXOZp0gX31/lyHM+RAUfRW
	bQPRXtlyYgO+4lxNCB+XwvJG5GvPmN3Y5HuN0PC0jJj/ng2NKtAKU22Jzu34GCng4WP2qXauw69X6
	RnV7lajYmJD2q28ladSqjSYYwfLWTEK9mTYX3YT+AGMaPuUxMF8VbZ+0d06HYVRPf5zPISoPF8z7h
	genWCahLYJlgC8jBpVpRGNKBshp2EdAvh+Py4OWNHQzEENKgn5fvTaM3rzKU5hlvID3yiuboYAEjX
	Yv/kljY6q9dmw1OGfvGCa2pzqtNOzjHiA1Ae8YePiKEex8ODOgb1YSkOnzcP4sFBqDoPhbCS/S5iT
	7S59W3nQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qHONX-00B49m-VX; Thu, 06 Jul 2023 12:46:39 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8DxxPCgt6ZkWfMAAA--.3885S3;
	Thu, 06 Jul 2023 20:46:24 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_yOPt6ZkktseAA--.51215S3;
	Thu, 06 Jul 2023 20:46:23 +0800 (CST)
Message-ID: <1784da38-52ae-668a-db2a-49d60f2be80e@loongson.cn>
Date: Thu, 6 Jul 2023 20:46:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/mediatek: Fix potential memory leak if vmap() fail
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongson-kernel@lists.loongnix.cn
References: <20230626185801.684451-1-suijingfeng@loongson.cn>
 <78b023a0-ce6d-80e2-c8d0-d3d6fde1c928@gmail.com>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <78b023a0-ce6d-80e2-c8d0-d3d6fde1c928@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_yOPt6ZkktseAA--.51215S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF48tw15AF4fKF1kAryxZwc_yoW8Jw1xpF
	4ktay5CFWjkrWFqFn2y3WDZFy5G3WrWa1DGrn2qa1jvw1UJr1jqFyUZ34qgr42vr4Ikw47
	Jr1DXr9xuFy2yFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4s2-UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_134636_698087_1B7433BB 
X-CRM114-Status: GOOD (  11.88  )
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

Hi, Thanks a lot!


On 2023/7/6 19:39, Matthias Brugger wrote:
>
>
> On 26/06/2023 20:58, Sui Jingfeng wrote:
>> Also return -ENOMEM if such a failure happens, the implement should take
>> responsibility for the error handling.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
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
>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>
>>   out:
>>       kfree(sgt);
>>       iosys_map_set_vaddr(map, mtk_gem->kvaddr);


