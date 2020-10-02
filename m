Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF7AC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 11:07:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C1C206B8
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 11:07:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QBmteG21"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09C1C206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GFPhgTa/pylUOogPNJbbeUZ+Hsbz848s4rJCioHf5t4=; b=QBmteG21aDuwKziwA37S477tI
	GPYcHHowtW4LYYRF8fwTIWWzj2qgIsEnsnz+Tz+VEpjLrHS1aBYZO/9IB9v8wXsYjzH1gIig8dw9a
	NETJKFUTCXCVYOWiCjDGn5+ftSUhYyRYUe7D//3Dc6kjpHHOdtg9tpN3hyy0jtDmmKi/wpBRj0zpK
	dSWU5YrFMzq0IG82k0ai9v6U3rTs/z9cCHQcuRueOf2zy0GSDjbTQV9mSwrlt7NMfNFO9mbPYQoUu
	V7XmN+NvOtofDa6clAtITq5DzqcSAwOBQFn9+l37AhjhG4AsxtVMxU8+Dsv1lTsJbbQEVrUh0yF3W
	OPEvlBQjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOIuC-0000HS-Aj; Fri, 02 Oct 2020 11:07:16 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOIuA-0000Gq-LI; Fri, 02 Oct 2020 11:07:15 +0000
Received: by mail-ed1-f66.google.com with SMTP id k14so1233964edo.1;
 Fri, 02 Oct 2020 04:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YQy6FiIzQNjdtyPlCm6RsMz74Z9Qpq3cOcma81PAdFY=;
 b=ktDhngn0al+a68EHDdWrxHyY738VMyLZeub93nl83yGu2koBdj3/Jmzdj0aOwwVM3Y
 O7cFbRTFqfqrm4tdiKx1ta0GWfJ0aP+aKOmSKoY66fwlU8Unvo45DI7FR1MRq4QIVwPt
 6oho7M3Ohw5TZvOlUCdz19wvQAI1mUc6+vje0Bng4bc1pbDyDtpJ1TLOUufoTYdDD0rp
 e1D1lBNh2QfI3FqawsrFBf8RdVZM+6CVxYCnMqG5nhmqzDmyWknp2r2y5EfuI0bmIXnv
 MGZaDzl8MESVZp3ebTtsNST80gPgiYm9Rle3cUaOQasnb8maaFeOCmgawlYcrZwPg+Ea
 HppQ==
X-Gm-Message-State: AOAM533jXd31HmDzAKIop4+lNIYyPl5iJ162TevkqweJoS7kyIW+5rcS
 YUF4XA2VAS1BjDPnsCE9OY0=
X-Google-Smtp-Source: ABdhPJyZ33O0u4XYmGYq2Z/I18o6f1qpHMSJ5cZb516PFEEciaNIv1xG7LHkDSXCH8zGXdT119dDLA==
X-Received: by 2002:a05:6402:18d:: with SMTP id
 r13mr1616331edv.267.1601636833441; 
 Fri, 02 Oct 2020 04:07:13 -0700 (PDT)
Received: from pi3 ([194.230.155.194])
 by smtp.googlemail.com with ESMTPSA id h10sm915230ejt.93.2020.10.02.04.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 04:07:12 -0700 (PDT)
Date: Fri, 2 Oct 2020 13:07:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 01/24] dt-bindings: iommu: mediatek: Convert IOMMU to
 DT schema
