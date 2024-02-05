Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CE9C48291
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 06:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpKnnCOYQga5vn8ITAi5OrOel7iL2Gt+/8Gm0Pg8Xpk=; b=Hf1hsveIRV7ACZu9lk//wwdQDR
	jJSTERFR8s4jKSldqIfEHDkt3hcSYLlfM4vkmYSIx0riZDm28dXblZIDmOQKPsRLKVqjvLlGsxnto
	5J/AMOQdr883PY/GDUw3bxbjKRYHgUg0tBnqGCluE+hfGW3goy3v5Pu141ub7+4kdRf+Ye/oKs6qL
	+MHQqtWtqcpgdlVAJWxjdkuSSgw+Vs0jHyh28rNPxtlLtR1dIvsQyxh0c0zB9tvWFKw0F5xk6Wg8v
	tKg4bqigQc2enBuyt5SEnTwPgb3vrmWPd6h5BNC83vTTlQEskfaZw2M2ChYgnrrFR3vCIjKlNncRS
	FitVdlvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWsoM-00000002CeD-1GJA;
	Mon, 05 Feb 2024 06:50:34 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWsoJ-00000002CdD-2Xqy
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Feb 2024 06:50:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2954b34ddd0so3444205a91.0
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Feb 2024 22:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707115829; x=1707720629; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpKnnCOYQga5vn8ITAi5OrOel7iL2Gt+/8Gm0Pg8Xpk=;
        b=N825bn2tIvsmrq8GTX8oy516e/KDRzAu/ST4aBWEa60+8CWfKD6PxGae75BtabhX3r
         YJ6iAtG5f8meIKvifT0ngoLG6CQ0Du2jOFaBrG5Q3MKFKVslYMLOL7kRHHSP4P2zI8sT
         rN2W74DbToqvxokEyltA4jJyXYV3BbZvwwIOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707115829; x=1707720629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpKnnCOYQga5vn8ITAi5OrOel7iL2Gt+/8Gm0Pg8Xpk=;
        b=OgqLk9FYJv+nikObvkZstm/+PNn0HoyaHc/szQKRpzLPDh5nVS+1IPLPfROlzw8G2i
         PzMDAl6XQTj7zxZpeSeKyq3z6WN4ECD7X/jAYeE64PqEqgZ4zZ++cnk7fgehxMbATfbf
         8nlFU2xoUHVfjxTEFVeG3nSf/GYsxsKPrO/qrBxJLBTFu/ig1adBIksZmJ0ZZtVNfyCz
         1a2/uvjHVh78oKMUCRhQYJeT7a7bxBAeX0zMr9raYplOpQkZr4GasYeamhXd+mN+QboI
         HBVhi/UjohWwxloHPCtJhXvZlnYM/Hakz3Opj5vWf4hg9vT/syHFDFl1jzFxJ2XKRNHA
         x/eA==
X-Gm-Message-State: AOJu0YzUbFZ7luhhyaoAD7lIGoyka78IJwz1BAm80G4Zu7dqXUy0RB+G
	ckraWoeL/0nD5qy4VwyzYnRWsr8siXja5m015v+VRpI1yFOK00RF0nqZ6wXSAA==
X-Google-Smtp-Source: AGHT+IG0H8aeLAvOYKXQnnEJD3qXYMf8kEawxoXZXlRZ2cUZJPYC+63FIOmTVYCu+bQUtbjz33aJLA==
X-Received: by 2002:a17:90a:e543:b0:293:fc07:22c7 with SMTP id ei3-20020a17090ae54300b00293fc0722c7mr12205375pjb.47.1707115829536;
        Sun, 04 Feb 2024 22:50:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWrrvS35Q79mS3tHqNtQdb2tO68fR6mrJvGRR0ysfRoULSlHXOTVCawWTbk0gZwXh1c3v1DEu753QH+YHr2JP7W2L/z9/n8HhN3QJ+j07DTzKxqLtMOq6H8XFRnetziNk0EQG4FSgc/SWmoHC3mNTCddrjNrgACLAEeCffsv81xWwzuYtIHorihkqXWZqgU9auqkeN/I4t05aImXuTzZXsZuXJGdVYYHU9i2Vi53DDhLVel2si2WGI/8XDtL26Dimnf16AJeluIDPpoEcy4MzvnIQ0Yv4+zgdp2sDc43FJbSkMCL47FCGTeqq8utANPs8eAI7ehs42pEmG3G61jC0Z4QZ77j7tShJJv4NIXxD56Gg7rxr/ScfPzFD1LkV6XSUHqZix5Dj684YHFctbD72BCi9QVRcfWzoeTXvF+5GHfO0ePAnNSGQ/qnLlm1+qWUwSqIg==
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id pt12-20020a17090b3d0c00b002968824041dsm2053378pjb.5.2024.02.04.22.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 22:50:29 -0800 (PST)
Date: Mon, 5 Feb 2024 15:50:24 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] zram: use copy_page for full page copy
Message-ID: <20240205065024.GE69174@google.com>
References: <20231007070554.8657-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007070554.8657-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_225031_677309_4BAF2060 
X-CRM114-Status: GOOD (  17.40  )
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

Cc-ing Andrew on this

On (23/10/07 15:05), Mark-PK Tsai wrote:
> Some architectures, such as arm, have implemented
> optimized copy_page for full page copying.
> 
> Replace the full page memcpy with copy_page to
> take advantage of the optimization.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

> ---
>  drivers/block/zram/zram_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index d77d3664ca08..58700dd73d1d 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -1338,7 +1338,7 @@ static int zram_read_from_zspool(struct zram *zram, struct page *page,
>  	src = zs_map_object(zram->mem_pool, handle, ZS_MM_RO);
>  	if (size == PAGE_SIZE) {
>  		dst = kmap_atomic(page);
> -		memcpy(dst, src, PAGE_SIZE);
> +		copy_page(dst, src);
>  		kunmap_atomic(dst);
>  		ret = 0;
>  	} else {
> -- 
> 2.18.0

