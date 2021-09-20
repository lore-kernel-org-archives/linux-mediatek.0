Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93F6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 20:56:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93E9660F23
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 20:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93E9660F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osmiNiDqWyrDMrXWSkTh1TA4asWiu9/1ROm/NQXlVHw=; b=uxDqnPyPeEsk2v
	f6YGTSis6v5GzCAr1/vTD26YLyrPAyKDpE//OX228lZJUMMg3A/6FsZxW99PBRgaSUYi0YlUYjII3
	iVSF2/7loI7Gkf2NNfw1Essy16hmFfKvSHEV9OyL8f5qPA2Q7jH2vcLoZjU60PkwuCZqolt9PZlw1
	mDYDRgyxJFqkR7rLTchFqKUFf6kUTeXUE0XwOwblunzwsBhR8FLUe0WbfOKeXxdohQkOrCtomqPZp
	50PKFY6HI+haLC5Z07WtO7mXST9wNhUdtESJ3xURrjcY94+HGcLTXthV/JQ3WebPDjm3Ad1H6kXmP
	8YOfbM4Crmzqap0RRo8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSQKk-0035id-RY; Mon, 20 Sep 2021 20:56:14 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSQKY-0035gu-0h; Mon, 20 Sep 2021 20:56:03 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 c8-20020a9d6c88000000b00517cd06302dso25356632otr.13; 
 Mon, 20 Sep 2021 13:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XPatjUnaHnEphbp45Tc3T1p6HiP/lC6r/ygiKd/wpQg=;
 b=OI+LFWETnaF9dLM3yfkMIKKRofhXzxNYKvnSNah15Q82P7AHcoSXHTZ4lSukHlo15K
 hfioz728SPhQ185COudcAW/UxpjmVIiDo1leF54+qnuYdCRzbp2fV86fNogj6rOvHZPD
 VAab4Wwc0IEqK6toOYDGe20x8Z4SL3EbJQn4oAvQtLC+w99YpwrbYqZHgajqlYNRo51A
 pV61Yp3930jDo4bOmKAJThc6SzoIEwgJA5WfiTKVhnkTagUdHxETNfmeGVw6QgF6bffz
 5eNtG79T6SfpRkbFzfezPMXpmuwUJ1t5qeGzgBdgPOFog1t9Nn9EwwLaFgdPlGAzVGn3
 rqTQ==
X-Gm-Message-State: AOAM5338dgysZ09+Jv6oCdVEkjKaRmPkmDBnkLbMFWkLoyWKQwNL3BOY
 X0tgJl9xkIgeZzdkTMdtPA==
X-Google-Smtp-Source: ABdhPJw0Ubx9PITUcYUz1zNNca0q8nJ7I3Nn2f8OSxbuj/hwXREco2J/I6rnExb8fxBIFDz9aO3PRg==
X-Received: by 2002:a9d:4681:: with SMTP id z1mr23005506ote.42.1632171360541; 
 Mon, 20 Sep 2021 13:56:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x192sm2337226oix.9.2021.09.20.13.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 13:55:59 -0700 (PDT)
Received: (nullmailer pid 744183 invoked by uid 1000);
 Mon, 20 Sep 2021 20:55:58 -0000
Date: Mon, 20 Sep 2021 15:55:58 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 khilman@baylibre.com, gpain@baylibre.com
Subject: Re: [RFC PATCH 1/4] dt-bindings: Add bidings for mtk,apu-drm
Message-ID: <YUj1XnBbyNEqrV2g@robh.at.kernel.org>
References: <20210917125945.620097-1-abailon@baylibre.com>
 <20210917125945.620097-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210917125945.620097-2-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_135602_107031_033DDBA7 
X-CRM114-Status: GOOD (  17.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 17, 2021 at 02:59:42PM +0200, Alexandre Bailon wrote:
> This adds the device tree bindings for the APU DRM driver.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> new file mode 100644
> index 0000000000000..6f432d3ea478c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AI Processor Unit DRM

DRM is a linux thing, not h/w.

> +
> +properties:
> +  compatible:
> +    const: mediatek,apu-drm
> +
> +  remoteproc:

So is remoteproc.

Why don't you have the remoteproc driver create the DRM device?

> +    maxItems: 2
> +    description:
> +      Handle to remoteproc devices controlling the APU
> +
> +  iova:
> +    maxItems: 1
> +    description:
> +      Address and size of virtual memory that could used by the APU

Why does this need to be in DT? If you need to reserve certain VAs, then 
this discussion[1] might be of interest.

Rob

[1] https://lore.kernel.org/all/YUIPCxnyRutMS47%2F@orome.fritz.box/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
