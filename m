Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B957D1F9C5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 20:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zllyT0+1EIKN2SAnhlVHbhZHatAZZL/GrgoCrwNLsDk=; b=qk48nRWBVTc0XRseQvzxWL3W9O
	zBkCloZBUeqiyna5T02O+27OIz2NLGp5t7IHtwrM9wF+6QiiWanqTi6Ym2HwHvRoBjddjcCdEn69v
	lddJKfo+Gj/4efh4NCMTQuiImyXW8NXbkeDiXMCer/nhqA7lCltFw2RjqB4HFL1paxzMA9ZkcwG+G
	W9sPeocP3dFx+mLCRM24Tm6UVCxcb8ZTlF6eoaBqckAKsMdVBYG//16uyOWNQ43cAhY/cYxXcYlB5
	NWKKz2YluvnuqswF4vkPo1FMEhSB4p0G0YzjQtKO2pax7iZ0bfMOmU5Up1NQkR0ts3ExmCiK0lq7H
	SMuTY0Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0oZt-00000009YQh-2PCt;
	Tue, 15 Oct 2024 20:55:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0oYR-00000009YDH-3Dnn;
	Tue, 15 Oct 2024 20:54:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CD365C5AAF;
	Tue, 15 Oct 2024 20:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A719C4CEC6;
	Tue, 15 Oct 2024 20:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729025646;
	bh=9wxjI5r/Gdefhk0EShbLW4iHqs+1lKibN5Vf788gSqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhbRwCJsK0YIM74AH6OIEukQtGWuMTAcTKdSgRzAYswYMg/JugZFFYjjOjHy6Xluy
	 XiAL4uQGLyDDumnbNRLtnHpl5Di2fZC6ja1sQr+kcvJNJOGy7fzna7zIXXDzR54wnu
	 Q/10XN6kHU9gNXewPhTEOWKMjRR0w7dwcgHywbig8jQhGUu7Aud+GNedFfSOFWyYJW
	 PjXqxmYO11X6UVr/n+xN6/areN0If7HKaS0Bpb8xomcAMZr7prPNVcQsQ7WU8E3/cS
	 GlraG+jHbXXIwjAmrp9NUKmNfi2yluOF3STC7fFMMrHcd8FqI3HCRYZ+Eew0vx72Am
	 Q27dT6e4GRYGQ==
Date: Tue, 15 Oct 2024 15:54:05 -0500
From: Rob Herring <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	ChiYuan Huang <cy_huang@richtek.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Chris-qj chen <chris-qj.chen@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: mediatek,mt6360-tcpc: add ports
 properties
Message-ID: <20241015205405.GA1934266-robh@kernel.org>
References: <20241015103337.20479-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015103337.20479-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_135407_875174_7C259BCA 
X-CRM114-Status: GOOD (  16.89  )
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

On Tue, Oct 15, 2024 at 06:33:36PM +0800, Macpaul Lin wrote:
> Add 'ports' and sub node 'port' properties to specify connectors on the
> High-Speed/Super-Speed data bus, or Sideband Use (SBU) AUX lines
> endpoints of the USB controller.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../bindings/usb/mediatek,mt6360-tcpc.yaml    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> index 053264e60583..5b6ea0d734ea 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> @@ -32,6 +32,27 @@ properties:
>      description:
>        Properties for usb c connector.
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Any connector to the data bus of this controller should be specified.
> +    properties:

> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0

No need for these, already defined in the $ref'ed schema.

> +
> +    patternProperties:
> +      "port@[0-2]$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          It could be one of the following interface types. High-Speed
> +          (HS) data bus endpoint to the Type-C connector, SuperSpeed (SS)
> +          data bus endpoint to the Type-C connector, or Sideband Use (SBU)
> +          AUX lines endpoint to the Type-C connector for the purpose of
> +          handling altmode muxing and orientation switching.

You have to define what each port number is.

However, I'm completely confused as to why you need any of this. The 
description sounds like the usb-c-connector which is already defined as 
a child node.

Rob

