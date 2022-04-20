Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ED0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 06:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSFBYEnsE0eIqlF0MtPPsV0lBbHBuqg+YSP8ne1BxO0=; b=MnkQDlB5Ifx9VM
	2YpZCONSK48RsaVi10GfiP+yw8T1RBD4XnZxUXQRoK5HrfxO2NouPY+sUXv9a7XOz8UnV3hwY/pYp
	LS2byWzziVLov1XcW9Zc0LINfiBXp+K7/BU3vh/V6sPcWeyctlPwYlD4e8PBK59pQV5NhCQyvwSTL
	xa/kby5YXkkD7su7H7WNnbiIU4oE2Vavk2eZeDu9zclHkfysPKDbhQQu8WqD1Y7LSqeUUS6LOooHS
	oqc17ikJPd5JfFlm+MFwv20mcLP710eQ740efQxf3zo8TYiS1NdMwfejod5IynoPhsEQ0HKqfcK/C
	bnGjSSX92JZnzIoVCXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh47c-007cRQ-6l; Wed, 20 Apr 2022 06:47:28 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh47Z-007cPB-Be
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 06:47:26 +0000
Received: by mail-ej1-x633.google.com with SMTP id bv19so1472948ejb.6
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 23:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vAFJ5Jy7fcFeVcUMp2gfVGhJtgw8jdXee9hX3koFUP4=;
 b=GVbK4VM0/4etSp27b5bmq7t/DzlSN93x9/8ZsVbOSRIrMgd8ENWgAs9lmj7YRIh/vk
 LvDGnOpAgyPWnc3HYVXZuGrkkJD3YULNrP6Qjz/BNpRv/fwLr6Rl+mMLc3E8tNx+c4cb
 lLyw4AJjzMkxykXu2lZ1ev0VbvcI5bAbjwUkkceMnva89oDw6RJxYBkyk6gEUcjnhaYn
 VQ2JRAzsIyG66cxNGyetyzEPSUic7+LQbdZQDb+shhrxJj4Gsjjcly8XRZK3yW/Aj05z
 vj1g99Fixbfcc863+p9Lvi/fhvzwLjgfVRxnYskXw5SbuSKln76cpuUtAFoRZ3dx/JJm
 aqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vAFJ5Jy7fcFeVcUMp2gfVGhJtgw8jdXee9hX3koFUP4=;
 b=IZ8RRUPWFZUU62YcoOdnmW+XgFTH1QCeLga6tg1Awxoc4hEQUq6ruPV8l3lLhPs5yk
 I+eHUeJ7cAdk62k7c/nVeRDXhn39/bj9z5iMe+ntIWX63sqynbHWFzhKN5Ek1T4YUjFy
 G1Pe6SQzDpNFOcjSW0QfENmeGu3k6vQvy88HLo1Gk+LYJAalAFxvTC8OmiTQ+ZS922rU
 inAFaAy5lVoBNpl3YBP0JzEFxw+99B8arSWAPNNZPRGX0rAtCr77V5uTr8+pp7otkOOz
 2nKQjGmvm0qEQMhUx6/o6mesgaq7w22BK4+KWnRZiUVdVI2JNI5YGkNPBJO+S3+0fbka
 3wqg==
X-Gm-Message-State: AOAM531WXOsaEDsAOwcQjVFZ7Q2xfFiuez372zyy81BA7OGnbsnobq/G
 G/BXwFeSHajUGrmcGpbjt3jluNtpSw2GhA==
X-Google-Smtp-Source: ABdhPJzxwUOONgHqHYaO73Ouj3/x4695MZhoOW7uiVUkaAN93uoh0N43FLOs0S6pvn5pcp3OL6IlyQ==
X-Received: by 2002:a17:907:2d0c:b0:6f0:a56:1c63 with SMTP id
 gs12-20020a1709072d0c00b006f00a561c63mr517861ejc.72.1650437243094; 
 Tue, 19 Apr 2022 23:47:23 -0700 (PDT)
Received: from [192.168.0.222] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 x24-20020a1709064bd800b006ef606fe5c1sm5185295ejv.43.2022.04.19.23.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 23:47:22 -0700 (PDT)
Message-ID: <efc6d3ee-b060-b070-1471-af940428964a@linaro.org>
Date: Wed, 20 Apr 2022 08:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: topckgen: Convert to DT
 schema
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryder Lee <ryder.lee@kernel.org>, Yassine Oudjana
 <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220419180938.19397-1-y.oudjana@protonmail.com>
 <20220419180938.19397-2-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220419180938.19397-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_234725_443176_BE40B724 
X-CRM114-Status: GOOD (  17.08  )
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

On 19/04/2022 20:09, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert topckgen bindings to DT schema format. MT2701, MT7623 and
> MT7629 device trees currently have the syscon compatible without
> it being mentioned in the old DT bindings file which introduces
> dtbs_check errors when converting to DT schema as-is, so
> mediatek,mt2701-topckgen and mediatek,mt7629-topckgen are placed
> in the last items list with the syscon compatible, and syscon is
> added to the mediatek,mt7623-topckgen list.
>

Thank you for your patch. There is something to discuss/improve.

> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml
> new file mode 100644
> index 000000000000..9ce9cf673cbc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,topckgen.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Top Clock Generator Controller
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description:
> +  The Mediatek topckgen controller provides various clocks to the system.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

These are not a list, so skip items. Just enum. Rest looks good.

> +          - enum:
> +              - mediatek,mt6797-topckgen
> +              - mediatek,mt7622-topckgen
> +              - mediatek,mt8135-topckgen
> +              - mediatek,mt8173-topckgen
> +              - mediatek,mt8516-topckgen



Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
