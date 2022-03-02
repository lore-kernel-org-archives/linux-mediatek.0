Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C21C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 18:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93KW0cIlXwhekwQ1cAD8n1K5TvrxGZFvAPuwPe1t8WQ=; b=LoQTKiGhqUXO6M
	CEl4wOuafUlD5UjPjnc8AMIcex1rgQmJUmvj5ZNnG1qZdSAbk2JnvT276I/7zAlDuL4DTXT2nhLG1
	7aF1Fk/fbvNOtlLgs4nAlnAxbb1gFDecGIsrnHF/ppmoG86IuLATKa6uF6lv9knM9j3fvbrdLqlT3
	Al2dNa9gwpmYG+CFnpU8MRlH2VxayOH3xt/dlQpdX3Fs/Yb1wz0oIQ/lG27iMvKDFoOkj1YTJSATR
	LCPo3LAh02Iak7+YHjTfHUfJyRY7Q0c1FKjz+p4/iKQfqgdF1rlJRWJdKMD0YDLyjUWQGFFDujudg
	AbdzyntkJyEZqJB9IYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPTKR-003iyi-Co; Wed, 02 Mar 2022 18:03:59 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPTCP-003gHD-AY; Wed, 02 Mar 2022 17:55:42 +0000
Received: by mail-oi1-f174.google.com with SMTP id j2so2429392oie.7;
 Wed, 02 Mar 2022 09:55:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XtJINkeAad4PNXHAMxkuIw7gJuFm8puZCGopniDrMH4=;
 b=W5r6VEQ5JaomzpbKb8YzKii+2aPxCIQkMhOrSqob2gXNowb4SKQOmewjs1zZ9tx2WY
 OIGjBBJNtIm0I55kMXVCbkLI+d8N1gq/3zGLpSG5iOtbpR2hu654VYb+I7q4gD7TJ8uf
 biKdN+VQy9Y2m1jTnZOMQWJmuM5k7lGqwccMYrblrr9jTdJ7Ze8eH6R4D2WgOsVmKlFA
 7GOa97fdSu4PvQTcHTgAJmHisZWINJ9rymdWgU2YxuwLxpiAZIreFwGkqK6urGIdDkyh
 18bQBL+S+99Wk+artHXJZqzLpOcsrxjLdGgaXj/kvrvU1tn8C6Tya1P4Pbq9RUI/JzFA
 tpsw==
X-Gm-Message-State: AOAM5328S0mnJVyotaJCsTYwMSGeMyg3zqqBugLoE6eayrURemoOMlF7
 79ZkLlLx+HoebcaztinaNg==
X-Google-Smtp-Source: ABdhPJxnos+rNy9BWd5srACedG+sKc7rc70EyhHRxtLepxttbdeiiWMGnm0ENW65df34irN3dANC5g==
X-Received: by 2002:a05:6808:9b8:b0:2d4:cc01:6cad with SMTP id
 e24-20020a05680809b800b002d4cc016cadmr899444oig.35.1646243739084; 
 Wed, 02 Mar 2022 09:55:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 f188-20020a4a58c5000000b0031ccb8272f1sm8189414oob.33.2022.03.02.09.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:55:38 -0800 (PST)
Received: (nullmailer pid 3961427 invoked by uid 1000);
 Wed, 02 Mar 2022 17:55:37 -0000
Date: Wed, 2 Mar 2022 11:55:37 -0600
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com,
 allen-kh.cheng@mediatek.com, rex-bc.chen@mediatek.com
Subject: Re: [PATCH v3,6/6] dt-bindings: pwm: Add compatible for MediaTek
 MT8186
Message-ID: <Yh+vmZy8H0CClVEZ@robh.at.kernel.org>
References: <1646199106-26879-1-git-send-email-xinlei.lee@mediatek.com>
 <1646199106-26879-7-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1646199106-26879-7-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_095541_408040_77356F36 
X-CRM114-Status: GOOD (  15.38  )
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

On Wed, Mar 02, 2022 at 01:31:46PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index 3a5d1cfed94d..053805846cfe 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -21,6 +21,9 @@ properties:
>            - mediatek,mt6595-disp-pwm
>            - mediatek,mt8173-disp-pwm
>            - mediatek,mt8183-disp-pwm
> +      - items:
> +          - const: mediatek,mt8186-disp-pwm
> +          - const: mediatek,mt8183-disp-pwm

Combine to 1 entry:

>        - items:
>            - const: mediatek,mt8192-disp-pwm

enum:
  - mediatek,mt8186-disp-pwm
  - mediatek,mt8192-disp-pwm

>            - const: mediatek,mt8183-disp-pwm
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
