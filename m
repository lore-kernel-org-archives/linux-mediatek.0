Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DDBC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:49:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3391F64E6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3391F64E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fFIggMSLU/WyfW4XtYhvGi3yRIT+tRmMkEHIyjNGp1Q=; b=jk55Yq09nOld+SY+kXgry+piR
	joSWEIkqVaUzb65Bep+PRZEetObyq+vNZ7Z8eC7Fparz2tsAp9qaVfbrEkMdMEVMEnSu503TWj0k1
	gMCnhMj37LjOuljTTWq/3DTY9Yot2JL6WPTrBPkv1ZrNERyfjg09FRfFOF62h0pjZgL7MEsgn+JH3
	m61TmEDd4PXplpHR79BJLrQvwA+k6Ss7XL9W7/KYo955Mo/F43lO1TuTVsFxo8nUj/ksG7Y+QxEeW
	zPd0F3VH5I0NDAf5F6YrMg6zN0oYmQ8mp59ejz9Iwlayjyb3wN0WMEtt+hJIQkTRnozYzCMRtcpxI
	JnyiBuQiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9ZwY-0005ky-CY; Tue, 09 Feb 2021 20:49:06 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9ZwW-0005kH-QJ; Tue, 09 Feb 2021 20:49:05 +0000
Received: by mail-oi1-f174.google.com with SMTP id m7so20874963oiw.12;
 Tue, 09 Feb 2021 12:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kZg0YSVP+RYC0Ye5U9uEUqshiAXagYrgvYF8cSBhWZY=;
 b=PdWz9YJPh3oRYMS57q+NCcTUEoFkP3mb10O6ZShuKzioORJCf7Ef0HfIXgXc84UhSg
 X2EbrYAMacFaLdMDULCGtsiJ0jcI7nctp/3f+n/vdD4QpoqJA86qQ25u4iGqyf+1Tcyu
 VAqrddKhbnamC6JFSP9TYrAoeKT04evxwYmAX9DugIEKwaIl6nV60FIrIpj0wWr08qG1
 Ujv+rfe2AgY79EQJWeoGLhQiZqkmVxOTzVj8EoKAt0tcgZ8Xq9Bnk4YMDA/7IVuyEIB2
 GZmRGhbtaGB1nO6oxqzOHWq4tsmvBpj+nlpfUGxmlxpVBbn5OH7ZlAhEp0EwVFuP0QMj
 imSQ==
X-Gm-Message-State: AOAM531mny/j+UPJFGX/QutssuVqlppOjEVY2mEkYJaKcIJifXARxeag
 FcXvhjRltPNIj9XImyUTKA==
X-Google-Smtp-Source: ABdhPJxzW2te9n33SGwrMlyb8WB/trBkbriR0NJ2iQxRfdRAYmb9sJYZ1n8iOYmAEjuyjkBSjpVSqA==
X-Received: by 2002:a05:6808:5cf:: with SMTP id
 d15mr3589604oij.69.1612903743737; 
 Tue, 09 Feb 2021 12:49:03 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l67sm1090581oih.57.2021.02.09.12.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:49:02 -0800 (PST)
Received: (nullmailer pid 152013 invoked by uid 1000);
 Tue, 09 Feb 2021 20:49:00 -0000
Date: Tue, 9 Feb 2021 14:49:00 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH next v3 05/16] dt-bindings: phy: mediatek: tphy: change
 patternProperties
Message-ID: <20210209204900.GA151981@robh.at.kernel.org>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
 <20210201070016.41721-5-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201070016.41721-5-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_154904_874747_CCC13C89 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 01 Feb 2021 15:00:05 +0800, Chunfeng Yun wrote:
> The phy may be named as pcie-phy when the T-PHY only supports
> PCIe mode, it's also the similar case for SATA, named as
> sata-phy.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2~v3: no changes
> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
