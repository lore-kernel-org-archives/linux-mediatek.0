Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3031C49EA6
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 20:47:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83596613C5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 20:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83596613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wh2WLyQEUwUqQHtyoGwnJhzNEeBoQIsUm2N6PQxfZP8=; b=lvWknQr+aKzwMk
	k3XQNcipxf3g0oTUrWoUVR5Fj9rWzGuVk51PkLGOITQfVDKlOGzLklBdR8Zem91qA8whNAfH8iyTS
	O5SiYTWxoDOlxZqpxe/6RF9Se8H1xcGHSiMDb2qumColodMI/Ki8hDtZ+Mxgo3ut4pziSOjqh8elL
	uwJ1ReayIkpTE426T32FVaQMFpNWVV/cowmKJxvNp7c8XWewCHD1T0mYchdsqUyt4+DrXZI5c8kBq
	z6PeazUPxvw1tQyNkSFDB5N6Ter0pwopwMf4gRr5ue7IIltiYSI60QMvwAV+03D4Ge+W+8hcjB8vZ
	qta8fVjcNFrfvQQBxMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwWFo-00GGCi-PQ; Thu, 24 Jun 2021 20:47:16 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwWFZ-00GG9t-1x; Thu, 24 Jun 2021 20:47:02 +0000
Received: by mail-io1-f47.google.com with SMTP id k11so9948915ioa.5;
 Thu, 24 Jun 2021 13:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F0x4IyKT2x+eXf6Aevlji6hFmmkziyiUYw8K70PDgcc=;
 b=uLUiMbExEjdgbppucpOFDhuEa3Sb5sP7T0xtp82xolKplnPj8PFVTRNUE0smnrgZv2
 qjCjwv5idtaLUVzMD3lvE41gnRKNRGY7K2E1HcYMFgLOJWgAqlKi36xFDDYSkn9zZmg6
 uNMtO6IANxGhJ6bANQMTTFrX2MQ0kOvtcDv75j2+XT8SUJc4vOu3hWz+7vbhGOA26AWa
 0T5lIKljfsgRct7vo6rM6X5gkKwzvyJ6jHu/8MS7Wh9B53AdFwIPCAHuD6QogBKbxfDH
 BMsa6v+mp+3SMu8ZefCVvThLyQRQmdBMIdrEoiFAnZOcBOfSjw0z3nfh5OsrVDH0YFsD
 vKRw==
X-Gm-Message-State: AOAM533Q4rfjzzEQVMWJTFjyXWd2rZNq0w8bDHYPmwLDe92nisY28363
 7LM7JxLPN+v7ETSnBUfdwQU42HN0LA==
X-Google-Smtp-Source: ABdhPJxP/WQNIhGKFN6SWUFmmpwOJftdPFMIatfnXDGwKcwWhakNCpsdPciM/vUKfsSrKJLq/dXC4w==
X-Received: by 2002:a02:c6d9:: with SMTP id r25mr6248042jan.137.1624567620217; 
 Thu, 24 Jun 2021 13:47:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q7sm1883511iob.49.2021.06.24.13.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:46:58 -0700 (PDT)
Received: (nullmailer pid 1960808 invoked by uid 1000);
 Thu, 24 Jun 2021 20:46:55 -0000
Date: Thu, 24 Jun 2021 14:46:55 -0600
From: Rob Herring <robh@kernel.org>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Seiya Wang <seiya.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1] dt-bindings: mmc: change compatiable string for
 MT8195 mmc host IP
Message-ID: <20210624204655.GA1960751@robh.at.kernel.org>
References: <1623726033-16073-1-git-send-email-wenbin.mei@mediatek.com>
 <1623726033-16073-2-git-send-email-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623726033-16073-2-git-send-email-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_134701_161940_DDD51426 
X-CRM114-Status: GOOD (  12.98  )
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

On Tue, 15 Jun 2021 11:00:33 +0800, Wenbin Mei wrote:
> MT8195 mmc host IP is compatible with MT8183, and currently it shows:
> properties:
>   compatible:
>     oneOf:
> ...
>       - items:
>          - const: mediatek,mt8192-mmc
>          - const: mediatek,mt8195-mmc
>          - const: mediatek,mt8183-mmc
> which means the compatible string in the device tree would be:
> 	compatible = "mediatek,mt8192-mmc", "mediatek,mt8195-mmc",
> 		     "mediatek,mt8183-mmc";
> The bindings is wrong and that isn't the result we want.
> instead we want:
> properties:
>   compatible:
>     oneOf:
> ...
>       - items:
>          - const: mediatek,mt8192-mmc
>          - const: mediatek,mt8183-mmc
>       - items:
>          - const: mediatek,mt8195-mmc
>          - const: mediatek,mt8183-mmc
> which would give us:
> 	compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
> and
> 	compatible = "mediatek,mt8195-mmc", "mediatek,mt8183-mmc";
> 
> Fixes: eb9cb7227e5c (dt-bindings: mmc: Add compatible for Mediatek MT8195)
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
