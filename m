Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E934FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZ8dOibWuBhXfyKr8q5fHvR+eh4a/jZEg0+2IyqqVr4=; b=jkH3FJr1Nr9on/
	NCbH5B6nOzqAHw++nA7kKBHr8IFv0buv8cDgTTOvFfxa6jZ0M03LWMYnlndYurB7HxJPAlbkWP4nM
	h8PIwDfovijRtgxM2vHtBgD7bOxgv+a/V0eBYtUmYUkBztFus1yOkLzqCaplIyqszpfCzgtdySpRj
	p4gr9XBieNS3+v4roxxEtHhg+ONeKiM8xMEXXABVq8siskXpzfrW7GCUnR0e645nARaX+BL2WSup4
	fCruxAxTJLncfVsyCeBPMQg3jLWF8Ud0ucaQ2fXYUSDbrLLWM9yKL+90BuHpHLVp34hlULFGbJqe5
	b2e5bLpS0/UkSuElWEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyarp-008Eee-1R; Tue, 07 Jun 2022 15:11:37 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyard-008Ebw-5F; Tue, 07 Jun 2022 15:11:26 +0000
Received: by mail-il1-f169.google.com with SMTP id u2so13498094iln.2;
        Tue, 07 Jun 2022 08:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yZvply317AePPx+C+0gJXDyN0OP2009ot+8UwJNT7lc=;
        b=KQmfG473SfoDLZWZkoEXA+DKSLZt4+D46caJdgeIu8G65a4fk4dGLNJpzDIeoquklv
         62lhtRr2PY7ubhDI8JQ6R/V9PgZ4017QTtRyeT+krroO3kwq0oK1WVYEMqrScz3rto5p
         8ympunyAwfGwhisMulyI99pdmzHxENOFlSIjOEB8j9wVJ9YIibk+TqJngz4ZIxhLNk+3
         Lfg7lXqUcil2KmyD13oDBFWSXNtZaM3Msw2h0RZQYITT2d9pu/R/19fGtcgbb8GCtd10
         XvCCMCbBtO9/E4bqy0am4IZ0WY7XClbTMKyi/mmWkPn+fZbgG1r4uvavTH1SMuP8qAm1
         icyA==
X-Gm-Message-State: AOAM530AnVBbymOW2zLXbBC1NvsmYA5WrMmJasjtKaJK2Zp0cW2nwckK
	lObypqxTh3KkYntTg+v2y98GFfQrRA==
X-Google-Smtp-Source: ABdhPJx/aj8OkTZ5sZWk9M29SQS/0eDgBTSzLYMt1Sjvv9q41ldddqHu8JdQx/N4vjM5hJPYMOdyQg==
X-Received: by 2002:a05:6e02:164b:b0:2d3:ccea:ff38 with SMTP id v11-20020a056e02164b00b002d3cceaff38mr16702955ilu.37.1654614682299;
        Tue, 07 Jun 2022 08:11:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b14-20020a05663805ae00b00331d98c9a7fsm409601jar.40.2022.06.07.08.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 08:11:21 -0700 (PDT)
Received: (nullmailer pid 3258163 invoked by uid 1000);
	Tue, 07 Jun 2022 15:11:19 -0000
Date: Tue, 7 Jun 2022 09:11:19 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@linux.ie" <airlied@linux.ie>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "pavel@ucw.cz" <pavel@ucw.cz>, Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Subject: Re: [RESEND v4 1/3] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
Message-ID: <20220607151119.GA3254370-robh@kernel.org>
References: <20220606051131.14182-1-rex-bc.chen@mediatek.com>
 <20220606051131.14182-2-rex-bc.chen@mediatek.com>
 <1654520033.524963.534472.nullmailer@robh.at.kernel.org>
 <8598b46381861bd36008cc87599c73863cb4b98e.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8598b46381861bd36008cc87599c73863cb4b98e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_081125_240398_C8986071 
X-CRM114-Status: GOOD (  26.31  )
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

On Mon, Jun 06, 2022 at 09:30:42PM +0800, Rex-BC Chen wrote:
> On Mon, 2022-06-06 at 20:53 +0800, Rob Herring wrote:
> > On Mon, 06 Jun 2022 13:11:29 +0800, Bo-Chen Chen wrote:
> > > From: "Nancy.Lin" <nancy.lin@mediatek.com>
> > > 
> > > Add vdosys1 RDMA definition.
> > > 
> > > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Tested-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88
> > > +++++++++++++++++++
> > >  1 file changed, 88 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > > rdma.yaml
> > > 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m
> > dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-
> > review/Documentation/devicetree/bindings/display/mediatek/mediatek,md
> > p-rdma.yaml: properties:compatible: [{'const': 'mediatek,mt8195-vdo1-
> > rdma'}] is not of type 'object', 'boolean'
> > 	from schema $id: 
> > https://urldefense.com/v3/__http://json-schema.org/draft-07/schema*__;Iw!!CTRNKA9wMg0ARbw!3hhZrSKSWnCN5Bha9laiHlB5JCx9_p-ksaYDZmoCLQRi1tI4KJCcTJQva2vds3j3bwKF$
> >  
> > /builds/robherring/linux-dt-
> > review/Documentation/devicetree/bindings/display/mediatek/mediatek,md
> > p-rdma.yaml: ignoring, error in schema: properties: compatible
> > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.example.dtb:0:0: /example-0/soc/rdma@1c104000: failed to match
> > any schema with compatible: ['mediatek,mt8195-vdo1-rdma']
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/patch/
> > 
> > This check can fail if there are any dependencies. The base for a
> > patch
> > series is generally the most recent rc1.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up
> > to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit.
> > 
> 
> Hello Rob,
> 
> We found that if we write this, and the error will disapear:
>  properties:
>    compatible:
> -    - const: mediatek,mt8195-vdo1-rdma
> +    items:
> +      - const: mediatek,mt8195-vdo1-rdma
> 
> But from Krzysztof's review[1], he adviced us to drop items.
> 
> Is there any suggsetion for this error or do we have any
> misunderstanding?

The '-' is important.

compatible:
  const: mediatek,mt8195-vdo1-rdma

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
