Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC00BC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqzXeJlC0I7OCnn6X0zvc6BscDwvzPmPZCU3yLPpNiA=; b=R8gryV9EYO5vqvGKufDp2AFmdu
	d7LH17BQguMDsICMlMrmQZKKhh32lAAWdU98ZuVEwGe6+7myb3Hcip6y0Qe5XZIlZdBVruwxQZ1A6
	ELLmpfjAr5KPofSm5zkI36Higvum4VchPROjgZISBGPIvkhD1cRGmyksluKAIzmdv9zW6aIYLPIPv
	xXjJRLyyJbzBDFMu9jgAAFT8Ilv2RlqZnNesb9xetAojCWut07Q4CEBMZxH2nsUOyeZKyEt4ca6sr
	jjujZ/GFJ66u5vatDgnaMZYS9uqWdGsxF0QGQa4hjI3hipn875dr2ozZHK7GjeB8S70Gl2Sz8N1Lj
	jIOuVr9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZjb-0039CF-2K;
	Wed, 12 Apr 2023 12:37:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZjY-00397h-3B;
	Wed, 12 Apr 2023 12:37:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso11149179wmr.0;
        Wed, 12 Apr 2023 05:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681303072; x=1683895072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqzXeJlC0I7OCnn6X0zvc6BscDwvzPmPZCU3yLPpNiA=;
        b=g11yy33k7UG9ipZVQ9TTaveA9K8uRz761fIaV7l2bVKANwUlHj+6VO9ulIV6KMZ1R+
         1I3cfHUYxN+56k/nPh4m9ceKodMdrpuCOWmSpJKE/dOPIhiibtAwrEzR+0x49wDMNuSI
         sc4v/V0Fwh3+hj70QfO8gBccxGwGOd/cIvrFqRoUmoiKiHeUZeox+oo+I/a3NbVnulwn
         ssmrWOc/7APl2rptNC+KuwS47t6unxlguKwRN2KvpOH/HRAhhRbl/3uZcXGaosLwv0RB
         oYF0ZSKuIK0tVeVriN9wY2CSWBPDAXu4I1xbOEm6YWc1vKsRbd25DFVFh20woxjB23dP
         zMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681303072; x=1683895072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqzXeJlC0I7OCnn6X0zvc6BscDwvzPmPZCU3yLPpNiA=;
        b=p70Iasysh55mHDB6AULo/nq32N/buOCzqy8daPKd03b200sZxSQFEW/wexRb/15Ada
         G1anPTDurYzng5e4kzWTwjtrNMCbd/aowHUeMBS40S3gHoBfrCwpV990hwsSXd86ekFE
         dcQLhzGDFY3FPSAUCivDRO/rZ7VNw5MYGeHkGq+C9VovGhNmOstI3GSDAt0GvdBaXgCE
         R2XmbvZt6ncfcVILIJZSIfd0YlKriS0Zu0Mkl0A/PDkeDVeuktxp5YmYHw8lwaZW8WE6
         zeLOzO1IRuL302OnvEZq6Oly/IX9TbJH+FWdg60gUg8RKEr1VdLjDakPbDfr8jXHDrlo
         mcNg==
X-Gm-Message-State: AAQBX9f2J49mq2azGi7Ftnc503L06iDeCGCblEoWyd4+mO0m3MzWTpdK
	/dg50JAgSnvklBP+xPb7Wys=
X-Google-Smtp-Source: AKy350YE7V2DR9bqM7GHaBKFa8M9MorPtdk6Hf8fTIr6Fb5dH11dtYMtZVVF1m92uPYPmtcZcNtEYQ==
X-Received: by 2002:a1c:4c08:0:b0:3ed:1fa1:73c5 with SMTP id z8-20020a1c4c08000000b003ed1fa173c5mr1898107wmf.27.1681303072175;
        Wed, 12 Apr 2023 05:37:52 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u12-20020a5d514c000000b002c561805a4csm17085971wrt.45.2023.04.12.05.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:37:51 -0700 (PDT)
Message-ID: <fc679db4-8f56-a707-9e28-6eb109b37011@gmail.com>
Date: Wed, 12 Apr 2023 14:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 12/27] dt-bindings: display: mediatek: split: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-13-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-13-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_053757_028333_A99DBA0D 
X-CRM114-Status: GOOD (  12.93  )
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's SPLIT block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,split.yaml   | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index 35ace1f322e8..fa6dd9b649fe 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -23,6 +23,9 @@ properties:
>       oneOf:
>         - items:
>             - const: mediatek,mt8173-disp-split
> +      - items:
> +          - const: mediatek,mt6795-disp-split
> +          - const: mediatek,mt8173-disp-split

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   
>     reg:
>       maxItems: 1

