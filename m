Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C2FEB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnBlUw6qtrfLhPWtBACs12VnsqaxxxmPTeeEsJGwpC4=; b=ReutzouK2P8IXoNnrz8qQ9TcUf
	/7fcFvZekGyTSf+AfM9RprkaNHN17Z5nXM0iWJ2XpLSORfnSdbyPIxb0RTb8YJRmFpuIVcDMK6vql
	2xTrVGu3l4n0VCfvUgjS98lBhoScXcwceSk1aS+3WVKJBNA8ulJt32cwn53vOjMXvCd3jnqmPh0Px
	5gQqs58G1OoumVE5zPqzfjfN70sAkx6NWbBlCjnQLTb1yml2FCAIs6BaC+WI/RBjT42JBswiwD7Ag
	UqrcLVOMP67/q5lclqNjGLu8sdRWvq2ywOrCDcXIGZOPeNmkCYc+1KG08XRXnLh/5QmMT5isCqoPw
	3RV+aAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHOOD-001gOf-19;
	Thu, 06 Jul 2023 12:47:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHOOC-001gNt-0K;
	Thu, 06 Jul 2023 12:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=UnBlUw6qtrfLhPWtBACs12VnsqaxxxmPTeeEsJGwpC4=; b=ALjXs+SQ4K0P0hGtaC69KOQW35
	fBjcMVWUGWE+dBpRKzQpUAtqzLkSwqdd/NzFu0aaeBmjFX57pmXo+Fa1gLzjk8/RXhAakyx07qqKv
	6XIKJUE97VzdjVuyp2VIUhQ1hUTWyMMlO+6LaWuMEprW8otXwB5i22eSj93hX+ZVKj816sJ4nTuBg
	HEPNSyY/uugl9FNdU33uIDbHAxcQKE029+SumZlit9/3JPAHFtPh/+xf2v0eewqNZx3sbbsntNXjG
	nnvw0FFl24ylcZPaZUuA+AxcLrmYrXf78SPVT/xrqGH17hIa8s9XAGDQ/77xNhpC5p5adKCw5pcA1
	XfV/Zf4g==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qHOO8-00B4CC-E3; Thu, 06 Jul 2023 12:47:14 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8DxxPDOt6Zkd_MAAA--.3889S3;
	Thu, 06 Jul 2023 20:47:10 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxriPNt6Zk_dseAA--.51437S3;
	Thu, 06 Jul 2023 20:47:09 +0800 (CST)
Message-ID: <593c7547-02ad-da80-24d5-dd4a670c8cdd@loongson.cn>
Date: Thu, 6 Jul 2023 20:47:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/mediatek: Fix potential memory leak if vmap() fail
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongson-kernel@lists.loongnix.cn
References: <20230626185801.684451-1-suijingfeng@loongson.cn>
 <4f493bc2-45b3-13b8-f1b1-1729a803c74c@baylibre.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <4f493bc2-45b3-13b8-f1b1-1729a803c74c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxriPNt6Zk_dseAA--.51437S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUmYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCF54CYxVAaw2AFwI0_JF0_Jw1l4c8EcI0E
	c7CjxVAaw2AFwI0_JF0_Jw1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw
	0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUcCD7UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_134713_157898_19C85F71 
X-CRM114-Status: UNSURE (   6.51  )
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

Hi, thanks a lot!


On 2023/7/6 20:13, Alexandre Mergnat wrote:
>
>
> On 26/06/2023 20:58, Sui Jingfeng wrote:
>> Also return -ENOMEM if such a failure happens, the implement should take
>> responsibility for the error handling.
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>


