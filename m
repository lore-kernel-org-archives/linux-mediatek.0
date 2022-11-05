Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E718FC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Nov 2022 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:
	Message-Id:References:In-Reply-To:To:From:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PcwwgX98pioZqmpF7IpPJDYkENxYcijXYjHPqyIhZNk=; b=rpbA1XqbLO4mDXDIFF6+Uq78kh
	oRMq8nUrIapZnZBptled/+YSp/9k0RX2zpZ7vQE4XU+gjnsr8tUFOmDFZqoXW16jWxuoujmYk4fVj
	9/aGGbMLL1FkxLh6DM9BJvlcCGbVdC9/YyN+tVXNOfsGwL+O8HuzT9xpl3l5Sn12aTIQN8m/2fe18
	w0A/8OGDqRfA58JgELNLfnelnYMkRgV61F3klnzOsucNacBE6d2FZWJQNtK6UVOULDMmUQQrG2NPS
	5hqZhceTvFlMCBtBC2yElTuQV4nRLqei/VglcUS6Xd1dbho4/br33Wjp7cPvKPCb/9ZHxR7aIUd+F
	ESjzO6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orKWx-006kfV-M8; Sat, 05 Nov 2022 14:52:19 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orKWv-006kdz-BN; Sat, 05 Nov 2022 14:52:18 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13b103a3e5dso8445609fac.2;
        Sat, 05 Nov 2022 07:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PcwwgX98pioZqmpF7IpPJDYkENxYcijXYjHPqyIhZNk=;
        b=OWURQijlsUWOZhnUx1goyett6+xT1nkY0XtnxQkvY0Ss4KDqiXTmAgAhpzvdHTQxLG
         qbEN1o1ZLtCrr2b3BySmWfn1iC8hHDUZRajlTBZP5xtfbvo4wSZ13f9oB2zugFziJzdb
         ZVGUXhfqFOXw+DzsreTRDozOpLn3IrwQzGN5qLb8DULmQHbcKbUxQj0MCeTT4OHJcwvr
         FZh0Kbsp8uH0C2TJOlbNIwibSfgdvpQgHGzR8IqWcpD7ftmriGoc71NAxjoyeoKYyRF3
         AMbrbQskMkGQqRVhEInkjuOOk76u1YTqylDyfkNVA2vKk+/iOvYAEKPfoT0UgOdhyzFk
         YQjA==
X-Gm-Message-State: ANoB5pmVIOn9FIBYAyV0s1Lj2ap/xe2Bidb/ow0zo9DvXwJjnqst7sL3
	yP/9adK0hgTp4Euwa8zl3Q==
X-Google-Smtp-Source: AMsMyM4kYNdfuRTk0occtw+rgiRZ+CP73DXZYUn56GnB9f+gvwg8Zo+icy0yvtW6pg+iyM+ep7Dv3Q==
X-Received: by 2002:a05:6870:82a4:b0:140:78f6:c954 with SMTP id q36-20020a05687082a400b0014078f6c954mr4581995oae.16.1667659935742;
        Sat, 05 Nov 2022 07:52:15 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d9-20020a4a3c09000000b0049bd96ec131sm677216ooa.8.2022.11.05.07.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 07:52:14 -0700 (PDT)
Received: (nullmailer pid 27957 invoked by uid 1000);
	Sat, 05 Nov 2022 14:52:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20221105084905.9596-2-linux@fw-web.de>
References: <20221105084905.9596-1-linux@fw-web.de>
 <20221105084905.9596-2-linux@fw-web.de>
Message-Id: <166765939131.4158830.8416727494529058690.robh@kernel.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: pinctrl: mt7986: add generic
 bias-pull* support
Date: Sat, 05 Nov 2022 09:52:16 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_075217_421236_FA1F4ACD 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Sat, 05 Nov 2022 09:49:02 +0100, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> Since the bias-pull-{up,down} attribute already defines in pinctrl driver
> of mediatek MT7986 SoC, this patch updates bindings to support mediatek
> common bias-pull* function.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 50 +++++++++++++++++--
>  1 file changed, 47 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dtb: pinctrl@1001f000: mmc0-pins:mux:groups:0: 'emmc_51' is not one of ['emmc', 'emmc_rst']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


