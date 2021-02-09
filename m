Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550D1C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:46:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF70164E30
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF70164E30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yb8P7/2O667MZsBTHkP+n7yZI67dBQOjZWJHC8+ImrU=; b=siBrzEFbILaXtlaIQyT2AiKjf
	8xr+xNhU6Q7YnNcLXeD/Aia4Yjt6XrmXdtr6wd0yDgG1oqlLSYATylL9geO3SrrybY8p38qQjP95K
	sa0NfCU5zYlJHi0qTX+YzK2DlhKQ/ot1ImCefPTVDEqjFUgcBsL2khgoI2Q0zRHf4SzGdFnXJBeq7
	tmjeKUHemKVQayCBaWJNxYzuAc2WIf5xMlF3QamH95GXmVNkSmwEZhHQGT+A0uwb8VB62w3hDcpSf
	kIZ5YLN48gd2Bgakor6pBsHgob1ph8ZycS1OmQhnnELI1pQpZsTGfLZT0zcY+kwiA0T6J57AP1INU
	Yo0hQ/aBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Zts-0005DO-DC; Tue, 09 Feb 2021 20:46:20 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Zto-0005CH-7D; Tue, 09 Feb 2021 20:46:17 +0000
Received: by mail-oi1-f172.google.com with SMTP id v193so15450097oie.8;
 Tue, 09 Feb 2021 12:46:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2s5+gI5RkcmBiEkvRs0kblor0zn4pUAbODGQq2QGc9Y=;
 b=r0sL1FGesLKT8R8lAi1HbcZTS3IdumqjX9JoxXa2IHeg1iRqhwwmThotLpH5U7SESi
 j+eyc3VT1KRN4tprFFxV0P50LK2TkJG+sqNWCZ9zjLxExnlHlns/bakBsBkx4i3PXKOS
 a7/3/2EhhNlNedTNMEss9hat9bleahQ6kheWgJxMkV7kM7yqI4SryiHz+q2LHbbSIkKk
 KQXz/lhhKiAt6irVHq++mo9JtdNgoFrNQc/RmbLJ/f0FZCKxYEF7NT42jGm9S8Uieprn
 LCnzHdXlKav9Wp9jmC+R95qJQ9lvzCvqPeZjBENpjLSVy5amGYVWTnnDe5PtV60TctWI
 AAFg==
X-Gm-Message-State: AOAM532tIKyCODC2TbKvBkca3/wnZTnIYdRAn2p3BTZEslIbmK3HbeTW
 9+UeF21lbhlseQTuax0BWA==
X-Google-Smtp-Source: ABdhPJxcbTWoPyqVdl4qZFD5NZhVbO2hWAT36p59UdrslscD+BpxXnlxEZlbWI5rCtc/8MHFmM/O3A==
X-Received: by 2002:aca:2102:: with SMTP id 2mr3811202oiz.80.1612903574974;
 Tue, 09 Feb 2021 12:46:14 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j5sm795351oij.48.2021.02.09.12.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:46:13 -0800 (PST)
Received: (nullmailer pid 146771 invoked by uid 1000);
 Tue, 09 Feb 2021 20:46:11 -0000
Date: Tue, 9 Feb 2021 14:46:11 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH next v3 02/16] dt-bindings: usb: mediatek: fix yamllint
 check warning
Message-ID: <20210209204611.GA143456@robh.at.kernel.org>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
 <20210201070016.41721-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201070016.41721-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_154616_289484_8A43CA97 
X-CRM114-Status: GOOD (  17.51  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 01, 2021 at 03:00:02PM +0800, Chunfeng Yun wrote:
> Fix warning: "too many spaces inside brackets"
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2~v3: no changes
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 2 +-
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml    | 6 +++---
>  Documentation/devicetree/bindings/usb/mediatek,musb.yaml    | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 38b1fe18aa79..a3817f3af59d 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -139,7 +139,7 @@ patternProperties:
>      description: The hard wired USB devices.
>  
>  dependencies:
> -  wakeup-source: [ 'mediatek,syscon-wakeup' ]
> +  wakeup-source: ['mediatek,syscon-wakeup']

We allow either 0 or 1 space, so this should be fine. Confused...

>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> index f5c04b9d2de9..66d78f534722 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> @@ -172,9 +172,9 @@ patternProperties:
>        example if the host mode is enabled.
>  
>  dependencies:
> -  connector: [ 'usb-role-switch' ]
> -  port: [ 'usb-role-switch' ]
> -  wakeup-source: [ 'mediatek,syscon-wakeup' ]
> +  connector: ['usb-role-switch']
> +  port: ['usb-role-switch']
> +  wakeup-source: ['mediatek,syscon-wakeup']
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
> index 790efe8b6274..a515c9f30b96 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
> @@ -66,8 +66,8 @@ properties:
>      type: object
>  
>  dependencies:
> -  usb-role-switch: [ 'connector' ]
> -  connector: [ 'usb-role-switch' ]
> +  usb-role-switch: ['connector']
> +  connector: ['usb-role-switch']
>  
>  required:
>    - compatible
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
