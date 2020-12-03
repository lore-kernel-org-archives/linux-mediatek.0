Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542F8C4361A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 15:34:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB101206F9
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 15:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB101206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IETEpDsdg4/hpbrMIt4TJEEQROZ2lYX0M8onCSos47E=; b=avPP/MWGYEsrH1OkK/ZVOhhz+
	oUU8VlwBVx0Jic+Xaimq804imlgKrTLrErzZkH80kAXe/WDZzYKTc4vFaB3u+ckPd3pcvcSfDFa+Q
	m6i3htaXu2c8ycVPESsqaT9LJ6ZCbFLMrgESv2e7kkJiyeGjTS/Up5cEGYta2wx63rtKYZKiexBFL
	be1LZTsRsGhMAre6AeK+LZBb30+KyZAv+PROaV/twc+FAUjMMNGsLc1hKnogS5F9birklUu7AnM8p
	Idr3tq40p5UZDrjG/afsD28xakYBxoifa8a3MVQo6NimHKHC/gWP4H/o317JvBayAaGQtMCNsNSNV
	cXDCgBwqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkqcC-0000aq-93; Thu, 03 Dec 2020 15:33:52 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkqc6-0000ZO-Gj
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 15:33:48 +0000
Received: by mail-pl1-x642.google.com with SMTP id t18so1347660plo.0
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Dec 2020 07:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gd//BVtbrF5fIQYuVuMwSd46+y/wcSCEQb7Z0473XMQ=;
 b=barcV+xgeUTsOnM6H6n031a9IlXxNTl0S6RqfKjbbP8/OMSvhfZ5nbC8mKY19XarkF
 RUXmSEOXyT9ewEFxzXYZpbgUjJugYzW3MjXPKFTvmxdUIMT1tOZ3JTlVs6XB5V6yAuKT
 9+6A1KQnNFrscfbLxkG7Xy/JnKywHrGPnGRmuQSquceIwz3W6okYcRqxT342rvZfP0/0
 y7k7evIrMW1+4a8IO7eLnCW7lT/KAUMyqKUTzvzU1vJbIyXWdUup8qyMlH8SYpnNWE/L
 DlP2vDZ0w8K43M8aUnsuJzyuvp4aFaDnLbg5LgOqqhH6FCMWXgXhNG/sqPSZ0FDoeFOw
 mnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gd//BVtbrF5fIQYuVuMwSd46+y/wcSCEQb7Z0473XMQ=;
 b=tcIm5b6Hmt28H1lqGXxBG+8IHJ7cBoG1WcOKzBuy/vjVidj6r74pNcOXc2pOTwTd3C
 Mbzx+L+GtwtwsWwnFy7mRrRNdWeYfbkQYG57glH9QasJdw6M9p5bFLUr+e24N7QIwPKo
 9OkHRkw+5r6kQLBD6jBAxXkGWcC7l47+gcZm7489rK9PaAYYxHBt2bYlaQUXYXQSh8y2
 zaUoSJogfji1JldWmxWYiRMks0Xown+QJEJYG9qq+l/y7MI3sc7tRArp559VI6i/wQIU
 EyX3mWLIjnHrKfGC+WT+cbXSI35OyUbOxdagDaId+l9JGktSieKLhUVyGo3ZRIw6mcIT
 5qHQ==
X-Gm-Message-State: AOAM530wFfG6fXotNHIBTnVopGEQunxNt5ZsWj8Su1SmDWMLqsTTcKxv
 ZqvdkCUycxZPasjDT+gJ1thF/g==
X-Google-Smtp-Source: ABdhPJxyvFQey/fKSX93EFbjSsCaaXfm5uiD2gx3x4OYLyzPU7Hjt40N+4uhu6X3HkQycL4HvmobcA==
X-Received: by 2002:a17:902:c401:b029:da:6fa4:d208 with SMTP id
 k1-20020a170902c401b02900da6fa4d208mr3561055plk.33.1607009620776; 
 Thu, 03 Dec 2020 07:33:40 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id x26sm2117436pfn.46.2020.12.03.07.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 07:33:40 -0800 (PST)
Date: Thu, 3 Dec 2020 08:33:38 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2] remoteproc/mediatek: unprepare clk if scp_before_load
 fails
Message-ID: <20201203153338.GA1386676@xps15>
References: <20201203030436.3583198-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203030436.3583198-1-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_103346_938189_2B34EDF6 
X-CRM114-Status: GOOD (  16.70  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-mediatek@lists.infradead.org,
 pihsun@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 03, 2020 at 11:04:36AM +0800, Tzung-Bi Shih wrote:
> Fixes the error handling to unprepare clk if scp_before_load fails.
> 
> Fixes: fd0b6c1ff85a4 ("remoteproc/mediatek: Add support for mt8192 SCP")

https://elixir.bootlin.com/linux/v5.10-rc6/source/Documentation/process/submitting-patches.rst#L122

> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Changes from v1[1]:
> - add "Fixes" tag
> - remove an unneeded change
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201202044537.2500497-1-tzungbi@google.com/
> 
>  drivers/remoteproc/mtk_scp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 5f42b9ce7185..5e5705fe35a8 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -350,9 +350,10 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp->data->scp_before_load(scp);
>  	if (ret < 0)
> -		return ret;
> +		goto leave;
>  
>  	ret = scp_elf_load_segments(rproc, fw);
> +leave:
>  	clk_disable_unprepare(scp->clk);
>  
>  	return ret;
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
