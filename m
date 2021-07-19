Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4C1C07E9B
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 22:47:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6962C6112D
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 22:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6962C6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scvwhj7xFp1Uv/7+JUlJWNDFklnhDUjsocGE6hTEfwA=; b=i1kaEtJxMZZvz0
	BLbFCcKQdZpJblujC1nzzGWfWsF1RXkXjIXicuz/9fTsKyjTD4rSrdOF5FSzqmiFOqVQDGStnxCtG
	W4oWU6HNyNODXcuzV0zEPgRqOYiuaF9cCrlTM26OIpFixy46HS261owL8v+EAZmiFvz9B0QsJ6JMN
	Fow9YbuyVkBVzrhRcOiizoi7VJmtCC9Wfd3QodKtINd3ZnY1Oi+vMHfD+zjo6yzeH1touvo734dCo
	qvzkppoh/CYQ7sLYPtb7W8DzMsFWsFVf5OJi83T1EHAVUbJWemduF/8K4LBUgHU5ugBxcIiFgClEc
	puZf3Z5tSCYYjiUc5c4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5c2n-00BTCY-6G; Mon, 19 Jul 2021 22:47:25 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5c2l-00BTBo-2l; Mon, 19 Jul 2021 22:47:24 +0000
Received: by mail-io1-f44.google.com with SMTP id d9so21856540ioo.2;
 Mon, 19 Jul 2021 15:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KvZduHEK4/JPd13AvRj7Dwo91+WDf4ZZkoTysoY/Z8c=;
 b=DiFhEIwlUJWaaWMLauwpKeeFZsS2tvPtVRGC5rQeJgUY9Q7uu/W85dvx0vc6mUn/p1
 Yva6p0LZzvaE9Oijb+7e0Wtj8OUzSfsXUNOZA2KgJUNZapKxwACqJeZsq44A9cygGKYT
 Y8u52HI2tkaBA6xf5r8+lMpYh0+uTEuTfKwQ0BB1syynfWF3rAAyckdM7WdJ55gUM7m5
 H5X7/aPWp6/UYukF8C7GIKlmXr7HMosZ+ysJg+Y8BUKkumnvhNzYr5KGRoGa20x27UmH
 l244J4P8E+jKahaiSyF2WwnmWu75yikSEwmEc1JS9dlO6t/8WZ1x7Y64pIXVamHNp2iW
 /ZnQ==
X-Gm-Message-State: AOAM533mCVTTANYAez5YsYDJL0UYxkl57/ROdySXIcf2RHJi9wFvUIHL
 Men+DKBzTCbW++EfxCGWRg==
X-Google-Smtp-Source: ABdhPJx2z9Xre7CdCLPouoO6dfskCrk/L/I3dMKprr4kx+Phkn3qCMvEw/eDabtuZvzFiQhg1hdthg==
X-Received: by 2002:a6b:fe03:: with SMTP id x3mr1146470ioh.120.1626734842302; 
 Mon, 19 Jul 2021 15:47:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id w10sm10283737ilo.17.2021.07.19.15.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 15:47:21 -0700 (PDT)
Received: (nullmailer pid 2767559 invoked by uid 1000);
 Mon, 19 Jul 2021 22:47:18 -0000
Date: Mon, 19 Jul 2021 16:47:18 -0600
From: Rob Herring <robh@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, lorenzo.pieralisi@arm.com,
 jianjun.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bhelgaas@google.com,
 ryder.lee@mediatek.com, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-pci@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 devicetree@vger.kernel.org, yong.wu@mediatek.com
Subject: Re: [PATCH v11 1/4] dt-bindings: PCI: mediatek: Update the Device
 tree bindings
Message-ID: <20210719224718.GA2766057@robh.at.kernel.org>
References: <20210719073456.28666-1-chuanjia.liu@mediatek.com>
 <20210719073456.28666-2-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210719073456.28666-2-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_154723_164764_EA4C28AB 
X-CRM114-Status: GOOD (  16.07  )
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

On Mon, 19 Jul 2021 15:34:53 +0800, Chuanjia Liu wrote:
> There are two independent PCIe controllers in MT2712 and MT7622
> platform. Each of them should contain an independent MSI domain.
> 
> In old dts architecture, MSI domain will be inherited from the root
> bridge, and all of the devices will share the same MSI domain.
> Hence that, the PCIe devices will not work properly if the irq number
> which required is more than 32.
> 
> Split the PCIe node for MT2712 and MT7622 platform to comply with
> the hardware design and fix MSI issue.
> 
> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 ++++
>  .../devicetree/bindings/pci/mediatek-pcie.txt | 206 ++++++++++--------
>  2 files changed, 150 insertions(+), 95 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
