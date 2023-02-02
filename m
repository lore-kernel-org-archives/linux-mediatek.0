Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07705C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S47R+5rjRzxXYMzXp1UK6jVO2A8+OORRyssP8k3OTaU=; b=4tRoDFFKjII80BH955/WVl6jjU
	/xZHgVkskse+8mVaLnD8jB5wf69Xh/FrgnhOCJuowLfQkuP6zuhSpwvuHAwFST9J4+w2vF36471ry
	w3FUw5exfYg2+o+rcatuZF1wdTbt4+PnKha8JYywd4DDVHKob/I/z/Dj8MlKEu/Kzp+cFhkkgSxKN
	Nqx7kt8BkT9g40iCapbPsiwFdLQkUeeUv1VbMr4Kov6IDid3K0t+iUGaQn2GE347l9EuPqD1rOa0I
	srYlDAkioGxPYby0K3hiHNmZY4pZ3qDQ6vPXKGFOZ0wfrfinFpTGwhG8BOlR9PuYFR9S7ieyUyYFD
	a4ITkuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWOG-00FIn8-0N; Thu, 02 Feb 2023 10:00:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWO3-00FIie-U6; Thu, 02 Feb 2023 10:00:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso910561wms.4;
        Thu, 02 Feb 2023 02:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S47R+5rjRzxXYMzXp1UK6jVO2A8+OORRyssP8k3OTaU=;
        b=NT8sqyUpXMd+sQ8nCZdKb3Jk3hikUSHqIRfmLogoNwWuN5GC4a763Nodacy2zqJyiA
         kBUghR/YVoJblY5B0z1E/QUNJ7c/Ee4LtL3jil40RJWy9ZFzyBIUNXh41jX8I96wbSJ2
         R5uFZac87cAbS+vh5hw1gxwJvmQLMNcjGFrqon62cdME66SIgYDxmuu5vCnLdBTeC1Le
         uyqXM4rKS+UgC8BPhpNaA2SD1L5er+kxZacitNRCAIB+81g6l95r6PUoCoPmj0QvA9Zk
         DOXBNjCzXiLnCG5p+paRsr/dFD/6IqnsvvwrCavKWzrqxgob36gdq6beYBGVPMYygQDe
         EYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S47R+5rjRzxXYMzXp1UK6jVO2A8+OORRyssP8k3OTaU=;
        b=CLtvwgdDk5pdNzrZfMn2nHeJS3xdb2S7YmayaCKLo6GS353Nq1FeomgGLx+kxMoh3i
         EWU6IJwgHNchY1jJ2Ij1mwDDycEMVpBkh1T0iblPULiaBlCB68aabVkojUU/cRCv1HEv
         1xMb984bjlTJ+cZ2choFLc2jM6x8nYTPlGCZVedG9zlD1+fCJIa2LH+8FDTPPR67PJz3
         Hu/lsEiZFgfOQdtK0Y9AJpYqwITAyWXI/GWulG3bV+3QnokvbR09nYG5bChbH6XzaICV
         qQDtJkZLPDC7qOOJkXNxo/aJzgZazjFVZCuPEGgLtz2jQI0NxQZ+37cMRpGIAcZlKAb3
         EYbg==
X-Gm-Message-State: AO0yUKVqi+LW+v64rS7H9DMLJQw/nt3fU+wmH5yrmI7F+wZF6whS/VTJ
	Su3aoJvhaxGDv8Y3C7Ri2ok=
X-Google-Smtp-Source: AK7set/hxDQtpBD/6sU2EWJnbnwSchb6GxrEplpuJIeN++ZLnKBZ4/9GOA5kj/HCSL0RzR1bzSURMw==
X-Received: by 2002:a05:600c:3ba7:b0:3df:50eb:7ca6 with SMTP id n39-20020a05600c3ba700b003df50eb7ca6mr3409069wms.15.1675332010587;
        Thu, 02 Feb 2023 02:00:10 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z17-20020a7bc7d1000000b003dc3f07c876sm4419673wmk.46.2023.02.02.02.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:00:09 -0800 (PST)
Message-ID: <5698df33-c3f8-19bf-7f99-5091931e5af2@gmail.com>
Date: Thu, 2 Feb 2023 11:00:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next] clk: mediatek: clk-mtk: Remove unneeded semicolon
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, mturquette@baylibre.com
Cc: sboyd@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20230202010750.79515-1-yang.lee@linux.alibaba.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230202010750.79515-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_020012_000479_0139B2BC 
X-CRM114-Status: GOOD (  14.61  )
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



On 02/02/2023 02:07, Yang Li wrote:
> ./drivers/clk/mediatek/clk-mtk.c:518:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3926
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/clk/mediatek/clk-mtk.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index c90c0a6b501b..14e8b64a32a3 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -515,7 +515,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>   					   mcd->clk_lock, clk_data);
>   		if (r)
>   			goto unregister_factors;
> -	};
> +	}
>   
>   	if (mcd->composite_clks) {
>   		/* We don't check composite_lock because it's optional */

