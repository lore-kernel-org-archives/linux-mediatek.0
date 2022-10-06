Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037B5C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 02:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFOpkqjZufkAK5FiEiN5bkXOo99mfhA/7lKBcTpwlOc=; b=LUuBq4t8VydaDdKYZfqGA2NYPo
	CjXDOLWQA5p/gtLU5JmCcIO+hmQNZ7r4TkVcJL7lzS/lobrgIA6gseO89Q31eNceDgjuMSu+ET0Nz
	jielzWQfKaTGnL4+ip/+EGbC90+oEHgFBhpfX6aZ+xONYcKDYHx48HnVyWUP5BmTsyWdvpVYqO+tY
	Tps+3krSk0Wl6AJKjPhUuXx4gv52suKqfd6l/YC9Y6rdP5XRiCot8aqrzp5O71S0odmUdlQsvVQVq
	y8hR+pNJh9PEdzS27fIWDLcVDHS5qNAbUJz4FjqMDK8fqOzA6n7qPLiteRJWj9KfrwRzBRPRrJbaz
	CDUBp/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogGTe-00Gy0g-Ni; Thu, 06 Oct 2022 02:19:10 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogGTT-00Gxyw-FJ; Thu, 06 Oct 2022 02:19:00 +0000
Received: by mail-oo1-f49.google.com with SMTP id h1-20020a4aa741000000b004756c611188so523299oom.4;
        Wed, 05 Oct 2022 19:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFOpkqjZufkAK5FiEiN5bkXOo99mfhA/7lKBcTpwlOc=;
        b=60bCc/Om1ApCsPr/g8hCdPF2ci9mzzrhMSpjN8OYEfeCvvFpLU5OMSt3pFTxyxSNlF
         0kv+ubhegn6Qrb6+7exsxmsmiHPT4Zbi+Vy2TvyewN7IAi1wcylQLsI55Go5SrhLBc4n
         0KMd1DfxQep/mX/zfvY3u3DSkJFWGADD2pF3uigTg3QBRklCx9lzYzQpxDdUFWboyTD5
         sAqw0ED0/o+dLN1x1vKcbCnpSaTlSVVCDnjRmq5ahASxNJJGWUFUem/JHSUXKFcdL7Qq
         EzIjG+6RtaP+078fVrUqSV5bLzRCh8uTTBbZfF3f/ANcFcH+lEL3J1kSUAkhnox2Pr+Z
         dBnw==
X-Gm-Message-State: ACrzQf26mqkASKc5XawUhFD3+sBNH9DSSfBumIveEeE7w0n1Pw8BVvQ5
	JZnlm91ONr6mVgrrjbk5ug==
X-Google-Smtp-Source: AMsMyM5K45MEbTKQlz/Q1cezYVFkM+sEQu9vC1IWWlda1XBr7rmBeSLUr2PlRAmZl67PFm7x9o9TeA==
X-Received: by 2002:a9d:6c13:0:b0:660:e595:c723 with SMTP id f19-20020a9d6c13000000b00660e595c723mr1015983otq.2.1665022733713;
        Wed, 05 Oct 2022 19:18:53 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e19-20020a4ad253000000b0044df311eee1sm3930650oos.33.2022.10.05.19.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 19:18:53 -0700 (PDT)
Received: (nullmailer pid 565678 invoked by uid 1000);
	Thu, 06 Oct 2022 02:18:50 -0000
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20221005174343.24240-6-y.oudjana@protonmail.com>
References: <20221005174343.24240-1-y.oudjana@protonmail.com> <20221005174343.24240-6-y.oudjana@protonmail.com>
Message-Id: <166502256683.562283.5162543675574392467.robh@kernel.org>
Subject: Re: [PATCH v2 05/10] dt-bindings: pinctrl: mediatek,pinctrl-mt6795: Fix interrupt count
Date: Wed, 05 Oct 2022 21:18:50 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_191859_531512_D4413864 
X-CRM114-Status: GOOD (  14.07  )
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

On Wed, 05 Oct 2022 20:43:38 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The document currently states a maximum of 1 interrupt, but the DT
> has 2 specified causing a dtbs_check error. Change the limit to 2
> to pass the check and add a minimum limit.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.example.dtb: pinctrl@10005000: interrupts: [[0, 153, 4]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


