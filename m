Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B043C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSB2tORpEY7AFj6lkS5miPOljfi/Oe35Ina8RVx1G+M=; b=Dphi73H5DnVjs2u3HR57mBas8S
	WfFjmv3QOAouq7gB20bjxD+JquNwA9f6QmXCPJ9waAQxOrbjw5MsqHTf+VO6/WukFM+SJoKBmGri5
	E3K+/mQ8q5csSLyGuGNj9yYUZ66bOx/YtQxcSrzlOxMS6iK5JHxyH31venhOQZgMPZa/Pm+frX5MP
	xShVCizwfoBrUEkT9Qek99AM66xVn3f13lhzvHFY1fFAogT6/+h/Nb3a5PIBtPCHlsJyLCvEe3JYF
	F8SappMvw9rfktj1sttbfZpr/JGwXAY1giU94J7Yn6zSIk2tTydJYTNV+XEMFky6sLVfNbQGrHWNG
	uEkcCe8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQReQ-005Usi-0B; Fri, 10 Feb 2023 11:33:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQReE-005UlS-74; Fri, 10 Feb 2023 11:32:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id by3so3452853wrb.10;
        Fri, 10 Feb 2023 03:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSB2tORpEY7AFj6lkS5miPOljfi/Oe35Ina8RVx1G+M=;
        b=AnL7oOlwGYw2m2KHrKGYSTrurPx1qkJqcWP+jaHP+Xd4NBPcMS3LIG0NUQe8zJH+MV
         OaaVxiNJHXIlR1m296SK8NjK5a/TPeqQ72pzXwVsU5s2KOGE6CRNBxiX81XAe2FCyjxN
         SBZd+NrIy0IT8xHzZ2QZb5N1oULFnHGojz4GMoE9jPDFGrVFFzzc7Rtcg4U46w3dQeg3
         dUzTvfVbZxizhEVkxQDclwNDWS3Weob71EnWAa61sQ5+kWgkWfiQV0llXd0BvIWUNR8P
         g7kWzn/mnfboAh1X8zraJdB/PG87qGHDcVbaGxEZGkybeKDRJpCYVQ8n0dQYquSdDYum
         X49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jSB2tORpEY7AFj6lkS5miPOljfi/Oe35Ina8RVx1G+M=;
        b=B/QP4BPV1LI3JC5Dbx6FXE+RC1EyovE5fdIV8cpi1kVAuqjuyNwXVSJ1kdV1K6JdKY
         AbtXz0WRuB/l13cO1in0PDNV2NF53Cadg4fNHYszJ4bT+/kXQLBA/Us+F4hAW/uyg9wH
         oNuAr80OJsr+XBBL9zGxOpoLHRXrbFFFVXN7tF0m0738lbFpRcI/hyGPLS65ETUqrza3
         CHQvABOtrs7hoT/8Lam2+4i3iUjSyNBPgHd/1ZZl66AkdKuZB4Loe08x3VTPRKme42YS
         bXS5vWABVNwaVA6Q36XbevRqOWRWPa2UresBmv1QAF16zGbQoNibkIz1o88hAKp9AgxY
         dW4g==
X-Gm-Message-State: AO0yUKVfoKEH+Sbyc4+KOWrv7PgRjIzkdDhjKZqCumHGkEuJnclbU9Bj
	8XuZWsAnHGm5d4/DtnhPkoiZ/PptjzM=
X-Google-Smtp-Source: AK7set9Cu9elcH6gpisnWD6MWr0EGRotDjpqGXMjkrCDhVwQARmchj+Gb21ZbvpCjBdk++FK4FDZQw==
X-Received: by 2002:a5d:6a83:0:b0:2c5:4a70:20df with SMTP id s3-20020a5d6a83000000b002c54a7020dfmr1342411wru.67.1676028773798;
        Fri, 10 Feb 2023 03:32:53 -0800 (PST)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c314800b003e11ad0750csm3576930wmo.47.2023.02.10.03.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:32:53 -0800 (PST)
Message-ID: <6f48f7a2-23d4-687d-5c9b-3a1561928ed7@gmail.com>
Date: Fri, 10 Feb 2023 12:32:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1] remoteproc: mediatek: Check the SCP image format
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230210031354.1335-1-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230210031354.1335-1-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_033258_301039_B704C489 
X-CRM114-Status: GOOD (  13.78  )
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



On 10/02/2023 04:13, Tinghan Shen wrote:
> Do a sanity check on the SCP image before loading it to avoid
> driver crashes.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/remoteproc/mtk_scp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index d421a2ccaa1e..0861b76f185f 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -649,6 +649,7 @@ static const struct rproc_ops scp_ops = {
>   	.load		= scp_load,
>   	.da_to_va	= scp_da_to_va,
>   	.parse_fw	= scp_parse_fw,
> +	.sanity_check	= rproc_elf_sanity_check,
>   };
>   
>   /**

