Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44F3C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 19:29:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8143822B4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 19:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8143822B4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nTZkbR5hk6Pmc2f/SdYPDg5JsXNrjHxymtYtArcyieE=; b=xaPcMJIizJkLRruAGMDjAid8d
	j9Xp0sG6wv7TIiunHk4dasSGpH46h/XMH7BaoGnVZpC0s9lu4EZmIq2FaTgcUfKrmRUT/5gbm+1pR
	m2qrKHGMAYEB7gOy2HiU4EfAmS//VZrYk3hEPiLMzHBXJ+F9C07U1d6y1S/Fs9yzSnwL8LByxdC5d
	8S6Dx0sPInAY/v0Q8qo/1ctRBLvyBWsOmPU80yVu4+O7ynTsUlF0U5DTy+zovoQgHnjBrlxdDT0i6
	iTVQdlGwj4wb14pNv18P+sqXUM4eAKDIXILmKuOj0JZpsA0W4EKGRBoWrgY32y+VOqXLsLhqvbhYS
	Txsm7Tijw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krQry-0002jq-1l; Mon, 21 Dec 2020 19:29:22 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krQru-0002ik-17; Mon, 21 Dec 2020 19:29:19 +0000
Received: by mail-ot1-f45.google.com with SMTP id a109so9841058otc.1;
 Mon, 21 Dec 2020 11:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M1MxrPIQn2j84Hy9VX0ZfS3TWh8t1dtQ7AGoSL/X1GM=;
 b=IV2iPbPL2NGhkTUaVi7DoCcv7QGDoj86Z2cHA8j47ku2vF4GMKPv4Qt9BesNKW0rIS
 0hFQO24+72cp4E6UVWRUuoBoUw+b8CKSQzQBcD/3LxQPSJod9Ys8uhtwHial3vrQ8PyZ
 tEvZSVPsh5f5AL05JPnfRiG4GxNfcIiOn8Nf3PrHzDn+32Gbq0MPipZX7vyFVKdpRK4F
 rBX4dBnxe3CWzLT92y182yOiGKEFxc1TLUzyIYt33kqe8weZn6isulIr7XQOPKPeRbAx
 8HB+NBpzvo0ANBEVozVltMyYJ7upPZmLvOJzFsj2045oEq30Cyxf1FALENsOu+NMHYGn
 +ssA==
X-Gm-Message-State: AOAM532w2O5F5YwYKbLtbzanr+dUCIx/lNovCHrrphe6LZfwdUT/0LrK
 +sylKtZUdpBPCM6b9toiyA==
X-Google-Smtp-Source: ABdhPJw47d1FoUkv7savdsGWx47OEshyMKCpowzXUs9f12OxLeVSkNOEAHPrCHH9GkcIRCtcQXgHvw==
X-Received: by 2002:a05:6830:1c3d:: with SMTP id
 f29mr13151677ote.47.1608578956645; 
 Mon, 21 Dec 2020 11:29:16 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s24sm549274oij.20.2020.12.21.11.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 11:29:15 -0800 (PST)
Received: (nullmailer pid 409990 invoked by uid 1000);
 Mon, 21 Dec 2020 19:29:13 -0000
Date: Mon, 21 Dec 2020 12:29:13 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtk-xhci: add a new property for
 broken streams
Message-ID: <20201221192913.GA407645@robh.at.kernel.org>
References: <20201216115125.5886-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216115125.5886-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_142918_434058_2DD5E2AB 
X-CRM114-Status: GOOD (  19.20  )
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
Cc: devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 16, 2020 at 07:51:23PM +0800, Chunfeng Yun wrote:
> The 0.96 xHCI controller on some platforms does not support
> bulk stream even HCCPARAMS says supporting, due to MaxPSASize
> is set a non-zero default value by mistake, so add a new
> property "mediatek,broken_streams_quirk" to fix it.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> this patch depends on:
>   https://patchwork.kernel.org/project/linux-mediatek/list/?series=402773
>   [v4,09/11] dt-bindings: usb: convert mediatek, mtk-xhci.txt to YAML schema
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index e5e03f902802..330f7294bf34 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -120,6 +120,11 @@ properties:
>      description: The mask to disable u3ports, bit0 for u3port0,
>        bit1 for u3port1, ... etc
>  
> +  mediatek,broken_streams_quirk:

You should imply this from the compatible property.

(Also, don't use '_' in property names).

> +    description: set if the controller doesn't support bulk stream but
> +      HCCPARAMS says support.
> +    type: boolean
> +
>    "#address-cells":
>      const: 1
>  
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
