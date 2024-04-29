Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DB6C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccLW8G4p0SZdUcyq5g3vEvqzDaahYIMqvrLLmreu1Ow=; b=MxCkd6nLgDW5+c+JBr3xyCczUg
	mLgIw3n3P/W+DH3j6Zb/LLfgohG+X7r0Zwl3gms6tqGq0+LtJPPiaagAuK4mYd3Cxj1EdyWaA/2VI
	cW+CZzjNitwnF/iWPcUHxTIFmn6iVUO2rR9ILT13d2WDAccGWITvSvFBfQ9UhS2k8e68ivcdqW7/O
	LOCor8YvUclKv0+fPntyz//z87dJb4ncZSPFGBHGNp+CJD2L8Ygob+AJxoyQoSX8VUbPN6MJij4hx
	su7KFyjB1Iq/PNF67OwwjMm8prVLFGFM51ZV9RR/yMb9ehP3f+MbVkJv7tBwc02T1yN81iJVBZbk8
	7QnzOKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1M9A-00000001vRJ-3Ujn;
	Mon, 29 Apr 2024 08:14:00 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1M8v-00000001vJ6-0teU;
	Mon, 29 Apr 2024 08:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714378423;
	bh=b1SZPFe+NuDhrNOpdqekcjo4NtR3t0eI9LUZWGBoZ2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vg1xro7DPLUieeWf4MObveLWKyTiikAkK/pIXlJjlaVz1tL7cQAaQZ/D4oqAM4zxl
	 r8HgExOz8TWgAjPjIxNuvBgu4ocTRCXoe8gtXqDUEARqmN+YrYdXZLXI9l8ql1MN+8
	 1UdT9QCggwJOAhtCkRKpui32Xh+CIYbhY6sVlUF67I1mH0QdznTYVqDkbvnoXSwpxK
	 zujgqfYEcjqfs0nQnJuNXOWJcbALcZY3vPvko8QDLBQb63YNEE57FZZNhUPaL1OujJ
	 ZJJgXw9809tFTIFZQUI5dJ5p6oLHAZnuPjwxMfyIY/I6AgKlJdGDNkurH9MsNO9/P9
	 S8lBqPVKa4y1Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1BBF6378134F;
	Mon, 29 Apr 2024 08:13:43 +0000 (UTC)
Message-ID: <16df315e-8a05-49a4-ac07-d1ed150c9317@collabora.com>
Date: Mon, 29 Apr 2024 10:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: mt6370: Remove an unused field in struct
 mt6370_priv
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <e389be5e1012dc05fc2641123883ca3b0747525a.1714328839.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <e389be5e1012dc05fc2641123883ca3b0747525a.1714328839.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_011345_978240_D193A7E8 
X-CRM114-Status: GOOD (  14.40  )
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

Il 28/04/24 20:27, Christophe JAILLET ha scritto:
> In "struct mt6370_priv", the 'reg_cfgs' field is unused.
> 
> Moreover the "struct reg_cfg" is defined nowhere. Neither in this file, nor
> in a global .h file, so it is completely pointless.
> 
> Remove it.

Sure

> 
> Found with cppcheck, unusedStructMember.
> 
> So, remove it.

Again?! :-P

> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>


Anyway, this commit misses a Fixes tag; please add the relevant one, after which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Compile tested only.
> ---
>   drivers/leds/rgb/leds-mt6370-rgb.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
> index 448d0da11848..359ef00498b4 100644
> --- a/drivers/leds/rgb/leds-mt6370-rgb.c
> +++ b/drivers/leds/rgb/leds-mt6370-rgb.c
> @@ -149,7 +149,6 @@ struct mt6370_priv {
>   	struct regmap_field *fields[F_MAX_FIELDS];
>   	const struct reg_field *reg_fields;
>   	const struct linear_range *ranges;
> -	struct reg_cfg *reg_cfgs;
>   	const struct mt6370_pdata *pdata;
>   	unsigned int leds_count;
>   	unsigned int leds_active;



