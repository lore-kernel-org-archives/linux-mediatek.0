Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D75CC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 22:44:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE4436044F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 22:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE4436044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GBbfB4ZE7wjlzaGgpjoxZ88TPmLc5xLZ2ZRbwlSZRwk=; b=TdCxA/FDVfcKTTp1SGj1yvTD8
	4W3Dh0u+MAZ23L08H7KSd1bH1Sb2kj73+yLI/6+MnWwvwOXtwOGhz6aY1FIwsiQGDFz83uUHTNInH
	df1Mb4SEgMJ8e64ZN0YYk2l+7667J3IX/CDOLcKLQzaF9lnQRLhqqDYUAXQ2qr6g6Neaj8cAswWus
	RcrJHuOMJr+pC202lmARDyzTHAUokKjFjdreXME8uoi5H5z3jMZoMwok/EEM6IjkC9+Me9ZHR0lUo
	9N4ikNG+o2YxuiU5WBbLaNYWKR5gmYtBjl7aC2XxfZrtPmx6CLVWnvdK8W9fOJ89dQt85i+HqiIZ+
	nVf08LQRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOpkw-00FvfQ-5I; Tue, 23 Mar 2021 22:44:10 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOpks-00Fveb-6o; Tue, 23 Mar 2021 22:44:07 +0000
Received: by mail-il1-f171.google.com with SMTP id y17so8027101ila.6;
 Tue, 23 Mar 2021 15:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=To9cZZSfsdpSpDQw0W+UmnGEzxUUpkZfOtO0q/U8W/s=;
 b=G3EuDFXjZ6ZGaG/ToWD5/NyDsEzlqtPGq6yGNAAGfMzlu2z8IjxPNWm9RE1FCZAiXe
 VVHZwfjxJXIW1zEKUG9cmBrCbbhxTlkTToEUSMxHkYstc2dfaedd7M1KxWdLIqtr1ptu
 l5wHg3TL3uPzM4HQ/NrINVYx7KxOr0mRLczvxU5CkiGNDKedpEqiSGxeRDNJGA7kigL3
 Zz7QnuDsggv4hcsGnOccT5emRSqi7ZV/YK+aNXFoYCnbdrXOgxY1CeXBf2LYL/A2cmf6
 Cqo+MHJD8tOD80fYGxzrYsh0qgjoUD01IRtzKprjs3lYTY2opyYSpK/Fpi3qbzlN0kxU
 h+/g==
X-Gm-Message-State: AOAM533FFaa9HCOC3BAbf/2nFM5eFCNkySC0UL+mOqTl4e2jhk+foMlV
 KLcZsxJBHuEZiQd2UBt5cw==
X-Google-Smtp-Source: ABdhPJxqGs67jhtTLty5OdHwPAGfKZPUCrN5SvDX5Ss4Kn3MzXOQEUOV8Zjk+93kV8LZiGFtHI0xuw==
X-Received: by 2002:a92:874d:: with SMTP id d13mr372236ilm.214.1616539445175; 
 Tue, 23 Mar 2021 15:44:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id i3sm116018ilu.67.2021.03.23.15.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 15:44:04 -0700 (PDT)
Received: (nullmailer pid 1485445 invoked by uid 1000);
 Tue, 23 Mar 2021 22:44:02 -0000
Date: Tue, 23 Mar 2021 16:44:02 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mediatek@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jie Qiu <jie.qiu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Cawa Cheng <cawa.cheng@mediatek.com>
Subject: Re: [PATCH v5 01/13] dt-bindings: usb: fix yamllint check warning
Message-ID: <20210323224402.GA1485389@robh.at.kernel.org>
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_224406_370881_6553A523 
X-CRM114-Status: GOOD (  11.38  )
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

On Tue, 16 Mar 2021 17:22:20 +0800, Chunfeng Yun wrote:
> Fix warning: "missing starting space in comment"
> 
> Fixes: 23bf6fc7046c ("dt-bindings: usb: convert usb-device.txt to YAML schema")
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v5: add Fixes tag suggested by Greg
> v2~v4: no changes
> ---
>  Documentation/devicetree/bindings/usb/usb-device.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
