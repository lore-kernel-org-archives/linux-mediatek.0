Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBC5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 06:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHRohcwnzDGWqx5gymLoaYPeH1SI73Ho5zn1Shkb5ZM=; b=PCGLkzJWaRsPw+
	W3K4RKQtRJmtrWCEXRgJRk4WpKPt+rSFFsBsatzcNE+zGJ9fwiJbzfW+/CcIRww6gTYz3eks9/HUA
	s35VyeVwGJevA8ahdvdIvlNXryERR9JkGJTmo4cn2YCigpMgJASh+3JsXOGd/F525hTHJb+EL1QBH
	ExmBGQCrWDXkcH3Tsaxoj2cYyh4B1cnemDDGka8MlLZDBpd9WJK1YBsu82db5mPVPWwJOmQfdTFAS
	kJOzo3PnRiAPSV3QW0Hb9wMEQbKK2lmeu4wiSrgA0ZobAy55UkNXSR88+q9/dTo/tv01gckhGujBI
	0EDMTQ6+sJxLFB1dfmEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqUlZ-009IsF-3a; Fri, 26 Nov 2021 06:31:25 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqUlL-009IqQ-AR; Fri, 26 Nov 2021 06:31:13 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4911758030B;
 Fri, 26 Nov 2021 01:31:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 26 Nov 2021 01:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=TQT7bhXqwH8akKiIgle7DOfwOzq
 sXFgyjCJ+JSwVBvM=; b=UArY7GF/grHcjnLfBnXEUU1gwzqTyNaaOluwb+sg0Eo
 pm+/1TsfpLJAebvBYApjuv3QnnnlEa3HKiaUw0P9fxcA8XHtXWdnrWB6sAwvLghr
 LOvI9XUzjoetQ7FveDlUQAeKg8j8FYqbdK43JJXM+GiYg58cOSAI21yr+b4cxxoM
 OszMI1XHTjBFRX7/Gu1lFy/6jg5XBUrEim4Fz5YGMOoe554GfMxmBrs72PDEP0xg
 Twv/mANVLQoUrK8AtS7bFKIgj4+WdMrCyOSAqYbHBgb68AiUBTRs5wlU4U5MOAja
 IawCmEDPlpOyGCwnyvoSkIwlNuxwVJTHw3clze+/mZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TQT7bh
 XqwH8akKiIgle7DOfwOzqsXFgyjCJ+JSwVBvM=; b=ad7MUCGgy6GBCEqiy5C7uF
 ENvuoMF/KjO9QrM9e+6Lfkql40q5ow+9hhnHEjNDZ0/v0R7eBG+dbTVPRg45BseY
 l6gY4gC/yALZBstQklXQfqD4FBY+g2bFVHBCDHfB/MaI8gEciv4JrkQ6yhxBrKz1
 CGbqK6u2RIS7vXeNUVfmhjyT7Tn+vfL90md6jHPu9Ueu8HrkWljf1niHkQCDocoW
 CaUyH3Psf9Q7ARs3nafg+tDn4VnCCTVOknEiaYbfxiG7Fdv6imBrkTFyijuFmkaH
 1BDnujDlMfsYcznk3Zmu2vrST6xQ8S63AWa4KUxxZ5tTsz/Pu9c7qQdxIaygrzXw
 ==
X-ME-Sender: <xms:J3-gYbgcJ7yuOd9PxPF7z6PUzVcR_5VDdV8atw8k7Ay6OiR9EabrhQ>
 <xme:J3-gYYCmCpJxWZh5GwcOX9abxzx6nWFs5JXay71t0m3W-qzumEF6ZXT_67GjD3Ksw
 JVBrl8GJsYpPw>
X-ME-Received: <xmr:J3-gYbE8gDUQBc2O0-GjvN0MDTqjRvWxBoOuptqQU9aRGWTCcZD6Ednqpvz5dH-YyVj0S47HffvL0d2035sbccQtgMwchpU5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedugdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
 dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
 ucggtffrrghtthgvrhhnpeeuleeltdehkeeltefhleduuddvhfffuedvffduveegheekge
 eiffevheegfeetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
 gtohhm
X-ME-Proxy: <xmx:J3-gYYRJMLRkMk3wyBE0Iv5OCuMK6kiSI-TXUIV8c2nhFI-hcKra9w>
 <xmx:J3-gYYypj5QB_CACUx3mkprwpqxZmTsm6Qj8en4BV4UyKs8jn2_aEQ>
 <xmx:J3-gYe6UdYl0Eb_CsMSzKsj3799OfW3C_EshpDEE60S5X8eTugPQWw>
 <xmx:KH-gYZT9W9xTQhOIPR-7TKNmuMW6_Ud9CatWFziCagno6socGADzTQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Nov 2021 01:31:02 -0500 (EST)
Date: Fri, 26 Nov 2021 07:31:00 +0100
From: Greg KH <greg@kroah.com>
To: guangming.cao@mediatek.com
Cc: robin.murphy@arm.com, Brian.Starkey@arm.com,
 benjamin.gaignard@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, john.stultz@linaro.org,
 labbott@redhat.com, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lmark@codeaurora.org, matthias.bgg@gmail.com,
 sumit.semwal@linaro.org, wsd_upstream@mediatek.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] dma-buf: system_heap: Use 'for_each_sgtable_sg' in
 pages free flow
Message-ID: <YaB/JHP/pMbgRJ1O@kroah.com>
References: <eb6cc56d-cbe0-73d5-d4f5-0aa2b76272a4@arm.com>
 <20211126031605.81436-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126031605.81436-1-guangming.cao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_223111_566077_4F44F0B3 
X-CRM114-Status: GOOD (  20.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 26, 2021 at 11:16:05AM +0800, guangming.cao@mediatek.com wrote:
> From: Guangming <Guangming.Cao@mediatek.com>
> 
> For previous version, it uses 'sg_table.nent's to traverse sg_table in pages
> free flow.
> However, 'sg_table.nents' is reassigned in 'dma_map_sg', it means the number of
> created entries in the DMA adderess space.
> So, use 'sg_table.nents' in pages free flow will case some pages can't be freed.
> 
> Here we should use sg_table.orig_nents to free pages memory, but use the
> sgtable helper 'for each_sgtable_sg'(, instead of the previous rather common
> helper 'for_each_sg' which maybe cause memory leak) is much better.
> 
> Fixes: d963ab0f15fb0 ("dma-buf: system_heap: Allocate higher order pages if available")
> 
> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..8660508f3684 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
>  	int i;
>  
>  	table = &buffer->sg_table;
> -	for_each_sg(table->sgl, sg, table->nents, i) {
> +	for_each_sgtable_sg(table, sg, i) {
>  		struct page *page = sg_page(sg);
>  
>  		__free_pages(page, compound_order(page));
> -- 
> 2.17.1
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
