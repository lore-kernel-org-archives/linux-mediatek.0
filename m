Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2E8E94114
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1oQgMYYOHJAqGUemakHE7gLhffpSOgun7mdtdcyLAY=; b=Te3h0eFxufJedlNouo0/8vCDAf
	SoxsWJ2udQWu+Vam0B9QgxR3VWwkUGCv1u8rlFehiICQPY1/htZn0ssodyk+P16i/pP9YxA0sJqqO
	xfbnJn6w1sYMhixiqsNx6dpaIBSx4coA7wwLmtDR8js0T4HNtZQaeKHM0xaF1FQK5S89B3SdnFIMa
	lQ6WQHkGJi7/uoIcWHxxdfWmyd2NF+OXwToo662yA6qXdTptSjzjY72FItHkgK1bsSheriqxH36t5
	laRQjUVCqI9fjuwAjAJW6MhwLj8roq4inoJiub9Py0QCVzb3lKZMQhSshu2I1C3ahbMpDB8tnKJQ9
	5ceXEaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qorK7-006RmV-0k;
	Fri, 06 Oct 2023 20:21:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qorK2-006RlX-33
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 20:21:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c3d8fb23d9so19743955ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 13:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696623674; x=1697228474; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N1oQgMYYOHJAqGUemakHE7gLhffpSOgun7mdtdcyLAY=;
        b=FR1jN6gdtJOXUnGBzPBt41Dn1el2EnSC6WqVp5ZXHIrGwRo3ARdrIzCRwwxVwBWACV
         FQjrD/+rZ24CYbnsGBb52s//L92KcOlN9cJ9d7f1kEhAfUevqgm78BZtf9IJzyC+mxCs
         R5WvQM4yG622K9P+xg26HMkg5Flv2uAfB9yjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696623674; x=1697228474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1oQgMYYOHJAqGUemakHE7gLhffpSOgun7mdtdcyLAY=;
        b=xUD0xy41f/Uj9UlNVuv5+0y1YnK9gpLsbD5qb+/nmcdruch6gYS6rpbWxNoZhDFqV4
         pL2ftETL5px29rOD5kU2bgo5btZjCf3evEYWmtMfKAqxGQhId0kjNODMLUc82+CD7Iu9
         TJtYns+I4XixelekgVIW9qn13+dZAjzo0PM3kVLoMnXmSG54r+Fmj252Gmv5Yftrw5Yf
         1T9MrTJEN2Ig7tQLDxiYYeeU9yVn+4C4eZoAZwkGvXhXIldog2UsoLd8Fvs84FTZSygo
         HIoloCVkbj3EDNElsYQ0wtktQ3As5fmrTnlyZQEgnnU1SKczkbHZP3VPsSU5httNRolj
         21OA==
X-Gm-Message-State: AOJu0Yz5+6joSiF5hZvcZAopJeNnIm/kZ+dzrZiK5pXt3R8XG/9frkdQ
	j2XPlRVx8V5yfwDEcf9r/tpGyw==
X-Google-Smtp-Source: AGHT+IGu32OJlQsQg2gdMOhdV/v2W3V3QUsAfaY6LRJfqpsCLXyocjInS1I983619DISa2FBj4aXpA==
X-Received: by 2002:a17:902:e810:b0:1c5:59ea:84de with SMTP id u16-20020a170902e81000b001c559ea84demr11148430plg.29.1696623674642;
        Fri, 06 Oct 2023 13:21:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ji2-20020a170903324200b001c75f94b0b0sm4333924plb.213.2023.10.06.13.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:21:14 -0700 (PDT)
Date: Fri, 6 Oct 2023 13:21:13 -0700
From: Kees Cook <keescook@chromium.org>
To: Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: Annotate struct mt76_rx_tid with __counted_by
Message-ID: <202310061320.8630F7E51@keescook>
References: <20230915200612.never.786-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915200612.never.786-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_132118_986026_A516D4E6 
X-CRM114-Status: GOOD (  17.56  )
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

On Fri, Sep 15, 2023 at 01:06:12PM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mt76_rx_tid.

Friendly ping. Can this get picked up by the wifi tree, or should it go
via something else?

Thanks!

-Kees

> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Felix Fietkau <nbd@nbd.name>
> Cc: Lorenzo Bianconi <lorenzo@kernel.org>
> Cc: Ryder Lee <ryder.lee@mediatek.com>
> Cc: Shayne Chen <shayne.chen@mediatek.com>
> Cc: Sean Wang <sean.wang@mediatek.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
> index e8757865a3d0..03ef617b1527 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -376,7 +376,7 @@ struct mt76_rx_tid {
>  
>  	u8 started:1, stopped:1, timer_pending:1;
>  
> -	struct sk_buff *reorder_buf[];
> +	struct sk_buff *reorder_buf[] __counted_by(size);
>  };
>  
>  #define MT_TX_CB_DMA_DONE		BIT(0)
> -- 
> 2.34.1
> 

-- 
Kees Cook

