Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A424EC4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 15:53:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1924E22247
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 15:53:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PQWRUhv7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1924E22247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rI89cgC3F7WybbjlqVaFmFMdIQaTid5b/4iNZVdqmH8=; b=PQWRUhv7YLO8e+sANF4Su0CGS
	16hyX8qbwmM1mndBM7Rho4dHFGWdHuk++kfg5O66JahlOJdYqjsena0nqE3NeuVXdM1j+lR2c3r/9
	v4D9ohwt6PP3tkZ4EXHatHPzJfoL29W6NDg+mvatzqVzCGXlRpMzwlV4dbpulvOH2rRaOqsHV6lsi
	ue1/uXID2LPSOeF+Xd2O6/1tGw/wXBGLl1qYborq99lHwXKus+FW+SElVN4b6Kysn8/p+zNwkfdRZ
	ZwM1/PCopZQQxZlL+aUM0+b5feGHTClLLvgci0ojqv/3JeXhXyf4FCP93/VoJyTP4/ztdS818uuP1
	0dI4jKPBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUtwi-0001lm-UF; Tue, 20 Oct 2020 15:53:08 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUtwd-0001ju-3Z; Tue, 20 Oct 2020 15:53:03 +0000
Received: by mail-oi1-f196.google.com with SMTP id l85so2615621oih.10;
 Tue, 20 Oct 2020 08:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iSUnJ3zC+i96Tee9HE3Ma7rzjDtB6lhpcHKRFjv2ccE=;
 b=VliwNQ/MW1BzkOwHQptwm1FxQj27/pTWhvYBZTcX5pyUEl8huZWSn0Y8svlW/2vv1A
 2ojQsuEdTTzan3zFOjGiySfqnagsJojzUmRXUWDuQE+JfrjPX40GxFc79aqldfhxUlhv
 ICl80TKgBLxc/f0NvSQrKkW38e92BtX9Rc16QI0MTGC6y6osHMNUBzSDWoecaZefSh1i
 tlpTd2yFYokh1CQ/8rK6hjkAd2kDD7X6pr7J9zSjXUKfgPSnvFOpqE1kxl2NQ6UA/PNx
 oDCqkb+5pvtEBFIIeZ0u++XuVpKX2yE+pxWhvQWOvbTXcqDReZOC63lhAHYEursi/1o5
 xPKA==
X-Gm-Message-State: AOAM530QmYM3SYxyvT5xagbC/un/WLs1mDdhExjrtYyFL7W5Fmixvn5c
 007tH8WaG8FfhWBWP61RGg==
X-Google-Smtp-Source: ABdhPJw7jKtcBX1HJmvImu3OtQLdkpQmW076DYW/d4yYauIv/uHxi67eNnw6fzLjEkrKebqPLx3YMg==
X-Received: by 2002:aca:1105:: with SMTP id 5mr2380044oir.46.1603209182630;
 Tue, 20 Oct 2020 08:53:02 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j84sm640090oia.25.2020.10.20.08.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 08:53:01 -0700 (PDT)
Received: (nullmailer pid 907213 invoked by uid 1000);
 Tue, 20 Oct 2020 15:53:00 -0000
Date: Tue, 20 Oct 2020 10:53:00 -0500
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: iio: adc: add bindings doc for
 MT6360 ADC
Message-ID: <20201020155300.GB906028@bogus>
References: <1603181267-15610-1-git-send-email-gene.chen.richtek@gmail.com>
 <1603181267-15610-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603181267-15610-2-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_115303_211624_D8AEA075 
X-CRM114-Status: GOOD (  12.78  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, jic23@kernel.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 20 Oct 2020 16:07:45 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> This change adds the binding doc for the MT6360 ADC.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../bindings/iio/adc/mediatek,mt6360-adc.yaml      | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
