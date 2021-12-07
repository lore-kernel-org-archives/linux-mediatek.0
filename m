Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6452DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+iDLyy1Q2KL4VW26QxIoMT+9rUQ42PpFIOwmmhoSaM=; b=gk92XQzx9trrCC
	VzIxXHn8Nj9GiYyklKRy2A2BBGc/XyPZulwMEdLG4KWHCqfMdcIDPAJbmMS0k404vjgEZwDMY8gho
	SYy/gr1dkU/AOLbWCJoaDwQgQi3j2T8GbFrvTfzjWdDr4vfRX1OR58DD0iUE+tNEltk3u5zfPEPCJ
	o34N2+dDwmBiUjocgbWFxrgzKfHbbhKy1JTtHBwe1MLoqFLPgqNaLYyGa9oxhHbITnftClucXWqe5
	GELrN3OkSgk10i/o3LquIaiHi3IHE5wAppMs+FuUgfhz9lavbz6UVOd+TYiXyyKPVo/xY4zqXLKAd
	PGmizfhk22WN7qjvhssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mucqU-009LyC-07; Tue, 07 Dec 2021 15:57:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mucqF-009LsJ-Ao; Tue, 07 Dec 2021 15:57:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 990DACE1B21;
 Tue,  7 Dec 2021 15:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC755C341C1;
 Tue,  7 Dec 2021 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638892633;
 bh=wrbsse3acJeCEeYR4Lf4gAc+9H0xGhKHL3PYig774uU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TYTC/d+sMyDJri6M/pu7iG487aY5RcwzshvKFeGeMoZGIIYmZft9eFvHfPkWZs3z6
 qzKs+7uCVeqNNugstO/Ax+j0iF1wEbzzn0Kq7l3SoLXAKDTWUfvR7xxSGY4RN+7c+A
 pg3D5v7ARfUVmr2Lzhi6sQyN7IaHiAj/vISAm5qZ60bTUz9vXeIvP2/KAdAeFSHQde
 7tScDMEeJlcYgPNqxKUCdeGL67jY2lFDuIEXowt1a1B8nhiWK6cbFYWDr45q1+MY38
 5B96Ll9Q0cUXVxZ0SbyqvqOtwzBnCrZ23kvRkoWNNKe6cpazYAtmISTr8Q5zEb+WnM
 XVLZ6ffgL2+AQ==
Date: Tue, 7 Dec 2021 17:57:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: linux@armlinux.org.uk, matthias.bgg@gmail.com,
 rmk+kernel@armlinux.org.uk, arnd@arndb.de,
 akpm@linux-foundation.org, linux@roeck-us.net,
 wangkefeng.wang@huawei.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 yj.chiang@mediatek.com
Subject: Re: [PATCH] arm: remove [_text, _stext) from kernel code resource
Message-ID: <Ya+EUDVYdBvRa7xI@kernel.org>
References: <20211203141416.31121-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211203141416.31121-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_075719_582084_B43EBDAB 
X-CRM114-Status: GOOD (  23.44  )
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

On Fri, Dec 03, 2021 at 10:14:16PM +0800, Mark-PK Tsai wrote:
> Remove the [_text, _stext) from Kernel Code.
> Although there are some startup code in head.text, they
> are freed to the buddy system after kernel boot.

Hmm, I don't see it is being freed anywhere. Can you elaborate when and how
the range [_text, _stext) is freed?

> And we have memory protection mechanism use this
> which have false alarm when some other IPs doing dma
> if the dma page frame is in the [_text, _stext).
> 
> Below are my iomem resource and reserved memory information:
> console:/ # grep Kernel /proc/iomem
>   20208000-219fffff : Kernel code
>   21b00000-21c2e76f : Kernel data
> 
> console:/ # cat /sys/kernel/debug/memblock/reserved
> 0: 0x20201000..0x20207fff
> 1: 0x20300000..0x21c2e76f
 
What are the addresses of _text and _stext in your configuration? 
What these dumps are supposed to show here?

> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  arch/arm/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 284a80c0b6e1..85ffc9501e38 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -851,7 +851,7 @@ static void __init request_standard_resources(const struct machine_desc *mdesc)
>  	struct resource *res;
>  	u64 i;
>  
> -	kernel_code.start   = virt_to_phys(_text);
> +	kernel_code.start   = virt_to_phys(_stext);
>  	kernel_code.end     = virt_to_phys(__init_begin - 1);
>  	kernel_data.start   = virt_to_phys(_sdata);
>  	kernel_data.end     = virt_to_phys(_end - 1);
> -- 
> 2.18.0
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
