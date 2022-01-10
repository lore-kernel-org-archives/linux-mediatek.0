Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA63C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 16:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWSjCxzks00tnN6aNuF/Lmo5/ofvbJaFTp41O4J1XEY=; b=b8X2TbqZGN6dAh
	Psj7q+XHOIcHAfWzybfwdXLeZwhsElW2O3gpM6apg4OVwTrwUKgT25d8k+13YBlGu007YRynofIl3
	ra9OaLzK/TTZHYn6/IM/8FwoPRKSJT6Bs6T+x11IgVxqDUeQ1VkoGb3smTq/bMJSBnxz7v9CIyBWr
	+fzuEHlazgpf8CMrY5wNI98vvQOy8Dv6XB5K6urijTnJn7aXICIcu3aWifZ8tbfkeLjvKlATEQuln
	V+gh405i1o4wCqfF0hsbvV60s53Y9VFrO12uROCk7TILP+eFz/A6TdVpEFQJKNrQB3lXaOPlsqpot
	N5b1c/TvEd3Tx+RXiizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6xrJ-00CPmD-VQ; Mon, 10 Jan 2022 16:49:25 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6xqy-00CPfF-Hx; Mon, 10 Jan 2022 16:49:06 +0000
Received: by mail-oo1-f43.google.com with SMTP id
 q15-20020a4a6c0f000000b002dc415427d3so3212534ooc.2; 
 Mon, 10 Jan 2022 08:49:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=UE8yD5Ct/F6dHlrHLAV9VNma1gP2lMc+7CQcqBSce8s=;
 b=tLwt0qyY6EFZwC3NAQvz8mD4YU+8KqvR8p6k+FU6amTzFa1IdV/XQmizCPyoWpFsB9
 uwLOH8RVr613nVskbqr2k6X9G9jJ3bfKpL1FZKKr84hIhhu8sNWziK+YPhntrLrIs69P
 YBrlPHL97DdNJQ+or3JiRmJ8pNEFF1NGfJHNRJCqr7HT7vDoLS73spUwbqIAt6fFSsx4
 UnLx5D1gN0lr6Tnd9H9IrPwI0hzYoZrzq1iXMidHkWPwdOc4nVcJpxeXPmiy7pdqdzET
 IcLVoy9v6e3BGev2DvWP9C1sD5x3LvRKoobF00g12taImlSzoiZS4Zv5nEVE778IvnJ9
 SO9A==
X-Gm-Message-State: AOAM531e3/PM5myZNS6r6PCRCQ/4uK7sOnBgGlcyGraI/UKDg+y0ehqy
 x3GarGDPwPBKalTyVmnkZQ==
X-Google-Smtp-Source: ABdhPJyAQKG9qcTs+ZJVuMZ/jvEd8orfRKAYQTVMvMNX+7d4dfJqitUbb9xMHJqKbaljkyvpyqBEgQ==
X-Received: by 2002:a4a:51c5:: with SMTP id s188mr441999ooa.44.1641833342522; 
 Mon, 10 Jan 2022 08:49:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v23sm1585676otn.42.2022.01.10.08.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 08:49:01 -0800 (PST)
Received: (nullmailer pid 1067454 invoked by uid 1000);
 Mon, 10 Jan 2022 16:48:59 -0000
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
In-Reply-To: <20220110053744.30323-1-leilk.liu@mediatek.com>
References: <20220110053744.30323-1-leilk.liu@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: spi: Convert spi-mt65xx &
 spi-slave-mt27xx to json-schema
Date: Mon, 10 Jan 2022 10:48:59 -0600
Message-Id: <1641833339.690847.1067453.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_084904_620198_C017AFC6 
X-CRM114-Status: GOOD (  14.29  )
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

On Mon, 10 Jan 2022 13:37:43 +0800, Leilk Liu wrote:
> Convert Mediatek ARM SOC's SPI Master & Slave controller binding
> to json-schema format.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  .../bindings/spi/mediatek,spi-mt65xx.yaml     | 96 +++++++++++++++++++
>  .../spi/mediatek,spi-slave-mt27xx.yaml        | 69 +++++++++++++
>  .../devicetree/bindings/spi/spi-mt65xx.txt    | 68 -------------
>  .../bindings/spi/spi-slave-mt27xx.txt         | 33 -------
>  4 files changed, 165 insertions(+), 101 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-mt65xx.txt
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-slave-mt27xx.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml: properties:compatible:oneOf: [{'const': 'mediatek,mt2712-spi-slave'}, {'const': 'mediatek,mt8195-spi-slave'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml: ignoring, error in schema: properties: compatible: oneOf
Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.example.dt.yaml:0:0: /example-0/spi@10013000: failed to match any schema with compatible: ['mediatek,mt2712-spi-slave']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1577767

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
