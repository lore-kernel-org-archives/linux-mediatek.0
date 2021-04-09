Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE5CC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 18:42:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C84661056
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 18:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C84661056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TTHVHuz4AeDBDpfipeRk40jf4gzKcwgB2K+RCfB2Gpo=; b=T2QFpFewUsou9DniRt3h0H4hB
	8HVB83SILVrpy4A3cPGqkL5NNIa8DQQsyIJ3uBRSGYOsX+wPbRgKc/GvQuW2haC10XntGzT6wPpOz
	123WNzLBkvsXir0rOZ5KAFarcV1h7wf2FeiQ6DsTr8QdyaVSRRgSP1wsIFGGCxk1fW6sCnwgv6aDo
	IwiOe2A3DJEAf621FrKA/xr9PB4bmSQjpzqCrjOfvnTjvhM8LAjyesMK7F8jjZaccXuYdvEwx07Wg
	MfJzybVHVtNMqBir0TudOFd7Tq3lxXL2JisTRcFNJM2zcn7N5uYM2XOCeV3XOc7JY1yBpGCriN3fx
	HalLm0TQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUw4n-001MOk-Qi; Fri, 09 Apr 2021 18:41:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUw4l-001MNl-T1; Fri, 09 Apr 2021 18:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Be/CGte7k2+pzdht/VJSu2yAXKvsFO5z2CA4PlW9wRk=; b=YFeqD6hrCzmMC61XyT2J3aZ0Z0
 2DdWePzCjw0EGzvL2Hgg3Ln+qZ4QR3a6spp4UkgVZwrh31KSvWdduBkrkxtQ1kqbD+4/vPFqW8kHV
 YnxuPcePPfqT6svPEk3f2/kdfTBee90qwUq7PDNz+ptijntH04x+uLEVCukDH1er9fUeFyiFxGc36
 HEq3eHKROfVaDyHuS+CfqUThWjVieyxyaEOnWN3FZB+Qv5GxtzUcJ/LHTAanjzVSVftqVv+tzXQHm
 Zt5lfDq8VyAQP9eAk9LGezJ3cfkPWmSo91O45/rbWOEgESh8dhGWMyO2LRRwWPSXv/XTLwyP0UwII
 eK88idqQ==;
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUw4j-004ja9-Gu; Fri, 09 Apr 2021 18:41:50 +0000
Received: by mail-oi1-f169.google.com with SMTP id z15so6726439oic.8;
 Fri, 09 Apr 2021 11:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Be/CGte7k2+pzdht/VJSu2yAXKvsFO5z2CA4PlW9wRk=;
 b=A6YHrAig29UQV0BtsVByZouETcTfwsRWw7j+rXXV7PEjTQFe1kz0lDSKzDAw15Flf+
 eVcpni5VKbreju5RrNFVWty20HL/VPStBLbv5IO/ig6Rxi6fWg2XS5oTwJq6ZXHQFAUG
 rMUCVTVL/Od/Ldwc1Lj8I3Of8o9Q644qcAntyYeOwOsb8vGcn0lJzN8JHwyBCHWCLb+B
 KV274gRvOoD0wsIUKW+jiH+KyvtLPy6WlORFm50p7QX9v1rvgt2GUtD4FoiAGFRNGl/I
 u8xHHa8rGReiyFOuUOLMi2vwP5h1zk6JrpToydq5LH9CPFY6R8+IRSVHtkQjlI63xMr8
 WIxQ==
X-Gm-Message-State: AOAM530KfLHnaxuE71QyIGAy5n+0sZvGzfWPtABYjX88xVzm0g2GmMgA
 AUZEQ0N0SQfMG+neOZ4h/g==
X-Google-Smtp-Source: ABdhPJxKSP8UJhYi3OWcPGvoRcKB97sjKJNex1pSUCZMF2CENuBOIdO8LLeB7CRM9Nu6Uwi9mPSLfQ==
X-Received: by 2002:aca:4e55:: with SMTP id c82mr10805300oib.43.1617993708908; 
 Fri, 09 Apr 2021 11:41:48 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 128sm669713oog.37.2021.04.09.11.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 11:41:48 -0700 (PDT)
Received: (nullmailer pid 3937739 invoked by uid 1000);
 Fri, 09 Apr 2021 18:41:47 -0000
Date: Fri, 9 Apr 2021 13:41:47 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, Len Brown <len.brown@intel.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/6] dt-bindings: usb: mtk-xhci: add wakeup interrupt
Message-ID: <20210409184147.GA3937709@robh.at.kernel.org>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
 <1617874514-12282-3-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617874514-12282-3-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_114149_583555_97CA4159 
X-CRM114-Status: GOOD (  11.82  )
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

On Thu, 08 Apr 2021 17:35:11 +0800, Chunfeng Yun wrote:
> Add an interrupt which is EINT usually to support runtime PM,
> meanwhile add "interrupt-names" property, for backward
> compatibility, it's optional and used when wakeup interrupt
> exists
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml  | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
