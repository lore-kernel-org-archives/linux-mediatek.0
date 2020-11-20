Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4914BC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 23:35:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E103E2240B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 23:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zr5AgPFd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lSqmqi3Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E103E2240B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7uSifMSNesoudUaksvaaU9QxBGKSWeAI2Zy5UGSz/aM=; b=zr5AgPFdqx2yW7dH1ZJ/0thul
	kDHBqPfppvF/CpnuoPRmcLBvU7JkBJ+FKffBWRIItkd2dbrOXizorciwHc5zZC5SlaNwN7l26MXbN
	QYViDPQAwyczyGxhawzl6DaFs59NC2bPZpHk9e8hxROaTL4nz+a0pWaKDspBHnMOtIsFURBZ88E8I
	gPcVlqMh2TBu8ukyTb5VbTJT/MmdvCEPZTtvlOGWVsyNAwkG8lzrenq3Iro61kiV3G4m7A9HD4ZLt
	J0IEBMmezuBgfB8G9wWHweXBtncD7Oa7Y2FfUsOxsFO0l8QkdVpc6dJ5Y3di6m2LUOlthkOmr0bkZ
	vl1KK8cxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgFwQ-0007YT-HC; Fri, 20 Nov 2020 23:35:46 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgFwN-0007XX-K4
 for linux-mediatek@lists.infradead.org; Fri, 20 Nov 2020 23:35:44 +0000
Received: by mail-pl1-x644.google.com with SMTP id x15so5688621pll.2
 for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2020 15:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nRTceVwrQo7nc3Kc6KStQCnzuWIzRftiyAd8oL6fIFE=;
 b=lSqmqi3Q157w+EhxtXGbrkd4lSfMsE4CKVqKVirBli6bOwnZN6/opiV6vTd2uXQ1GF
 ApulU6IasNb58YkXkwLIvOkkYl4uS9NzMoYbUq14q9tMxncPbJ+OO+IA/Bn6rp0EIXx6
 y6gDU7gvwPFzcYm5edJ2P5d9u6A43kcI4OZNgNImA8wALXcMAdTWQxsUlqx4ni1IrQHP
 yqs3cXCvS9TuRiFMvk29L+f0v7RuK+m08Z54n3lvu0X4OaZ4NL+E8oTDEsxSh423T4Sw
 rglb8cb16Uw6Wib/oV+A0/9scpXEvLN078NqrIwPPm5x6t66Y/Lr4sye6aUOSIU4iqN9
 oLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nRTceVwrQo7nc3Kc6KStQCnzuWIzRftiyAd8oL6fIFE=;
 b=i+zded0VFLjMEXEOlW/Ua/ast1VhwAZQJ4HosRWFZHrbsRazR0Iw7p3RLNFrGb0ZrR
 031GE6nM0HwrZ7bcC1Cu9D+RUCmXBKtZO/nXOr2ZZpQj+926wfZjyi/7zXML/4QqvxO+
 qOiBknBFf8M1MWU0RH6Baqmd+qEj8+QofQLiXdY3lzgPnaENpOQYmNvdm9XdFQZR1hjd
 P3Mx41DfdGdsG6QHMtGSpd9nucd6iqQMXU6VqHCgBMk9J9tnlzzKMmb2rcE1IkUksLQE
 iDdiFLeWP/J1uuIyMPiiT0GvhfAvJjTnbsmtZn/nyh2BHFaB9sClomBdKNOK/2TwAT3l
 ARZw==
X-Gm-Message-State: AOAM530MLD0M9J5/LLBxT+bPr6Wl3QlbSbuOQgqXpIb+IIrjGAlN4jmF
 5p/TYVwhvr2AF1CXTOmws2ek94J5iHn9yw==
X-Google-Smtp-Source: ABdhPJz7jpiA+PzNI27E9IqxJ7o62Iz6jhCSYhdGO6EHIxHvY5p5FHzAXs1zPrxaX+LDxpqR6FO7sg==
X-Received: by 2002:a17:902:b410:b029:d6:614b:679c with SMTP id
 x16-20020a170902b410b02900d6614b679cmr16035685plr.79.1605915339434; 
 Fri, 20 Nov 2020 15:35:39 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id b3sm4721015pfd.66.2020.11.20.15.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 15:35:38 -0800 (PST)
Date: Fri, 20 Nov 2020 16:35:37 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2 2/3] remoteproc/mediatek: skip if filesz is 0
Message-ID: <20201120233537.GH4137289@xps15>
References: <20201116084413.3312631-1-tzungbi@google.com>
 <20201116084413.3312631-3-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116084413.3312631-3-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_183543_767982_B6BC56FF 
X-CRM114-Status: GOOD (  22.70  )
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

On Mon, Nov 16, 2020 at 04:44:12PM +0800, Tzung-Bi Shih wrote:
> The main purpose of the loop is to load the memory to the SCP SRAM.
> If filesz is 0, can go to next program header directly.
> 
> We don't need to try to validate the FW binary for those filesz==0
> segments.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 0abbeb62cf43..74ed675f61a6 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -234,12 +234,14 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		u32 offset = phdr->p_offset;
>  		void __iomem *ptr;
>  
> -		if (phdr->p_type != PT_LOAD)
> -			continue;
> -
>  		dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
>  			phdr->p_type, da, memsz, filesz);
>  
> +		if (phdr->p_type != PT_LOAD)
> +			continue;
> +		if (!filesz)
> +			continue;
> +
>  		if (filesz > memsz) {
>  			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
>  				filesz, memsz);
> @@ -263,9 +265,7 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		}
>  
>  		/* put the segment where the remote processor expects it */
> -		if (phdr->p_filesz)
> -			scp_memcpy_aligned(ptr, elf_data + phdr->p_offset,
> -					   filesz);
> +		scp_memcpy_aligned(ptr, elf_data + phdr->p_offset, filesz);

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	}
>  
>  	return ret;
> -- 
> 2.29.2.299.gdc1121823c-goog
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
