Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7ECC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25NXwF3j3CDWMwNZ1yXSftsyQ/VmIgJUcDUuu2o2sQc=; b=kfCwqvqWcECUjeqT9DeXcXjqsc
	Feu2fEB4iNhZlnBmUOUSF5HBTKBivYmSSgPw5MJPHLsfV9IxhPAWUd81i3KPv7Ei7wF4CCaBAI9qu
	NeEoAKU1hzhArf15UmSCCvxWjhyY5yvuITXDE9X0UTfVZscxM57dSFax9kAGlQnz+kl2OpFCJW7RK
	3HTqnRxkmAdXNOxPklqQN3vGPhwiSBvB4NhXkbSkKGs1rMiAAsuGe+q30c0GHa3zA3q0I6LnaBTeR
	nOAxuCEgyq/9effa6hZnFXmyRJniBnFtNB61ILXv8uNa96YldLmMgN40a6uTThqHdQczEe+Sq8XwK
	bAr2WYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDuQC-001Tq2-1f;
	Thu, 14 Dec 2023 22:43:12 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDuQ8-001TpM-3A;
	Thu, 14 Dec 2023 22:43:10 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-59067f03282so74939eaf.0;
        Thu, 14 Dec 2023 14:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702593788; x=1703198588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25NXwF3j3CDWMwNZ1yXSftsyQ/VmIgJUcDUuu2o2sQc=;
        b=odyzFn6fJdTLN+lQLFM9z1q5XMx7dWoaSS8NpqUF/8nkQrNr7Rcoe2VF5ofb1JpdCp
         zUlfXLP26IakdkWfTUWvgRAsyUMEyztxOAQ/72ZKHI3Qr1umIh6olStX0y47CGyQv3cQ
         WVkG/mLNHd6dOCoknZWxHxjNTIgkLgukXGUF10VbU86xbgHPmZE4FiHCxh+9l1cKCs5r
         gUNPNDxv8nmSEFfBXpdOdTCMXz+pAmP6W19lXqawiRR923ZIGmPh/KU3QGFBQFNPquFz
         8TG6qNeFhsRLjyom1N5EgR2L0GJmrk2AA+WZOl/QUmnQQ37Y8K9cCGUz0uVjGF6D2F1g
         URiQ==
X-Gm-Message-State: AOJu0YxzCoZjzE/dGJB05s/sc67whuw1GapsKcabg2RI8eZtODUaeybP
	SG+icT6OEfRsRAJrgMp0Pg==
X-Google-Smtp-Source: AGHT+IEOpcXDaJc/6auAFxNvwtlBTN+TSmelxUX2AwVBrxCJYeQ+EL/Dz8nHpPpAbpv7PDMRevEGfA==
X-Received: by 2002:a4a:98ea:0:b0:590:f5fc:df58 with SMTP id b39-20020a4a98ea000000b00590f5fcdf58mr5115698ooj.17.1702593787772;
        Thu, 14 Dec 2023 14:43:07 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w23-20020a4a7657000000b0058a0809ea25sm3714382ooe.21.2023.12.14.14.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 14:43:07 -0800 (PST)
Received: (nullmailer pid 1066090 invoked by uid 1000);
	Thu, 14 Dec 2023 22:43:04 -0000
Date: Thu, 14 Dec 2023 16:43:04 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Macpaul Lin <macpaul.lin@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtk-xhci: add a property for Gen1
 isoc-in transfer issue
Message-ID: <20231214224304.GA1062298-robh@kernel.org>
References: <20231213063543.12435-1-chunfeng.yun@mediatek.com>
 <c1bc144d-07d6-422c-8294-42be47f83e59@linaro.org>
 <5327b2fd-94c6-46fe-b987-52cfff042033@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5327b2fd-94c6-46fe-b987-52cfff042033@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_144309_040909_ADEE10CD 
X-CRM114-Status: GOOD (  22.19  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 13, 2023 at 12:17:17PM +0100, AngeloGioacchino Del Regno wrote:
> Il 13/12/23 09:05, Krzysztof Kozlowski ha scritto:
> > On 13/12/2023 07:35, Chunfeng Yun wrote:
> > > For Gen1 isoc-in endpoint on controller before about SSUSB IPM v1.6.0, it
> > > still send out unexpected ACK after receiving a short packet in burst
> > > transfer, this will cause an exception on connected device, specially for
> > > a 4k camera.
> > > Add a quirk property "mediatek,rxfifo-depth" to work around this hardware
> > > issue;
> > > The side-effect is that may cause performance drop about 10%, including
> > > bulk transfer.
> > > 
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > >   .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml     | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > > index e9644e333d78..b8ed68574ba4 100644
> > > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > > @@ -124,6 +124,16 @@ properties:
> > >         defined in the xHCI spec on MTK's controller.
> > >       default: 5000
> > > +  mediatek,rxfifo-depth:
> > > +    description:
> > 
> > The property description and driver patch suggest you configure the
> > depth of FIFO, so this should be not bool, but some uint32. And then,
> > use generic "fifo-depth" property to set desired depth.
> 
> Did you mean "rx-fifo-depth" instead, as used in net?
> This FIFO depth parameter is for RX only.

Or rx-fifo-size. There's so many to choose from.

Rob

