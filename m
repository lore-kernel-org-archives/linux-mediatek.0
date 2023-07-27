Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC95C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 09:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YujDTlbA4onXaGeSY1e5MHF7Pjo0PpSJxih3c5b9mq4=; b=3m5tD7nZNO/+5yrv1aca30lzQ+
	+HyB1bhFoAl/WTkLfQU9R0+kGBgaRBRCP/bOl8TiYi5V+NidfIJ961FuLoQNDylJh+PpJAeUTpePJ
	akBjuBCQGDH0gCUyQqjLU4r6pZh9e45nWzBAWkxyj4c/hBWwb14CL3enTDA368yDfJJTHfKNw3W58
	COX5FJUcY4ijJi3H5FNhJXlBjXywkixsAfR2C0HVJICi/P2i2eWODaTvcEqhlgAZ/JzLFJSPaMrAS
	Hepngyd51+DyiBNxPXHkHwI2oPEVywSGZwPrF43dzrgiUH4ZH0Xo8rAHbzOMPBwdHAVoOe6HYj1Nx
	raxsvHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxjq-00Ctpn-1p;
	Thu, 27 Jul 2023 09:56:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxjo-00Ctoq-1r;
	Thu, 27 Jul 2023 09:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YujDTlbA4onXaGeSY1e5MHF7Pjo0PpSJxih3c5b9mq4=; b=CqHECXC7DeM1Fd978tJqGQxyfU
	0HST5vVxl/Jwjt3iqJKPfig2H0PeN7R9NFoywdIrXlzeLb93dlQ9Oopr5v3NsQRGau7r+cjtJZCPT
	azDNr3n3keFLAM+OvaCbbcaLCqcgPWbotbbcZPtLr/VThqvVHxof0dpkrMBIgJTlwBqdgl+dbvjq4
	EjrAEYy4c78OGORLEN2K3GbTj7r0xWtk3lXrMNUGnACpU4q15Ug8UqaJ5B+GqENlAuBoWbUYGF0uj
	UrixsLXxtHsbL/PQUXp7b15h1JCkYqXqo0rEhqrjscNfO6i9TN8e3I5AwScLRHnnMh6Pbofu7Ot5G
	Lt9zGtrg==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxji-0074iA-2p;
	Thu, 27 Jul 2023 09:56:49 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8Dx6epJP8JktqoKAA--.21025S3;
	Thu, 27 Jul 2023 17:56:25 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx3yM9P8JkTeo8AA--.57606S3;
	Thu, 27 Jul 2023 17:56:23 +0800 (CST)
Message-ID: <68a9a139-922b-93ae-0f4d-ee36b3610110@loongson.cn>
Date: Thu, 27 Jul 2023 17:56:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/mediatek: Fix potential memory leak if vmap() fail
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, loongson-kernel@lists.loongnix.cn
References: <20230706134000.130098-1-suijingfeng@loongson.cn>
 <040c1db8-4ae1-2a6c-ff58-282ed938e565@collabora.com>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <040c1db8-4ae1-2a6c-ff58-282ed938e565@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Bx3yM9P8JkTeo8AA--.57606S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw1Dtr4xJFW7urW3Xr1UurX_yoW3JFb_K3
	y0q34xurs5tF43Cr4ayasxAayFgFW8tFnrWw4kX3Z3Gwn0k398Xayqgws3XFyrGFnruFyj
	ga45JF9Yyry7XosvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUU
	U==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_105647_734227_C7F36F74 
X-CRM114-Status: UNSURE (   6.32  )
X-CRM114-Notice: Please train this message.
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

On 2023/7/27 17:22, AngeloGioacchino Del Regno wrote:
> Il 06/07/23 15:40, Sui Jingfeng ha scritto:
>> Also return -ENOMEM if such a failure happens, the implement should take
>> responsibility for the error handling.
>>
>> Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap 
>> function")
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>

Yeah! I got so many R-B!

So surprise, So happy!

Hopefully someone will merge/apply this patch someday, thanks.


