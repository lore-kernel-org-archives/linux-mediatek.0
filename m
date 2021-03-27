Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB5DC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 17:25:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7656B619A0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 17:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7656B619A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TRt7PTzdHrsIbIcSi74G2k6SAhvexPeQsCOG7OX5J9o=; b=BipQcZoTlHYUcKq/S8CLr2C/C
	3X8Zx7/bgNSQBZKqgOzaN2Duk9Kxr+Vz/MzN0FAaA7KQJPA0ZaBgqeq/9NzsGFRJZmLFlpyIG/Dcg
	nE9rwFh1FojeQjp4bQVAqnTXqBuc6lfcQyiy+sxdaqJIrRCmQMsGaGDQ4gEimS30gcj5hU7XkijeB
	e8Bwe19M5VfNZZJ0aNt4GEXqDj+EOe8Qi/AgWUXumyXUi7ihiPGx2TEL0/7UNifd90vMuG5F1FjZs
	E0LoWf+cJeLNETAbzja7Q8QehB8hFOhUgqrgZyVNLM9hqiGtxzgTui5h3KNR4cG9K3aNr8NV0ylQE
	p/UewhFiA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQCg9-005LK1-QP; Sat, 27 Mar 2021 17:24:53 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQCfz-005LJC-L5; Sat, 27 Mar 2021 17:24:45 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so8307667otn.1; 
 Sat, 27 Mar 2021 10:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9KcE+QgrUuQXuE2OHRMrLAz8ThBgbzr+7gew1p6Sfs8=;
 b=FfrsSIS1j+47nBm5PecrMafLhEy4/YRQf4CN/umKtCaxxfY38wtZvprOxZ7o5zBKw1
 Qsd2nw53q7g3erjIH+aau8wFg33syUCyeAW/s8O0CS3Z62AziAsay9/AnfGU2VGWZn52
 eWZmFBb+wOw+iRe8cJXIBakVOJJnlZosrEJvtIKtXcZzLSHzfl2Avo5Bq22FqPmfHamr
 UGp801ytcJn3PXdtoHmu5wfk+nf+NNzcwwyu0lQg184M3r9a7INBBY43bbzL+TeQYg9l
 Xuup7gqo4602NoZ3zbkftnGYvCiewDX3p4cc+KVwS/GwPvFK5MjkbtBmiFJClq3y5mhr
 WNAQ==
X-Gm-Message-State: AOAM533EBNx0HpPacv7PsDa0hAmzKkKeViiigD6nZqpd/vDheYfuVjuo
 8+YY75z/3yVlzQydXKGUuQ==
X-Google-Smtp-Source: ABdhPJxmOLqcGKblP3FioISsj/PKoEKfEHBIhelUfWzhfJ4Qr92xjql0UTWYq8up9UX9BBsep6mh5g==
X-Received: by 2002:a9d:2628:: with SMTP id a37mr16901446otb.366.1616865882565; 
 Sat, 27 Mar 2021 10:24:42 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
 by smtp.gmail.com with ESMTPSA id r10sm2997394ots.33.2021.03.27.10.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 10:24:41 -0700 (PDT)
Received: (nullmailer pid 275943 invoked by uid 1000);
 Sat, 27 Mar 2021 17:24:38 -0000
Date: Sat, 27 Mar 2021 11:24:38 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Eddie Hung <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v2 01/13] dt-bindings: usb: mtk-xhci: support property
 usb2-lpm-disable
Message-ID: <20210327172438.GA268453@robh.at.kernel.org>
References: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_172443_980992_845660FD 
X-CRM114-Status: GOOD (  14.01  )
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

On Tue, Mar 23, 2021 at 03:02:43PM +0800, Chunfeng Yun wrote:
> Add support common property usb2-lpm-disable
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 14f40efb3b22..2246d29a5e4e 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -103,6 +103,10 @@ properties:
>      description: supports USB3.0 LPM
>      type: boolean
>  
> +  usb2-lpm-disable:
> +    description: disable USB2 HW LPM
> +    type: boolean

Already has a type. Don't redefine here. Just 'usb2-lpm-disable: true' 
and make sure usb-xhci.yaml is referenced.

> +
>    imod-interval-ns:
>      description:
>        Interrupt moderation interval value, it is 8 times as much as that
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
