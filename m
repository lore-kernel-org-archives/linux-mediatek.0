Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFBEC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 01:07:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD1D60FBF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 01:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABD1D60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67mBial5PikyQz9JJ5qkoC+ty+mowjY2lQ6FwBVeUR4=; b=SbN/7j8QdZUwxW
	dOmkscSfaIRlBrg37gvlDhx9oQGTAZqSS/6crXmVOcltFdVV7gsjgmHXItwPGHVGsY/cHXRnEdFBG
	f1FOHpY+4W5gc3Bl6sLVLPxO33M+JACcD31dIJB8ilpd4fTCBvQE5Gt0BOMeKqYudiMryzWjwQ6RU
	nGTx2IoM+syiOlZ5HxfKQmvqovizeltKyqAMyuW5SaLl2QS4yxyqy2T28pahcdmUK7I3AmE4LTk16
	sclg6aklbGQEV+VnUQPCNhwLwSxl8ynWdh/Hyow8IYyE94AIz4PgxHTu5i13lJ9fpbnI55sdoRRX5
	5Z8xRWS40pPKe8Rnu35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGA39-003peA-Tu; Wed, 18 Aug 2021 01:07:23 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGA2v-003pcA-J2; Wed, 18 Aug 2021 01:07:10 +0000
Received: by mail-oo1-f46.google.com with SMTP id
 m11-20020a056820034b00b0028bb60b551fso212712ooe.5; 
 Tue, 17 Aug 2021 18:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h5q8VzIWAFVz/l5dP+7x5gcn5xuv5tl7Qar3LU6BUB8=;
 b=MfEe1JGAw7JSPOM3P8HHTWwMFqaXkrQNtDeJxWTlFez2gkRQuQBrKdmpM2Q2Gh7ZEB
 SktfF9d5kaGReWEV+Bn0c5Bl3Xrz4+j3Eh4jgubaFqs+KDcpZgpj4BVfyW4W+Sfazdo6
 SjFRohOUu8uqwGBAM1os34EU0h0w0UIGGjL5ez9q5vJBXR6ej+qMEMDk8jGrNgDtICaD
 rcUOXPQ3koftfSkYpu2X/7sRf4uEqcvJRfIl/9fJwSKV6WaEG6ReF87Zv2x5lhywWPou
 c9hBD+IlJKaqYvyCpwHQ46147f3m4VrwmqYJr2IiybfDCqldzbbFCAlXEv4uL82OI+20
 h42g==
X-Gm-Message-State: AOAM530LwlzPs77kK9ikjaBVvaaCD+/0gFVkn/AIazrp+sDT7mW+V/qh
 XuCc35+JTXHhLHAW+pRBGw==
X-Google-Smtp-Source: ABdhPJzIPH42GWVxKeO7jdVek/5WPtkXW3uDVYvdwtDdzpUjulmiYbSAP1qL3dVSUN/o2H5a4ZbnjA==
X-Received: by 2002:a4a:dfac:: with SMTP id k12mr4668702ook.41.1629248828736; 
 Tue, 17 Aug 2021 18:07:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n130sm654964oif.32.2021.08.17.18.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:07:08 -0700 (PDT)
Received: (nullmailer pid 1164082 invoked by uid 1000);
 Wed, 18 Aug 2021 01:07:07 -0000
Date: Tue, 17 Aug 2021 20:07:07 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: rui.zhang@intel.com, daniel.lezcano@linaro.org, matthias.bgg@gmail.com,
 ben.tseng@mediatek.com, michael.kao@mediatek.com, ethan.chang@mediatek.com,
 fparent@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: thermal: Add binding document for
 mt8195 thermal controller
Message-ID: <YRxdO9upQxib5Tcb@robh.at.kernel.org>
References: <20210816164307.557315-1-abailon@baylibre.com>
 <20210816164307.557315-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816164307.557315-2-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_180709_686289_857D87F9 
X-CRM114-Status: GOOD (  16.48  )
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

On Mon, Aug 16, 2021 at 06:43:05PM +0200, Alexandre Bailon wrote:
> This patch adds binding document for mt8195 thermal controller.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../devicetree/bindings/thermal/mediatek-thermal-lvts.yaml  | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> index 69ffe7b14c212..2e1ae00d4fd18 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> +++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> @@ -12,7 +12,11 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt6873-lvts
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt6873-lvts
> +              - mediatek,mt8195-lvts

You don't need 'oneOf' when only one clause. Just changing the const to 
enum is enough. 

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
