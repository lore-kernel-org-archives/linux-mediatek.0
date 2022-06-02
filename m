Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEE4C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 13:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4BpGQDpRW2b8ZbYEagJKo55Cn41YHGIU4Yn4hYzO2I=; b=rWPfLwrtqzztI5
	UPfHNshpErsY6RldACE2yYjtm41lBrUDWtpCXBv0AxossF+TOjKz5/yuqzq9DAlQ+tIvLwIu3icoJ
	8ffmQGtQBsSRerSDzqTwAhCSY1H8q10Z0CBNkQPLs9cbdZFEAKWwTVYgFRLRGXPNz0mcCrDxL1tY+
	lUSRGquk8SHicGvvgLvsaN2NXQuhZEJQ1heJPvQU2qrJbNbFL9SJFEkGezn+omoP/TtzcnStnzk0n
	aN0t1LICEP08ynHcRbma4W/YxoviD8oMlvPNWDgmVkC3JUf1DB+frehO2fLd3qpvag52Fd7mFvGfX
	U/FzoajFDCP7s8l7m+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkVE-003JSy-IH; Thu, 02 Jun 2022 13:04:40 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkVC-003JRW-B4; Thu, 02 Jun 2022 13:04:39 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-e656032735so6707072fac.0;
        Thu, 02 Jun 2022 06:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5/VCST4F7lVnuhuAO5by30KXb22t8RLJk2t2EhCzbII=;
        b=8LA5KfD0JYOlQxvEzLqOP1n6J0uoUq4YScdLUvbNsSYJ9XVrEEBZOSar/VAlnLdHWD
         kItvgcZcdsxRk6aVf5OB0OXM5ucZWzWaxIT7w+83BEgfhnkIabBOFkkOeZ4usagfOds2
         K6LNF3YJjl4vT7mr8iSuW5Lu4mDuW0zIa+Sc1LOeOWXCg9rBJSEfD12PvC1mJAbVDKtp
         zgcjuaf4M52CTbIJ9B1/qUg2Q/V5ql6hCFgCZka56aWsoCeLsBz1Ouqf50Hf+OvucPzH
         vOLdbVsDwAJTWgbb09esoJmvcFyJ39dVt9SKOQhkZAJk8wb9nt/RdI0XQXMhtftSNwul
         2h3A==
X-Gm-Message-State: AOAM530EmwbMIqIUEYBI9DYEB052R9mMwZdECUpWkkmmhvjxLLu45kIm
	9YgUYRu/EOrRYoNrp16lWw==
X-Google-Smtp-Source: ABdhPJx2W0m4zHCJcbUYiCbmMZxD45G9xBPM0mXVqwnzD0WfnB5hrx5/44F6vFlg4XgGrsVmFtgK3A==
X-Received: by 2002:a05:6870:ea8b:b0:f1:f46f:515e with SMTP id s11-20020a056870ea8b00b000f1f46f515emr2655714oap.192.1654175076098;
        Thu, 02 Jun 2022 06:04:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 1-20020aca0701000000b00328e70cae5csm2325309oih.43.2022.06.02.06.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:04:35 -0700 (PDT)
Received: (nullmailer pid 2106394 invoked by uid 1000);
	Thu, 02 Jun 2022 13:04:35 -0000
Date: Thu, 2 Jun 2022 08:04:35 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: mtk-xhci: add support 'resets'
 property
Message-ID: <20220602130435.GA2106339-robh@kernel.org>
References: <20220523090449.14430-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523090449.14430-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_060438_427454_ABB7D92D 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

On Mon, 23 May 2022 17:04:46 +0800, Chunfeng Yun wrote:
> Add 'resets' property to support IP reset usually by top pericfg.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
