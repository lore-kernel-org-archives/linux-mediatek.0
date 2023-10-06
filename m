Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDACE936FC
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 11:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkZAhzcVv5l/GWGZH+CNEm4JuaJPR9RYctj/ltot25I=; b=UHc6ctVAKesunQ1qRbHu87l2/2
	SLgUoLinkavV4MLP4ZBh4tYq5GJhWIqgoJ47i+0lWF1ON1YlzpU/2GiD9pdr9T70nIP/oH2rA3hvq
	Ws0XcHUnrWxH9fUBmaNriGr3AuTP76m2SxL6Xb+zahriRDg4m+nBvzGjnkgEmkEYa/uCji2Ta5MeX
	plqnDzQ/x2oP4tEnffY9wUOqZz/68/aqxAGuYDkH2GvM/ekwhXCclvxaiLlyy1Y1SBbgpA4dgvM7w
	H8WP6O2ocHcZRsWvCYatGhYw2KzrO/sPlNkBBHv6YznvDkcZALbRY3BKshTYZHWaSLxIGBreQ/IJg
	UXJEqVPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoikU-005fQj-2T;
	Fri, 06 Oct 2023 11:12:02 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoikR-005fOc-0D
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 11:12:00 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c87e55a6baso15024405ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696590710; x=1697195510; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CkZAhzcVv5l/GWGZH+CNEm4JuaJPR9RYctj/ltot25I=;
        b=YUtDrYaqHDfZWXWTXtfbalIXHt7nNRW7Wmcy2cCvqbFZNUde90/49HE9u7kCOxyaKH
         E5SipPeiIOlGMa/CJdC01msB/l2/EO3O1a9CJEc3MFlFw+m9zJetNbjm3ScWvI72VgTt
         T/dICPUSeZWrcYtt0QQbZT9vZKX1kiFZaOiGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696590710; x=1697195510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkZAhzcVv5l/GWGZH+CNEm4JuaJPR9RYctj/ltot25I=;
        b=MzssCYprnOs0QLFBBCWceUqmKIQQQPWl5EHZIh/+UzG7ZF4L1/KbsjaKFtjiErRBJI
         v+YKkdHpOiViczzxNlS+PehfPcr9UE63OqVJrDigJmcz7cIyNYi4iH/cD6873vzV8LX4
         zZ/ORGyDM2ExHmXn24AcPIGIDxK1F9dDyYI+XUnl6UGMlY+vnofmQkrTr4qhHjtJAFpF
         4tF7+IS9SNYuq1zz8XERWURINA7HV/kGVv4Q8Thlv7suBlUUT3Oh/9gl6PhRZvo7RMX7
         vEbtjZwE+vq3O3tDzvomoeyLpsqOSsALodeyGxMFMgmAR9l/26WlOXyc9Yu+S2A3Ikrt
         ZcpA==
X-Gm-Message-State: AOJu0YyUMxvMmvj6oOgj4YH/J+Hf9dpGuIj4cElP1Dfn7Mr5i+GFbssu
	CUkyAifr43fU3K/iy7MzGWlQAg==
X-Google-Smtp-Source: AGHT+IEnw2wOEXtKPkvOMaGQ/meYjnZqcW/2/XkI4MuRt4Jv7xi0tOnWU9TYjbFIEraXRPgIHyXmng==
X-Received: by 2002:a17:903:24e:b0:1c0:d7a9:1c48 with SMTP id j14-20020a170903024e00b001c0d7a91c48mr9046916plh.49.1696590710250;
        Fri, 06 Oct 2023 04:11:50 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:4afa:2f75:6a8f:b6ea])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b001b9da8b4eb7sm3539523plc.35.2023.10.06.04.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 04:11:49 -0700 (PDT)
Date: Fri, 6 Oct 2023 20:11:44 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	yj.chiang@mediatek.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] zsmalloc: use copy_page for full page copy
Message-ID: <20231006111144.GB17924@google.com>
References: <20231006060245.7411-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006060245.7411-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_041159_127867_E73F0B1D 
X-CRM114-Status: GOOD (  13.66  )
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

On (23/10/06 14:02), Mark-PK Tsai wrote:
> Some architectures have implemented optimized
> copy_page for full page copying, such as arm.
> 
> On my arm platform, use the copy_page helper
> for single page copying is about 10 percent faster
> than memcpy.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

TIL

I've never heard of arm's copy_page() before. Is it really much
faster than memcpy()?

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>


> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index c743ce7a5f49..b1c0dad7f4cf 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -1839,7 +1839,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>  	 * Here, any user cannot access all objects in the zspage so let's move.
>  	 */
>  	d_addr = kmap_atomic(newpage);
> -	memcpy(d_addr, s_addr, PAGE_SIZE);
> +	copy_page(d_addr, s_addr);

I guess you can also look into patching zram_drv.c, which seem to have
at least one PAGE_SIZE memcpy().

