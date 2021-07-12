Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146CEC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 19:08:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D16CB61221
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 19:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D16CB61221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AaIm5MxrTop7m7JIZs3/t5SilzJPDxUrjM2I9aRWDF8=; b=FU91vdi7duO8Kp
	+rj8hLVN/vxcj59JekvO3ScmP3mWyVbgwbwnD7udp6pcMbalM0LA6BLn4L7nYV9H33HsARJ5CS8Tw
	jIuP2B+J63QJ5lBnv9h0i8OAZnZTvwGm2rVLomr81Y37ztKs0FRRqgCas6bbCh/Szwk0+KosXsgsa
	Y+H8a8hg4oDgI56ZaY8B6xxBeimUMmRO6+oGh/yTHDKuDsBbYJQsYWwlpxuYfbJiWKOw0ifFCXBqY
	6izWc+dgzLQC3hVIMY2ssncXDwhwnLlcm7uLXtcecFxtDgRNfEGwsZ4e5jSw2KUtzFPbzpVKq/F4w
	+3Y2+iFbCzsSHTridQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m31I6-008Ebz-GA; Mon, 12 Jul 2021 19:08:30 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m31Hs-008EXR-87; Mon, 12 Jul 2021 19:08:17 +0000
Received: by mail-il1-f173.google.com with SMTP id e2so4144308ilu.5;
 Mon, 12 Jul 2021 12:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2M7YIyDRp1gENoSHGUY9aVt9+1qD2EsTC5NJBCX37X4=;
 b=rBgl5BFhYvI79oHyzNxR1Lg2H6SEWe6ll4SiMpLtlUm89rt9CEkOtUP6D9LpEfkPK3
 43p1L8Sr78nnntJtr2zkq2VuDA+whApqIBUqsvwBsvQCV4nnYLrjAxPs1ZariVNAFJkM
 XRHuB1bsabYvBl1CSJYFdnho78INLEZ4ueHAJVqoc5vSWwiHawHjQgHCTH5slOgyP50M
 xV8vcjl88OwIVyBh2QJzoHQchMD16UaqMQeFhYwCZD/WdnWHyJVINwGaDHjtq6s+qUz+
 gPpr+kusUFE7TgYBIZBqNMo2852d16RXb8wvkqCu+cUvgjUq44rj1mjHdqFI1hoFzqcq
 G+hg==
X-Gm-Message-State: AOAM532hwPkqgU6z7G9gKkui7cPfcgKN7gh15kqnQkADsjbpfeuiCE1Q
 pWh7m6+yep7vI8b3OGxMjg==
X-Google-Smtp-Source: ABdhPJzKmT63VhWHvz6Gt43Hgf8rHhxkjEEh2GltWkhFJXhb3gzkCEwmig2tRpvP0B47gIT7hB+v+Q==
X-Received: by 2002:a92:6e07:: with SMTP id j7mr235895ilc.71.1626116893425;
 Mon, 12 Jul 2021 12:08:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id g1sm8170313ile.35.2021.07.12.12.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:08:12 -0700 (PDT)
Received: (nullmailer pid 2311680 invoked by uid 1000);
 Mon, 12 Jul 2021 19:08:09 -0000
Date: Mon, 12 Jul 2021 13:08:09 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] dt-bindings: usb: mtu3: add optional property
 to disable usb2 ports
Message-ID: <20210712190809.GA2310371@robh.at.kernel.org>
References: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
 <1624008558-16949-3-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624008558-16949-3-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_120816_351385_7F897665 
X-CRM114-Status: GOOD (  20.88  )
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

On Fri, Jun 18, 2021 at 05:29:07PM +0800, Chunfeng Yun wrote:
> Add support to disable specific usb2 host ports, it's useful when
> a usb2 port is disabled on some platforms, but enabled on others for
> the same SoC, another case is that the different package may support
> different number of ports.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> index 2cac7a87ce36..3e6f2750f48d 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> @@ -166,6 +166,12 @@ properties:
>      description: The mask to disable u3ports, bit0 for u3port0,
>        bit1 for u3port1, ... etc
>  
> +  mediatek,u2p-dis-msk:

Just spell out 'mask'.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The mask to disable u2ports, bit0 for u2port0,
> +      bit1 for u2port1, ... etc; but can't disable u2port0 if dual role mode
> +      is enabled, so will be skipped in this case.
> +
>  # Required child node when support dual-role
>  patternProperties:
>    "^usb@[0-9a-f]+$":
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
