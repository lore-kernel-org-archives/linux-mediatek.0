Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC63C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOc2AucAU7aYdgbiSm2th1euSZVFGfwkabbTq6fep20=; b=IeyqwQg+zWyPXoif8U4UpeIzIW
	q6HZllN8t/fK6qyBTIcg3dTUAXH1qgMWfqNJw7vlTam+Dlh8l1B4jR6UAJmx64iqrKjcS5B6kTYTO
	NmrlTWjIKcNhkgNzxSVNf7o+Dsn4Az2ZaSP6JJ8WVGqlgwf8csY0HCjVVJ9nI/nfZG98cLSSniHxJ
	QlGL6yP7kQLNy9exCzxs7Oww2QC45PU+0DyNyMiE4Z2C3qSQ0veZjuNrWGgBRKUcxmZlpfbiGh+RL
	gfFgEYP2V0+lRwx4swD9gvwppPkPSpY2IAzGCBpLEj0Xk7PWfNeFia7o4kva6IlSl9rd8Ag9aT5yg
	drtkYGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZhJ-00383S-25;
	Wed, 12 Apr 2023 12:35:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZhH-0037zT-0X;
	Wed, 12 Apr 2023 12:35:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id he11-20020a05600c540b00b003ef6d684102so4298934wmb.3;
        Wed, 12 Apr 2023 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681302929; x=1683894929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nOc2AucAU7aYdgbiSm2th1euSZVFGfwkabbTq6fep20=;
        b=m+v514HGaFK5Ryst2GvVu0WpbKzjiMUgoyTC3y7ib70zmND8f67yDqDhLEyszteIcu
         nDEgm33pZMF14/NNYFE24RJ4wbeF6salTTbtdl1udWn14nlYygKujZcEmXvXeCrBKu20
         +uHCSmVjN7gN/VCu2q6bPg9rk3QWIOcAVF8XQ8OFc/EyKn6V4ER2/rkYwBUSltPIteMT
         snSivVlPFZSUA7xOhLeIVhtWzFFbsxi/TyAwby9iugYa7cAG2iQNu0+ThiWWmiAZ2KsA
         I8wgaKW3OSXULH/DAaKqPGc/lFQDpCVKycLjbmpJbYKXoe1pSxtsvoQj+sPanEZNJ6af
         xwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681302929; x=1683894929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOc2AucAU7aYdgbiSm2th1euSZVFGfwkabbTq6fep20=;
        b=6gDlzp6yULXL010ynqQWwf0yCrsmbGbvqZL6lLI/fq9YJCGKG6dQDaNaFp8IjLf0kn
         QX+h7BKzFE/3iwLJgUaX4zy/cUnUuo6UyaHcbdbqGA65EmNTBwZwKOP6VWu89KaeiT8o
         TNWy/dDjIxhPUKlMxRW/BIrRcDeIz1I8E5NJ/IqhHm4KNFY3/oP+2IjJJgcbqqlqtdEx
         QAhjBgS1wS2WvUAnDvCdYP/xZC4tqYvYh4WdCC9HHNL25qWAyvPrVQCGl0KJvwDRao+F
         pqw3ZfTOMn1TpzH8OuC+d8IQF0FHdmw0sCnpWiv6vI5cWUE0Gg/NMHlL8Qj8hgKmDvP8
         W/EA==
X-Gm-Message-State: AAQBX9eoHJ1HShbvmjGw2uk97B7QTZXaQJrCGOC2D8MuzE6O/1WKwUI2
	jcu3rdE/jjYo5ERbha4a92E=
X-Google-Smtp-Source: AKy350bP8nKYohS7TIl2I5thMGIpEvLFOztUtKV5055tbR5s2H7wE+Qv5yJdtdxWYRvuV7mf/92Nfg==
X-Received: by 2002:a7b:c3d4:0:b0:3f0:7f4b:f3ab with SMTP id t20-20020a7bc3d4000000b003f07f4bf3abmr4704930wmj.5.1681302929390;
        Wed, 12 Apr 2023 05:35:29 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c8-20020a05600c0a4800b003ee5fa61f45sm2359319wmq.3.2023.04.12.05.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:35:28 -0700 (PDT)
Message-ID: <6920f628-8e8e-b800-eaeb-2703a9b7f9f0@gmail.com>
Date: Wed, 12 Apr 2023 14:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 04/27] dt-bindings: display: mediatek: aal: Add compatible
 for MediaTek MT6795
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
 <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_053535_204667_8DAC3E16 
X-CRM114-Status: GOOD (  12.21  )
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
> Add a compatible string for MediaTek Helio X10 MT6795: similarly to
> MT8173, this SoC has the gamma LUT registers in DISP_AAL.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,aal.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 92741486c24d..7fd42c8fdc32 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -27,6 +27,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt2712-disp-aal
> +              - mediatek,mt6795-disp-aal
>             - const: mediatek,mt8173-disp-aal
>         - items:
>             - enum:

