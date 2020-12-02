Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5116C6369E
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 20:35:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6641121527
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 20:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6641121527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n9W7ipm1q0lfxrUh83DOnMOeVaqY4azwg9yQ9xwzor8=; b=2aR7FrYX1OhJm2m8KUO2tKQYm
	a8tEEp61XXFqvMswzWG+GhPCdB5sX5hOum0I8aaccfU6T5FDdYSPfsG2zBEqrDRNFi9jcpxr25tlm
	6iNuED/BsuRe2OuvslRKAYOm1+IbAd5iXotVpZ4ZG5+4/9KOJni8XfqJIUoMhwaFdkUrKRFWfivQl
	7fCNFc2hzJ4K/2W9Hu0rtzpMVkUxaBv5dFrLcO25rQVieI5uXuNMEoxuitk1v/TU/LyR7aIb3aX3I
	Bo60HY9DktSpZ5hdoo99ywcqSvlDTnCkZWR53wQpj3K4G5W7lPLeclASTEZy8E7quw4IsDx62FRNo
	P8HYyHd+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkYqI-00013K-On; Wed, 02 Dec 2020 20:35:14 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkYqG-00012K-0h
 for linux-mediatek@lists.infradead.org; Wed, 02 Dec 2020 20:35:13 +0000
Received: by mail-pl1-x641.google.com with SMTP id u2so1765447pls.10
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Dec 2020 12:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DJDfzlDfTnrfdlzBEpegCQHAti8FUO1LnfZw8Lau0fQ=;
 b=C+knjGEmhK41qutbbphKO4J4NrbDW26y9QH8+LHd7EvKLqHCEGkkZYe9M7SJC+NvAu
 YVrc7DgTKBl37RvOJxMjZviMbl7E+EEL0hdzztKsNBNyUl4s03BKBfhsul1YimNxANz1
 LohNMAcwL1tVXDnsMGnR9Wrx42jw/NWJHx40rRZgoL6FKb2D2XDwDsivMHh8kQPh04QM
 iDcLelQl2Q7KQcZkUdPB816L6bCqkzZ8JGpC3PXzStS5bnsoubKMx+he6VaN80K1WtCF
 rOti1lK98j6v4q3HH2GbKZYf+misH2waveH8dqTNNS9Yzfbq+tlb8Jr2UihrwfAapKzX
 YEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DJDfzlDfTnrfdlzBEpegCQHAti8FUO1LnfZw8Lau0fQ=;
 b=Ge9yajEK0ISU/C0HZf2wOyuoUgVC6TOpx3BUV9MfQDC98KRz6XwxjBwBV9RUMfcSUr
 CRrAn5eAMU64lJlKhJvFjrDsoySAI05SI4T7J7JQ0SKo9iQ9arfqC1YzxQAq7FmagfRD
 F4ZP+BFNm/H/jlZUjMjo34r4jivMvneAzafXkmZpjg5nvQWb81Fa0cQzDMsvKjIk/mAB
 MUJxZ05Pv0zlsRfZp056cpEpslUWAnjEajFbObZfjsvdYbcL7g7ex3adHxNJZoVhYiZU
 fY8dvl9KA8zg/5mfG/h1PlIuTSeMmk+hOiWqfDhjssO1NK1lTJbnpPepqLko4YAPqcxj
 xHBA==
X-Gm-Message-State: AOAM530A8AsFpHHCNpDkiauaM3yypWpfa1Ncv9+uvCYrwGF6i4AKFUsB
 TeNy4vWCLQfsDqyWAycMoXBeAg==
X-Google-Smtp-Source: ABdhPJzMsAlGSS2amauxNUiGiVKwN3GZ0vcFO+QU6J+ByDlC0KcIIuBQu6P71TTmuB9sxoB2samOuA==
X-Received: by 2002:a17:90a:bd16:: with SMTP id
 y22mr1465841pjr.203.1606941309922; 
 Wed, 02 Dec 2020 12:35:09 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id b20sm553096pfi.218.2020.12.02.12.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 12:35:09 -0800 (PST)
Date: Wed, 2 Dec 2020 13:35:07 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] remoteproc/mediatek: unprepare clk if scp_before_load
 fails
Message-ID: <20201202203507.GB1282360@xps15>
References: <20201202044537.2500497-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201202044537.2500497-1-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_153512_223087_D6D601DE 
X-CRM114-Status: GOOD (  16.55  )
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

On Wed, Dec 02, 2020 at 12:45:37PM +0800, Tzung-Bi Shih wrote:
> Fixes the error handling to unprepare clk if scp_before_load fails.
> 

This requires a "Fixes:" tag.

> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 5f42b9ce7185..c7d49c861adb 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -350,11 +350,11 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp->data->scp_before_load(scp);
>  	if (ret < 0)
> -		return ret;
> +		goto leave;
>  
>  	ret = scp_elf_load_segments(rproc, fw);
> +leave:
>  	clk_disable_unprepare(scp->clk);
> -

Unneeded change

Thanks,
Mathieu

>  	return ret;
>  }
>  
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
