Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFD7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQ61VnvJmquL4P61EofkwGsXxmYmHrL9OepXujF7jkw=; b=tNTHIfvzlxGMFJ
	pQr+/ZrCNeXew9GK05FQY6DznOSIBLYW5eDSkLpBO9sHoi8gGTkaeM24Ux/eiTDWPSh3T8pWre9pG
	GuI3dB3AY/B05nmVwIOkSvsBjU7iw4aoy9ZpVoJXQTVyQFeKf4TmXBnaXlZjjA7/bj5i/TwvZiCHu
	Bn4AAsQmeodQ8AdUNQNQ6yXWQ0g9HiCNqeghcRDZ50wEw4vZCgCBzjne50ixJ/rgLq/R1tjTGBKdZ
	KLMrtH/ElMgBe3USWwYgTU9JR7sAGlLBQVolmxZNPS+d/7znK00EN2kaBhP1WgpsuOr+stRH9Vd61
	gwx35leqkQcyw/ZGq37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpYlZ-002uEM-4j; Tue, 23 Nov 2021 16:35:33 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpYl3-002u06-Pg; Tue, 23 Nov 2021 16:35:03 +0000
Received: by mail-io1-f54.google.com with SMTP id z18so28708737iof.5;
 Tue, 23 Nov 2021 08:34:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=tTDqJqEpn3lJVr9hvHIdnLnM0QZTa6cWxZTxlXqyveI=;
 b=ofvVNftjiM6EfKCvPxCsQyg4Y7B7R2vNfjEwrAETHv9TJ8H+3+LKyxpsUzDGSgKjU2
 NsnVgT/OABoH7YlfBu1GeTFCE2zOrQGrRtskshx869R28judzhvJVB6K5f9xgM4yOTLQ
 5kaUQThNhcJwWtm3ws218IiUEwuNArT1kQeGJ/rnGDJUH9z1KKTj4uJlQRiCRbF//ym0
 kRaIbeyLu2J4iqaqfTAuYruIxtTYPVWfDgNC9A9owpctgaeJPxBgUtZJtxiAdw9sB9h/
 5CWP0uedI29CJ4m6BYdwtV5dizcCKLqSN5rAmSvzoA+DZ0f4CNn5WMngIEywutrW5FZJ
 CHBw==
X-Gm-Message-State: AOAM5316zTUtBeHJp48VhzFomTtxvk343PvGXXhf711eRkOdN9swgsif
 KD0epPnrrm9Amm+6V/iAlA==
X-Google-Smtp-Source: ABdhPJzpKxUJnoCa0cAVi7P8tqEKN9cFnfuz6QPVzyOgjxBNvvRZQNUJPZWW6WEKX50SRbXuuf9lzg==
X-Received: by 2002:a02:cc29:: with SMTP id o9mr7751315jap.116.1637685293477; 
 Tue, 23 Nov 2021 08:34:53 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id o22sm8929890iow.52.2021.11.23.08.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 08:34:52 -0800 (PST)
Received: (nullmailer pid 3442912 invoked by uid 1000);
 Tue, 23 Nov 2021 16:34:29 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: tfiga@chromium.org, - <devicetree-spec@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 Rob Herring <robh+dt@kernel.org>, senozhatsky@chromium.org,
 iommu@lists.linux-foundation.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20211123112104.3530135-3-hsinyi@chromium.org>
References: <20211123112104.3530135-1-hsinyi@chromium.org>
 <20211123112104.3530135-3-hsinyi@chromium.org>
Subject: Re: [PATCH 2/3] dt-bindings: Add io-tlb-segsize property for
 restricted-dma-pool
Date: Tue, 23 Nov 2021 09:34:29 -0700
Message-Id: <1637685269.659918.3442911.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_083501_863038_B5B5048F 
X-CRM114-Status: GOOD (  12.91  )
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

On Tue, 23 Nov 2021 19:21:03 +0800, Hsin-Yi Wang wrote:
> Add a io-tlb-segsize property that each restricted-dma-pool can set its
> own io_tlb_segsize since some use cases require slabs larger than default
> value (128).
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../bindings/reserved-memory/shared-dma-pool.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml: properties:io-tlb-segsize:type: 'anyOf' conditional failed, one must be fixed:
	'u32' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'u32' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml: properties:io-tlb-segsize:type: 'u32' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml: ignoring, error in schema: properties: io-tlb-segsize: type
warning: no schema found in file: ./Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
Documentation/devicetree/bindings/display/msm/gpu.example.dt.yaml:0:0: /example-1/reserved-memory/gpu@8f200000: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.example.dt.yaml:0:0: /example-0/reserved-memory/linux,cma: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.example.dt.yaml:0:0: /example-0/reserved-memory/restricted-dma-pool@50000000: failed to match any schema with compatible: ['restricted-dma-pool']
Documentation/devicetree/bindings/dsp/fsl,dsp.example.dt.yaml:0:0: /example-1/vdev0buffer@94300000: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.example.dt.yaml:0:0: /example-0/reserved-memory/dsp-memory@98000000: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.example.dt.yaml:0:0: /example-1/reserved-memory/ipu-memory@95800000: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.example.dt.yaml:0:0: /example-2/reserved-memory/dsp1-memory@99000000: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dt.yaml:0:0: /example-0/reserved-mem@52800000: failed to match any schema with compatible: ['shared-dma-pool']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1558503

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
