Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3490AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 17:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4YjVOGb2fPqQMld9Ni2gz3E06h3CJBiPapLR4a3KR0=; b=FYbPZX0qpr1R+Y
	O6SamoEx0/PWzVwWm/j0AV3TES83ROlpq7O2JBonfsvK1Bbsa2NYLS5VvMenm/9PqugUdiVJliRBq
	o/AuWCRgFnPtrJ9qPzmIyPJrC+n6jTjGSB5K4eNRx7BjKo/T665MD8gIEeL/k0U0GIqmxHaR+AYmt
	NmFseTMHswTTSUl0UAc28kwJQc6lFq27ldbRrI5C2jLayPNbBLG8NyeFaJymbVRFNHjzvB5OjImaP
	nILKFC413/nZUx6xmvpS1fHa8GMyOtUZWQcuhbSY3xW4pkFe3Bc/AFTlfwJIVK8wtXgrIAlKORO4T
	jwTv1GPZThF5VlGNgAQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncVku-00DJY1-Iz; Thu, 07 Apr 2022 17:17:12 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncVkj-00DJWf-MW; Thu, 07 Apr 2022 17:17:03 +0000
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-df22f50e0cso7079942fac.3; 
 Thu, 07 Apr 2022 10:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5EG0rJLTD+MbvhnF4oQMsvQXhv9+LU3aJVkGQ/n7roQ=;
 b=vy8Vc3h0XUrLwb722d2bkfeu/THsqLUV6oYgflzHDOnHKUkravOkcCpRffJBwPVqNG
 R+iEKA74FQwhmLeJxtet84AsDViUxLb8KN4aYL/cmBdtqnWGd0RVvVFXFX+uCOXs0yeR
 vBHxYuq9dD/nwlrt7cg1AlqllJTXEBnbBAifbThzslxYuTlXBqwwQBTDeZ691bxqn+Ja
 VAJse5SgDcTx+6SmZ8pGSPCjADeo78+f25t1WJYatJcv0vHQDwplhMVb5CbyQdNGusBy
 6O1b5lLCfrebK3PUuUsFqv19xJmxYhwEByJfW3yP0sR2O77l5Q8xECUzRO6vcT+glBWV
 RqGw==
X-Gm-Message-State: AOAM532XlJfkQh6499w6PO3L3NGKvmP3+F4Tthra8eDnAbFRieU1AHpT
 CnGElIyDkNPp+5OTGge/zWurdkHVMw==
X-Google-Smtp-Source: ABdhPJwAwF992HhuCgRfD4AbhjABaBZXkoVS6JYTmRcVMCykjLHu4LCaNf8nJMk6mYL3QdIrniYUkA==
X-Received: by 2002:a05:6870:d14d:b0:e1:e253:99e8 with SMTP id
 f13-20020a056870d14d00b000e1e25399e8mr6484169oac.23.1649351816358; 
 Thu, 07 Apr 2022 10:16:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 pn22-20020a0568704d1600b000e27271d76fsm531821oab.58.2022.04.07.10.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 10:16:55 -0700 (PDT)
Received: (nullmailer pid 1462273 invoked by uid 1000);
 Thu, 07 Apr 2022 17:16:55 -0000
Date: Thu, 7 Apr 2022 12:16:55 -0500
From: Rob Herring <robh@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 netdev@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/14] dt-bindings: arm: mediatek: document the pcie
 mirror node on MT7622
Message-ID: <Yk8chzNBsRZR8e1q@robh.at.kernel.org>
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-6-nbd@nbd.name>
 <4bafe244-6a3d-d0ec-59d3-3f3f00e71caf@linaro.org>
 <318163cb-c771-c7eb-73ba-35c66f7d0e68@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <318163cb-c771-c7eb-73ba-35c66f7d0e68@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_101701_787888_0B0962B4 
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

On Wed, Apr 06, 2022 at 01:01:06PM +0200, Felix Fietkau wrote:
> 
> On 06.04.22 10:20, Krzysztof Kozlowski wrote:
> > On 05/04/2022 21:57, Felix Fietkau wrote:
> > > From: Lorenzo Bianconi <lorenzo@kernel.org>
> > > 
> > > This patch adds the pcie mirror document bindings for MT7622 SoC.
> > > The feature is used for intercepting PCIe MMIO access for the WED core
> > > Add related info in mediatek-net bindings.
> > > 
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > Signed-off-by: Felix Fietkau <nbd@nbd.name>
> > > ---
> > >  .../mediatek/mediatek,mt7622-pcie-mirror.yaml | 42 +++++++++++++++++++
> > 
> > Eh, I wanted to ask to not put it inside arm/, but judging by your usage
> > - you did not create drivers for both of these (WED and PCIe mirror).
> > 
> > You only need them to expose address spaces via syscon.
> > 
> > This actually looks hacky. Either WED and PCIe mirror are part of
> > network driver, then add the address spaces via "reg". If they are not,
> > but instead they are separate blocks, why you don't have drivers for them?
> The code that uses the WED block is built into the Ethernet driver, but not
> all SoCs that use this ethernet core have it. Also, there are two WED
> blocks, and I'm not sure if future SoCs might have a different number of
> them at some point.
> The WED code also needs to access registers of the ethernet MAC.
> One reason for having a separate device is this:
> As long as WED is not in use, ethernet supports coherent DMA for increased
> performance. When the first wireless device attaches to WED, IO coherency
> gets disabled and the ethernet DMA rings are cleaned up and allocated again,
> this time with the struct device of WED (which doesn't have the dma-coherent
> property).

I'm pretty sure there are assumptions in the driver core that coherency 
is not changing on the fly. In any case, if it is, using 'dma-coherent' 
is not appropriate. You obviously have another method to determine 
whether you are coherent or not.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
