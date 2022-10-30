Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B58C38A02
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Oct 2022 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNqQtPZFw1ZRUiXn/bpdnJoMGSfAm72IDjxJO9YExkw=; b=4qO+y5XFcRPDI/wC/10kBN8cEi
	oG4uD72UUgrW1lEc1gDKo0nwX/UPPzEND4xGSjgNVCsws/AKO56VrsUENmqucFPEML08xEbXyHHgQ
	N5Rt3MWibzm0dJVhbFCo4PQUIH2arWCKx/b9LDAIIdiUe+rSb63KbDlvcQAD+D0ZAsglfC50dri8c
	3rEUiecktgpH7495U9uK8dmWCZjg1Xe2XFcQdqSCAhBq0vbVXefNp44KFeiIgBTnrIott6NUKPv4B
	YUOrt4iBDo4rE6mzULjv12N9kQzyXXGiuf3sTnX5hQb2L5XmR9BtqAVD0yAVJeeSOGn9OfLCpmTby
	HwHYLEmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op8iL-00GbAz-22; Sun, 30 Oct 2022 13:51:01 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op8hq-00Gawr-3U; Sun, 30 Oct 2022 13:50:31 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-13bef14ea06so11180194fac.3;
        Sun, 30 Oct 2022 06:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNqQtPZFw1ZRUiXn/bpdnJoMGSfAm72IDjxJO9YExkw=;
        b=JpiXM9WLC/lYvrhhTfHbivvTyDBz6ruvNl7XGRGRPgfwxrrErX99V+7yAKF/jbUzzt
         bvWDg97fK7kW8AfaZgJqkmGUfXBt2FWb9HF0FVLtW8oW2HkZ3t4E+wT13ALvs7yXxkQQ
         YVT4Ij5SGWiJ4gllqTZpsIA/34tp+ebbbvdz2mCIdcUkbtp7LmAt5ZNBnapr4Ftcickj
         563EPrR8B8JF1dNAAf1huaxaoF1rpoajHW02VUyDXqJ/oSWH7xCGs+1MOU1AtwVkNAuP
         LEyeeKIQ+SDWm4fo2hN9di4kF6pI33E8gmI3MJsHjHbnpK/fnez4SREBM1oYzq1OPyJv
         qgWg==
X-Gm-Message-State: ACrzQf0Ir2tR4UuIZ1pjsIoQUpqWDu6hpZHnwwIGI+MtowW14O8UqNAO
	kxYUo168SG/U16FdelBlIA==
X-Google-Smtp-Source: AMsMyM7SrfS+jRFoPnPWEbktrG/CDV4pS8dOM5/QuFFdmGAKqtq17e4SrJOdAQGLFcw5yG4ZvqRQYw==
X-Received: by 2002:a05:6870:e889:b0:13c:c80:7188 with SMTP id q9-20020a056870e88900b0013c0c807188mr13919904oan.93.1667137827142;
        Sun, 30 Oct 2022 06:50:27 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q16-20020a4a88d0000000b00476995b5f0fsm1460946ooh.9.2022.10.30.06.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:50:26 -0700 (PDT)
Received: (nullmailer pid 992224 invoked by uid 1000);
	Sun, 30 Oct 2022 13:50:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, "chunxu . li" <chunxu.li@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To:  <20221030085358.1619285-2-ajye_huang@compal.corp-partner.google.com>
References:  <20221030085358.1619285-1-ajye_huang@compal.corp-partner.google.com>
 <20221030085358.1619285-2-ajye_huang@compal.corp-partner.google.com>
Message-Id: <166713668618.965877.11108951663566363754.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Date: Sun, 30 Oct 2022 08:50:23 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_065030_188248_9BFFDF06 
X-CRM114-Status: GOOD (  12.85  )
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


On Sun, 30 Oct 2022 16:53:57 +0800, Ajye Huang wrote:
> Add a property "dmic-gpios" for switching between two MICs.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml         | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 



My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.example.dts:29.35-36 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