Message-ID: <20201002110709.GC6888@pi3>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_070714_702369_28766652 
X-CRM114-Status: GOOD (  31.85  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 03:06:24PM +0800, Yong Wu wrote:
> Convert MediaTek IOMMU to DT schema.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.txt         | 103 ------------
>  .../bindings/iommu/mediatek,iommu.yaml        | 154 ++++++++++++++++++
>  2 files changed, 154 insertions(+), 103 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>  create mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> deleted file mode 100644
> index c1ccd8582eb2..000000000000
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -* Mediatek IOMMU Architecture Implementation
> -
> -  Some Mediatek SOCs contain a Multimedia Memory Management Unit (M4U), and
> -this M4U have two generations of HW architecture. Generation one uses flat
> -pagetable, and only supports 4K size page mapping. Generation two uses the
> -ARM Short-Descriptor translation table format for address translation.
> -
> -  About the M4U Hardware Block Diagram, please check below:
> -
> -              EMI (External Memory Interface)
> -               |
> -              m4u (Multimedia Memory Management Unit)
> -               |
> -          +--------+
> -          |        |
> -      gals0-rx   gals1-rx    (Global Async Local Sync rx)
> -          |        |
> -          |        |
> -      gals0-tx   gals1-tx    (Global Async Local Sync tx)
> -          |        |          Some SoCs may have GALS.
> -          +--------+
> -               |
> -           SMI Common(Smart Multimedia Interface Common)
> -               |
> -       +----------------+-------
> -       |                |
> -       |             gals-rx        There may be GALS in some larbs.
> -       |                |
> -       |                |
> -       |             gals-tx
> -       |                |
> -   SMI larb0        SMI larb1   ... SoCs have several SMI local arbiter(larb).
> -   (display)         (vdec)
> -       |                |
> -       |                |
> - +-----+-----+     +----+----+
> - |     |     |     |    |    |
> - |     |     |...  |    |    |  ... There are different ports in each larb.
> - |     |     |     |    |    |
> -OVL0 RDMA0 WDMA0  MC   PP   VLD
> -
> -  As above, The Multimedia HW will go through SMI and M4U while it
> -access EMI. SMI is a bridge between m4u and the Multimedia HW. It contain
> -smi local arbiter and smi common. It will control whether the Multimedia
> -HW should go though the m4u for translation or bypass it and talk
> -directly with EMI. And also SMI help control the power domain and clocks for
> -each local arbiter.
> -  Normally we specify a local arbiter(larb) for each multimedia HW
> -like display, video decode, and camera. And there are different ports
> -in each larb. Take a example, There are many ports like MC, PP, VLD in the
> -video decode local arbiter, all these ports are according to the video HW.
> -  In some SoCs, there may be a GALS(Global Async Local Sync) module between
> -smi-common and m4u, and additional GALS module between smi-larb and
> -smi-common. GALS can been seen as a "asynchronous fifo" which could help
> -synchronize for the modules in different clock frequency.
> -
> -Required properties:
> -- compatible : must be one of the following string:
> -	"mediatek,mt2701-m4u" for mt2701 which uses generation one m4u HW.
> -	"mediatek,mt2712-m4u" for mt2712 which uses generation two m4u HW.
> -	"mediatek,mt6779-m4u" for mt6779 which uses generation two m4u HW.
> -	"mediatek,mt7623-m4u", "mediatek,mt2701-m4u" for mt7623 which uses
> -						     generation one m4u HW.
> -	"mediatek,mt8173-m4u" for mt8173 which uses generation two m4u HW.
> -	"mediatek,mt8183-m4u" for mt8183 which uses generation two m4u HW.
> -- reg : m4u register base and size.
> -- interrupts : the interrupt of m4u.
> -- clocks : must contain one entry for each clock-names.
> -- clock-names : Only 1 optional clock:
> -  - "bclk": the block clock of m4u.
> -  Here is the list which require this "bclk":
> -  - mt2701, mt2712, mt7623 and mt8173.
> -  Note that m4u use the EMI clock which always has been enabled before kernel
> -  if there is no this "bclk".
> -- mediatek,larbs : List of phandle to the local arbiters in the current Socs.
> -	Refer to bindings/memory-controllers/mediatek,smi-larb.txt. It must sort
> -	according to the local arbiter index, like larb0, larb1, larb2...
> -- iommu-cells : must be 1. This is the mtk_m4u_id according to the HW.
> -	Specifies the mtk_m4u_id as defined in
> -	dt-binding/memory/mt2701-larb-port.h for mt2701, mt7623
> -	dt-binding/memory/mt2712-larb-port.h for mt2712,
> -	dt-binding/memory/mt6779-larb-port.h for mt6779,
> -	dt-binding/memory/mt8173-larb-port.h for mt8173, and
> -	dt-binding/memory/mt8183-larb-port.h for mt8183.
> -
> -Example:
> -	iommu: iommu@10205000 {
> -		compatible = "mediatek,mt8173-m4u";
> -		reg = <0 0x10205000 0 0x1000>;
> -		interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
> -		clocks = <&infracfg CLK_INFRA_M4U>;
> -		clock-names = "bclk";
> -		mediatek,larbs = <&larb0 &larb1 &larb2 &larb3 &larb4 &larb5>;
> -		#iommu-cells = <1>;
> -	};
> -
> -Example for a client device:
> -	display {
> -		compatible = "mediatek,mt8173-disp";
> -		iommus = <&iommu M4U_PORT_DISP_OVL0>,
> -			 <&iommu M4U_PORT_DISP_RDMA0>;
> -		...
> -	};
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> new file mode 100644
> index 000000000000..eae773ad53a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek IOMMU Architecture Implementation
> +
> +maintainers:
> +  - Yong Wu <yong.wu@mediatek.com>
> +
> +description: |+
> +  Some MediaTek SOCs contain a Multimedia Memory Management Unit (M4U), and
> +  this M4U have two generations of HW architecture. Generation one uses flat
> +  pagetable, and only supports 4K size page mapping. Generation two uses the
> +  ARM Short-Descriptor translation table format for address translation.
> +
> +  About the M4U Hardware Block Diagram, please check below:
> +
> +                EMI (External Memory Interface)
> +                 |
> +                m4u (Multimedia Memory Management Unit)
> +                 |
> +            +--------+
> +            |        |
> +        gals0-rx   gals1-rx    (Global Async Local Sync rx)
> +            |        |
> +            |        |
> +        gals0-tx   gals1-tx    (Global Async Local Sync tx)
> +            |        |          Some SoCs may have GALS.
> +            +--------+
> +                 |
> +             SMI Common(Smart Multimedia Interface Common)
> +                 |
> +         +----------------+-------
> +         |                |
> +         |             gals-rx        There may be GALS in some larbs.
> +         |                |
> +         |                |
> +         |             gals-tx
> +         |                |
> +     SMI larb0        SMI larb1   ... SoCs have several SMI local arbiter(larb).
> +     (display)         (vdec)
> +         |                |
> +         |                |
> +   +-----+-----+     +----+----+
> +   |     |     |     |    |    |
> +   |     |     |...  |    |    |  ... There are different ports in each larb.
> +   |     |     |     |    |    |
> +  OVL0 RDMA0 WDMA0  MC   PP   VLD
> +
> +  As above, The Multimedia HW will go through SMI and M4U while it
> +  access EMI. SMI is a bridge between m4u and the Multimedia HW. It contain
> +  smi local arbiter and smi common. It will control whether the Multimedia
> +  HW should go though the m4u for translation or bypass it and talk
> +  directly with EMI. And also SMI help control the power domain and clocks for
> +  each local arbiter.
> +
> +  Normally we specify a local arbiter(larb) for each multimedia HW
> +  like display, video decode, and camera. And there are different ports
> +  in each larb. Take a example, There are many ports like MC, PP, VLD in the
> +  video decode local arbiter, all these ports are according to the video HW.
> +
> +  In some SoCs, there may be a GALS(Global Async Local Sync) module between
> +  smi-common and m4u, and additional GALS module between smi-larb and
> +  smi-common. GALS can been seen as a "asynchronous fifo" which could help
> +  synchronize for the modules in different clock frequency.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-m4u # mt2701 generation one HW
> +          - mediatek,mt2712-m4u # mt2712 generation two HW
> +          - mediatek,mt6779-m4u # mt6779 generation two HW
> +          - mediatek,mt8173-m4u # mt8173 generation two HW
> +          - mediatek,mt8183-m4u # mt8183 generation two HW
> +
> +      - description: mt7623 generation one HW
> +        items:
> +          - const: mediatek,mt7623-m4u
> +          - const: mediatek,mt2701-m4u
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      bclk is optional. here is the list which require this bclk:
> +      mt2701, mt2712, mt7623 and mt8173.

Similarly to my comment in other patch, this should be part of schema
within 'if-then'.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
