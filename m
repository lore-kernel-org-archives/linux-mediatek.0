Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA13C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 21:51:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1153823406
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 21:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1153823406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TvBqm9OYpYj4+oJQsBMNCCw97fGRixXAaZoOW7x0ESw=; b=OzZCSwL4ugSZDA3A20KQuqgdf
	9v5a11EOOwSADaQvJXcIxB5ZWJ9fbKbtdm74K2VcNaYz6mscCUO75rlumavqYdvotGgdNT8p0uBJ9
	UPfW/H/94ZWQlBrWHDu4BTjakXjdmpIa+8qWkwnS0/ge2I+ZTuK2yp4IKu+GFy3msAesNohI5OUCB
	Qe1ixSEPI5nO76IkI5KXHPtC09ZdUoCpzdptw9UM3zktPaQbyNj97AqkwUutqIcZLvipy7ISsh78M
	pzPYjldNhnNDkY9P4RNQu6lSUp0cYz7uZCxmo7JO2wsCOuUTpV0WgBxQohJIXZr+5H6NU4b/mz6v3
	lqZqkkeLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxdBN-0005Nn-1i; Thu, 07 Jan 2021 21:51:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxdBJ-0005MF-Ue
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 21:50:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id g3so4517819plp.2
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 13:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uw28iSl5y8aqxwZIYKIrfSUBToG10LDkBuDH9Apkh7o=;
 b=V99HHI70hgC8uhJ4/d1qVv4HDq07qqzh23fVSWdmXaH8TEoYOCeclao664ZEDxV0n+
 ERR7J42+75Ho6Sw64CRGX8b43xem9LrXd4PhC8BEFYkVlX/1VjV9QucFC9BmwsT4diZG
 3hf572OsZvtU66+/ofAKW7IEIAmaU9XbfkykqzppFUNX5/UIXkzgFr8VIwlYNsn97mT9
 Fpis7AfqrsvyCyx3AVsJh1NPEDe9VIwTbC1vyO9llYUAQBeFM9KL1+MBUtE2cKPtqGBY
 sX3RekgctotcR5peaoxSIpVL5xrDWik74DGcajR/DHQb/jrc97f2upijcBtzr0FTI6/Z
 V7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uw28iSl5y8aqxwZIYKIrfSUBToG10LDkBuDH9Apkh7o=;
 b=r0S/NxkLwYLN6m+37ylOgxSijkoeNPAIsjoVer+jaOuoCU/kJfdbDpoUVuiE68iO4s
 pXnkY9iGU5wt90GB2MWSy2FzDhISWTLJaGEvcgSV48XNgKzqPITem4Ik36rqtFglpCBU
 RKrXVFwcE2zJOleMvo9p0eX2BD0f15MGjz1d0h5/RsZdGYtQ4wwDDP/e4MdhMpq5ALzc
 vsfWJpuJRYFXu5Xl+WP6orZrEBtUOuG8hNwkieDyC7UyBer9tyxwi5bo3qlU7V51pEG+
 NhkG+yZSS3lz01sagsBsMiIb7JgwEEwtTnU8xNI6snq39qMrwI36jF4ly5nCoyqXPwtZ
 juJg==
X-Gm-Message-State: AOAM531KZpu0U+g6V/+XJD8zcXC3pndz6KcLxruknSo2+UKAiew9Xxvo
 RBdDX+/1lcDKZ2IMSN2eJo/kGQ==
X-Google-Smtp-Source: ABdhPJwAWY4rbvoPuyfQ9PF72eamwyBXspTaMcknhM0xeBVWbdgpL023Ily+Xrw9JvD0wx4wRpwVbQ==
X-Received: by 2002:a17:90a:fb97:: with SMTP id
 cp23mr453605pjb.215.1610056255559; 
 Thu, 07 Jan 2021 13:50:55 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 92sm2974663pjv.15.2021.01.07.13.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 13:50:54 -0800 (PST)
Date: Thu, 7 Jan 2021 14:50:53 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2] remoteproc/mediatek: enable MPU for all memory
 regions in MT8192 SCP
Message-ID: <20210107215053.GA43045@xps15>
References: <20210107023020.3224002-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107023020.3224002-1-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_165058_294799_AE8F4DB2 
X-CRM114-Status: GOOD (  22.88  )
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

On Thu, Jan 07, 2021 at 10:30:20AM +0800, Tzung-Bi Shih wrote:
> The register MT8192_CORE0_MEM_ATT_PREDEF contains attributes for each
> memory region.  It defines whether a memory region can be managed by MPU
> or not.
> 
> In the past, due to the default settings in the register, MT8192 SCP
> works luckily.  After enabling L1TCM, SCP starts to access memory region
> that is not included in the default settings.  As a result, SCP hangs.
> 
> Enables MPU for all memory regions in MT8192 SCP.
> 
> Note that the register is read only once when SCP resets.  Thus, it must
> be set from kernel side.

Much better - now I understand what is going on.  

Based on the description of the problem please add a "Fixes" tag and CC stable.
I also suggest you bundle this patch with your other patchset [1] once you have
make the modifications for devm_platform_ioremap_resource_byname().

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=401287

> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Changes from v1[1]:
> - Adds more details in commit message.
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214051047.859110-1-tzungbi@google.com/ 
> 
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
> 2.29.2.729.g45daf8777d-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
