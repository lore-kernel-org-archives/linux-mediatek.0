Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B01FE95A8E
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Oct 2023 04:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IsMeRH0QRNKYNVq9/tm9ZJNkwgPtdPqq26qQy2Ffdo=; b=40F1xP3nJ4IJfA9YF0BLwM0Wv3
	63vQDs3FJKdAKlEdR7HTPZOePVW6sogdbEksu/3pyLK23tOtanpl4A7Qe7C/GYk1+D3IKfd5hNgGv
	ieZ/yAP21sq6j7t8txm8Fc4bduujaHRpSjWwViRYhriIj1ph0nvU0FqKvYksDDH6tSe8AtXNsOAEk
	B+2hvU0NAa0mQTtupOowl3vGu0JI3SktK8vdWFnzGFcwlroyhexLRyBjiF6WbFan2HxdQjK2F4ddo
	mDssvmadP4B/r34+Q+6PgqEYK6BposKCfiGIBstMNTFggTolJ7Wx7lg7LoqoT2Xm0SbWvqHlJ0sTk
	2Z5Bfoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpLZO-008Ib9-03;
	Sun, 08 Oct 2023 04:39:10 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpLZK-008IZp-1H
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Oct 2023 04:39:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c7373cff01so33801525ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Oct 2023 21:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696739942; x=1697344742; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0IsMeRH0QRNKYNVq9/tm9ZJNkwgPtdPqq26qQy2Ffdo=;
        b=elN9ceV/sbfiVe8ONi4Wjd3VcGCu9uejf1xv26XdtgkuqLIFAfQICaEzttzdFiT2xE
         tpxllLgfgUr5lKWQPMaAtJQ1IQnSFneYflK9AmHwrFCvYfkzJF/fIyiuBFUirU66KxiB
         3rlvgnlS9eXzQat6HVAe/ftPsgKVgNSleHoeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696739942; x=1697344742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IsMeRH0QRNKYNVq9/tm9ZJNkwgPtdPqq26qQy2Ffdo=;
        b=oYUsYhEcEE2dqUF322C6fHgu8S268EdQclHpRZ4U/WTJNOoZzIK9oyL0oKUm08Cg4o
         4WnxTXCgfTPQrXo89ix6rxJF4hNvt7AJk87qD1A/FluM2EvZcCNL4MBYeDmkB2EuKRud
         31wZdPD0RW2ui+ZITXisNlZ7Q+J0k89plqsvNN5TP+X1BVEZmdQzhZpUXgkg/dxVI9Y6
         yzEnYQBwCZbnD6X1yb8DoXCw0/Ze9IpwOVdLWvBmJ7Wy9QtFfA0IM+q7KDMGdeTi6aF/
         /8uLHf5CfJNz9x2IThnJ8FZC9CKwh0bzb9pDVH4jkJRixPsASigB5AfcvIrt1kBXnWu0
         RW3Q==
X-Gm-Message-State: AOJu0YxW2tnQSQw/1NQJmPTNxkuIZwbIGj6de6oNoRE5KACWWa92e4sU
	//pqi8gMd1uXND1wQiMoV6eBZw==
X-Google-Smtp-Source: AGHT+IF/FgciWLEkO+rHo0i3RaI4sgAv8QYL/KWMB1vlhmp8wyjNfPRAim7iW2undRDY1Stzw+4xAw==
X-Received: by 2002:a17:902:e84c:b0:1bc:4f04:17f4 with SMTP id t12-20020a170902e84c00b001bc4f0417f4mr12703406plg.30.1696739941503;
        Sat, 07 Oct 2023 21:39:01 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:5275:a34e:f50f:5f52])
        by smtp.gmail.com with ESMTPSA id b1-20020a170902d50100b001bdb0483e65sm6727218plg.265.2023.10.07.21.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 21:39:00 -0700 (PDT)
Date: Sun, 8 Oct 2023 13:38:55 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] zram: use copy_page for full page copy
Message-ID: <20231008043855.GA2738554@google.com>
References: <20231007070554.8657-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007070554.8657-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_213906_441345_5B778D9F 
X-CRM114-Status: UNSURE (   9.06  )
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

On (23/10/07 15:05), Mark-PK Tsai wrote:
> 
> Some architectures, such as arm, have implemented
> optimized copy_page for full page copying.
> 
> Replace the full page memcpy with copy_page to
> take advantage of the optimization.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

