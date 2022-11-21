Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B052C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 17:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H739gohkJQiXvKefWiLyqitYzOD/5OYfD2uRzWxJMv0=; b=YZyWN8n0WI5J9UPQFoaKjqAvz/
	N5y8pgJAXlmuA8Y2e2AGiSk0BCyzCSCfEkk59zT2WvklLcAxHSasfHuhKSeVMIz8vWZ5NUxg9hngt
	uNtIL0AK6tQjQXHxCt5urBOWQKnyDkpIvOJdcv97jAHuYWpWRdny75BtNtitchMsgGvh4oavwKjb5
	Y6YDA5lN42k2loKUVjNpaf2CvoUg+ibMb1cqDcOIh3AFdAtMvlvgYlAgjHycWIaT5p8HAMa6N/sKB
	sMphFUqbbIeIZSppAqaTyFYd5RtCP59QJLXdXc2Vr2azdHrV/S2hhMhUm/Q5u3e51L783zEq+OIHV
	wUwR/PKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAhl-00GNG4-Mw; Mon, 21 Nov 2022 17:35:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAhF-00GMxa-Ho; Mon, 21 Nov 2022 17:35:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id x17so7479205wrn.6;
        Mon, 21 Nov 2022 09:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H739gohkJQiXvKefWiLyqitYzOD/5OYfD2uRzWxJMv0=;
        b=Sw4vUrpV+2ZKerURpiiaRPbic/zppeNW8NcdRE+SOtCQaKWeI7Z9q6CLWu9trUZVX0
         dOBHa2KaSZV9zAL9fOGSNVWmAyEmP5pBTfbUFA3Z6/SlswhOql+H3ZPXezC9oKFC8Ckw
         HffyxJS3QDcqeJM7CFeNaVIFlWHCEEthmCXJ2PeL9qAt4BjS0e+gfd7/XDJy68WlnYeS
         W44A6uI+xi0e77dXoiRLxzlGsBM2JbtLVr3w9WD6z4Sy/+e9JhPsiVUzutWxv2MA1oXq
         dvbvHUUfW1aFUpOZAwFZZ4KaRgF+Mk39DfSO5njA/EmDr3vdoVecxTtm82RlS+tV12v/
         aonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H739gohkJQiXvKefWiLyqitYzOD/5OYfD2uRzWxJMv0=;
        b=xJ4GN1ni6Q20lOPeEDkl94YGVxD4I5IMNkRhU7wsBDp7QYU+UH6Q8+w9/YWsWkGox0
         pVfF6lcMEsYXTin9uvlMvKB2fG/6NxNEL9KcvjG10BJDUXbPLXyCkmFiq8Ysl7lm/Da5
         jvdXDBb7C4Nfgrgjoe0j/SAa6GHEUubzq+1cJfh5bJuOQMlwFN02hjhowrLhGM0NyQS2
         trw/YxyCgdT4WVEi92rnWRJXUw2ndQ5mBgPQZeiAHhH4oYnNuHwJdLNn18cwgGfjL4bA
         3SdiyQYIO7DSNfMWTLCwTbun/z5bWjFKkfIdEc19BYEHDxDGQ8GD909kf2nCK4VSueaS
         EPbQ==
X-Gm-Message-State: ANoB5pnZ8MQ39KEk4nxnPFNOSkrjp47fGzvXm7QxrH5ipnWWYxsULpK+
	9Z8mfbQ8Zu2Kb2vKDx8S7r8=
X-Google-Smtp-Source: AA0mqf6s5UrB6KSQzIfGircalN42vcOhoXNt66f+1gAnQqi9w65qZfja19jeAbwazXHd+sfm6fd/Aw==
X-Received: by 2002:a5d:538b:0:b0:241:c3c2:24cf with SMTP id d11-20020a5d538b000000b00241c3c224cfmr3225033wrv.587.1669052103907;
        Mon, 21 Nov 2022 09:35:03 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c4f1200b003c6f3f6675bsm20780645wmq.26.2022.11.21.09.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:35:02 -0800 (PST)
Message-ID: <1c33cf07-900a-7acf-92d9-ad40f8543db8@gmail.com>
Date: Mon, 21 Nov 2022 18:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jitao shi <jitao.shi@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stuart.lee@mediatek.com, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mac.shen@mediatek.com, linux-phy@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220919-v4-0-bdc21e1307e9@baylibre.com>
 <20220919-v4-1-bdc21e1307e9@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220919-v4-1-bdc21e1307e9@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_093505_662131_36A713FD 
X-CRM114-Status: GOOD (  12.37  )
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



On 21/11/2022 15:19, Guillaume Ranquet wrote:
> Add a compatible for the HDMI PHY on MT8195
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> index 0d94950b84ca..71c75a11e189 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> @@ -28,6 +28,7 @@ properties:
>             - const: mediatek,mt2701-hdmi-phy
>         - const: mediatek,mt2701-hdmi-phy
>         - const: mediatek,mt8173-hdmi-phy
> +      - const: mediatek,mt8195-hdmi-phy
>   
>     reg:
>       maxItems: 1
> 

