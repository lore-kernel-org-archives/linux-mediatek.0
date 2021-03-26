Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B51C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 20:08:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6610F61A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 20:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6610F61A02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a87SJGn1NA99O7q/v4wExGZXRSsUjAtsQrQgXxL2p4s=; b=LhJuHnPv9mpCjP2eS+U4GwFbv
	OGGBd5077P3jsHDB30FOlThY4Nurgt70lwZedrEtXaQAoCt8sx/63XpsVtv2j6uV22quhbggN/QIq
	3rzxD1jse3zDKjlgMPFzdnBC1YAXy/ugEKrYqv2W+yTA1L9oS1D0HPyBN/uFAFyBJiiHOzjLFtlKD
	aZOtwrfcB8K0q2zgK9iAgiiakA1nWytOZ0p2EHmVBUMtsYrBnNfjlTse6FUaT8XzG/lBHBic2Oy+m
	O/gc0HsMrRmLWgppwjAq4wMhrxNFtTo4cY2qBMF+Fm9jokLrPe0Yg7ONYv/MtWT1pW5Ig7SJaR+ZT
	b4dDGaXSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPskc-004GwG-P9; Fri, 26 Mar 2021 20:08:10 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPskJ-004Gt5-OR; Fri, 26 Mar 2021 20:07:53 +0000
Received: by mail-io1-f47.google.com with SMTP id b10so6642919iot.4;
 Fri, 26 Mar 2021 13:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BbtWtxUcA4nQqDl/UPn+aqKLA2p77nKCFqTscN4h5/k=;
 b=Cw27N5+DuSqK2OhUqPZEDNw4GoZxDQ3pdmR59ntMNVcXBQIqXzbQYhhY1u6TezMfUV
 YD/kfhPIBDZjmQOKGgLcuDj0bmdpYGffbTI6QlKRQxwIylmzGzh9MMReokED4DamB+uj
 pxjtEjt0BMOWw0Nr+JML/JhpcTGIKN034vPH1wZ0ekRY35AObjx+dFwW2aS+J1zjpuQI
 PlD0qa5y+8QOupfLC5kUQ81AR6aIyygFJ33gzHjtcCTf60onfO0TPFIIiqwlYw1m9i7a
 e3navkHPuSZsOiEqZfNjavEphfv9bFp+NMkzMyBFEEV+2YHB603NaO95UilGzO5f0Xch
 uKlw==
X-Gm-Message-State: AOAM533lLVA4tbuH3ljE6axqe3BtOqF97oPMKeX9hOs0AqGOVBelgyZr
 yvCWun2/a+jft1JLH8ddYQ==
X-Google-Smtp-Source: ABdhPJxkLZewL+HvKGCAaXxRvt+eMKXvcHbXgnT813SdpEA+owGYpMxsBB+s+dACBDurjiqsiv9iOw==
X-Received: by 2002:a02:a809:: with SMTP id f9mr13513022jaj.63.1616789270808; 
 Fri, 26 Mar 2021 13:07:50 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k10sm4816688iop.42.2021.03.26.13.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 13:07:49 -0700 (PDT)
Received: (nullmailer pid 3784158 invoked by uid 1000);
 Fri, 26 Mar 2021 20:07:47 -0000
Date: Fri, 26 Mar 2021 14:07:47 -0600
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
Cc: Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, Nishanth Menon <nm@ti.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Kevin Hilman <khilman@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 YT Lee <yt.lee@mediatek.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Enric Balletbo Serra <eballetbo@gmail.com>,
 Nicolas Boichat <drinkcat@google.com>, HenryC Chen <HenryC.Chen@mediatek.com>,
 linux-kernel@vger.kernel.org, Charles Yang <Charles.Yang@mediatek.com>,
 Angus Lin <Angus.Lin@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v14 1/7] dt-bindings: soc: mediatek: add mtk svs
 dt-bindings
Message-ID: <20210326200747.GA3784111@robh.at.kernel.org>
References: <20210325025114.25842-1-roger.lu@mediatek.com>
 <20210325025114.25842-2-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325025114.25842-2-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_200752_050087_070D01DA 
X-CRM114-Status: UNSURE (   9.90  )
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

On Thu, 25 Mar 2021 10:51:08 +0800, Roger Lu wrote:
> Document the binding for enabling mtk svs on MediaTek SoC.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../bindings/soc/mediatek/mtk-svs.yaml        | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
