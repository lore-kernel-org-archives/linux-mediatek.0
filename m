Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDE0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IfwOEejCk1WTO0dgV+3bjCu2UTbfGNuRBG60zJYsQ8=; b=UsyYi2H1r4bLpt
	0Bye2Bh/tQN+FM10hrT6zQg/1y6Vl1iUr8kSFW7Vw/nNcJRh9lq5MpiOjmXhoTgMuCBmB9Rjhz24i
	ROalmdGr0ix+bn9Eo+sNYg6LwnDSFeM4PKgWBsAnH4HvcfdeHurq69lKFpXIDFNVHu1wOWqua+1TR
	Em6MvoPAjpcqBhFiF7/FeiG5gi8d1K3xtZW5VdodVq7ZdAvuEm3Kxz1SbJElczyQnrql2rFGyOzd6
	MUx2BMc0VpcwVM0e66HlnAqlUYP0nyphqlT/NkG37tJKbuXyO4z2tpC9w0z57x8ofu2zqI19jX7gG
	gNFW3GAyCMufqmdV5Ozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np9qB-00COiz-80; Thu, 12 May 2022 14:30:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np9q8-00COcs-Fg
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 14:30:53 +0000
Received: by mail-wr1-x429.google.com with SMTP id k2so7549939wrd.5
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZsOFLBYov1FAxmhwWBTHoBgyIz4ukWcPbqsafVCZ7/E=;
 b=KoHgrenB1Q5hv8m4uB2is8OkE97bPWIJ5+4qc0Uk387iuUKVoTeCeb9j+9cpo24w8g
 ksnpmHMc0WIOYwRKCT1AaLMh+vX15rUxmYsBWX+2MVFQ4ThfuhJpk7FL1aNEoKDIuW9D
 fMJI5X1mrBiq26rDHHhwl/MZInL9QO3RPeuA8W15DYIURR295tw/fFalfVoM9DBbagBH
 SYidH2mDuNcy/L8QGNzw1L8ZW1b902kvnGir47zmT1XxGEbOQSeK+22wd8BkcHrc9vvE
 phNif1j6kuJ4a1LSkqYVY1majxK4haZZyNur2OQOg5zDBS6Ui9mYB+1UQCRjBmCqGmzV
 MW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZsOFLBYov1FAxmhwWBTHoBgyIz4ukWcPbqsafVCZ7/E=;
 b=ZObCHO+n7yiXNERuS43eFIhA2f4QxZrs5k55LhcZeNYLOw5GlhacBrvTuxrMT7HInI
 e9dgQ5Cl4QCFPxW+iRq4CIE4yih3OPaaIg8620yN5l7ZNl+4x5WlMdi9EjKhFZ+uciDE
 ZYM3HJF+5Ati7XXVuGIIzF0jlGUdmsizDXje7ZvnLw/6TwN62j2QV+oAukWmID6y3jzy
 uS35o6tY9A88UtBxIx6Rl6m0JnwdItHI47U89Dj05pQr9wQxa1WdtxC0iiNe3kZn5C82
 MCvL56a4FIUfoIW7jQsGr9YSP/x5vJiM4rua6F55SZGYIPST7VQ0qsIOofKGsafEvajP
 XuYQ==
X-Gm-Message-State: AOAM530ekrKBbbYAOpyEsCAwsq5Gr0wHvSuLxVwT6Vb55PVm5gsFk3AO
 jmfs7IDlyqB9F0iWQCM+u7mNTdWGSjbh4n+O
X-Google-Smtp-Source: ABdhPJxMwtrDsp3r3H3xP3VNWAcgbQy/ElkWYh4FISYFSUGbcavB87DrDWT7A7XEBKFVhztrPvhiLg==
X-Received: by 2002:a5d:64ea:0:b0:20c:5ca3:a0de with SMTP id
 g10-20020a5d64ea000000b0020c5ca3a0demr28487175wri.308.1652365848701; 
 Thu, 12 May 2022 07:30:48 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 r5-20020adfdc85000000b0020c5253d8d2sm4198917wrj.30.2022.05.12.07.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 07:30:47 -0700 (PDT)
Message-ID: <01d30e6c-5d0a-a5c0-851a-817277a8712d@linaro.org>
Date: Thu, 12 May 2022 16:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 4/7] dt-bindings: thermal: Add binding document for
 mt8195 thermal controller
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
References: <20220512122433.1399802-1-abailon@baylibre.com>
 <20220512122433.1399802-5-abailon@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512122433.1399802-5-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_073052_569914_9E63A3A4 
X-CRM114-Status: GOOD (  15.26  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 rui.zhang@intel.com, ben.tseng@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/05/2022 14:24, Alexandre Bailon wrote:
> This patch adds binding document for mt8195 thermal controller.

You just added this binding, no need to change it. Squash it with first
patch.

> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../devicetree/bindings/thermal/mediatek-thermal-lvts.yaml  | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> index 69ffe7b14c21..2e1ae00d4fd1 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> +++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> @@ -12,7 +12,11 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt6873-lvts
> +    oneOf:

Why oneOf? There is just one item below?

> +      - items:

No items, you have only one item.

> +          - enum:
> +              - mediatek,mt6873-lvts
> +              - mediatek,mt8195-lvts



Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
