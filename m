Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CD3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 10:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mq6BOmh8xbUlirqR+WtITm9mv82ZSI1BLQePDaUCMYw=; b=gxXHKTHzO32DNd
	fwO//0PsvnTr4tz9GJqbUv7svUNEaay3tu2uEXH9DbtXwHTluT42RrU7FQWDrtybyabrvY0qE2qJS
	2/X/7T+swuQbB4E/Wdymr+Xj+g1SViQbVO8YOPdcj1AdE+kY7rd3yYO0z83frW7AAoTUUVd4d22C6
	UJshzd3WEzeINhvcNietJ2r8GDCg+kCSrxYDr38eaUSrm+g//Lxi0nmloS/oikUtIEhEpBtAfXCBL
	5jub95CZtCQfNoNmeEUgtO7SgZ3wyaHn+pUq4GYf3ObboT7i+vIsZ3T440K9bWGdht11syqvhlfoq
	+AniBtuAPUYClwxvUPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKHSe-006VP8-7p; Wed, 16 Feb 2022 10:23:00 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKHSX-006VMX-Sy
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 10:22:58 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 771104060C
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645006972;
 bh=wuR90S9txt4D8ZpyD8BmkEY7fqkqr+OEq1oue1rbm+I=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=jlDlR30gUFvjkTZRuzp22FEdktHu7JDXPFGWpvebE8RmmahgKWKBA6pEVtpoU8hKe
 Qlu6hHrAONndzRhWYrIvPuL7CqXRInNzqCiJaVi9Q6993RLFZPEEBQ4l4olLXIFGs8
 npS30TQbORJ8HMdt4T61zrmK/1OiXSgdudmufL7N1bEs98PMKqIMIFR3wQ3okZrXdo
 5LejIchTK1HnQqd3DnKqOgXjQveIpBYEZr79pRNCVXn76qZHDehkJjLuc58HTCr0JU
 rdeQJPJof8v17v8u5LbxRU0PkHVrLfkbBVMIvQ/g5DtjYL7Dq7KNerpCqcS+sk35+C
 sbB3CP+DgESbg==
Received: by mail-wm1-f69.google.com with SMTP id
 n3-20020a05600c294300b0037bc685b717so285778wmd.8
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 02:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wuR90S9txt4D8ZpyD8BmkEY7fqkqr+OEq1oue1rbm+I=;
 b=7eJo/UoLgLd66L1D4+X+3y+mi2LSrW/9Aa2KufvkrE3V4bLv3war4Kp5kgqo+bdRmw
 bhxyLkZ8Tg9TzTC64HnymIsWE7dRcw0pALddFPz2K9G2FGKV6OjQkMHTCOj4reF4YJgM
 5VRWgyW+O6/on84+1Yl8tw5EDvi6LbrZfFd4LVwGouzM8Ik5/p47zdjfjRBVP4cBQsso
 pqa2+pk7GyHBGDgy0/xZBWS3SaYpP0RnHhjm4ZSaNL38aO4L/RVN0/0gj6YnUPli6g7I
 Au3Bs/Ta4xjRML7aPVE3P236WRE7aiqQjKAxrs5DtrO5YWoqvf2OR3KoQJoLSHOFgprW
 DzBw==
X-Gm-Message-State: AOAM533ghvdVFtVLlIdEedaFKwRJTzjngPS8AuDgohee2KXGDOAPgPij
 igaYxFu+zY89AyDP6a6Sx21ANf/1nOHR1Yi6JutswdIhNF7mjpJ0bAq3hBfYPT5wxGjh3OpAFa6
 IVrtRHFAR4vNjcunwIDS02E8bDWo85YcPYOCRIYW2CJne3ihiZw==
X-Received: by 2002:a05:600c:2e47:b0:37d:62d7:24bb with SMTP id
 q7-20020a05600c2e4700b0037d62d724bbmr905759wmf.71.1645006971953; 
 Wed, 16 Feb 2022 02:22:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0tm5zca8pzPPli4+p2IjYg6ZL4qjnL96rMvrKZhljZw4NnZGhrPPdbfPJHZ4Z1myjwiM05A==
X-Received: by 2002:a05:600c:2e47:b0:37d:62d7:24bb with SMTP id
 q7-20020a05600c2e4700b0037d62d724bbmr905747wmf.71.1645006971809; 
 Wed, 16 Feb 2022 02:22:51 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id r11sm26194194wrt.28.2022.02.16.02.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 02:22:51 -0800 (PST)
Message-ID: <370739d4-2da6-b620-ec79-adf8d00c8c33@canonical.com>
Date: Wed, 16 Feb 2022 11:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v2,1/4] dt-bindings: pwm: Convert pwm-mtk-disp.txt to
 mediatek,pwm-disp.yaml format
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: allen-kh.cheng@mediatek.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-2-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1645003971-16908-2-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_022254_192894_65A345EE 
X-CRM114-Status: GOOD (  15.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/02/2022 10:32, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> 
> Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as suggested by maintainer
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> ---
>  .../bindings/pwm/mediatek,pwm-disp.yaml       | 71 +++++++++++++++++++
>  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 ------------
>  2 files changed, 71 insertions(+), 44 deletions(-)
>  create mode 100755 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> new file mode 100755
> index 000000000000..edf2a2e9ea72
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek PWM Controller Device Tree Bindings

This is a Display PWM, not a generic PWM.

> +
> +maintainers:
> +  - Jitao Shi <jitao.shi@mediatek.com>
> +  - Xinlei Lee <xinlei.lee@mediatek.com>
> +

My comment about pwm schema was ignored.

Please include pwm.yaml.

> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-disp-pwm
> +      - mediatek,mt6595-disp-pwm
> +      - mediatek,mt8173-disp-pwm
> +      - mediatek,mt8183-disp-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    description:
> +      Number of cells in a PWM specifier.

Need a const. Description can be skipped, it's obvious.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
