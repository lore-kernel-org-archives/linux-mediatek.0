Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5024C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 10:36:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD4F2337F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 10:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD4F2337F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ijV9L4DXEpzJOVVWaFjaLmagZ4s+fr39AUxacjE+lgw=; b=l8xBLotaWZyK2sSpryhX351n9
	qxf5Su+HAW6c45kEuzNOkLjbs10lfcRCknYH99+rjMusLVmajqyRNteMWS8pYNDxPNzuBlGodfnxd
	LluY8nSxg3Dnodit0tHTDBWD7nJ+7gJgUszEXi36XZ3TYRMWev/Gz67jWzjneBcJo07gdQA6ABx4c
	phzf6S29ctNtzVtjlL9irekE4a8zHsp2ui3j+K41PnWKVjxxH5RvB2sYw3Fq+n0FdhSiyAwHzd9zN
	LR3Zj7XTOQZBsf/gr2yP8xgWL3+S7a+Xnu2wsLWWGGCj2u//yRBbW25vGclZdf7F72YsFOslCV6pi
	eQ0zfTxFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdVQ-00012X-Jn; Wed, 13 Jan 2021 10:36:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzdVM-00011Y-Ox; Wed, 13 Jan 2021 10:35:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id F08FD1F41028
Subject: Re: [PATCH v3 2/2] arm64: dts: mt8183: Add krane-sku0 board.
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20210113062834.4043956-1-hsinyi@chromium.org>
 <20210113062834.4043956-2-hsinyi@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <4ccea266-a840-7954-e7b1-ff6a321a9411@collabora.com>
Date: Wed, 13 Jan 2021 11:35:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113062834.4043956-2-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_053556_966842_24F3B367 
X-CRM114-Status: GOOD (  19.50  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Thank you for your patch.

On 13/1/21 7:28, Hsin-Yi Wang wrote:
> Similar to krane-sku176 but using a different panel source.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> change:
> v3: fix yaml
> ---
>  .../devicetree/bindings/arm/mediatek.yaml     |  4 +++-

I think the binding should be a separate patch? (Rob to confirm). Other than that.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

>  arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>  .../dts/mediatek/mt8183-kukui-krane-sku0.dts  | 23 +++++++++++++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 53f0d4e3ea982..93b3bdf6eaeb7 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -120,7 +120,9 @@ properties:
>            - const: mediatek,mt8183
>        - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
>          items:
> -          - const: google,krane-sku176
> +          - enum:
> +              - google,krane-sku0
> +              - google,krane-sku176
>            - const: google,krane
>            - const: mediatek,mt8183
>  
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 18f7b46c4095b..deba27ab76574 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
> new file mode 100644
> index 0000000000000..fb5ee91b6fe0e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2019 Google LLC
> + *
> + * Device-tree for Krane sku0.
> + *
> + * SKU is a 8-bit value (0x00 == 0):
> + *  - Bits 7..4: Panel ID: 0x0 (AUO)
> + *  - Bits 3..0: SKU ID:   0x0 (default)
> + */
> +
> +/dts-v1/;
> +#include "mt8183-kukui-krane.dtsi"
> +
> +/ {
> +	model = "MediaTek krane sku0 board";
> +	compatible = "google,krane-sku0", "google,krane", "mediatek,mt8183";
> +};
> +
> +&panel {
> +	status = "okay";
> +	compatible = "auo,kd101n80-45na";
> +};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
