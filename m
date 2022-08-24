Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D10C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnINneYYpss74fFaxA2QzFV2m8mTzk2bkrWfDISsTyI=; b=iwAW+sBDm6SqdhGS07SFTlYAXN
	iw8CBOmVZ4T3VKn8VtHm9qM1/1sQ8tOdkiZEzY8Ql15yNvycP5QMmp1ewU2adPLOzVml3+aOoJ1IW
	4nbAkt1HOCiKdzyH6M6F0XMVCFm+2TitT6sNKFHFjLN5XNmRl8J9hg0AQPXGVSBfzqqcUgxu5cH81
	t8IVZG9rlUUmjk1P38lnCiLeS+yYc8F3d5R0pWdL5l7cSFB/36YkyROKgP530ByF2nr9PrzYq15SR
	etv6SmYp1pveclGJd7ZK+pwrKIBmKz/2iJpZB0bwwZJKmfHDx0v0bFCd2W8lf6Vn2B+FfFIuUG53Q
	ltCU+lDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQquf-00DRlr-Pj; Wed, 24 Aug 2022 13:59:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQquT-00DRfU-Qh; Wed, 24 Aug 2022 13:59:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id h1so8818762wmd.3;
        Wed, 24 Aug 2022 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=YnINneYYpss74fFaxA2QzFV2m8mTzk2bkrWfDISsTyI=;
        b=ilfAGLNDfRjrv7v2hXx6haQXcmjYzh4TRdLS3ADcOmG8o4XYaAXVEo6gI5Y4AxMWfr
         EE4nsM/YYdZWzWUC3lhrurWqhcSS55hSttFdJJrBMp/9Ji00cYRsoNoRSyvPY0hmY3Zp
         gNa2y0sCTZP77OjagAze+2glbFj/y/0wpQv8fsIrvWTyViJV+YxmYXCU8OfYGaRefU+L
         FJFGpr1nLr6KZpEwa419j6b3ARx9jfZHqXq2fVAHXeOBbrM3/Pln9oJlQGZ1cQgTNhCv
         aZJSnr7+bTOUBJTqvPzcQpKYue1znDw/hWgrkQuhBKWERv0hMHu/1KDpYimHiF9SQwTG
         UKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=YnINneYYpss74fFaxA2QzFV2m8mTzk2bkrWfDISsTyI=;
        b=X8GrdRFEqlWATiqq8WHXaPewsBrVvsUeQ+/R9Ulp+0BPP6bxIY8hDU4YegI9ngVged
         TiyhIuq+0PaUEhn+rAtyKHMQtcwI97gnn0b21hb4kHKUJ/7AVGSCyB8uGQ8LH3v24JqX
         95ueD50wkZsATgZXEC+7wqnUQax8cUclhRLE77ITaS+c6g8I1HbbUrxoG17+T/EZxwO9
         VkpqQCG+HzKCxGd4aUBBGzN1zbDCJPtVWKeP63W0PuCCvHnoE0yCSWsMpczK/b2RLM5G
         1o+lzl62bdLcBSqcNbEtU9H/L+yoJFq0zQMULCZU+qXxzP15ZKMIMyq52CuYF0aR3kgE
         gt3w==
X-Gm-Message-State: ACgBeo3Y1QJbXOhZeT/GuxXdO/ofHoSAh6YdTF1R8+oyFYIoPCfCcq64
	EixYFlkQSEqar+m5ZmL2ZzI=
X-Google-Smtp-Source: AA6agR6aunVXgh4W1vls5gdUD1YAugOnjiduggkUW4qwCv86sXjJCE4f6NzBM3Flg9r8pOFx7qRWww==
X-Received: by 2002:a05:600c:4f90:b0:3a6:2bda:dc4e with SMTP id n16-20020a05600c4f9000b003a62bdadc4emr5429153wmq.39.1661349547561;
        Wed, 24 Aug 2022 06:59:07 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y2-20020a5d6202000000b00224f67bfc95sm16842095wru.62.2022.08.24.06.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:59:06 -0700 (PDT)
Message-ID: <f8a391de-dd47-1eb9-0e15-e6a651517a6f@gmail.com>
Date: Wed, 24 Aug 2022 15:59:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 1/1] dt-binding: serial: mediatek,uart: update bingding
 for MT8188
Content-Language: en-US
To: kewei.xu@mediatek.com, gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com,
 liguo.zhang@mediatek.com, caiyu.chen@mediatek.com, david-yh.chiu@mediatek.com
References: <20220809084457.31381-1-kewei.xu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220809084457.31381-1-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_065909_896644_AB907AC2 
X-CRM114-Status: GOOD (  14.21  )
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



On 09/08/2022 10:44, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the MT8188 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> v2: Resumbit the patch based on the linux-next branch.
> ---
>   Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> index 4ff27d6d4d5b..fe098d98af6e 100644
> --- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> @@ -42,6 +42,7 @@ properties:
>                 - mediatek,mt8173-uart
>                 - mediatek,mt8183-uart
>                 - mediatek,mt8186-uart
> +              - mediatek,mt8188-uart
>                 - mediatek,mt8192-uart
>                 - mediatek,mt8195-uart
>                 - mediatek,mt8516-uart

