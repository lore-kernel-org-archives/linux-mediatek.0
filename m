Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B348CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 19:49:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 714C761164
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 19:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 714C761164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMHxd+4wLLNVmzf7CG6T/q/LiawuqV5VP+8/vqBoVHA=; b=RtGVg5CYO+9nFf
	4y8NlBQNOz/wrfEfNy83PjfZ8uRIvBhfh+7kZ7QW1gzc1BLiULJuL550gU2KGUQtHj1RsnubfSHiH
	WIh4PQsK455OTBTeCDCvgw5/G3vLjO7cGgXWJOTSU5hBjZBvQYkZ2yl6SJZgLYHlbJlFAstndpEka
	e5mla0DyptfxX+AuGw6vCNJ/U4SHCbx0SZRYSJIFCkgmKcTq+685+SWLk4yiUgViIvWxiV+b4my+g
	Vq1hgDUmhk8Hn6i2t5Ize8pJ9paKGrDX7bjkkzRrTz4EcG85gphNhhZs67ch33KjMLssymu8wOI6I
	JB7+WV8HqzYo+qdIBiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRJrF-00ExL5-VY; Fri, 17 Sep 2021 19:49:14 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRJr6-00ExJK-7C; Fri, 17 Sep 2021 19:49:05 +0000
Received: by mail-oi1-f174.google.com with SMTP id t189so2953835oie.7;
 Fri, 17 Sep 2021 12:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=pE+4bnzWEy5M45GFHsCRmVHyw6zJKyXPFQ+Hy8/7q2k=;
 b=L4LXa0hl4CgM8YL7syJHsVazGLduWRnDPzjIV0qfdcNAkkk7KoBUAaSYrbQ2bQMNl5
 rUIc88K1xEEJnI9OCKuKMB/1nnsRa0/BleH0uLZAHLMXmabwNxuZrOJhFbY+969Z5Vac
 XucA8Hf7/Dzu19DW/DL0+cZ78SobmgUH3Dr+negEoiu1jyFcAVTL2iU0Rkj8JrVnQ0jQ
 E2eiUobwy54eKX8QKSJH2vXVCSiQtr6v/LTBHov3+9lnO632hbrfAmC/J6enjFNeORer
 6yuf+f78jVmwmitD945NQg/W+6Mkh80yPx4hY1O5jGIvNS5N0LK315SWKCdnhFWMWq9D
 3LRg==
X-Gm-Message-State: AOAM5309RhA8Q5jHFHFAoGU7xWL7ljPHHqwrrXWnfXTSAFkIpP1sPmSr
 QfZN7Z4fXnp0t9DtHbwG3Q==
X-Google-Smtp-Source: ABdhPJw33RfJFXipWnsomu5OMJbVFalUdObkurEitpoBWQS/R7QjuAoRiC8fBREZ7YS1JypZmiMHIw==
X-Received: by 2002:a05:6808:bc2:: with SMTP id
 o2mr5488000oik.73.1631908142931; 
 Fri, 17 Sep 2021 12:49:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v11sm1805276oto.22.2021.09.17.12.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 12:49:01 -0700 (PDT)
Received: (nullmailer pid 2025335 invoked by uid 1000);
 Fri, 17 Sep 2021 19:48:54 -0000
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: bjorn.andersson@linaro.org, daniel@ffwll.ch, ohad@wizery.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, gpain@baylibre.com, mathieu.poirier@linaro.org,
 christian.koenig@amd.com, devicetree@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, khilman@baylibre.com,
 linux-media@vger.kernel.org, mripard@kernel.org, matthias.bgg@gmail.com,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 sumit.semwal@linaro.org, linux-remoteproc@vger.kernel.org
In-Reply-To: <20210917125945.620097-2-abailon@baylibre.com>
References: <20210917125945.620097-1-abailon@baylibre.com>
 <20210917125945.620097-2-abailon@baylibre.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: Add bidings for mtk,apu-drm
Date: Fri, 17 Sep 2021 14:48:54 -0500
Message-Id: <1631908134.342766.2025334.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_124904_302953_B8CA1846 
X-CRM114-Status: GOOD (  12.14  )
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

On Fri, 17 Sep 2021 14:59:42 +0200, Alexandre Bailon wrote:
> This adds the device tree bindings for the APU DRM driver.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
./Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpu/mtk,apu-drm.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dts:19.15-23.11: Warning (unit_address_vs_reg): /example-0/apu@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dt.yaml:0:0: /example-0/apu@0: failed to match any schema with compatible: ['mediatek,apu-drm']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1529388

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
