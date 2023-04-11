Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB588C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 15:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAnyItecZ2z9vvTCwvHtRvd7Qhp8m4rVZ2fhtqoSxcc=; b=MrdyyVqLqpMef1Uf8h9JkdjLXT
	VYCvNr9H5Yl+6J3IWWDRURopl+fQZiyMwqFpt2vRtgdkiVX9lZl/lSoC1Epz+D+GwhXfJxF1g2aV6
	wEv9idFJJ/2I1t/voEf6obx74oaGSGZGy8qIxn2CElmwtXLCs6uICD8JURA/Hm5IEj8hwI6IdoNS3
	bf3OrCFaeXN6j8UEbS9jJDLlk5GdiuuyW1j6PGlu8heAlI5xgMgH5DaKrpUuw/T2qb5KQrRZz91NQ
	63+n6xiSNWuEX16x6JX2u9rLURWYEW4hdDN43LsQIZq0qw7AUqD5nyFf7HAJXusw2Le5Lql+SNebN
	5q5o/jKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmFjc-000OtM-0s;
	Tue, 11 Apr 2023 15:16:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmFjY-000OrD-06;
	Tue, 11 Apr 2023 15:16:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id gw13so4765065wmb.3;
        Tue, 11 Apr 2023 08:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681226192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAnyItecZ2z9vvTCwvHtRvd7Qhp8m4rVZ2fhtqoSxcc=;
        b=QepIDv2vzF9TGg8dmBYgO94A8bpFE/PqwDzOxtq1+LXoNCGvxc5oFX54q7g0YGw4fh
         XNl0thFWuYEVCzGZWJF4qIxrhsZeeGxewEemTWbPZWHKeCN9hTUHBdQsM7Ptovz8wrKU
         fRVkOIKcFvFnQANanbeyYLkQ9/KNPy7JnWFLT0610SdpPpKvK6OMXEJPHyuqTb7O4YC7
         f5nABwZv5BKnIkIo+0FQTOTjqudu3ooBnbVC25bu+t3n3xWhZhBYRULf/ZzhXWhmdW1y
         LGHcx9w8yr7tWCrcLGZFdQC5YA5zn2CPtn7DE3rSmJjxrbMCOAomAO37DMsf75ZvmYfU
         l7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681226192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rAnyItecZ2z9vvTCwvHtRvd7Qhp8m4rVZ2fhtqoSxcc=;
        b=WtoxjvIwFu9l3RbirjLq8LDBs4DX0UkuHSzdYRK0pfwPS4Oc4umCJDGaf/46G+wJQR
         KnJf/59onEjxwutkvw+pp8Uw8sZauhdxwmDuf8MRQu8OYoHkzA6be6YFQYxiGsWpGAON
         DN96wLyvnbhy/lqX0dfGcIiAe/ZebF6/N/qJbieNAWBD8tSCAFNDXG/Wa+G1z+z5Nd1B
         Lqk+OS1y/k2WuuTPMXQJIA3Jw6yC9+OS+5YD0DCuR6UQoiRqZGUNvLDAYiFCqh+qkU/R
         vuithJM5oeMmLbZYJw82Itkf9U7u7ousfhKqfpYRl8fiG2eYis3MqSeUFMa7P4LNYDZ3
         QfeA==
X-Gm-Message-State: AAQBX9ejCkZTPL82RKoou4+YtI7+ueOiqJ6FLb/CxxiJz4a54ai4CGb5
	tUjKSM+z1LXjjAJqsXE5l+k=
X-Google-Smtp-Source: AKy350YYczj9vQgtR8p+/keGudnvll6ePlBxMOGhUVM9Wl5egXGj+Ti3qENcdSQ608cDRLSeGQmNWA==
X-Received: by 2002:a7b:c8c5:0:b0:3f0:85b8:ce6e with SMTP id f5-20020a7bc8c5000000b003f085b8ce6emr6511718wml.37.1681226192363;
        Tue, 11 Apr 2023 08:16:32 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c4fcb00b003ebff290a52sm21212046wmq.28.2023.04.11.08.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 08:16:31 -0700 (PDT)
Message-ID: <c0f7b342-6dc5-10f2-cdc5-7af15d4d2fd4@gmail.com>
Date: Tue, 11 Apr 2023 17:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] soc: mediatek: Kconfig: Add MTK_CMDQ dependency to
 MTK_MMSYS
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230403093304.276418-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230403093304.276418-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_081636_087679_4B0977F7 
X-CRM114-Status: GOOD (  18.53  )
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



On 03/04/2023 11:33, AngeloGioacchino Del Regno wrote:
> The mtk-mmsys and mutex drivers do have a dependency on MTK_CMDQ,
> even though both can work with *or* without it: since CMDQ support
> can be enabled either as module or as built-in, it is necessary to
> add a depends rule in Kconfig, so that we disallow building both
> mtk-mmsys and mtk-mutex as built-in if mtk-cmdq-helper is built as
> a module, otherwise obvious linker issues appear.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!
Matthias

> ---
> 
> This has no Fixes tag because the commit that can produce the issue that gets
> prevented in this commit is already in the maintainer's tree.
> 
>   drivers/soc/mediatek/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index d6b83a5508ca..a88cf04fc803 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -76,6 +76,7 @@ config MTK_MMSYS
>   	tristate "MediaTek MMSYS Support"
>   	default ARCH_MEDIATEK
>   	depends on HAS_IOMEM
> +	depends on MTK_CMDQ || MTK_CMDQ=n
>   	help
>   	  Say yes here to add support for the MediaTek Multimedia
>   	  Subsystem (MMSYS).

