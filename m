Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BA2C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 18:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqp+Ruz/AdnKmnGI6Zv/MF4JDiJ9A6hS03v38ROXSso=; b=alw7aKNO0mJ1SGlBmhzBJ7wE6O
	1nxYlI1ul1Jg9+T1p4YbxqUdLY6RhTS/CjNKokjE2ElxknNxFRDxBttNrZMpGVUYh2n9u3zPkf6ph
	tMMheEF97oRqbcZXJYVXWgZW9oLxu8DFa0Y5Xb/5ZfjZXY1/7fJqe8hRDHT9yxW+AOSceRGRUXyLx
	TFUPJqz0OLSYqS2uBiu/J9IfFDXnAEKC+AtQ7q0kaC1cEyc36n8PDscZqgJbxmzbka297WKuYxOdz
	1sAKMn1m02GSypWf9enhzuond3W7nCvry0pR0GDy3Z5m6BOG/4y3n+hMTP30zo9PlMFX8E5+IjMgh
	k4Pqv5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcs7v-00HDlr-34;
	Thu, 16 Mar 2023 18:14:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcs7s-00HDkm-0e
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Mar 2023 18:14:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id i5so2695456pla.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Mar 2023 11:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678990493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqp+Ruz/AdnKmnGI6Zv/MF4JDiJ9A6hS03v38ROXSso=;
        b=SoOra7MYJ9yivi4lQa+vmZdoc/naYbQn9Og1Qszg3CNCnmunbPcxN6IQPbIdWCxvjX
         A2CGlAaXFkP3JeXKtzf1JiVPR9liWuArRur29p8mmckt6mm4C3MeEgpD2na9oUeLn4JG
         cjzIf2GrTGasQgwLHVk9vzwdwfWyvLsybrVQuf14AnoHT+hWYDtRbhd/4DO0O/bAFjZ4
         hHR01N0LyzuCTjuvpm1C+u2llD2UfK/+mmfns+5H4nH0ZCHpS0w3L50138PZXXyslGT/
         RWes9KJ2go8TmDh2f3qiTVEIckz1KrlgU4QOWerkkpSKlWqRSn4VFGgsv2ljPQAZm7x6
         3LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678990493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqp+Ruz/AdnKmnGI6Zv/MF4JDiJ9A6hS03v38ROXSso=;
        b=p+IMXyZ0b2N3x5YPC8sfbp8fzB59GdS/31A92cTZsYP8mVdHFkJQLjJeVb+uzMIcWC
         4wuBJL5jaVhsBiELawKlXXddw+MqZUZ+DdU8AI78X2NwXFbTCPpXCocrDwfSrmctJ1nJ
         U46PVMOEjQExkDHFlEzxr7nTwsOY3BYnqEkuTM4NTwHSy9Zing3rqqPrfwVoPqwn0jFI
         GKbUBR3sVOyJUMDdSPYVVkutrGonFeDpQHGyHOSc6VIZb6DK+WwqeKh3+EVLntxZONZt
         5GLRpRlfj9G7HoUt8Fl+sE/6CNW+WXdAOvU+v/OlBWmAh2vqQigyGrRGEr/QR7Zw9Egy
         mp1w==
X-Gm-Message-State: AO0yUKXb9wf0Yh2uNy2iXE4j8cYINLgPj44i9YGB/mCqIbr0QaNQeNE0
	frNRp7kwYsuigd/e8gOdgZjUFQ==
X-Google-Smtp-Source: AK7set+RPXOketPy5+X+PCkBvQftwRTp+x6bJhpmW+1XHc3+dvZDWj/l3PB2TxM/AHSGIWzWn0XNJg==
X-Received: by 2002:a05:6a20:8b90:b0:d3:5b84:6fcd with SMTP id m16-20020a056a208b9000b000d35b846fcdmr4638504pzh.12.1678990493121;
        Thu, 16 Mar 2023 11:14:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5997:2b9a:5757:d5f4])
        by smtp.gmail.com with ESMTPSA id r20-20020a63ec54000000b004ff6b744248sm5436710pgj.48.2023.03.16.11.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 11:14:52 -0700 (PDT)
Date: Thu, 16 Mar 2023 12:14:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: andersson@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] remoteproc/mtk_scp: Fix one kernel-doc comment
Message-ID: <20230316181450.GA2421452@p14s>
References: <20230316084011.99613-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316084011.99613-1-yang.lee@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_111456_236933_ADCF3406 
X-CRM114-Status: GOOD (  13.39  )
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

On Thu, Mar 16, 2023 at 04:40:11PM +0800, Yang Li wrote:
> Fixs the function name in kernel-doc comments to clear the below
> warning:
> 
> drivers/remoteproc/mtk_scp_ipi.c:136: warning: expecting prototype for scp_ipi_lock(). Prototype was for scp_ipi_unlock() instead
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4544
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/remoteproc/mtk_scp_ipi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index fc55df649b40..9c7c17b9d181 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -125,7 +125,7 @@ void scp_ipi_lock(struct mtk_scp *scp, u32 id)
>  EXPORT_SYMBOL_GPL(scp_ipi_lock);
>  
>  /**
> - * scp_ipi_lock() - Unlock after operations of an IPI ID
> + * scp_ipi_unlock() - Unlock after operations of an IPI ID

I have applied this patch.

Thanks,
Mathieu

>   *
>   * @scp:	mtk_scp structure
>   * @id:		IPI ID
> -- 
> 2.20.1.7.g153144c
> 

