Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D0DC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 19:15:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4F0364F2B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 19:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4F0364F2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F6XQVUiuSdpkbQPCTv+kJHWO/9FwkWGbgx9cUtsvodU=; b=LFYQA4dEN04iXDGr6oDKeSCOw
	a3p4n1qvYCwVuHep5+ugKtDy/SvdEd4EBvCjoCHJ8B34LZcswWaPXwQvwpksRLrMEEOeuktLh7Ycf
	Dj/UyjL475nw7iPywRJi3qIOC+gcDRlaj1DjZRt8ZCDfqHjqr9xdq/lx2zz3w1jrBtK40NI7K0MX9
	bQG5Z/ijRstoS+ZYNxqNr7qSvi4boqXakbqw+HH3ZZTHK22X3rqYQnNvNDRS8Wt+inl7FXtH+3Q+x
	YkJ8xZUGdzvMbKooOcMv1FWo1CGhjEtkjVjqJ2s1dQu9ThlzY4HOLwew5hzSt4gpNvdp8W+rijeqX
	u1WM7NwvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMbd2-003nm3-A8; Wed, 17 Mar 2021 19:14:48 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMbcz-003nlN-Ag
 for linux-mediatek@lists.infradead.org; Wed, 17 Mar 2021 19:14:47 +0000
Received: by mail-oo1-xc30.google.com with SMTP id
 q127-20020a4a33850000b02901b646aa81b1so814335ooq.8
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Mar 2021 12:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g9fo32zIMywDmkalH1qKvmJRPNyM2Hr5LB6vnu4P+0A=;
 b=g8Wd5Cg42nwpe8q2cavQbP3Wwt39ymrMQf067hKxjVTbSTWB5/pj6/VICVYsqE5Phr
 cKabUG58b0efCxHe60fSf+//Pv0lghf/IfqzIr8Q5PVtcxsUvWaed49LyriX24N3Owq+
 F4VQY29T8/yqel+EsuXXSbkHJG/N08jyzVuskPRtLd3dEygz1igdxDNXCm058omcP1y7
 cdvabGQJcO6u3tn5MMzoQrL2ZoZVsJNcHSFCIcg8gDvzqTqJOoqNdpdEXWc0cMVJFjIs
 2Oh3FkFeejKot97G3VPwpS8yE3jpjnjFflly1ixatGqyudXVnoeBw5xuZeZqV02M96sn
 StcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g9fo32zIMywDmkalH1qKvmJRPNyM2Hr5LB6vnu4P+0A=;
 b=bg/vvUUPiKAOcqR2X+v1cHFBfo2LeKJ3eUOTK/ev5p0MRNiRYd6IW72c8cHFXD06Mr
 h0eAMPuk0k7eRJfuOfTsF99Hrs83gJyFUI8pPDcdjzIZz4M9ouV3fAaD8bsau9vLnxeq
 LEmIAp7dTuS+he5jfgGdUnjq2uXBiJLQX887p3Fo29LvOEj+/ou9lrJN2anhWSubPNOZ
 41+TQtFAeiM/4oPMcgxPvwH6JCaqPAPl+QE7+80Ojw2ibTkeGsGsTgqs4urv/7DN+WND
 kxy/BTV8XO5Jb6t9OgY7Sx/kJlzMU2noWGhrwrute/YA1MtuEgIUanP8aOmgJj4Sslp/
 gq8Q==
X-Gm-Message-State: AOAM532RrjW4v32mJ8RuQXiv+95868DlI9gPoxwaO8dloOFnZnyNanSy
 3z5hUYKze9nO9MCWF3qTzAGlbw==
X-Google-Smtp-Source: ABdhPJxruRMgj2ESsfTROG9di9oS8+XDw7YgLmoAT+Pnji2hikqyt+89hEKD0W3IIBE7eOYel4NUWA==
X-Received: by 2002:a4a:395d:: with SMTP id x29mr4461590oog.41.1616008483668; 
 Wed, 17 Mar 2021 12:14:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 64sm8714987oob.12.2021.03.17.12.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 12:14:43 -0700 (PDT)
Date: Wed, 17 Mar 2021 14:14:41 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192 SCP
Message-ID: <YFJVIfTPnZe/SfgX@builder.lan>
References: <20210317034311.2281708-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317034311.2281708-1-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_191445_487847_EE4AE3F6 
X-CRM114-Status: GOOD (  15.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue 16 Mar 22:43 CDT 2021, Tzung-Bi Shih wrote:

> DEVAPC (device access permission control) is a MPU (memory protection
> unit) in MT8192.
> 
> To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
> domain 3.  ATF (Arm trusted firmware) should setup memory range for the
> domain.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

As written here Tinghan is the author of the commit, but the author of
the patch is Tzung-Bi. Please resolve this.

Regards,
Bjorn

> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h | 2 ++
>  drivers/remoteproc/mtk_scp.c    | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 61901f5efa05..2aa9fdf5e59b 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -51,6 +51,8 @@
>  #define MT8192_CORE0_WDT_IRQ		0x10030
>  #define MT8192_CORE0_WDT_CFG		0x10034
>  
> +#define MT8192_SCP_DEVAPC_DOMAIN	0x85080
> +
>  #define SCP_FW_VER_LEN			32
>  #define SCP_SHARE_BUFFER_SIZE		288
>  
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9679cc26895e..50bdec5a97e3 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -374,6 +374,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
>  	/* enable MPU for all memory regions */
>  	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
>  
> +	/* set to DEVAPC (device access permission control) domain 3 */
> +	writel(3, scp->reg_base + MT8192_SCP_DEVAPC_DOMAIN);
> +
>  	return 0;
>  }
>  
> -- 
> 2.31.0.rc2.261.g7f71774620-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
