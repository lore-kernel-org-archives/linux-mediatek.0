Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBBBC56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 18:32:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA2420656
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 18:32:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLMALA8Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DA2420656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F9g5UqaP4Oy/Fb1RMjT3gOSOPsddptVlNsd1m+B3giM=; b=PLMALA8QJ9dlEv8fn6gPNxuHn
	vdDB3vqOQjGCrr7kuIFxdc03acYDofzPWUWUvu6b2yV6DnzFkoq6EDGNvtDIDWW6vrEbO2wtyyFWj
	nfIWb1cWAc0EJbjpdDqNZXM/jnXwUL3GBqCbaWuRFuoa1+2mnfwj2EhLYMdHTDefNOrsnfmYflsEw
	MZ4wiLELYas4IslIPQU5HRKGfW78L2He7FtoMJTC7etjkUjkhbj2oQiqwEn73YaNHk4OKNs+ZheJn
	I/+9fI03rScwwDUx/i1Zv887rvujzm9DJJ+jxqrUTDtHd/+wgUKPguP1QCcTCqVTKPoN36CauyMNa
	7DMzcS3sA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khzaV-0003hd-Mo; Wed, 25 Nov 2020 18:32:19 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khzaT-0003h4-Di
 for linux-mediatek@lists.infradead.org; Wed, 25 Nov 2020 18:32:18 +0000
Received: by mail-wm1-f65.google.com with SMTP id w24so3063010wmi.0
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2020 10:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5GkTO/25VVUukwZ9zh97AvZy/dEeO6lHGqjonU7CXlI=;
 b=DyhTdhLw2xz+l/7o/XPEzv6tvDkhghxb8S6irQ/MX5/gn5k8uRNfIdwoUMT21rBsAm
 D0nzOrSpC6g1g8ARkBuyy1EIHf27yvfXhBALXdg1WUMvIRdlJBdWkjKWHpYfboHyrtT9
 FFip5mNnwkrzGtoHB0DJCAuItFQ89rL5ZK+O+1YjvKzGHhKXLKHUjmDXMFcXvk3apQxR
 o4EPyRT2vEb8M2oxABqUNNw2mdfXGIylHRscaFlUqfTmRgEyL/0Y0lTeOfnN6O0v8vLK
 D4Am8wCZmszF3PhNrTpdjgcpKnE0JN9jqv9yMDvtu6Mv4EnxMpO5yPxWtmWUY8nJTQkE
 ontQ==
X-Gm-Message-State: AOAM533uDQAyjwV1ZvoMINjZhpUo2o4hK+VEoQl2rQ/zW2P8eE2s1oen
 VYA+7JSHl0seg/GfJaBNuy8=
X-Google-Smtp-Source: ABdhPJwQF52MOMubIDrG2tGa8X5k5t/uVNz84W9l+rimXRerR2hN1cYDKN+37C4kmh3UVe8bK87Bbw==
X-Received: by 2002:a05:600c:2541:: with SMTP id
 e1mr5555749wma.185.1606329132868; 
 Wed, 25 Nov 2020 10:32:12 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id v8sm6023116wmg.28.2020.11.25.10.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 10:32:11 -0800 (PST)
Date: Wed, 25 Nov 2020 19:32:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH] memory: mtk-smi: Fix PM usage counter unbalance in
 mtk_smi ops
Message-ID: <20201125183210.GA3665@kozik-lap>
References: <20201123102118.3866195-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123102118.3866195-1-zhangqilong3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_133217_521506_2314150A 
X-CRM114-Status: GOOD (  17.82  )
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
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 23, 2020 at 06:21:18PM +0800, Zhang Qilong wrote:
> pm_runtime_get_sync will increment pm usage counter
> even it failed. Forgetting to putting operation will
> result in reference leak here. We fix it by replacing
> it with pm_runtime_resume_and_get to keep usage counter
> balanced.
> 
> Fixes: 4f0a1a1ae3519 ("memory: mtk-smi: Invoke pm runtime_callback to enable clocks")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/memory/mtk-smi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index ac350f8d1e20..82d09b88240e 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -130,7 +130,7 @@ static void mtk_smi_clk_disable(const struct mtk_smi *smi)
>  
>  int mtk_smi_larb_get(struct device *larbdev)
>  {
> -	int ret = pm_runtime_get_sync(larbdev);
> +	int ret = pm_runtime_resume_and_get(larbdev);

Thanks for the patch, but it cannot be applied.

There is no pm_runtime_resume_and_get() in v5.10-rc1. I see you authored it
around middle of November, so don't expect that it gets magically to all
other trees. In such case - when you know that your patch cannot be
applied or you suspect any dependencies, you should describe
requirements for the patch.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
