Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3AFC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMlPXBM3hd9jIHL9hgd0wOc31UORXSj4RilM3kqo964=; b=gJW6FoKoOEE3OsuUGRpfYakfGs
	9nrAzybH63Qv/+rEG6AUse5OsufGwl3iVb08+R7CpX3YQcxGpLHDB9TbUU4c2Rr1aURSF9YstRkIo
	RB8S3yvJMzaEbPV7udW3QPiTK7gt9uTXX0RVU4BLOlpQLF1hgh86P86YT3zSXGmzPLYN3IXAkRl26
	Lh3XTr3AJUMHxVA0Ksp3unJb8oQ8UgkVOH1NSqT86D4ePrYw+uSMME6PsIR0VVrij24IzfowMjewq
	f+VaTgpSbvG6Y7O9eaPpMhLW5aghT5KhLNWSoSFmzzzUDROIHr0mA9NbOgwDfIXcCqzjsx7AvtNO6
	Xidxazug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZjQ-00394L-0v;
	Wed, 12 Apr 2023 12:37:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZjN-00390W-02;
	Wed, 12 Apr 2023 12:37:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id j1so14743498wrb.0;
        Wed, 12 Apr 2023 05:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681303061; x=1683895061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HMlPXBM3hd9jIHL9hgd0wOc31UORXSj4RilM3kqo964=;
        b=Z6aVvxumaepTR1WGJnrlhUfUxQORULeGEFRjMblfGS9rRIUBbD1guL+66kDoGL4L2F
         EJNPI2WnR9X/nptHy2HVSvB3cX5oQs2CyIUCjceXuWD8mg/12SB0Xgi1bhlRX1O+L45k
         Pr1WQeTvwalajQQlbo3kJdwwY+yxm75ZIQB+9XceHwL8B0Y0wk12WQo5Kv7wL1J8lN24
         9B+aPa0TI9AwPoVCBDSJbKqeJWCF0o0zg7OxvKe9irQ+syXvy2jlZ9til4kd3dINP/15
         Ayuo+c9aKnzXnlf8nMEGcNEl0ErehlBR/mi1ZpBBS0m5k5tdcRZtDadBe9P5jMsgHGj4
         CMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681303061; x=1683895061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HMlPXBM3hd9jIHL9hgd0wOc31UORXSj4RilM3kqo964=;
        b=7RQaDUSw+5Pq7by3Jn5hpRciSnDWR88gUzpoMwQ+KxJnGokQelQw8wBkWiS/qGWvnx
         D8nz7fzVJCwdcULZV6Pq4GEdNqJaGJP8Ax8ipBOCKq9J51v53LJNvTq8dMadTMpEu2vV
         IyRK6/3IzloXOWmbBTlJSeRGKMQVMsarkeSrrjLKcKoCGWpWrP7RZJLXpzl9QGrFUawi
         GVZ4YSQjzNYD6IwDYVn+gkQV4zdmXq0YomVzXKy3TxrBtCJHDFL53TE4jOcDxlCMAtEP
         fHVHZE/LyZPkNap9RKx7dL6tRbPjx5iMIhncwBIdbkUt3JL3eJCiCHO5axdyTJjzM5Rh
         p7Vg==
X-Gm-Message-State: AAQBX9dTsgb60lPkS9RynmzpC9Cp1uIH6S84o6+eNC6FCP/g9mSsG2Ph
	757BjnjId7oz55xroRV+eEI=
X-Google-Smtp-Source: AKy350ZArefRK2km5RNJgiCd8KzO9LsFvtICtB+2FMvxRJx3OiTP5Hvi3HzbZ3HgKraJfWt5r3+hXA==
X-Received: by 2002:a5d:6e8d:0:b0:2d8:81a9:4d75 with SMTP id k13-20020a5d6e8d000000b002d881a94d75mr12073306wrz.32.1681303061489;
        Wed, 12 Apr 2023 05:37:41 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e18-20020adfe392000000b002c56013c07fsm17037899wrm.109.2023.04.12.05.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:37:40 -0700 (PDT)
Message-ID: <cd2906d3-5490-b3e0-b02a-39b201a65bb1@gmail.com>
Date: Wed, 12 Apr 2023 14:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 11/27] dt-bindings: display: mediatek: merge: Add
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
 <20230412112739.160376-12-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_053745_068648_AE053CBC 
X-CRM114-Status: GOOD (  12.78  )
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
> Add a compatible string for MediaTek Helio X10 MT6795's MERGE block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,merge.yaml   | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> index 69ba75777dac..be330be1399a 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> @@ -25,6 +25,9 @@ properties:
>             - const: mediatek,mt8173-disp-merge
>         - items:
>             - const: mediatek,mt8195-disp-merge
> +      - items:
> +          - const: mediatek,mt6795-disp-merge
> +          - const: mediatek,mt8173-disp-merge

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   
>     reg:
>       maxItems: 1

