Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36E9C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XLoAT9wTAoBeiFTA7jrPHKHuzLyNpOALQlGGb823EY=; b=BworYEKwGTRWC2CHjt2tPklQQB
	84qu0kcXyd7BRb7qzbj7iDbB5qoKbnBWe7NWBgEYB3H6QAhSTKb+IOmeDu9pJJmC7SYdvhWLDMwzi
	LnxTqDJVdwYqgm8V0iRmVaWsXIptsBG+9a6YieHn+hUaZPN/7t6qxJei2L5A55XGDAIdM2eS/gWi0
	1Cf6v42vxfbUcYpCZf2SKZLBHvTqFxl0kNDXdbSAR8+Kr6IYa5S90k0vgMTgqSZymZHgwbH4LjRUL
	q52mh08cA/zRiv0+SZ3YSlxoPoEU2BfJ6qNhVuS4r2IcQ7iH+IeekxcpXJDnpnCSXknr6WWozihO6
	na1/PvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIOd-0030g6-2L;
	Fri, 12 Jan 2024 14:20:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIOa-0030er-3B;
	Fri, 12 Jan 2024 14:20:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 407ECCE23DD;
	Fri, 12 Jan 2024 14:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDD7C433C7;
	Fri, 12 Jan 2024 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705069221;
	bh=zmlC6jkMelq285ECzm84F7pJRpHbtewNs6IurYJ0/EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/2TkSzwlKIvIFYzFvUSp7Lg4gjIlDR9tPEg0iGi282ybmiyDw7wMISWdGupf5F4J
	 VX3Rp0AioRhHA7gWiKoOCWY1t/6DGST6UDp2Nt1u0psSL8dcwkfszVuMRCQGbBJEJC
	 q2SkJl392wwe2DahvMB5LLm4lI9R7e7ynEPPzvXwpHEpghxz66SskoRpgEP565I+RF
	 ApvkRqhD8HLTinyc7vdzCVCxaPJ1Uk+zENq20+NWUOcNJKL3CPjCL7IoKR+/tBMyx8
	 v059iRjQa93nv+5DSN9ooL0L+JLQK+7vkE5OSWfXmwcHUUJuFvLdSoZaZoIAYB1/jF
	 imbCsXe6C14vA==
Date: Fri, 12 Jan 2024 08:20:18 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, cy_huang@richtek.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 1/2] dt-bindings: usb: mt6360-tcpc: Rename IRQ to PD-IRQB
Message-ID: <20240112142018.GA3127117-robh@kernel.org>
References: <20240112094538.65639-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112094538.65639-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_062029_203125_6ACBCE19 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, Jan 12, 2024 at 10:45:37AM +0100, AngeloGioacchino Del Regno wrote:
> Since there is no user yet, rename the only interrupt of this device
> to "PD-IRQB", avoiding underscores.

It is primarily node and property names that have this recommendation, 
not so much -names values.

If there is only 1 interrupt, I'd just drop the name.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> index 053264e60583..0bea23ce2f09 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> @@ -24,7 +24,7 @@ properties:
>  
>    interrupt-names:
>      items:
> -      - const: PD_IRQB
> +      - const: PD-IRQB
>  
>    connector:
>      type: object
> @@ -58,7 +58,7 @@ examples:
>          tcpc {
>            compatible = "mediatek,mt6360-tcpc";
>            interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
> -          interrupt-names = "PD_IRQB";
> +          interrupt-names = "PD-IRQB";
>  
>            connector {
>              compatible = "usb-c-connector";
> -- 
> 2.43.0
> 

