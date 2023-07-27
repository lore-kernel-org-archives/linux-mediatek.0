Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7C3C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 07:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wo4RVFKj39jcCUcqvLecFvgIsHUmLl9bkps4Z+IjJe0=; b=Zqd9/kK34+QC/eppqkbcOAsqyE
	fB5zpvmeJpflGbZvbXyKQ6Cn4vqvzKNOn1t52asjZf8Y0vsFuRHhPzO3VvpXFHFBreQgflNeh89Hd
	EWREf5grifeJD8sdpRKu3VrMx5osDhG11eXsIbfoz3lpVtdr3pU0UAZBjxMObuIq6FXrjFFUiNz8X
	UrCx2LYQ7Thf8EfEbsy/v+7MyzsSMkeuHIZ9T++oq3V+t2LDdnQx08UbnlCYWd7BLeWKtpwWbQa9s
	jih8reUR0ZGv+4WHM2clo1FUbewgRAgck0vovKhXPWOHUNSc1XLnPREshJbb2OOPdsyIw/4tt74OS
	LvaDJtIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOvMX-00CSUw-24;
	Thu, 27 Jul 2023 07:24:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOvMV-00CSTi-2H;
	Thu, 27 Jul 2023 07:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=wo4RVFKj39jcCUcqvLecFvgIsHUmLl9bkps4Z+IjJe0=; b=qaqQ/yxCDfOvt6wSQGxj0n4X68
	wg/kKncuKyU5OmeQduR+WVg1AHgin4k7hXOu3t/8Vhbo4Q3BoS4+kJ0C9Ogl28gw5+16+nVeWg5iL
	0jdxB3dUnFwc8r7au7vFpJYlPe2nZCVoPlKPIH28hBQweqk08H4w6Tx5K/bXXRikCC6ZxaDcHFp+g
	l/FFpQe6o1mwZWW24QVpzlxV2YYuWs0uQWjCEtEKEJYo8RueR087vbMyAVHQfLQ0SUN2DIYxVxKRq
	VaSB+Th9y41EdLh1Ic25ZniskbJuJgRnTYiWcSuBTlZ5r5cEQFBqaCYzmaRaUQHfe85SrW9GQspUk
	SsSbX/TQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qOvMP-007Ff7-Db; Thu, 27 Jul 2023 07:24:37 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8AxTeunG8JkGp0KAA--.21111S3;
	Thu, 27 Jul 2023 15:24:23 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx7yOdG8JkObk8AA--.56804S3;
	Thu, 27 Jul 2023 15:24:22 +0800 (CST)
Message-ID: <1690f822-7b35-5108-abee-93593d2ae655@loongson.cn>
Date: Thu, 27 Jul 2023 15:24:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/mediatek: Fix potential memory leak if vmap() fail
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>,
 loongson-kernel@lists.loongnix.cn
References: <20230706134000.130098-1-suijingfeng@loongson.cn>
 <6c639e58198680a8d2fb903bb27184bd328e2d54.camel@mediatek.com>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <6c639e58198680a8d2fb903bb27184bd328e2d54.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx7yOdG8JkObk8AA--.56804S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFy5Zw15tF1DGFWfAr18WFX_yoW8Kw48pF
	sak3WUAFWkJr4UZF1Iv3Wqv3W3Wa4fXF47Grya9r47ZF98G347Gry2yw1YkrWjvrsFka13
	tr4qqrya9r1jyFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
	vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8q2NtUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_082434_547211_50F147EA 
X-CRM114-Status: GOOD (  16.84  )
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


Thanks a lot!


On 2023/7/27 09:47, CK Hu (胡俊光) wrote:
> Hi, Jingfeng:
>
> On Thu, 2023-07-06 at 21:40 +0800, Sui Jingfeng wrote:
> >   
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Also return -ENOMEM if such a failure happens, the implement should
> > take
> > responsibility for the error handling.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>
> > 
> > Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap
> > function")
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > index a25b28d3ee90..9f364df52478 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > @@ -247,7 +247,11 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object
> > *obj, struct iosys_map *map)
> >  
> >  mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
> >         pgprot_writecombine(PAGE_KERNEL));
> > -
> > +if (!mtk_gem->kvaddr) {
> > +kfree(sgt);
> > +kfree(mtk_gem->pages);
> > +return -ENOMEM;
> > +}
> >  out:
> >  kfree(sgt);
> >  iosys_map_set_vaddr(map, mtk_gem->kvaddr);
> > -- 
> > 2.34.1
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!


