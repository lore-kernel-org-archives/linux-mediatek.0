Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18281CE7A88
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V10gzi2RlVQOmrv/zaocoqbYLQ49RKI1zclTkXbhh6E=; b=T/wl9ktwEJa2lMXJDE2yvTNa3Q
	S/nqVRQJxW951cqTWOumWjx3bhfCzrpR1VjoRgo4DnyNDWNrBmfdzzkOZpP74kyWdXcnCtpSLJodi
	qcOTXBOwtE6ocZg7sjWgW0rzmSBDgEaB86YBOg3Guv7WwR2L/QRj58ZJ4kT8TfjMHwvDKe5Se3rqH
	TRR/No1ImXvPN6mafgFQaxKTUzOpwfpmI562KW36GAwyXLgGphZelDFjv7I+Ms8fJkHC6NbBtzWYy
	xQfkoKcD3q+6GSR+y+9xqGkUT+RFMJoQCatOWu46GqYydydN15IgakT+3HDHo4loCNlYSffdagNhg
	no5l+a3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6aE-00BGZb-2s;
	Sat, 23 Sep 2023 17:38:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6aB-00BGYd-26
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 17:38:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4053c6f1087so29613635e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 10:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695490698; x=1696095498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V10gzi2RlVQOmrv/zaocoqbYLQ49RKI1zclTkXbhh6E=;
        b=ptqAsGnmu0mrxaMLooaB3Ulwy4V9+xOcHpw5WSAKOxZ1pCopT+DiHStQ7+mcd9gCry
         pr7VO1OJB3DcaDMgGLcoCY++pBoXc7wKdgw+J3ka4QW7SkAIvodsOQX1oyHC9N/BXZAe
         JCwzcxGl7obdgupQrWAE+VMWvHsgWlRwCCcmyFsiIi5UAWb5OLiUaoODz6HAXCT6LLGX
         cQlHjJQvwk9Tdi5HnkR8sB7dPtWIYYyphfm9ycfVgWwwwj4yKFWJh9xFiPc53A3Ku4F0
         9nMaLkSBbUASfeQqs9IlsR1weqWOO4Uv/e1GIcjSOnypSEJjxXJMLBHPOeH8xKzAZKdO
         4yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695490698; x=1696095498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V10gzi2RlVQOmrv/zaocoqbYLQ49RKI1zclTkXbhh6E=;
        b=gP13LnyeTMFYwvnEWMs8XsKufG/spoOzQCWqTBIxE6rWO2Sm1g0v+twMEfkgO3W9wg
         ryNUnGknzNzOOOPRLDtVjWVTrXJ0Rhup1oN7TSQsokh2CdSmUvuQUeHZX9Uhaiy6aMyo
         7am09TRaaI7zXQLfUVKHCseSdfTQ5SZhJ8yhxjVesIysAfn1YlPnH6SawSGBDYThcS2R
         jERE/N0j96PBEqCYhjB7xhGvPIg4fUULfWDEmhP1dPEMnSleDEFDaaMTvWdr22t0j3BL
         +t04X+btcCusCr6uQQY1HZgHEWc2wgwmtxOah0begITGpdtTDQLgRlepV/20tWThqaSc
         yGDw==
X-Gm-Message-State: AOJu0YzjfhCSWu2Z0otKz2xaiHfeAg0E0/xcRk1fAfICPRv+l17/FtsB
	4O1yZlnSOnnzP51BR3c6ZvRqPw==
X-Google-Smtp-Source: AGHT+IFCjRZIcLO+0g8diFjimp5gtGgP355llzi7E+8lc8YGycCcAJHapljUSf7AamsNzyP9lncAsA==
X-Received: by 2002:a7b:c38e:0:b0:405:37bb:d942 with SMTP id s14-20020a7bc38e000000b0040537bbd942mr1967658wmj.4.1695490697643;
        Sat, 23 Sep 2023 10:38:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c248b00b003fee567235bsm10604723wms.1.2023.09.23.10.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 10:38:17 -0700 (PDT)
Message-ID: <e4311804-bb06-ec04-8479-dfa0466e4b35@linaro.org>
Date: Sat, 23 Sep 2023 19:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] media: dt-bindings: mediatek: Add phandle to
 mediatek,scp on MDP3 RDMA
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mchehab@kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
 u.kleine-koenig@pengutronix.de, linqiheng@huawei.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com, wenst@chromium.org
References: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
 <20230919095938.70679-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230919095938.70679-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_103819_699562_22E06518 
X-CRM114-Status: GOOD (  13.52  )
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

On 19/09/2023 11:59, AngeloGioacchino Del Regno wrote:
> The MDP3 RDMA needs to communicate with the SCP remote processor: allow
> specifying a phandle to a SCP core.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/media/mediatek,mdp3-rdma.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index d639a1461143..0e5ce2e77e99 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -46,6 +46,11 @@ properties:
>        include/dt-bindings/gce/<chip>-gce.h of each chips.
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>  
> +  mediatek,scp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the System Control Processor (SCP) node

Why? Why do you need it? For what do you add here phandle? Your
description should explain the purpose.

Best regards,
Krzysztof


