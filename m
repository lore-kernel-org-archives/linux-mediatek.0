Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 10:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzwVtEjWRC9NFjDfm/wqYz6cGQKlRy80iRMlQt2nDYI=; b=GVtCpdqT1hu6wb
	2dzEv3m6NbsSOSGQVN8fa0iRUJnKKRaaTnydWIckBspPYI+s/RmkFXsi4vhv70AMxbAjaM9kMPsDj
	ryS5OJyeoNns1HEGT11pAziP6e/X7muwTHYxAnmLWWUfmq128ntDMCzdv2Li7e9508ByPYZCLiDdq
	YBSOaUrnx6duRQqzjhLIe9h/tyToW9lnY5WlP5KalbcuE6SFiMunNf+LAr5vfngZEB6BFCP6217Yk
	aAj897UZo5IlXprjYGKdBPMGNtZCb/tiEGxWqTDeT472NKyrRLGIB85y3sM506f6MXA/qvPJLPLqS
	CEth5VJfokzZmGWtrNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOd2V-00BS7J-Hj; Mon, 28 Feb 2022 10:13:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOd2G-00BS2n-2B; Mon, 28 Feb 2022 10:13:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so1878916wmb.3; 
 Mon, 28 Feb 2022 02:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iHjNxJBcliVXwUGTUuDrqJ48gN0ghqxi7GbNzI66nDg=;
 b=B5yHEZ8nfvEze7BcpERA6IwTFyTFlXmEnHPj+qeY8Lr7ulvVFeEYomuTTmUnFkQZ4S
 GbFdZ0I8BjI/gZ5NapYDLIPu/wShTItEkdLmz4MTEqBS0be7b2HpmiJgUaGNpftl6wdA
 PLzQPyHLWR5q46ZkNawG0iDOUGMkCn1AjXA1GtHgRpGhzdu6ePw3dkcfTU4T/D7Yo0Pg
 zbLoHBwJGXQtVjBqY6+oNS2i0XouHcl7q18ZdaMXDMyl9cVF35+SIHBeTd5N9kdHibfH
 MgWz4ISkniTdGART+3Wxtjvs9S0G9QnFrEf8vD9qj6WsS9imSA87YlfPvSH4ts8trSy1
 UcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iHjNxJBcliVXwUGTUuDrqJ48gN0ghqxi7GbNzI66nDg=;
 b=eF0o0xOuOZHiC9taPSRp7CeFHTUOxuZybpbVsnHQfHpz4ZCCNGNls897M6e75BxA8A
 /ROzzJCMoUwOrPaFAy2QoTyYslUlg3d78bCDeaZ/6c2SpmqABE+lsN0zxNHpHMtq7Bk6
 cXcDN8ROvhNJNdl2ZYlJybmtjECywkfgS7YSZcv3BgnJK2Bv82K/XkWSYGnOZ2UtKXuA
 971gBSuSnfOqNGZlKunmc19H79TDu/WgWzw+FfHSrCIgptnMsdNlBjnBfISiBtaU0VRV
 NgLskXXo3M6sNgDsYCCmCvLMfjGuOOHAqeNL79I9Tp7jT3SC7LzH5YSVH9pXrNj4xYH+
 3VPg==
X-Gm-Message-State: AOAM532bBbQ7JjiAiZJ4LEkzJSAD6CtuLuob0nSfYv55YwGV7U2UmQ6A
 AlU61zIBTlHKMlnTFQEQFNc=
X-Google-Smtp-Source: ABdhPJyGje3sKsCaHr2cgj08/7Go8LtXdFkBrvBDBbspnQWl1pFUFer6mzofM1fgi2HmJq6bZgkuNA==
X-Received: by 2002:a05:600c:4e13:b0:37c:fd8e:28d7 with SMTP id
 b19-20020a05600c4e1300b0037cfd8e28d7mr13048794wmq.51.1646043222543; 
 Mon, 28 Feb 2022 02:13:42 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 v14-20020a7bcb4e000000b0034492fa24c6sm10578772wmj.34.2022.02.28.02.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 02:13:42 -0800 (PST)
Message-ID: <8a95a9fb-fede-b2e4-d616-e03c9e6778c8@gmail.com>
Date: Mon, 28 Feb 2022 11:13:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 2/3] dt-bindings: pinctrl: mt8195: Add
 mediatek,drive-strength-adv property
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Linus Walleij
 <linus.walleij@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
References: <20220216113131.13145-1-tinghan.shen@mediatek.com>
 <20220216113131.13145-3-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220216113131.13145-3-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_021344_148217_1FC397D7 
X-CRM114-Status: GOOD (  18.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Linus,

On 16/02/2022 12:31, Tinghan Shen wrote:
> Extend driving support for I2C pins on SoC mt8195.
> This property is already documented in mediatek,mt8183-pinctrl.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Will you take this one through your tree or shall I take it. In the latter case 
I'd need an Acked-by from you.

Regards,
Matthias

> ---
>   .../bindings/pinctrl/pinctrl-mt8195.yaml      | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> index 8299662c2c09..c5b755514c46 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> @@ -98,6 +98,32 @@ patternProperties:
>             drive-strength:
>               enum: [2, 4, 6, 8, 10, 12, 14, 16]
>   
> +          mediatek,drive-strength-adv:
> +            description: |
> +              Describe the specific driving setup property.
> +              For I2C pins, the existing generic driving setup can only support
> +              2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
> +              can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
> +              driving setup, the existing generic setup will be disabled.
> +              The specific driving setup is controlled by E1E0EN.
> +              When E1=0/E0=0, the strength is 0.125mA.
> +              When E1=0/E0=1, the strength is 0.25mA.
> +              When E1=1/E0=0, the strength is 0.5mA.
> +              When E1=1/E0=1, the strength is 1mA.
> +              EN is used to enable or disable the specific driving setup.
> +              Valid arguments are described as below:
> +              0: (E1, E0, EN) = (0, 0, 0)
> +              1: (E1, E0, EN) = (0, 0, 1)
> +              2: (E1, E0, EN) = (0, 1, 0)
> +              3: (E1, E0, EN) = (0, 1, 1)
> +              4: (E1, E0, EN) = (1, 0, 0)
> +              5: (E1, E0, EN) = (1, 0, 1)
> +              6: (E1, E0, EN) = (1, 1, 0)
> +              7: (E1, E0, EN) = (1, 1, 1)
> +              So the valid arguments are from 0 to 7.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +
>             bias-pull-down:
>               oneOf:
>                 - type: boolean
> @@ -270,4 +296,13 @@ examples:
>             bias-pull-down;
>           };
>         };
> +
> +      i2c0-pins {
> +        pins {
> +          pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
> +                   <PINMUX_GPIO9__FUNC_SCL0>;
> +          bias-disable;
> +          mediatek,drive-strength-adv = <7>;
> +        };
> +      };
>       };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
