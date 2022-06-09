Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCC0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 14:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8J21K1WnM37unnt+fb9/MOVB+jOqWLECvRp0MrWb6I=; b=jFfesHNE4+my3b
	V+OUXol9eZXxekst3kjmmH7uYIjYcAYA9GmvAjFEsFUrNVkEwJJtDbsmVlDmEgOAqVvT6QKZxWNa9
	XWs+TYXV7KPCU/JAQ7ZtObk3WJo9dCjBw3aHkleE9R9MzizvYJVQhrGOgQdQ4xj4b3Uv+7vhsZUhD
	nSRT4HVhoAMzQladNp+pYhwMc84xDDn0ZMaxf2ANJspW3z5P54mn+kgIzoyB6w7z8h4YnCJIt7uSh
	rP3R8dfBKYzF8cXhp+O69+AovdNep6XCh2hf/0thF3Qo6L1iCaVL8n1U9crZEH+1bOUrU4bZaI6Rf
	lRua6xMrLSqxXfDUflHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJ4f-002Teh-Hd; Thu, 09 Jun 2022 14:23:49 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJ4c-002Td4-5s; Thu, 09 Jun 2022 14:23:47 +0000
Received: by mail-io1-f41.google.com with SMTP id q11so298134iod.8;
        Thu, 09 Jun 2022 07:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=2euiQq6QHzcln0aEqodhVH6QsST6rRQ5WhOXirbniGc=;
        b=bZ/mXibSoBDkMevJ9wDbzSLJn+sk7jMnRkvTNNGiLSGGy87I27KtECPsS9PbqBWyb3
         2izMPflJA6pdgBt2zpPeq2u3TpcnOgQLWjKZr9NjjvovoQjJdHVOzsNKLABqRDcz52Bm
         lHET3Ob8WwzLYNACk+ezsIetnjuxmjFL43upRfp7UKl6a7mylY2c9fTcL/vogixdwg6v
         +2kk5VLAq1jvk3KPMOfZjETF4Z3yxZzVBEJGUjmikFJcAlxD5Ba95inyv9q8HU7OegNU
         aVp4spYt8gx8NKLjBThRnyxsP6RzGeg3t6uQ1riql8l4SgPtjdVUjgcu2OVAXx3mGGLz
         30xA==
X-Gm-Message-State: AOAM5302dJzDP97A9NfcRkZMAy58L+uFunMa5jQQI5WgtdWalUNUDHzp
	y4py9APoZc7DDidkDa6J0A==
X-Google-Smtp-Source: ABdhPJx6We98HCBCkzcUJThBhFBjHm+zyDlUhxvomrFQnfPjQxOhbwjj02lQhbBm75JyPLLuRR9NHQ==
X-Received: by 2002:a05:6638:1182:b0:32e:5c70:c89c with SMTP id f2-20020a056638118200b0032e5c70c89cmr21146904jas.45.1654784624025;
        Thu, 09 Jun 2022 07:23:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id e16-20020a056638021000b0033195fabca4sm5974569jaq.175.2022.06.09.07.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 07:23:43 -0700 (PDT)
Received: (nullmailer pid 3738851 invoked by uid 1000);
	Thu, 09 Jun 2022 14:23:41 -0000
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: joro@8bytes.org, iommu@lists.linux-foundation.org, robh+dt@kernel.org, will@kernel.org, krzysztof.kozlowski@linaro.org, yong.wu@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20220609100802.54513-2-angelogioacchino.delregno@collabora.com>
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com> <20220609100802.54513-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: mediatek: Add mediatek,infracfg phandle
Date: Thu, 09 Jun 2022 08:23:41 -0600
Message-Id: <1654784621.700928.3738850.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_072346_266829_B9FC0F0D 
X-CRM114-Status: GOOD (  12.28  )
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

On Thu, 09 Jun 2022 12:07:57 +0200, AngeloGioacchino Del Regno wrote:
> Add property "mediatek,infracfg" to let the mtk_iommu driver retrieve
> a phandle to the infracfg syscon instead of performing a per-soc
> compatible lookup in the entire devicetree and set it as a required
> property for MT2712 and MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml           | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/mediatek,iommu.example.dtb: iommu@10205000: 'mediatek,infracfg' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml

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
