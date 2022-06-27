Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AB0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0YdyNDNHfoLjY/B6VaUfC4jZi5UF0V29yd+MqAfjd8=; b=yNdX6sYGrPeXFrwF3ikEusoClf
	/Tz140Lap+Ylh338u7iroyhsiF0T+9p0U6mheH8+/SghVpi7Oj73ifpkebQHVFo46rN4//CLTWMrT
	p0xjJkfG6P2sMgjBSyIv3h7fZMDgsqlm8KfIMaRbWqIsVuJUJvpufColggBxgru+RDdjp90pzymbv
	JwPoh7qGPP8andM4xKi2Rcof1BkKqfLPNP4bD1VLAxDs92JBGOn5sz4iSP4Df4ilnBucVsTrFKPTN
	tfKz4E97ySry1yf9974RDSB52cOMu0gVJRb/eSR2V+p94vFa9NKBFLplzSvURZFmsrtl6PUy/degE
	oasgFsWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5opn-0019hA-CT; Mon, 27 Jun 2022 13:31:23 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5opk-0019f6-JO; Mon, 27 Jun 2022 13:31:22 +0000
Received: by mail-il1-f181.google.com with SMTP id a7so934735ilj.2;
        Mon, 27 Jun 2022 06:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=e0YdyNDNHfoLjY/B6VaUfC4jZi5UF0V29yd+MqAfjd8=;
        b=PKIKx6/VY920fA4bYFrOs2FpNomJKiyrmWGjUePiKxOB2J/wpU+baOUGUgy9IOM549
         viDP54laccQUbW/2EhEKny6wknVw56ym8XWYj/BknSkD5/aUdjS9kuk91tISc+5JMHWw
         oRAQ7TqpOtIcacf1XRYkDOxU2fpP6ldGh1rXrkBoZqcmZpEtq7U2YGlKH+M85UzvDKm6
         DnVUoN6K/NC3M0hBHCLUeTBo2tcEW8lqGDqr+G4qpvmsWnDePstCVV/MGGNTXiBSENAi
         aAIK62RIpv+A6QpV0gpcC0Igi7k4Rrp12FDd5+Szn0TtGTjokk3HMOXgBgKnGIOasgmE
         M/Sw==
X-Gm-Message-State: AJIora9LEHRE7EU54SRTgC6BWYwdNgIJkrD/zlIXXnqvMnpRc55/EXOm
	HTEs/CdcB1FGARzdCR3rxA==
X-Google-Smtp-Source: AGRyM1vEEEhnghUvEvoMNkCRM2MJy0M56TmHGYSJhVoccPP4WQGcqcvf8lzrpCi+otOX48sba38IeQ==
X-Received: by 2002:a92:c743:0:b0:2da:a849:511b with SMTP id y3-20020a92c743000000b002daa849511bmr124717ilp.109.1656336678835;
        Mon, 27 Jun 2022 06:31:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id v28-20020a02b09c000000b0032e0851ea0fsm4794533jah.10.2022.06.27.06.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 06:31:18 -0700 (PDT)
Received: (nullmailer pid 2285172 invoked by uid 1000);
	Mon, 27 Jun 2022 13:31:09 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, granquet@baylibre.com, angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org, airlied@linux.ie, linux-fbdev@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, daniel@ffwll.ch, msp@baylibre.com, wenst@chromium.org, Project_Global_Chrome_Upstream_Group@mediatek.com, deller@gmx.de, tzimmermann@suse.de, ck.hu@mediatek.com, linux-arm-kernel@lists.infradead.org, mripard@kernel.org, jitao.shi@mediatek.com
In-Reply-To: <20220627080341.5087-2-rex-bc.chen@mediatek.com>
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com> <20220627080341.5087-2-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v12 01/10] dt-bindings: mediatek,dp: Add Display Port binding
Date: Mon, 27 Jun 2022 07:31:09 -0600
Message-Id: <1656336669.663950.2285171.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_063120_676919_99FEF7F1 
X-CRM114-Status: GOOD (  13.41  )
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

On Mon, 27 Jun 2022 16:03:32 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Fix reviewers' comment]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dtb: dp_tx@1c600000: data-lanes: [[0, 1, 2, 3]] is not of type 'object'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dtb: dp_tx@1c600000: data-lanes: [[0, 1, 2, 3]] is not of type 'object'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


