Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EBAC77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfV+vHgOiOTb/T8PGJETWUjU9ShSgfKqGb/lRZ9bS+Q=; b=j8fEZpGBya21jfVraEoMq3HP77
	+wcllGzGiexkGRm8zbmXiKaoqh0cac4QbQkTR0EfV4aG7YeeDlNBPm5RFZp0HZKquYXEoHTGAGEcR
	3Gncsgrq+R6NO11qzP89DCsx2Z2cBTGMKoOu7ye56mg0T6VYtwSDein/NaeqiDFx4F1cDOZ2KDwDF
	xTlaaIjccBxvUPjTQY0ULpLTKpVr9qz09rkcPPg7sjOBp30MR5vVPRbawsamIBZNjbDe0cqd92ta0
	GS0BOqtcR25uoo/fepaPRp4/+8siAbtdr3DHGYHdIYKrihtDYDkoB66Z6XWpVqxOOVyC389rgm4fW
	JN2XXvsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEm6-008hQN-0N;
	Fri, 14 Apr 2023 08:27:18 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEm0-008h4v-2g
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:27:16 +0000
Received: by mail-ej1-x62c.google.com with SMTP id xd13so9811329ejb.4
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460832; x=1684052832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FfV+vHgOiOTb/T8PGJETWUjU9ShSgfKqGb/lRZ9bS+Q=;
        b=TXtg+5vSMswTh++PcVMw4FZVIJqiJXwtBF4esfUNcovAdf/NpcKSjcUBpatbisjxWJ
         1m3+T5xQIJMtC6itqvIY24p8+E3w3ulSHduTDMIz6GS7nU6oZ44ajbOjyIS8bdz7mJpy
         qxNUKmIeFOHGKpcVhauyQ/Ct94cEDQNwloMkJQzoPNWXy8VK7wgirOKomhYBd05xfbsm
         6nFmgoLKnZN10M2aIP00kyw3jXrKfO5vThqEULTFKVKu367PJgNidsKBUcg0i9HVQsUm
         VlrXmuInv8FGw66mhBXkZPMxcFgx1eqLzoDO+PsZE4esAJ1vYNVK6veTbl+F6t7oVHkl
         k20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460832; x=1684052832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfV+vHgOiOTb/T8PGJETWUjU9ShSgfKqGb/lRZ9bS+Q=;
        b=HBaKTa1ZskGzR69VgRZSd9GhmAPXfi+MWjFCWDUe/nK7acfv+CjrZQdDEvXzMDNMMp
         2DnGw8Hj3MGH8yPF4VJs82MJqdZLMFv8QCDpXVQQUXPdzhV2Ok8HjJgT6vTiZVDniWzg
         o7fff2K1ddYDXuu5y35dgLUa9lkovZOId7BkQQICSRxpqpmcMZSvD9QQTIl24LVeUf0E
         bw8vyOXu+W9PFVaptZVEML0eL3pEBaGjHKchhkH7cp2PlKeOqqdvhPFR7nbRTORVguqn
         LIbz3AQyQexoX5dDtTl5YBXYrGMzPKdHjU7xk6h8rW1G5zWNNwpWKqY+v7urPVy8NNdc
         nqCA==
X-Gm-Message-State: AAQBX9dmJ0NYH6+Kh76C85AUZx0uKnvwfvlrru31vAT/QvPeHm7HzAJa
	4nlQof1X+O/LNXYs6hAcmD3Vyg==
X-Google-Smtp-Source: AKy350bROMqGwlhCVGwl5H8OJ+bgHbDFNGXpnOwYOw4FLgadYWAX0xpuhZWD9cFLA3D4vEUtaQZhkg==
X-Received: by 2002:a17:907:10ca:b0:94a:5a9e:9da0 with SMTP id rv10-20020a17090710ca00b0094a5a9e9da0mr5236919ejb.77.1681460832272;
        Fri, 14 Apr 2023 01:27:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id ss23-20020a170907c01700b0094a611b21a8sm2072758ejc.223.2023.04.14.01.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:27:11 -0700 (PDT)
Message-ID: <ca69a9a0-5abb-e3b8-dbd7-0389da955bd1@linaro.org>
Date: Fri, 14 Apr 2023 10:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 10/27] dt-bindings: display: mediatek: gamma: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
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
 <20230412112739.160376-11-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_012712_879623_91827D4B 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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
> Add a compatible string for MediaTek Helio X10 MT6795's GAMMA block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


