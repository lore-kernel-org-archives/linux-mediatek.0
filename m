Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D30CD37AA
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 20:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ohc40rdkFpNqCvyZeX87gUeuQ9p1uMByBKe82TNbak=; b=oZIHgmBGfJuaTP2bw0hzFpiFlS
	XzQA2BDKDxMLgitWuJlAF2rHjtJJSWyqIBLzWTvjbg69nnpRAl/Jg0BnXhqWC+XwCoRAwb5FhLtHN
	6LXofyeXdjScGpwLSYbP43QX9Amk1eB+bXAqUHEN5XNi/+hVwdaW1uGJOWsr4LbEBjHop6u/AuOSY
	ciTCQ6pq4OJ605ZypKfJVJiRvRDbgxXM0nmEtti9GXzqZ0khCX4CFOiwKwhTSePkdrfucUZym+pSq
	Awmcrr61RhQ87AVebnfAaG+3u3hZa+4QoLCn8N+1Jjq4BWLaVotCyFZmIIbNIihPnH0ETEwzWr0uQ
	Xylm769A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFj1-00BLrM-0K;
	Fri, 15 Sep 2023 20:47:58 +0000
Received: from omta034.useast.a.cloudfilter.net ([44.202.169.33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFi2-00BLmp-3B
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 20:46:53 +0000
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTP
	id hAPHqblUQez0ChFhfqBwHV; Fri, 15 Sep 2023 20:46:15 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFi1qkOkxxtb5hFi1qfXFv; Fri, 15 Sep 2023 20:46:37 +0000
X-Authority-Analysis: v=2.4 cv=IOERtyjG c=1 sm=1 tr=0 ts=6504c2ad
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=l0hiEBf7AAAA:8
 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=ynCB8LqupOr-u-Kv-6Up:22 a=1CNFftbPRP8L7MoqJWF3:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1ohc40rdkFpNqCvyZeX87gUeuQ9p1uMByBKe82TNbak=; b=awqgyUr3IqvC14RazBVM+ai3UA
	pDPjDX3wFvhvCsqZwkqOEe1SjMRwqldgbBksO1OFRYeC+ks1k92hmEkJgS7ytkeAbiEArLIOkY/iv
	RWxgPYxbrKPafMUs+A9qL8o5ETw+rLk+04IB3/Tihjoce3XWYoV6Gxbe0YRdI7H7ikW46mm2Z+UjS
	QEBgFbUG0E4xDuFS5PJdCRNKDS/dvOEf072qongFWLvEp1yns8FZACdUEQ4jeRKp/YPYAfpWVxyWR
	OmWidhKMtWJ4votC3kNEyjGrvVpF7FHv+jIwWHac0pOLGbWfRgiqSMLQgP4RfjejYx2822T3RFHUQ
	6zmmXV2w==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:51670 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFhy-002axi-2b;
	Fri, 15 Sep 2023 15:46:34 -0500
Message-ID: <754beb7c-4eca-ebf3-6b0d-3eb5ccda9ed9@embeddedor.com>
Date: Fri, 15 Sep 2023 14:47:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] leds: mt6360: Annotate struct mt6360_priv with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Gene Chen <gene_chen@richtek.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201020.never.433-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201020.never.433-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qhFhy-002axi-2b
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:51670
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 239
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNXmMQm5lt97MrQGHw1MjCnEFuO5Equ86jNoUkP0VyxRokal8uxy4vrtg8pvXeGlaUWa3owntyOQsWXkrTxTGpYeGcCLOb8fxzfkEx8GRnWnLHqqi+w9
 CC9dXS70oB9mttygm5ORM4iRM+D2h2TdCIeP+KmOidq0SPOI+iiZqwz2hNMtuAstgUUVFCeKGgtuJemZVJ8WZycgx1J8yFGEs4zrGtazkPzeYNgmC9O2407v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_134646_409677_87977A61 
X-CRM114-Status: GOOD (  12.57  )
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



On 9/15/23 14:10, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mt6360_priv.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Gene Chen <gene_chen@richtek.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: linux-leds@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/leds/flash/leds-mt6360.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
> index 1af6c5898343..b70dc689b33f 100644
> --- a/drivers/leds/flash/leds-mt6360.c
> +++ b/drivers/leds/flash/leds-mt6360.c
> @@ -91,7 +91,7 @@ struct mt6360_priv {
>   	unsigned int fled_torch_used;
>   	unsigned int leds_active;
>   	unsigned int leds_count;
> -	struct mt6360_led leds[];
> +	struct mt6360_led leds[] __counted_by(leds_count);
>   };
>   
>   static int mt6360_mc_brightness_set(struct led_classdev *lcdev,

