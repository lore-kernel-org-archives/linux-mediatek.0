Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25200D116F9
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 09:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cY73q9qbLbd7fjaEifwSQ6Xmt/gFrar+SVAWfWs+/ck=; b=sC2N+k28PzTkhGT9i5NGDQcHfQ
	BM59/pxEItQr7bfBF3bG70kkzTCKGI55dhNfqJjS2D7QENUg9FbcT547OvSeZOTzeTU+P2HzjJyxo
	QFz4gbL5oQeohhoeSVsHJAQB6K3Btkq8kdoN0EgxkZniq5BkxE3eqqswy5wL8LuMsxrD6Iw3/SI7k
	tZrErbb70CjDYG4dboedmR5NkFlQBYYz0MnjB1esTPH1+rYvimO4CXRUo8GGYRKVnrQvSTs+5GSjw
	q54WmpjyxM0ebhuRHBSGOXfUOIa5K7BgLjIX58z2UHQZHA3kiHtglyFMz8ksMcOzRGC7l+PrpB9NR
	3bkbllMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0I0-00000003DTP-0TGo;
	Mon, 01 Dec 2025 09:33:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0Hy-00000003DRB-12fj;
	Mon, 01 Dec 2025 09:33:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 653F16016B;
	Mon,  1 Dec 2025 09:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119A6C113D0;
	Mon,  1 Dec 2025 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764581625;
	bh=tBkKEMuW8ICQGDPwq1PKcDrajbLvvxTth+P4EEwAMzk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=es2pCRlyHdmpd42IrlWVKynzqri79MdnPA9dxm4mgH5V4vQY7XXD8okdLkHXmi9Xm
	 7K/ISbLkuKcqcUaIzIekrzQ+462GY3AXDqhp+Pvxwp9qNwOm2BDS+LbNFVlhFzA5s1
	 Aq9aHgHTZGQu0jNGg2QLlpPidXLCe/Fehhnddh61abNYVd3UV7cShoy29O2Yht+UvU
	 Gu003uCdg6LxQUkgv5BLGKSV1VlYRsMyEOcn33V4WPUQJRKLa9SLjh2O3tIG38G+Qq
	 OKtCipmFG1eLSJ0JsGBeG3MjdfJWyNIKKlsrU/Y8VgUzDbv4Ej4NH3nWrlp0yB45Dx
	 WYfDl0gc4evVA==
Date: Mon, 01 Dec 2025 03:33:44 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
To: Gary Bisson <bisson.gary@gmail.com>
In-Reply-To: <20251201084140.376058-4-bisson.gary@gmail.com>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
 <20251201084140.376058-4-bisson.gary@gmail.com>
Message-Id: <176458162056.2489271.8926442564760324805.robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: arm: mediatek: Add
 ezurio,mt8390-tungsten-smarc
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


On Mon, 01 Dec 2025 09:41:38 +0100, Gary Bisson wrote:
> Add device tree bindings support for the Ezurio Tungsten 700 (MT8390)
> SMARC SOM [1] + Universal SMARC carrier board [2].
> 
> [1] https://www.ezurio.com/product/tungsten700-smarc
> [2]
> https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
> Cc: robh@kernel.org
> Cc: krzk+dt@kernel.org
> Cc: conor+dt@kernel.org
> Cc: matthias.bgg@gmail.com
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251201084140.376058-4-bisson.gary@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


