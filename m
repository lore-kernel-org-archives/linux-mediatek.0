Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80264C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 02:29:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C82064F38
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 02:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C82064F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t5fALFyfEo7fKgaPBzqTHQtt6+4XLlN2aMLDMh45ltE=; b=fZCZmFff86xbQNOvfVOqCE3i/
	8a/aWPX+vzMn6pGzOsTZFxO9mxPD0rvWwSeUxjWcVTG2h9stLpo7zLiGjDVvb3MtLJmHnxylkoF4m
	1Pn4daAeDldOMxpiCuMSEj7NkaA+1Eb7z23X+SAirtH5PUeTFrSOz4qyKRgzCHSeCNucrptLxcJ1I
	SD55zoS/0Aj8ypQPVFJ+I9HqcOiJ1y1nVuEBv0pwFmTyTCJiISWcf5LHMucZB7VQ8OPzR/MgEtyll
	wjAka4D99YcRH9WuaPEZfaeUObvE/NHsucUsp6umjhGAY/PeGxPcbxxMo63JcARvACGwcox4ORslA
	WRVZGyhFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJoaM-005o4J-9u; Wed, 10 Mar 2021 02:28:30 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJoa9-005o3X-Si; Wed, 10 Mar 2021 02:28:19 +0000
Received: by mail-il1-f175.google.com with SMTP id e7so14100856ile.7;
 Tue, 09 Mar 2021 18:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H/PbJJ+B+OfvmyZFpcyfF/sjb4tA6E0cFD7ESjMM+e0=;
 b=QPp3VHjmMwssuQCD1ZSMu+rGQU/Amc0bHq8zIBz3TWNJ6+X0lXsyqKNxRv+pNiE1rM
 WOgbWQAN3624h8V7SYLhz0k1eSQf+6a6QUvMD5dHQuU0NvnJx+gSc0AiRC7alpj8rGE7
 3KX0RgEvTr+32vMnZgvXwV9xX6U3erdwP5V7ZLXrPLgEHv3S4tHVxpEMoY3l7eeqluGg
 zVtywppure6/y7DmvdpcnpdiiooU0/CxMzMGJHjMDhHHI1ebaRfpqnSWuylqLPx9y64i
 jcCAUK7fDcs4Q2VV6WIYTmEyLECSGbqkBn/r+rDshiWjFFJQhh85zYxBgFVV/WVU/etK
 rX8Q==
X-Gm-Message-State: AOAM5334G0A0SHOne84yb/u9t9S3M8NbSEz+FUaKdHO6EPL/7RG1LxMz
 P8DQil51TyCVWvC26r4tmQ==
X-Google-Smtp-Source: ABdhPJxaBqWxJBySm+R6hLqmNeaFC9yTJW09h+zTC0LttNCVmJdKatSxs4V8sNf0p307tRVKiggTJw==
X-Received: by 2002:a92:6510:: with SMTP id z16mr1137919ilb.88.1615343294967; 
 Tue, 09 Mar 2021 18:28:14 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id j12sm8238945ila.75.2021.03.09.18.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 18:28:14 -0800 (PST)
Received: (nullmailer pid 1613968 invoked by uid 1000);
 Wed, 10 Mar 2021 02:28:11 -0000
Date: Tue, 9 Mar 2021 19:28:11 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 01/12] dt-bindings: usb: fix yamllint check warning
Message-ID: <20210310022811.GA1612587@robh.at.kernel.org>
References: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_022818_032886_B7E868E6 
X-CRM114-Status: GOOD (  17.73  )
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

On Mon, Mar 08, 2021 at 01:37:34PM +0800, Chunfeng Yun wrote:
> Fix warning: "missing starting space in comment"

What tree is this in because I don't see it.

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2~v4: no changes
> ---
>  Documentation/devicetree/bindings/usb/usb-device.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> index d4c99809ee9a..b77960a7a37b 100644
> --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> @@ -82,9 +82,9 @@ required:
>  additionalProperties: true
>  
>  examples:
> -  #hub connected to port 1
> -  #device connected to port 2
> -  #device connected to port 3
> +  # hub connected to port 1
> +  # device connected to port 2
> +  # device connected to port 3
>    #    interface 0 of configuration 1
>    #    interface 0 of configuration 2
>    - |
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
