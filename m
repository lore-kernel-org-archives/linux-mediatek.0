Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB25EEB571
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ai0FCheq1Y9+G4KSSTm0hzGJev3w/SK52/y2/6kswq8=; b=vj2sd+kdupe9i+KpBLOm++7oOC
	MhUMcRANsbzxQHJvmb5QBAdKSwTDzGTytJ3lSzCzM+UfE4P+4Yk1KGoxXWczvJXwBNhSWxp740sGP
	ffnq9mJSolrcos8vOndPd+G/O22tWWGC0KHKDlE1I+B1NpzQH8h5MIbpZl0/Sv5QkDIHKt5SHIAXp
	VKEXSENUyhY9vFyUIn0MoTUzQX6q22GFH3UB3yNADvLp9YZWSDzv0abF/+D7l4gZnRs7dMXKzJnv2
	MZ8NEu2t2fB0wb8RWZdt7LYwKJqp+RVX4AmEFiOFOUyye7M0Klq38Yg2hlEtOu6qe8p5cDZP5P9t8
	ZJI6uE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeiSq-00ETkd-3C;
	Fri, 08 Sep 2023 20:52:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeiSn-00ETjQ-2E;
	Fri, 08 Sep 2023 20:52:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3327361584;
	Fri,  8 Sep 2023 20:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A55C43215;
	Fri,  8 Sep 2023 20:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694206344;
	bh=TcTQRLCCJ2nI5kBt3Ur/VJ/CjA9qDNAGUbTVoXZ0FFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKMs3kuE0jyLhFFImDSGLnNruBWTdUeyW76xuzGn69ruwfKYI6GKbJOaYXOQYZxy0
	 GBLo8zoKCuyc9etWI7P2hqXaoHe1OoTEI/nEhhLmdDq+x7kevRAmSflKjzGx6wKXVK
	 1vmR4jvvx8ZXhKhG4REISHbNAa47cFya9GHyN5fIQRoUJUcmU+7Jmzbx4jzEQhETje
	 tQStBQmAneqHovqRdKrc1FydK3HWBE2FJOZ4bLkJMBCt7W+ZWKEIOBuuAmrCH/FPYb
	 VtvltK95RppdKCbSzGcb7/WprEJRCyAptgDoUFBra9H9TTDJQuiRcYKZ9nAe2QY9Td
	 DUc2Fb76bENog==
Received: (nullmailer pid 336501 invoked by uid 1000);
	Fri, 08 Sep 2023 20:52:22 -0000
Date: Fri, 8 Sep 2023 15:52:22 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8365-pumpkin: Add overlays
 for thp7312 cameras
Message-ID: <20230908205222.GA320762-robh@kernel.org>
References: <20230905233118.183140-1-paul.elder@ideasonboard.com>
 <20230905233118.183140-4-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905233118.183140-4-paul.elder@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_135225_810007_F45A9B09 
X-CRM114-Status: GOOD (  18.38  )
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

On Wed, Sep 06, 2023 at 08:31:18AM +0900, Paul Elder wrote:
> Add overlays for the Pumpkin i350 to support THP7312 cameras.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |  4 +
>  .../mt8365-pumpkin-common-thp7312.dtsi        | 23 ++++++
>  .../mt8365-pumpkin-csi0-thp7312-imx258.dtso   | 73 +++++++++++++++++++
>  .../mt8365-pumpkin-csi1-thp7312-imx258.dtso   | 73 +++++++++++++++++++
>  4 files changed, 173 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 20570bc40de8..ceaf24105001 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -56,4 +56,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-pumpkin.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
>  
> +mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-csi0-thp7312-imx258.dtbo
> +mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-csi1-thp7312-imx258.dtbo
>  mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-ethernet-usb.dtbo

This has no effect. You are assigning the same variable 3 times. It 
needs to be every overlay applied to its base is a *-dtbs variable and 
then those are all added to 'dtb-y'. IOW, we don't allow overlays which 
can't be applied at build time.

Assuming the overlays aren't mutually exclusive, you could do:

mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-ethernet-usb.dtbo
mtk-mt8365-pumpkin-dtbs += mt8365-pumpkin-csi0-thp7312-imx258.dtbo
mtk-mt8365-pumpkin-dtbs += mt8365-pumpkin-csi1-thp7312-imx258.dtbo

This works the same way as '-objs' variables to group .o files into a 
module.

> +
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mtk-mt8365-pumpkin.dtb

Looks like mtk-mt8365-pumpkin.dtb failed to get built before. In any 
case, that's a terrible name. What's the difference between 
mt8365-pumpkin.dtb and mtk-mt8365-pumpkin.dtb? There's no clue.

Rob

