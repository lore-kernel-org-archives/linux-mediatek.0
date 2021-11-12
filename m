Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5334EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 16:58:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1092561073
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 16:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1092561073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=euczCg3lm9aJNhRYiqPec0lRiP5zNHQ0QxptAE5dcwo=; b=AqeA8eyIzwvMtv
	ri0NRHCNO9WxrL056z+6kPGNYnJjgc0+vUgbMx0Wzdiyoyvw7v+q8k85koLdvYrtm98rXki+Ei14/
	ae845tmrkymrLhaqVHiDKZS/wFEc62iEWnh8Rcwlpnpn0IAcBOS2XV2wafTH/8jmhTS8yuSqWGIAW
	Sxd8Rb+qaBhank1dUI3BH3COcvs828vIKZCOKOmcoc9wT2K1j2YnN+go+x4Cm2YcpjAGCgTGwFje2
	VEHr7RSEVlSGT0tHqhhm9jV6Rr8qlQ2I5ZMJjBcrzWl1vaPuMb23ji8owAsJmef9hVc0LvybIcsTt
	xC7dGb+OH7oqNVereZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlZsB-00BHTN-PY; Fri, 12 Nov 2021 16:57:55 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlZrw-00BHQ7-0n; Fri, 12 Nov 2021 16:57:41 +0000
Received: by mail-oi1-f177.google.com with SMTP id m6so19067569oim.2;
 Fri, 12 Nov 2021 08:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n9OxRMPgp6pk93jZ1YlEjSWdjPyoXU189+XIXwiTYRw=;
 b=m+Nt3XDfo9uZDWBaW+INt+GGZmFwBUveWHY6qL9wu/AvA4t09LfPMxuiODkVlif+BW
 i9213B5ddARnfqiigOM1XcCj/Tr7V24SvG0NsnU7MZVFlr0S9le1thfFJWE4e3PX+kmH
 JElb5DM/loV6K7Zl0D5mEsmurqzdCZ+MdJsb1VmkZmhYqEx0gLAwJ8deuA29xDSogVEA
 ppg3QeLdRiQlbb1yT5wh7GaWw0ZSeshjuOE7pKD1iK7v/1Iidua/lk7EdVR0iXkyHenm
 THb/sZ9/JZKpYwOs1TAjOkbehcpfia58dFyz6SBWrFI3BBOiBDLN+a4KkFT9v+eWCNCz
 AHvQ==
X-Gm-Message-State: AOAM53386iUg4YRISOu0BQ//ZIv+DSeYVxW0NJP5jeSgR7yIptwQDeAY
 D/f05tlh1A6h010tqaj6SAIPybBDNA==
X-Google-Smtp-Source: ABdhPJw55ryGR39q61JJpTyvJsied/FtWSJDgs9l5hCvlD+IouVp9dNd0acwh0y+I9393pbRkbSMFw==
X-Received: by 2002:a54:4584:: with SMTP id z4mr27648506oib.158.1636736259168; 
 Fri, 12 Nov 2021 08:57:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y203sm1407807oia.1.2021.11.12.08.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 08:57:38 -0800 (PST)
Received: (nullmailer pid 3004958 invoked by uid 1000);
 Fri, 12 Nov 2021 16:57:37 -0000
Date: Fri, 12 Nov 2021 10:57:37 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtk-xhci: add support ip-sleep for
 mt8195
Message-ID: <YY6dAT3OHbu0CO/J@robh.at.kernel.org>
References: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_085740_082981_553B5213 
X-CRM114-Status: GOOD (  16.73  )
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

On Tue, Nov 02, 2021 at 02:00:47PM +0800, Chunfeng Yun wrote:
> There are 4 USB controllers on MT8195, each controller's wakeup control is
> different, add some spicific versions for them.

specific

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 11f7bacd4e2b..41efb51638d1 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -146,7 +146,11 @@ properties:
>              2 - used by mt2712 etc, revision 2 following IPM rule;
>              101 - used by mt8183, specific 1.01;
>              102 - used by mt8192, specific 1.02;
> -          enum: [1, 2, 101, 102]
> +            103 - used by mt8195, IP0, specific 1.03;
> +            104 - used by mt8195, IP1, specific 1.04;
> +            105 - used by mt8195, IP2, specific 1.05;
> +            106 - used by mt8195, IP3, specific 1.06;
> +          enum: [1, 2, 101, 102, 103, 104, 105, 106]
>  
>    mediatek,u3p-dis-msk:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
