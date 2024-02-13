Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C58FC48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVxaJna0CX31UM9puZRZMf8QLphdGcrpZmzcpVwpquM=; b=zxPb87kZl2Nppxha3tM0SjFk3p
	PRTm9A2OOTuFk8WkKKpO1qGAaoZqsG/XKJ+iGGprpYI9wFpliEReJ3yd9d8JhHcY5hKp2AAu+egTv
	bsGMQ+XUt9sCR5GvUQCfpiYzRdJ0lR1D8TTArSkBZ8VfMClTi5mcxkXViBwmTLfaBX98FE97XFOyX
	1wzqlADoQqfjD0hvMMavBQo5lhjUxstmJe78b/BaU9w0W40cjBqWhhVilObNNXtK40J3Lzq3UXMXP
	ZtsPeC9fnk94tIIl3ySu+A1Le5wnDBQZzB0cKo624Yewvu7xsot4PtNU0eKfitWZucB/J81h8a/lL
	7UdGbVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsVS-00000009HiP-44q1;
	Tue, 13 Feb 2024 13:07:26 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsVP-00000009HgN-3mad
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Feb 2024 13:07:25 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a3ce9a33fd8so157020266b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Feb 2024 05:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707829642; x=1708434442; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVxaJna0CX31UM9puZRZMf8QLphdGcrpZmzcpVwpquM=;
        b=p9BAWjsWvrlge/NAtH7CRHFrxCefB4ixmOZ4ohzx1BeZHnkAx/Cr7c7pfuugeGjuLD
         ZLYUWtKn6CDv2TjkHYQ1b/IfWdwv8yBSWbXD1/AvAzjm/SxWiW2LcLzRrkuQacINjODR
         LY2S8MYIPDLDLauRNnLGgES166WEh5CHkP1he3vyjiXqZh4cFlwoIZRe9H3k6zAqV/fu
         WtbLDjgx4mTDU8YRhrem1R9N4BO+JRX3fDrXyUCletm5DPGKNClmrswl0SwioF0T57ld
         pjKnHpaGScw8U45TZ3I8hapSJFE10rPRd6b8LzsapqKjElJpwcQMiwz/lYrD/C5NEf39
         UYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707829642; x=1708434442;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVxaJna0CX31UM9puZRZMf8QLphdGcrpZmzcpVwpquM=;
        b=s6+Tlo5oObeFuNcWcZHge17F85FByxdQn9NTrjouSQs27px4xe1NUK4JdOHimZvWO4
         6lFUFl9oNZa8NozMBwJJJYAH7kIN9qfjKZRFCRC5zILjDNEnsIkgvjBBU+tHgHTIn/Gc
         qBM2xhuJgEqlcaJEIJOZznrA+Nko97MDTH6RRtLmUZfLsSBKj0D2OVR457keeNexTkXm
         8JMW5STJFSFQDPzCOifM1kX6b2j44iA85LC99ftTY+XW5b0zA08Rnu129PqkKJZG67VE
         vcp2FtSN2TI5BPG3C7DlwhmRYwciwxsjtlbrm1kv2wLihIyzF3+wNFny4ZyZNlKsNRFd
         SlPw==
X-Forwarded-Encrypted: i=1; AJvYcCVgC2driTumaKidRTCPu4te44TtY6uRyB4Un901TJeJcNCNx8r2bZSn7m6eCLgUj64RFWm65FuxrkKs5dcyRf75KGHLmvQS+FzT0/kgFpjI04Ny
X-Gm-Message-State: AOJu0YxbuJfrG6SpDQnL1oucsSFzoV0JW9bzPJxOfvKWe3v1ETA9HVID
	lNXkxJe5qKRWrIcGZno/iDSnwmEhLEH8xzMO6vm0k9HPjCo4mrqGUA+vp7FZW8k=
X-Google-Smtp-Source: AGHT+IFh1NVRDFsAmAeBfdnNCSRt5exaQnTNYHe6n1Mgo2czviZlZUmZ8bQ3e1yieENQ7rbKHkE7fg==
X-Received: by 2002:a17:906:4acf:b0:a3c:9cc4:99a0 with SMTP id u15-20020a1709064acf00b00a3c9cc499a0mr2225129ejt.16.1707829642511;
        Tue, 13 Feb 2024 05:07:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0Q3w5wC18ljb0qoHP4W0gjT5C9FMsg90LWcTcV3wkk7aNk2qADp+B3bmyfkFvwFeGmIUkwzJRGNdqvXKl0flkEHCueTi8o19epb5RlyDZdiUYDrNGQKAnWFhV19gto/smjWB6cdoMlPfDVfjm8Dj4D8djOjlfM2BeR3YAceEVjffs2f6R0cA/T1mrFgASwXsUp0q7cQAFTqrmZxdXR6g88hRCQVBmWunUsrH32lEZfqrM4xMlTGP3Hb+7+irz3MRkXzgs51V5foQ6DHVYRg225aLUGdw0
Received: from [192.168.86.110] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id vi13-20020a170907d40d00b00a3ce1bef210sm1130409ejc.28.2024.02.13.05.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 05:07:22 -0800 (PST)
Message-ID: <92d4d421-54a8-4a41-8b47-61ae39b55ebb@linaro.org>
Date: Tue, 13 Feb 2024 13:07:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] nvmem: mtk-efuse: Drop NVMEM device name
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 William-tw Lin <william-tw.lin@mediatek.com>
References: <20240130095656.3712469-1-wenst@chromium.org>
 <20240130095656.3712469-4-wenst@chromium.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240130095656.3712469-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_050723_977246_82B2B688 
X-CRM114-Status: GOOD (  16.30  )
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



On 30/01/2024 09:56, Chen-Yu Tsai wrote:
> The MT8183 has not one but two efuse devices. The static name and ID
> causes the second efuse device to fail to probe, due to duplicate sysfs
> entries.

have you considered using NVMEM_DEVID_AUTO?

--srini
> 
> With the rework of the mtk-socinfo driver, lookup by name is no longer
> necessary. The custom name can simply be dropped.
> 
> Fixes: 4e6102d60d88 ("nvmem: mtk-efuse: Register MediaTek socinfo driver from efuse")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   drivers/nvmem/mtk-efuse.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index f5bebcecf9bd..9caf04667341 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -86,7 +86,6 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	econfig.size = resource_size(res);
>   	econfig.priv = priv;
>   	econfig.dev = dev;
> -	econfig.name = "mtk-efuse";
>   	if (pdata->uses_post_processing)
>   		econfig.fixup_dt_cell_info = &mtk_efuse_fixup_dt_cell_info;
>   	nvmem = devm_nvmem_register(dev, &econfig);

