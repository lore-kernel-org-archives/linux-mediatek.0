Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58080C48BE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 13:53:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 210EF613EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 13:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 210EF613EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FLhl4HqC8EIs14jroM+EZzMMQCFuq3Ok2UPKLxwBtqQ=; b=a5v+92r3yuOVqkeqxmFKGXyR8X
	ZKbyFWzExySpm523mjlgYNQQ0z6gE4uo80zwjRsrlYpv/iDERs/Pz09Tfk6JZIyR+6TI6LAqhIyf2
	/WmqoxRpllchU+G7wWp0aAtQELu/DAWA4udW1Z3vdmMKXQ/6TBIYlJWj1U6eJwrYduaBzn7FP+Onw
	cnshr8rZG4I7XrXdrVlGj/r7oiyaEZE1vy4oAP8sq9wFOk8kncwUMXSorn0F2/64+51L7d/BBuhdD
	8GM4TVxeI4mtCUQQQULQxRJESIrKXDLag/eSygzCV83xT68rqD1MiGuUWITOKQwbss1E3mJUDVlVv
	cux8hWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luEvm-00EMWF-4D; Fri, 18 Jun 2021 13:53:10 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luEvj-00EMUS-IS; Fri, 18 Jun 2021 13:53:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id m18so10878893wrv.2;
 Fri, 18 Jun 2021 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ITBAl4FWs2S5uSotuHXD8wqyuOBqmsc7zriYKDn2S+k=;
 b=nTxIZ8xokQc6mlmltoY0rHWuh/kMpywSMXPOercEeeZbPaeZCE9/O22J53a2EBWUtP
 d5foNFsym9xbqMkgBT+TrE9kMN76sMNzeDInDALWAJF7bizuIA0fI1rmBm42VY9o+TIg
 /nzoJ9rZxBkcucm18mkhBVAOzneyEJWnKx0hPpkOPsvRjpVXaS7ZXtCuYpUPVL7Qc6Qo
 2/Q5S5mPW/a47e8k+jUhrBYaqJTlZpCuKO5mZtvStOnyKRfVv+4FvA0uYFVrgRaS2Z2t
 C1sU2SmbS2RIdP1cHKBdfcbRderokDveStCbZVTDVi4O6n69C1inDeb/Onc16cT3ytDK
 Q2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ITBAl4FWs2S5uSotuHXD8wqyuOBqmsc7zriYKDn2S+k=;
 b=Xph8CwyiIsZAq1wFr27RGvNTJYQBVVXJVOFujHT+uejFSqxvkSk2eeQsT87UGh3C+1
 C049+c9FsyZJyR/D3Yv01lG1+0bwpxDeO5dgAtHM1iffsC+DikF7zem2SxxGZCVk+aRk
 0ReHPxxzze8m2HeIJYr/zI9JmvuZBUuoMhkolTbh6+qop8oP7hnsZKO4xjz9Un8Hinqa
 72uCZUAhw+53H6v5vCjmrzmSRV79wtY2K711hzbjbfn+RfMbIZjyWE1JXgQSLXggJKf8
 pn3ywt4sT1RYAZpQuswwF0NPanBo1sbyURWq5VW88XNcjHW9y18Y4QCmuRweHGU4oYig
 zIzw==
X-Gm-Message-State: AOAM532hofKctBEul9vn1pcMbjC4ZFPz80Tjl/xKA//EW3fpz3mYG6mB
 awCS8h/61q0OKGOTgoo3elU=
X-Google-Smtp-Source: ABdhPJw+MfiIKMOT70+0vEXXd5JNmRAUwX7q13K8fShJA9b0q7JJvb8tpaYMCPMQQ3AQQnp4h+HXRg==
X-Received: by 2002:a05:6000:178e:: with SMTP id
 e14mr12911421wrg.246.1624024383863; 
 Fri, 18 Jun 2021 06:53:03 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id c13sm8935127wrb.5.2021.06.18.06.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 06:53:03 -0700 (PDT)
Subject: Re: [PATCH] dmaengine: mediatek: Return the correct errno code
To: angkery <angkery@163.com>, sean.wang@mediatek.com, vkoul@kernel.org
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Junlin Yang <yangjunlin@yulong.com>
References: <20210617133229.1497-1-angkery@163.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2eb509a4-73dd-b3db-41d3-e7a0043ce8c9@gmail.com>
Date: Fri, 18 Jun 2021 15:53:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210617133229.1497-1-angkery@163.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_065307_662310_CFA7790E 
X-CRM114-Status: GOOD (  17.82  )
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



On 17/06/2021 15:32, angkery wrote:
> From: Junlin Yang <yangjunlin@yulong.com>
> 
> When devm_kzalloc failed, should return ENOMEM rather than ENODEV.
> 
> Signed-off-by: Junlin Yang <yangjunlin@yulong.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/dma/mediatek/mtk-uart-apdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
> index 375e7e6..a4cb30f 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -529,7 +529,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
>  	for (i = 0; i < mtkd->dma_requests; i++) {
>  		c = devm_kzalloc(mtkd->ddev.dev, sizeof(*c), GFP_KERNEL);
>  		if (!c) {
> -			rc = -ENODEV;
> +			rc = -ENOMEM;
>  			goto err_no_dma;
>  		}
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
