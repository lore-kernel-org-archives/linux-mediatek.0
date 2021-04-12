Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A315C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 13:20:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49EF56134F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 13:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49EF56134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZSErdoHMXZnCzl/Ck0XldV8rFVKRgHpVbcswUz32DY=; b=OvMYxUhSBjK11Y8UylDeUEpZjr
	7F6IjmXEYkTcU0qGszhXnAbz/VC/kEsmJQ8q5XguzXCfwjUrDTvFJJVc6Gnur29h1H5pNjZyx0ykc
	wCJy38bEa4ZNTMGavzoKX3A2emgm0yvriGX1Yc9BD3Km+1RdKpULMI0jUdQKQNHOfaiRYDJD1vdZe
	6vXa4XNiItCOpqYxeqqkxCe13v4CTEhqpMt9qdr7rCNtovQZXdRUzrid+wvW1r7L5KU4Km18sP3rg
	nUmUNaYp7nAxRTfG695NxAwuFn+q//GAkticmLp7+994f7LNqVrYXilbyK0+7hD8BQiQ568gY40ze
	55qPEcRA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVwUF-006ogs-QV; Mon, 12 Apr 2021 13:20:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVwU4-006obt-5n; Mon, 12 Apr 2021 13:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:References:
 In-Reply-To:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lGbxJrFzMnc2Fx/IsvHpCVq0F6FhFOgQp1Mj1B5sJic=; b=jqQs2Ks2+32TrDN3ENTyXfI6+V
 IFwt1CPZRIrNrVI2lHHt8dwdgxZ1wWeRMJii5nNsbAhCbgSAFdOpBE53YT6pTgScNRWO0TGmh14wn
 Qeegg/xXul+4oDSKBW3b9jrkM0c1R+p2tEEucSYpGLY4UIzjG2TZNpPWLHEXIOi1BVKOleDoQlUfQ
 vH49GJeo0FacvYbxc979pE3EUSF3XGOBpK8+KA5O2t4aH60+rQoV6jUTIhH6PO3k9qcbPBnwhKhMQ
 gZ8/Dy6XTqcoYtgPlBPXXtkflMw9HsSVH1aRWiW1Om6x5kj2OMFnQG66YVgEKlUGfkTCktHHOoALZ
 a/1eyYdA==;
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVwU1-006G9k-HW; Mon, 12 Apr 2021 13:20:07 +0000
Received: by mail-oi1-f172.google.com with SMTP id m13so13337100oiw.13;
 Mon, 12 Apr 2021 06:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=lGbxJrFzMnc2Fx/IsvHpCVq0F6FhFOgQp1Mj1B5sJic=;
 b=ctxfBPpH94/22S588ks9K0fF4c4pVO9t9lAjwoaE9o208hNtRUdQh1rQNf0IyRzIFk
 vNAgB3yZnSNX9Jy90veJVTj5jtijb86lFZGzO9M1cVi1+q6k/8lMYSHucxJ+JgTeRI3P
 wQHsHJcx9tM5bnXADLyp/Eemxh9Z4hVfZMFG+p2loaeDbbqno7nBWEAbinyAk+Mh6TuJ
 TM7XGH8tE+JCfM/xdGl67HuzxEz3DuA7fw+ip1IPMwuDIbaRJAH8pzFLB9Cw24c7escn
 aWuP0LvWlRWw79zyYTzz6Dr/jXrjcXczLsqgPJfWtGY/T69ACxWBONhYa57yNIQ7sjBP
 Nh9A==
X-Gm-Message-State: AOAM532gZgf5TtKL+q0mO8n4FHkVvmOlfzWOVW6q++OxQ69YobL1onNy
 6HH9ZR/GuJ+7F+ow5aknLRG8JKLwiA==
X-Google-Smtp-Source: ABdhPJwZndFkIsmVSZKsOGhLjyxjuNqKh1d0bmVhKTaHx1jRM6l3+6e4iJWO8bm8em9IBSkpGj8/Sw==
X-Received: by 2002:aca:bc87:: with SMTP id m129mr19491514oif.29.1618233604163; 
 Mon, 12 Apr 2021 06:20:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v205sm21386oie.16.2021.04.12.06.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:20:03 -0700 (PDT)
Received: (nullmailer pid 3757978 invoked by uid 1000);
 Mon, 12 Apr 2021 13:20:00 -0000
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
In-Reply-To: <20210412093928.3321194-2-narmstrong@baylibre.com>
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
 <20210412093928.3321194-2-narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: mediatek,
 hdmi: Convert to use graph schema
Date: Mon, 12 Apr 2021 08:20:00 -0500
Message-Id: <1618233600.211900.3757977.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_062005_597917_AF40E8A6 
X-CRM114-Status: GOOD (  12.46  )
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

On Mon, 12 Apr 2021 11:39:24 +0200, Neil Armstrong wrote:
> Update the mediatek,dpi binding to use the graph schema.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/mediatek/mediatek,cec.yaml        |  51 +++++++
>  .../display/mediatek/mediatek,hdmi-ddc.yaml   |  57 ++++++++
>  .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
>  .../display/mediatek/mediatek,hdmi.yaml       | 131 +++++++++++++++++
>  4 files changed, 239 insertions(+), 136 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.example.dt.yaml:0:0: /example-0/i2c@11012000: failed to match any schema with compatible: ['mediatek,mt8173-hdmi-ddc']
Documentation/devicetree/bindings/display/mediatek/mediatek,cec.example.dt.yaml:0:0: /example-0/cec@10013000: failed to match any schema with compatible: ['mediatek,mt8173-cec']

See https://patchwork.ozlabs.org/patch/1465094

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
