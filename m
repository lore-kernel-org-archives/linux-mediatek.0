Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE680C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:18:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6280C22D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6280C22D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UT98beMsMIU8NZLJPnGW14DhCVpsUH0xw66cgiOVl0Q=; b=xrrIRMtcYiltKwzYY1R3TQej5
	lAPaxjW60zUDsDn1UMt/QXlW9tcREkxOIfrIFg8j7uiomdoxWgnuFBYwdlEbYAqLa6PXSoXpCTIxD
	/wsCXrSV5eHcrJGbNGRE2UrqsQj1n7+hlZircATDCiKttEF//jtdmU4GbyZVg6hz86md1dQduoiRq
	O1lG62trBopJeQSxq6PGq9IMyLbABh35IhjyKegho61MlGVW5RBRoEM8VgRYMpSiOy4ulj3NqKwtg
	+hUhvZSK+KdLBTO1D+UeUa2FeYZ5sqrTNzC8zhr8V9OyrWgQnjn84FsdLvqXi3xjYYzDQw4/opQV/
	GheY3UtSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxI4T-000416-Pf; Wed, 06 Jan 2021 23:18:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxI4F-0003qq-9M
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 23:18:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id b5so2435257pjk.2
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 15:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=indQo8BcjWbRXzRZ0T8BngRVCv//mmmu0O844tiaT4g=;
 b=R8nV230zvQAnflbm4TeJlSDkjzREroj58pd6hDZK7uB7vV6VtYIOaZuv5w38c9QHj7
 UA4xDdfcDZmIR0xBCSBHV1mtB2xAe80/b6Dg1PjDZEfo9Un4IO+2yPrfErAiIULydpdG
 Bnq8gZblQhNmbRn2tm8X21MO9nwLo2gZCPM2w+LYhiB7HRixkj2lqx186QmCHAM4Hc6Z
 RKIdDjqZ+QfTey3SmJKv1MX+CODbYSKRE+LW+NX/6ynEvyJGgc5iRz4+ZEUcARXUQ0zJ
 4EnGVigdZEexJfUSkDFMfJN8bNNb894d074MIjiIuIH2+7/nhSgakZ7UeBfhhq7LWqQj
 tbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=indQo8BcjWbRXzRZ0T8BngRVCv//mmmu0O844tiaT4g=;
 b=iE8x2UPtlO34IygpWXzfx2iRaBrFKnj8gxm9pPbxSf3h4jaAAiFeA7PNaRX6NyLXmD
 DTpeWjCAeMC4cNCQM1whcoqMgqNZotHNyoJCf8H786Lo1ADjkwQ2Lyarj5JjVqo0ouzM
 Wyb8uAURAQgn8BM05vTXiLpdBlKHTzTtosi0an2s6XqbfK2M8giGZOZOFdICRkjSsRE/
 3FnnaKqlJ89dhdC1A4FQYEh9RCgGijypzixPE5NTFz8cH9UliYHp1QQgISCwzcSNrRkt
 wvX0VO1yUovMPTAVog+SrJmRA6pM4itrlwF/zIWTwPZQmf1++u7dJd3brb4W2Q8PzLvm
 icnA==
X-Gm-Message-State: AOAM531pvnLeOD40ayy8FhvI5TKc6B8uKDL2HQ/niTF+k9PJ7J6AXKKd
 /QPKRYw65j04SAVZmxpRUktxgg==
X-Google-Smtp-Source: ABdhPJzdPs9nu4RV1o0ddWjYjCwy9pG3y21ZR8W8u9VqtmvdUWGqYr5OjPi8n+0KGl3quDn9wHwdZw==
X-Received: by 2002:a17:90b:4d07:: with SMTP id
 mw7mr5008012pjb.172.1609975092947; 
 Wed, 06 Jan 2021 15:18:12 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id t25sm3827483pgv.30.2021.01.06.15.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 15:18:12 -0800 (PST)
Date: Wed, 6 Jan 2021 16:18:10 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] remoteproc/mediatek: enable MPU for all memory regions
 in MT8192 SCP
Message-ID: <20210106231810.GD9149@xps15>
References: <20201214051047.859110-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214051047.859110-1-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_181815_477921_286E2B6B 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: ohad@wizery.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 14, 2020 at 01:10:47PM +0800, Tzung-Bi Shih wrote:
> Enables MPU for all memory regions in MT8192 SCP.

Ok but how was it working before this patch?  Why is this suddently needed?  A
changelog that explains all this would certainly be appreciated.

Thanks,
Mathieu

> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h | 1 +
>  drivers/remoteproc/mtk_scp.c    | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 94bc54b224ee..5f7cd2336cef 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -47,6 +47,7 @@
>  
>  #define MT8192_CORE0_SW_RSTN_CLR	0x10000
>  #define MT8192_CORE0_SW_RSTN_SET	0x10004
> +#define MT8192_CORE0_MEM_ATT_PREDEF	0x10008
>  #define MT8192_CORE0_WDT_CFG		0x10034
>  
>  #define SCP_FW_VER_LEN			32
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index f025aba67abc..130c0b9511df 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -369,6 +369,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
>  	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
>  	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
>  
> +	/* enable MPU for all memory regions */
> +	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
> +
>  	return 0;
>  }
>  
> -- 
> 2.29.2.684.gfbc64c5ab5-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
