Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A83EC7EE3A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuPny2OtXAzM2wWK6VJ+p5t+ABcpKnPrmiRDWrl/TM4=; b=WCTIG9gtf9ReIQ+roQ1FYxAvlg
	718tyiQHpCLid+wZVaLxkwlEW56d8Aj1dhp+ZpdDiFvHrKU/ylL1Or24PuCabr6GlPVjagvHrTTL6
	QOLDgKLXiFfslQI4rlh5NRvn41ykxQB3KaucOZcIJtvoubaSfKKiiRFW+8VdNexAEj2Sn3b6Zi+5H
	VEymvaDfZPHPs6io3GLHBO7atEZm5gPlq3QQhWcQm6HSGrywxdwlR0wAl3CwmZIBdVDMNiFP/ZGRU
	nhrxJxVTPWX2A7LlFwjs1iNifX2p6qqjWT5cqr7PR+pGWe5lZe4/tBNKiQ93Kagt1wj5bQMimqGbQ
	sMoZF+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dWz-00Aic2-1N;
	Mon, 29 May 2023 14:07:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dWw-00AiaG-39;
	Mon, 29 May 2023 14:07:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f61530506aso34876975e9.1;
        Mon, 29 May 2023 07:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685369241; x=1687961241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LuPny2OtXAzM2wWK6VJ+p5t+ABcpKnPrmiRDWrl/TM4=;
        b=S2L7ubx5W2cOkZ8pVxf0WL9LIoKztesZZ7B2oDF4cIv688EwisgTFdGiM051ckbdog
         IXapWwJUh2Sh6C7luDJmahU3Z1RFiNnb2Xcc5ff1MQi/cBNguGxh3qq9r2Bl7TGwBbE1
         bSK0Ywk6NRfXydQ4E8JfKxCbrJbbQTkPJbgXxCEC6adjw90zodzr7FC+1MguNY0Y2fQ+
         zR31DzhDv+0TkE1tTVvgqkRujPKG05bWuEgyAx+upRvmciOpX7BQvMA1kJnAfcSwE2q/
         7Bnlpgt016RARi6s5pTc1VXtFlvPg1WJ1f3QbiwkXDjMkEARdqGYdrv5Dqbly81nqaFT
         oyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685369241; x=1687961241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuPny2OtXAzM2wWK6VJ+p5t+ABcpKnPrmiRDWrl/TM4=;
        b=NRIL0jEnr6Rv2MhwVseNV/C2wJGfEq7U93QipaU5yUlBeEYXumts0Jvw+dnIRvBxQG
         ZLJbbvTLopsa/zmeuZlVdjInMio2sbQTehY2qVcAnxdiPnHtQ3jr0HWIhDyfUo4N+hDl
         CnrtzCXe0GgpQgjQ8dx2Lekc6+dcf3UHDPD+wyKv5PAxJxQ2QXnH9IqqU/+4vfUVYQ5O
         u+XDH3nspYTJ7muM2aVEJxKctVGXNXyCT7VJWzj76npwzq18MBy0hDG4YbCb7no45RwN
         HcVjF3UbG9mSrx0j45aLCIGL3rrzGIhH0NXNhZvcJER+YK8armddf4v4g7BmK2rjrx/7
         kW8w==
X-Gm-Message-State: AC+VfDzoNfrSXPiqy74BSizUkpvMf6KN/afW23hcb0EhL/9/8BG2kYD+
	oUw4mHxdkB+ACozRtsNgkZQ=
X-Google-Smtp-Source: ACHHUZ6zxu2kt7VKYzBTez/NpRcKvfFT/05iC4XI/22RhPD4iBaJlYpy/McywyI+4iaDMmBq5kffpQ==
X-Received: by 2002:a7b:cb9a:0:b0:3f1:72e2:5d13 with SMTP id m26-20020a7bcb9a000000b003f172e25d13mr9545158wmi.16.1685369241290;
        Mon, 29 May 2023 07:07:21 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z17-20020a1c4c11000000b003f4ecf1fcbcsm18247034wmf.22.2023.05.29.07.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 07:07:20 -0700 (PDT)
Message-ID: <02a588ca-680f-ab45-1005-768d5b5db252@gmail.com>
Date: Mon, 29 May 2023 16:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT6795
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_070727_017913_B758E4AF 
X-CRM114-Status: GOOD (  13.32  )
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

Hi Chun-Kuang Hu,

Can you help to merge the missing DT-binding patches in this series?

Thanks a lot,
Matthias

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> the same parameters as MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../display/mediatek/mediatek,dpi.yaml        | 23 +++++++++++--------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index d976380801e3..803c00f26206 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -17,15 +17,20 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - mediatek,mt2701-dpi
> -      - mediatek,mt7623-dpi
> -      - mediatek,mt8173-dpi
> -      - mediatek,mt8183-dpi
> -      - mediatek,mt8186-dpi
> -      - mediatek,mt8188-dp-intf
> -      - mediatek,mt8192-dpi
> -      - mediatek,mt8195-dp-intf
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dpi
> +          - mediatek,mt7623-dpi
> +          - mediatek,mt8173-dpi
> +          - mediatek,mt8183-dpi
> +          - mediatek,mt8186-dpi
> +          - mediatek,mt8188-dp-intf
> +          - mediatek,mt8192-dpi
> +          - mediatek,mt8195-dp-intf
> +      - items:
> +          - enum:
> +              - mediatek,mt6795-dpi
> +          - const: mediatek,mt8183-dpi
>   
>     reg:
>       maxItems: 1

