Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2083BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0JxUePUTNk7VzUYtAp/AfM8/JpKpLNDOS91V76LHDQ=; b=JCxnf5EBXQE9JS
	atzSI1UPhMFmbH9WFfnqFlGi+NXr2YQXCAMT5rej+oYugq2LsWNVjm30kH22jRaCYdVD/xdOnX7LA
	sPK2X9UL3BklQRp426O3FlkGHY7ck+MDmBD7PKtV6WVUfROoHlS7hzwe7r+2ZQphwOBzl2559DXe7
	MAAM6OkV4jjYs6Zks7Iz0y4GuBA+uKgFll7+cd4A2DWjGGBH4iutdg1a2mGvpit8utPB4nKvEObO7
	vKH2JDA7xACwkFUm8AVLXRQa4VEkX1h8kEykVdbXzVMZyapI33n3WwZSnVPGebdMkrv2lq1wR08FJ
	zhqffFmqRjWbgY4r/nPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1pt-00B3RE-KK; Tue, 31 May 2022 13:23:01 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1oO-00B2gH-Cg; Tue, 31 May 2022 13:21:30 +0000
Received: by mail-oi1-f180.google.com with SMTP id k11so3800222oia.12;
        Tue, 31 May 2022 06:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=sjiY+V80OL2DiZ6A4EsGgW9fJIH8AO134dDg8U/4y24=;
        b=duJE9UWaaoMroq6CZxx4PGnzjtH8XYXnE6J0F9wuVIfm+Q0Iw6nAl9UGztd9ToWIgj
         NjriwMuAvg6SqIKUwqoJo/GhX/QrCjMXy5FLEePo/T1n2Ul8BeQIU0NjvthJZIHyCA/d
         OEbcUKeKWVaqtgv7AOYxm4Dh6pQlTxWoUeF5kp8Lw8l2n9w3vzgJvZuK4Y4YJI6jPoDq
         zha6QxaBld68zRaTn9Vh3141vRB0MiLDsnxIIwJWwCUE5BX/aB+GDCn1N0LyPAlGs8Lh
         ONz+ZywA/VSuIwe1mXygk93EeHLraPFNoUqFfhcicMGsoqe3eV/7P4rIrCT5h++pFotf
         57bA==
X-Gm-Message-State: AOAM530pQ5oeTPYgR+IAN6vXFZ1O5+ZFHFf9Oqz7HdVF1Ayh40U5EeL3
	9jRiTABiq7+QuNnxAG2Yeg==
X-Google-Smtp-Source: ABdhPJyl1Zml7tK5z8UzPYsy0IRPoHHsY9ZbD0LO+NEm3SnMP5YpNvNvBFYMbygVSD+kwDaZAn8DAw==
X-Received: by 2002:a05:6808:1510:b0:32a:ef6a:99b with SMTP id u16-20020a056808151000b0032aef6a099bmr12444054oiw.120.1654003286440;
        Tue, 31 May 2022 06:21:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t6-20020a056870f20600b000e90544b79fsm5563380oao.41.2022.05.31.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:21:26 -0700 (PDT)
Received: (nullmailer pid 1610155 invoked by uid 1000);
	Tue, 31 May 2022 13:21:25 -0000
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, chunkuang.hu@kernel.org, devicetree@vger.kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, daniel@ffwll.ch, robh+dt@kernel.org
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: mediatek: dpi: add power-domains property
Date: Tue, 31 May 2022 08:21:25 -0500
Message-Id: <1654003285.268526.1610147.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_062128_533226_3C144BA3 
X-CRM114-Status: GOOD (  12.24  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 30 May 2022 22:14:30 +0200, Fabien Parent wrote:
> DPI is part of the display / multimedia block in MediaTek SoCs, and
> always have a power-domain (at least in the upstream device-trees).
> Add the power-domains property to the binding documentation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dts:29.35-36 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
