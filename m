Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5823EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JG4Fl7yYfdp+Fmh85HhEsfM7trOtuKYtbjX9b5YYWJo=; b=xZ3A3gVuFpWHog
	nHfrwiXF47H/Ya61Ee2PAZzq6ogiXsoaRZrSbpmMsov3UaCtG9G1COOJ7xkV6B2XTNCC3Cg/z+5uF
	oJ2m3K/9Ptupxt+AR0pB0aYgLdU9yRr7fhsJI49exDZg+rneI8zTbaLqNE7j5LJlVnbJGGY+kFPBL
	OO9hD5MHKWipFoLCB/gb/UP7giuVcVLXfNELg9Xy1ch7fdYW10uJTQbQ/Q4dOLhsMk/SMDDJwK1xe
	qCTXQjk24szJssBaQnfA2v0ShVeBCu2tUVAsGTUQA/RvOMMFMrzxlYKNDppZq7YexLlObSYLwAt70
	nRzU3iPnYLv8FDgWSM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB3UD-00GGNy-Jj; Fri, 21 Jan 2022 23:38:29 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB3U0-00GGKW-JR; Fri, 21 Jan 2022 23:38:17 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 y11-20020a0568302a0b00b0059a54d66106so13784534otu.0; 
 Fri, 21 Jan 2022 15:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e23Qd0fm0GuK2sIIse882pkUGPnMfjGNce/vSbHSQdE=;
 b=ufYkOy0yj3AbY927ezP3j3D8f/UjCRqcz/vantQfOQAhBK2htnLECTwHdh0ogM21KJ
 A7NewSGKUoUcfsQavBhOlPhhlgHGLbslIH8sSTjmQrFulCsp/h6GOcZOmFMiFScUCuCp
 2Z3k/FuTKS0y+FqlQOhYf+GqvHhYS+nyIQ6B5YuhkbpDQ5KsI7RP8IlMG284s2hom6q0
 ZYrTW8Zn1R8aFDJdCLzZk9ENDXAtqokXRKOlj6EEPgNhiWDynuzC6+TOait6ugPwDrcJ
 b2sX5NxyoZC01VloOWsbVOpKTLcRfPxJlFzz4cc0F0Yi+3EODQuRFPI8Krv2CJY2xgNh
 uSeg==
X-Gm-Message-State: AOAM533FxTpJl7qojOsY9tRf+yDb3qGkTA0e+C3UYNjJ1ucCcFnCmJyq
 q+uYXs5++p0y8nOkMWbIvg==
X-Google-Smtp-Source: ABdhPJx8DELQ9xc5SKlrpkpLS4lSCx/gVdpoSqAojzwmxkwoW4TLkPA8rhSCwN3hTZgsaKBeYeeRDg==
X-Received: by 2002:a05:6830:1f56:: with SMTP id
 u22mr4325700oth.138.1642808291144; 
 Fri, 21 Jan 2022 15:38:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f6sm1399162oos.7.2022.01.21.15.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 15:38:10 -0800 (PST)
Received: (nullmailer pid 1827883 invoked by uid 1000);
 Fri, 21 Jan 2022 23:38:09 -0000
Date: Fri, 21 Jan 2022 17:38:09 -0600
From: Rob Herring <robh@kernel.org>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-iio@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars-Peter Clausen <lars@metafoo.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add compatible for
 Mediatek MT8186
Message-ID: <YetD4SehEDxLkrzH@robh.at.kernel.org>
References: <20220110084841.575-1-guodong.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110084841.575-1-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_153816_670677_D63210AB 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On Mon, 10 Jan 2022 16:48:40 +0800, Guodong Liu wrote:
> This commit adds dt-binding documentation of auxadc for Mediatek MT8186 SoC
> Platform.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>  .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
