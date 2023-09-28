Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FF1E732EC
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 16:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fmEByqp0p6ff/NHlXL9uOPA17tduXyEAm2C9ec0baU=; b=YWdXbTbf144LP6WpX1+op2l849
	Mo+dVWGV3ZeenaLzWliuG41hlzMukb7mhBiPWFpwv1xq8ZWkQh4H4Z1DyMWELBETeEoWjirGp6z7i
	OH5n7iYSz30VYypoCteV3oet2FR4cFBPvVCZg+0zBvRhtf0IIZD5zCvXxB2NFKunNKlFSDdCqEL6s
	bUi2yyBKLHmYJ1jphU3zDS7uoqr8QTlPUQK/Ql/2PJIBPFk06ipRZOkayjEZZzumjxVoIjlyVoHRe
	nsTAJvQ1d6v51MDQI1RvEwhJbiocEqfIVzplEDk4N88yNGp8YIg+2JaCS8UHxDJSaS1bhNCDqeoBq
	QIB+7VVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qltgN-005siE-1g;
	Thu, 28 Sep 2023 16:16:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsgs-005Hoc-2F;
	Thu, 28 Sep 2023 15:12:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9DF3DCE220D;
	Thu, 28 Sep 2023 15:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985B9C433C8;
	Thu, 28 Sep 2023 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695913948;
	bh=Hqro9VXE8P3Msf+mPt73qlFFXuWRyTwJYSf6N/jB9S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hkvv3AjwF/FfBT73XOvjTQwBEZPy4TELmLlrWZAlrlcHVwS8LNs1grrP2kQvGs/sw
	 gJ5Jv9FIoREU7cFRso6OSBO1NQ5aJOLlkYXME2ONDicgTAIl1PEmk0qcfvQ5kcczep
	 Tptem295Ky7EmOX08ySvAU26pv0SH+rpmH2GiwFV/dZczgzkWZpn6GWVpVCURFQu33
	 5d0hr2TpiEV9SEhwWSuVeVXcG4Z8cQBqzsa6K14wZMI2zI6rfhf4TgzR+0yMxhULwp
	 4q3JK6jU17E+HsvgqmOH5XXBSWlDd03Zw+U1XrLYQG/qL0CKQwfrAvhSB6Oy4ndFk3
	 SVu7vsoJ3TpLg==
Received: (nullmailer pid 512608 invoked by uid 1000);
	Thu, 28 Sep 2023 15:12:26 -0000
Date: Thu, 28 Sep 2023 10:12:26 -0500
From: Rob Herring <robh@kernel.org>
To: Jian Yang <jian.yang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Chuanjia.Liu@mediatek.com, Jieyy.Yang@mediatek.com, Qizhong.Cheng@mediatek.com
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 controlling power and reset
Message-ID: <20230928151226.GA424754-robh@kernel.org>
References: <20230928105819.5161-1-jian.yang@mediatek.com>
 <20230928105819.5161-2-jian.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928105819.5161-2-jian.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_081235_503971_437EDD15 
X-CRM114-Status: GOOD (  19.62  )
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

On Thu, Sep 28, 2023 at 06:58:20PM +0800, Jian Yang wrote:
> From: "jian.yang" <jian.yang@mediatek.com>
> 
> Add new properties to support control power supplies and reset pin of
> a downstream component.
> 
> Signed-off-by: jian.yang <jian.yang@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 7e8c7a2a5f9b..32031362db58 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -84,6 +84,26 @@ properties:
>      items:
>        enum: [ phy, mac ]
>  
> +  pcie1v8-supply:
> +    description:
> +      The regulator phandle that provides 1.8V power from root port to a
> +      downstream component.
> +
> +  pcie3v3-supply:
> +    description:
> +      The regulator phandle that provides 3.3V power from root port to a
> +      downstream component.
> +
> +  pcie12v-supply:
> +    description:
> +      The regulator phandle that provides 12V power from root port to a
> +      downstream component.
> +
> +  dsc-reset-gpios:

This should be in the downstream component if it is something extra. So 
not the root port node, but the next one down. 

> +    description:
> +      The extra reset pin other than PERST# required by a downstream component.
> +    maxItems: 1
> +
>    clocks:
>      minItems: 4
>      maxItems: 6
> @@ -238,5 +258,10 @@ examples:
>                        #interrupt-cells = <1>;
>                        interrupt-controller;
>              };
> +
> +            pcie@0 {

Missing 'reg'.

> +              device_type = "pci";
> +              pcie-3v3-supply = <&pcie3v3_regulator>;

This is in the root port (which is good), but you've defined the schema 
to put them in the host bridge node. IOW, these need to go in a PCI 
root-port or P2P bridge schema which doesn't yet exist. I have an 
inprogress branch for dtschema to split up pci-bus.yaml for that 
purpose. Will try to finish it up soon.

Rob

