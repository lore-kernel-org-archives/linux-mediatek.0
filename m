Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A839DC5B543
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jun 2025 01:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xG0Wdkt+NUraD2HgOh+0AFsEQcpWyh1rmYJFEEo12N4=; b=cd6jEifzgD6y2LzDEdIQmHGdaL
	qlv1/dqahB5SKWwo83ETWrJm5tBXZ47Awtkhxz9qjtc2tQ7ZUtaTyZVtVOkllj7dRsko3PEwIRnvQ
	4GlEK+tO4KBLFg+gH0KoLPd+eS5IW/kf1kRYH1vUBncRU7mGvDQodKvi1HLl6mPikl8N+idHouKcW
	hznZJHpASEQC00SKHpkAdkLdp5YbSApbprZlyP8euKUZpzFes5iuNNSHuF3AfJEhJBLx0ImNRc+Y2
	qNMvftSZWUmaybqxJHcaCvVSKOCshTcBxcgtPwCLj+p2musJP7XmqogN8ysVDlmaer0WU5azlNxdq
	HRU0AvYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMzDe-0000000EUeC-1F4n;
	Thu, 05 Jun 2025 01:16:34 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMzBW-0000000EUTD-2Rpp
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jun 2025 01:14:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22e09f57ed4so14734155ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Jun 2025 18:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749086061; x=1749690861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xG0Wdkt+NUraD2HgOh+0AFsEQcpWyh1rmYJFEEo12N4=;
        b=anaFwzrZLie7c7VsPbeu/5KovXWqkJyLysOMPEivWPpupxJZif7TyexPgA2C2kGKfr
         qrDHejS29wT1X0LoyeCwclg6EZlu2wU51Qds4dhdW0YLt7yLn2kyEKaIIBDn8G8x8I2n
         1yhW+HbhovfkIL6JiJWHVeh2ghHUHUXlVFHeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749086061; x=1749690861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xG0Wdkt+NUraD2HgOh+0AFsEQcpWyh1rmYJFEEo12N4=;
        b=wgX2xPyJpD2WTdtR4d12qk4PMVzpaHiMcnd3e6seEMDxSBCnklSzfZ3orfJiqsqFaZ
         QU6hStw2MLeJuScXIxYJ860U4nt+GwCJkMiBJR1Yh19Mfqkdke3dHfr2G1DxF0Ap1ic3
         g3EhHUAuFD9hP7S0pfJf1UWhvOLcw2+ODv+wEtYSC8uXU1jqKCQ+A9DJZF3U+Rjn8Pqo
         Dkw6i7QpzBf6AemTqmtWTQpAFXditNfnPaJwmXfpFjYM3NIr6dj5yrKtZcWseqq9C5nR
         3ZKrmaUaNVleeM9dn/GctsPmp+/AdKSrT4NJzbdwpi84/Rx1fbLZQFIMhdlX6yCwn5jV
         T6UA==
X-Forwarded-Encrypted: i=1; AJvYcCU9skkkypzzIhL4lWKJNdCNUhn+/no8/xyknVDpD+2744WFshkRAysOGZv1ta6d/cA+ZqLr2Mx9WOTDdKydXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4SnnHQ/ZRjv6vdGEOzfhD8KUpr53BRcC6KKBYAcd52Giw5Ogh
	m9f4clOXwICTf5PwnFUO7O5RW2oFpPi3Ci2UtEmLXhbS8HbugSDYim1+8vKHJZev/g==
X-Gm-Gg: ASbGncs36tARQ4mfiP6b3vJkFM3sE0dFKvOhNCTkKPkzbWOeKWzFG4cHNXhXab0Ofsj
	MMENVdG56fhHF4oN7O7aLNY2ykP4/JOpd+3W0H5ohlPW7pFUc3MmR3PlBj/s4gfb+E5R4lQ+UfJ
	VN7LYZ1BYW8dnYflA6FFtai8XDN5xoqZ2ochH2rvidW7fVxeTJfhmlP8HJSaaXHwYCuizplx5r6
	SD4LU6pAj3oFaG8vrmgwvAvK5YEqaYSNlJ3DQJI16gDCnK+/shidVGKIBQNq22pJLg0FYQu++Hd
	29gG/K5MPKPYaG/GGpBtSamHP+FyvWTU8L2PYR5CU+cSIKssqj14BYUJNTSob2lBPA==
X-Google-Smtp-Source: AGHT+IGslAg+kZSR5r1KLQpvpTAyqVFFwVIFqW/069qKCAdAOWTjgfmHSrr73Y4oBWMXmc3qhryGWw==
X-Received: by 2002:a17:902:8f92:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-235f16b216dmr15063785ad.25.1749086061279;
        Wed, 04 Jun 2025 18:14:21 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:bc6e:7ca0:2017:eae9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd908dsm110307055ad.59.2025.06.04.18.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 18:14:20 -0700 (PDT)
Date: Thu, 5 Jun 2025 10:14:15 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtk-sd: Fix a pagefault in dma_unmap_sg() for not
 prepared data
Message-ID: <yf7ehbrvjj46xl7hkjukygnvy5z3ez43ewqch2mksx2lmkd5of@kthk42zpjabq>
References: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_181422_656177_C9DE1C59 
X-CRM114-Status: GOOD (  15.00  )
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

On (25/06/05 10:07), Masami Hiramatsu (Google) wrote:
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> mtk-msdc driver causes a kernel crash after swiotlb buffer is full.
> 
> ---
> mtk-msdc 11240000.mmc: swiotlb buffer is full (sz: 16384 bytes), total 32768 (slots), used 32732 (slots)
> mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=18 arg=0397A6F8; host->error=0x00000004
> Unable to handle kernel paging request at virtual address ffffffffc0001fc0
> ---
> 
> When swiotlb buffer is full, the dma_map_sg() returns 0 to
> msdc_prepare_data(), but it does not check it and sets the
> MSDC_PREPARE_FLAG.
> 
> swiotlb_tbl_map_single() /* prints "swiotlb buffer is full" */
>   <-swiotlb_map()
>     <-dma_direct_map_page()
>       <-dma_direct_map_sg()
>         <-__dma_map_sg_attrs()
>           <-dma_map_sg_attrs()
>             <-dma_map_sg()  /* returns 0 (pages mapped) */
>               <-msdc_prepare_data()
> 
> Then, the msdc_unprepare_data() checks MSDC_PREPARE_FLAG and calls
> dma_unmap_sg() with unmapped pages. It causes a page fault.
> 
> To fix this problem, Do not set MSDC_PREPARE_FLAG if dma_map_sg()
> fails because this is not prepared.
> 
> Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>

