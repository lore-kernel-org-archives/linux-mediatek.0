Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B40EC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 14:39:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A8CE6127B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 14:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A8CE6127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66DFj2PR/UeGNkMT2eVuaUs4d9QKKtKvp56NGLmilBc=; b=QMDc4qMu5Qdq0f
	Cj8gPbI+UBJRUArp9SDGWVOrCwHDo//EV1QZuHcHRoEewKXf0L306OaXIXVp9jhV/da4f03j626gs
	FzJklcppfopNV66/zdnPH/wsKQxGWyJh+c7GdS4omTMgWRqBbHZJoEFWQqu1FIOAOP55iFX4JMwJL
	o2splFJbt+plrIKfoOjM4e0QNJrRwb+fsjI9HtLovM6Cqpf/eFFsjPca8Tw9KjOU+P/ogcDhmgoyP
	meKeIUYkHqSVsXtSB2Dv/1PTysQzTkQXAUXhhBkvBZzkylR6VTjgcwb5eaa32xZThjaxwyt7IITd8
	Uaqi0DGxkPfXTThwFL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIXa1-003Xlm-PH; Tue, 24 Aug 2021 14:39:09 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIXZw-003Xju-4Y; Tue, 24 Aug 2021 14:39:08 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so46594657otk.9; 
 Tue, 24 Aug 2021 07:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oJTjVdGamrFwSnS4XYHRrrAclccvRhahcNOf3uZWcog=;
 b=OLIm0ejwB6w0kaXHMDapHXHNP2ZBvkyBLRrnFlm6ZV/FfX78yjPnhAl2IP4OD/2Euf
 4C6k0K4PWLbPzPGJgUEwP0BJAPfiNjyJWP+XUlpwHZ7GFgq+8i5vuGpJDZe/JlCD0cJ+
 LuUaiS0aVuRTZp9bPn2sDjVL9fzpINvDTea0exWCNUWIXW02dvvGuI4xwpO8yasdpbwI
 zOVKQ4uhbefAbT69tPjzGKhCciiWe3KRiV8fwLS4NCSTz+AnMTW0j5IP2N/GCUbCbyDd
 1QKDV5NoISdrh4kbrmxEumgZJq3lxoGI+4TAp6LADuC4Hx/Xr+nHs20Ir3ls1GOJalXj
 B1SA==
X-Gm-Message-State: AOAM533ZtUYPOQS6f9CMJfQ9ot8PyOrnYLlY7YI7/Wdgw4vFkN0gGjAH
 AdmITwTYUXfAPkbz9Sy3Bw==
X-Google-Smtp-Source: ABdhPJyWxAQYVSvp5dfYC1MVG4wcDA3+xadxULnBKqwxP7AbYTYs6hbMs3GS17peHFiEsVBo69cv8g==
X-Received: by 2002:a05:6830:238e:: with SMTP id
 l14mr31227924ots.354.1629815943350; 
 Tue, 24 Aug 2021 07:39:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i5sm4396860oie.11.2021.08.24.07.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:39:02 -0700 (PDT)
Received: (nullmailer pid 407321 invoked by uid 1000);
 Tue, 24 Aug 2021 14:39:01 -0000
Date: Tue, 24 Aug 2021 09:39:01 -0500
From: Rob Herring <robh@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rex-BC.Chen@mediatek.com,
 TingHan.Shen@mediatek.com
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Add support for MT8195
Message-ID: <YSUEhTbzz9x1UeaB@robh.at.kernel.org>
References: <20210820023521.30716-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210820023521.30716-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_073904_227941_B7A05A23 
X-CRM114-Status: GOOD (  15.34  )
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

On Fri, Aug 20, 2021 at 10:35:21AM +0800, Jianjun Wang wrote:
> MT8195 is an ARM platform SoC which has the same PCIe IP with MT8192.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 742206dbd965..dcebb1036207 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -48,7 +48,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8192-pcie
> +    oneOf:
> +      - const: mediatek,mt8192-pcie
> +      - const: mediatek,mt8195-pcie

Use 'enum' instead of oneOf+const.

>  
>    reg:
>      maxItems: 1
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
