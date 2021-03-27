Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED23C433C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 17:29:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E0236194A
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 17:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E0236194A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6u93yPoBnXm2pfwopUUNxefPIIshnofF+6BsmmfDeFM=; b=IIGhZH0gU1SXP8ZgIxK9avHN8
	UtTlqAKEW4K89M0TBqeA+Y9JNoiMydofPXg4olbnKEeavHAkNIzjQnICVcftqz2f73wjsmJNJvoAn
	PAbpDXCgp/8+QdhkJvTOaMG8N5IAHnao4Qxhth+Xa1gS1po0fFckH0Sdzh/LJYIak+8+ITL/CQTUB
	ceVdCRjbDp0E3eGHXfYhZH1UKN92EZ99XgBgIFgeSRhRlsv228OKAuDD3SBMXhz0NMaQZgYVqb4ZA
	dAwIrHFMiMzvjYBAOoTeO8kwsNBIInDpS6KLrzqm38XgciR8s6EutRhNZ/Se5vOgMa8jARRauFhiD
	EjjcxNh6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQCk4-005Lk3-28; Sat, 27 Mar 2021 17:28:56 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQCjt-005Lig-69; Sat, 27 Mar 2021 17:28:46 +0000
Received: by mail-oi1-f176.google.com with SMTP id w70so9096749oie.0;
 Sat, 27 Mar 2021 10:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=43kaMhB3q/Kj38hyiBJmFaUkUztVOtgdfAsesdOAszA=;
 b=hRKGMpmSSa3R94Ov4qJ3SL3vfXhHRC+eBq+xoDuTBzsc1KAKtJgA2pynop+WIu8XX1
 0nZhD+v0+X8Go0iWW1xzKjNSSyQFuXrmEojqgw0Vo7QyFW5JClnIEF7PcKhwJp/MI309
 U280PI3tsAXci25Ez0rSvZ2Grh4NWRiASJI/Tnwh2Y54QY6eAs2zTswvEf39hO8wzrBX
 cNmEIEvBw0e/+fNatAB1j4i7zbzyrY9oBvgPNKb5Geybz767Hxioerf4r78SIQabVxyV
 Qi03SGPvW6dF3qHIOIYmT8frQ2CIZpFqcandIkX9RURB2Q/TCaKWCXf0CTmQfg/eDP7a
 Kcdg==
X-Gm-Message-State: AOAM532yG1Bu+v+Uxf3L07GPBwL6q85F8xlVEObbx6gD0vGFpVXnGj4j
 hdtTQZDE2TZmq/metuSDQg==
X-Google-Smtp-Source: ABdhPJwnDrTWcH4ZbP9AsCzdaGXUuDULIbvwhDZ5vBzuAa7ucioqsV+K9RS+lK09Q2VOPmpau0ZYfA==
X-Received: by 2002:aca:b787:: with SMTP id h129mr14030961oif.58.1616866123966; 
 Sat, 27 Mar 2021 10:28:43 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
 by smtp.gmail.com with ESMTPSA id i4sm2459520oik.21.2021.03.27.10.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 10:28:43 -0700 (PDT)
Received: (nullmailer pid 281403 invoked by uid 1000);
 Sat, 27 Mar 2021 17:28:40 -0000
Date: Sat, 27 Mar 2021 11:28:40 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 03/13] dt-bindings: usb: mtu3: support wakeup for
 mt8183 and mt8192
Message-ID: <20210327172840.GA279100@robh.at.kernel.org>
References: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
 <1616482975-17841-3-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616482975-17841-3-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_172845_297819_9EC06511 
X-CRM114-Status: GOOD (  12.87  )
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

On Tue, 23 Mar 2021 15:02:45 +0800, Chunfeng Yun wrote:
> These two HW of wakeup don't follow MediaTek internal IPM rule,
> and both use a specific way, like as early revision of mt8173.
> 
> Due to the index 2 already used by many DTS, it's better to keep
> it unchanged for backward compatibility, treat specific ones without
> following IPM rule as revision 1.x, meanwhile reserve 3~99 for
> later revision that following the IPM rule.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: modify revision format
> ---
>  .../devicetree/bindings/usb/mediatek,mtu3.yaml         | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
