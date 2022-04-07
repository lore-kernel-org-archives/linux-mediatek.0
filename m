Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DC6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 18:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkFowJi+qCAjvCFDeGDCaIUa4xllmxQg8t8qneJ1ZN0=; b=GRXEZLEWZhfjQ4
	CrFx79VavvGk6gx2AMB4E5hFnMg+U8Es63pCLoO15/gg1rPPNH9qnbGv4RPA+i59aRUrJBqrwPX+Y
	ASFl/cRhyXvVwDWU9Nks82jxrDGagL4ssO6h59BWkd2EU05cVeyO/9xlkF0pkOw12hWkPdFIzLDjg
	a5I/2GiSehJvtEz3xGO9krurCkJixZlQdrTO/oLzCpPdqqwFk05/6P5i+ISzkCBrl+DS9Rvg+l2CQ
	h4EI/MybS2khwV1ypjkml2LOKtQxoA6PFEVPirIRrzEdKSMvK/SCk3bWY2eZroOgdoQhOIml3HZrw
	9F9DJYvjvfpBQIcwaFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncWaW-00DUtl-DB; Thu, 07 Apr 2022 18:10:32 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncWaS-00DUsS-QY; Thu, 07 Apr 2022 18:10:31 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 z9-20020a05683020c900b005b22bf41872so4420261otq.13; 
 Thu, 07 Apr 2022 11:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6TEYtr0WQJYpfQ0AF5934WwFtrAlPa1PaWKEAl7TxDc=;
 b=Bb+HT1lPaMKMjMYuw9YOIp4oKXPJ4y/72JJKaQEY2W6LWWC75TqiGRd2HUMKUOG6J5
 ekrQjQCbjmFmOweSfqH3dV0tTwyJ6pSqTorTXwrEcb/8jHOuM/QQ4kbW1/jZ8PcH7cSn
 Uh+xo737CrjEUK+fsV7J/Li7mcWPBi9htU8oeqsimpDZYHr1BAgA1ykmAaALVvxNi3Tv
 uJfPN6Kb9C5VSJHtRdmN+KDusLo0oiXXzj/Zfw6FID7dVwW3+HxlFiTCymvnXvuNACvF
 wbB3rOnyLDPNmbozEhuiRAESgvKUXG2gd5n7fW08VA94MWLVyHiI9LD/xpGGQ70NrKIH
 k2wg==
X-Gm-Message-State: AOAM530d2RBegrBrp+joMaTLeNGhzC1gFm8TLA+Rn9yKpBJCTmju5kMP
 +I9+2Ktledvs3U99m1Bnzg==
X-Google-Smtp-Source: ABdhPJzB/b9X7R/SPQT9WwYzSy0K71IXwHdQnVUmKIG6nDijEMu0eda107qtX4FiJ/lv/sp3bz3ezw==
X-Received: by 2002:a05:6830:14a:b0:5cf:b0e5:485f with SMTP id
 j10-20020a056830014a00b005cfb0e5485fmr5299147otp.293.1649355025378; 
 Thu, 07 Apr 2022 11:10:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k10-20020a4abd8a000000b00324907b406fsm7298601oop.21.2022.04.07.11.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 11:10:25 -0700 (PDT)
Received: (nullmailer pid 1716498 invoked by uid 1000);
 Thu, 07 Apr 2022 18:10:24 -0000
Date: Thu, 7 Apr 2022 13:10:24 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, wsa@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, miles.chen@mediatek.com,
 kewei.xu@mediatek.com, linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com
Subject: Re: [PATCH v2] dt-bindings: i2c: convert i2c-mt65xx to json-schema
Message-ID: <Yk8pEIqxeZeblOWM@robh.at.kernel.org>
References: <20220407094753.13282-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220407094753.13282-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_111028_896025_ADDEA5C6 
X-CRM114-Status: UNSURE (   9.52  )
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

On Thu, 07 Apr 2022 11:47:53 +0200, AngeloGioacchino Del Regno wrote:
> Convert I2C binding for MediaTek SoCs to Devicetree schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> v2: Changed minItems for clocks, clock-names to 2 (main, dma clks are mandatory)
> 
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  53 --------
>  .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 118 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 119 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
