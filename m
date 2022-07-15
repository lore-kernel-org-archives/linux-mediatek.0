Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FF9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/R62/XfNcQVMTmrWk/l/EPI5fVciSHdC92bX/2kpIY=; b=XfpUmJdFQj91Jlbu5huQ00IIkQ
	5bzgiriKm0qeEeHgjEIX2vKHkmDGnRhrbL+O4NPLmwmcuK0PILSMeXOfOawMTRZNB6+1AY+ibU95V
	ueIInJB75CWIUOsr9tVBPwHd1Dez4cMnqxfjGZFTBWbv96DVGTHRWAgwvMETPAsCeyRuTXZvjrTv7
	rSL/WJYDjUAstF5rPWNQAqKv95AhvakKzssXazwnskaK+3uQYi0cg/G3ol0hvTUbrqr9WrYKzg1vN
	Ibhzpu/W/rErEpLN+TpVkASN7J/5+JkF66JXefBeDIiCX1eC8iBQBgLo0L7Xle3ReidJsstb+sHoM
	WEhaP/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCLb6-007Jlb-GS; Fri, 15 Jul 2022 13:43:12 +0000
Received: from mail-il1-f170.google.com ([209.85.166.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCLas-007Jb9-RJ; Fri, 15 Jul 2022 13:43:00 +0000
Received: by mail-il1-f170.google.com with SMTP id d4so2524816ilc.8;
        Fri, 15 Jul 2022 06:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Z/R62/XfNcQVMTmrWk/l/EPI5fVciSHdC92bX/2kpIY=;
        b=fttAK1nfE5+dDWKOc1hQlBH22VQxljkvHTv4pIqqbXdqHntrY9wip7MYdVpU4vBCqQ
         m/T4RjQwF4HfD3Nb6Q7RzQuGpKJwCmuQl71hOZyy+alf1FZ6aJ4/Kye6vXFuiLbd1AQu
         GX1FiuKeejNm/Zx+1oXpGXivtck005RkKABd3KOaGiwI0Yf/fB8BkPzhEVJpT/LWdcCP
         N/9E25a55ZkDO1IIYq079EwSxstLKvl/8+1gEAhMvLAa4Evl5p8QuT9EyXuMYN1N307U
         d7HmcmdWW6TUtU45odMUv0RfElSfPMgym0fPHQVsrjxEUxJvVen8ZW1dXEIZd+Sc78bd
         CRCQ==
X-Gm-Message-State: AJIora9IJfvnt8hRcyImBlfra0T/FaX84wXGLzCp1d/77Uv2uAE20GMj
	zhs8yHSgyKqIAYzYD3q2JQ==
X-Google-Smtp-Source: AGRyM1t6a5kEHo4Mrc8T7zv8UWHhMBbeNMJMzSeheyHsBVb7d5Xbopp9RO//FMCnNa5ZX4G7S8lRpw==
X-Received: by 2002:a05:6e02:1b85:b0:2dc:c1c5:c444 with SMTP id h5-20020a056e021b8500b002dcc1c5c444mr1423250ili.81.1657892577669;
        Fri, 15 Jul 2022 06:42:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g7-20020a05663816c700b00335d7c314b1sm1939544jat.53.2022.07.15.06.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 06:42:57 -0700 (PDT)
Received: (nullmailer pid 520284 invoked by uid 1000);
	Fri, 15 Jul 2022 13:42:55 -0000
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, sean.wang@mediatek.com, matthias.bgg@gmail.com, nfraprado@collabora.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220715103029.204500-1-angelogioacchino.delregno@collabora.com>
References: <20220715103029.204500-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Use drive-strength-microamp in examples
Date: Fri, 15 Jul 2022 07:42:55 -0600
Message-Id: <1657892575.852530.520283.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_064258_913676_2E6B8F21 
X-CRM114-Status: GOOD (  12.27  )
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

On Fri, 15 Jul 2022 12:30:29 +0200, AngeloGioacchino Del Regno wrote:
> The property mediatek,drive-strength-adv was deprecated: change the
> example for i2c0-pins to use drive-strength-microamp.
> 
> Fixes: b6d9af2c6b69 ("dt-bindings: pinctrl: mt8195: Add and use drive-strength-microamp")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dtb: pinctrl@10005000: i2c0-pins:pins: 'drive-strength-microamp' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


