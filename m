Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2CDC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 22:00:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF16619BB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 22:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF16619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J4aPCeUfcQkonEdYNpqZh2ZoC8DgiF0SS2r33zBPHSw=; b=mWQ6f81iOR5udchNHlyh/Sqqq
	mwVG2edB5dVbiRejIUJfg6RBnfyF1UjLtSEjxTqZRzQPBfQ+0K2apI3+4jgGlJRyU444TnAsLILJN
	DS6Q/GXLv4JHl3GigXcLhfA7h8IABDg/LXDXfumkNpI7ju4MXa3fAZuCB92+/GUvpn+jD8KdrV3hu
	FmLJ0X6WT9+oK7AW/piOm75E7jeqdxwizi1IIAIKlt8AFO5Ggl/Kq2T0EeE1vRpiRIQL2x5FURyBt
	3CmoHwXXuQhbV9HodcNIcb2H0DL4ssPs6aYdtCyOD8Noa/hH2L3o6/AgPvlO8YpvIybP3CgGGgiyw
	zEO7USdcg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRMOn-004yNR-Lb; Tue, 30 Mar 2021 21:59:46 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRMOi-004yMV-PJ; Tue, 30 Mar 2021 21:59:42 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso17030174otq.3; 
 Tue, 30 Mar 2021 14:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ct7bQjqlmuzUZdOiA5dbz3QfeJ0p9yFzsZbuoy4bHrU=;
 b=AmeDpDMTQ7q2SckUKeMJIb6h4n7aj2N6Ip32ulJquTenEdkZ3KI5tChOkwt77UTXND
 IJmwhCY05yTKglo+bU2+yuxodZrsE00X4apQmPm53tg0WFJmJlM5a0azm6MSHoZsoQdT
 uZdRCLwiS4s1nh13wwd8kAPavw9Wu6rr9mosx4kcVTCqdGY/ggI/t0Dhl4DUVFbffK8+
 CmozQ/SSDuWk9ex7VzuePAJFHKfp83YTjJ14DVsBha+T06NKdm1p6u4wIaKMovFKovf3
 9mTIWBk5x7pP7TUr0u+WpHl0UUxiE28fRByb7g9PDNsYc1aUbsW6B3QGQa7f/dp4o6lq
 iMNw==
X-Gm-Message-State: AOAM530LCxLB6Oj00XW8FLUJgZsmmj5yBV46KwnBC3jpAr4WUrUw4Z4e
 Q36Y49Mqx0oCn5wrwE8Egw==
X-Google-Smtp-Source: ABdhPJxtjGfrnIV6FqaxZx99Gyr7rWag7GQjzOLgtAbpPj6cRxrK/b0wK/km+25shVcpcrVsP8FQ3A==
X-Received: by 2002:a9d:550b:: with SMTP id l11mr46907oth.218.1617141579649;
 Tue, 30 Mar 2021 14:59:39 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x18sm20207otr.73.2021.03.30.14.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 14:59:39 -0700 (PDT)
Received: (nullmailer pid 788808 invoked by uid 1000);
 Tue, 30 Mar 2021 21:59:38 -0000
Date: Tue, 30 Mar 2021 16:59:38 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: usb: mtk-xhci: remove redefinitions
 of usb3-lpm-capable
Message-ID: <20210330215938.GA788756@robh.at.kernel.org>
References: <1617002411-9015-1-git-send-email-chunfeng.yun@mediatek.com>
 <1617002411-9015-2-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617002411-9015-2-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_225941_159665_37F7D552 
X-CRM114-Status: GOOD (  12.46  )
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

On Mon, 29 Mar 2021 15:20:09 +0800, Chunfeng Yun wrote:
> The property usb3-lpm-capable is defined in usb-xhci.yaml which is
> already referenced in this file, so no need 'description' and 'type'
> anymore.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: new patch
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
