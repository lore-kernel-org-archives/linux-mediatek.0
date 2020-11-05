Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44027C4741F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 19:03:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B305C206F4
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 19:03:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GacT8L5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B305C206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5tWOOFPp6q/7nmGwF27DDS7af56ha3lp/eedTsXNh/I=; b=GacT8L5ocDSaPHJTFKsf59o/1
	pT0H/UFThaDguiYvKI+D6tf6igDM/zPIi9F1FA0ViaVZJVEhAqqR+jUwlx55+mPfLC6z0c8hBO5eA
	udJhW1serxegbO+kndr6KpICVEpNZLF7bZ2MSzDnEaKdCBrVf6bKowtrJS/8I9mc/jxwIvz/3g4iC
	EGXg+QYcw62cASIv1kTcyU/GJF+9WXY7nOGGXKXqB2N18Po0ffv+SEczKZZPSxYZxAbFcD3eD20iA
	NYKysYNRgcb49GAXA8cFv7OQeKAyFzhtd8ysNcCNnyJtbL9vcFSmJAYfUIrW+S7EM2Rou8/xcWUFT
	1Vccdd3Gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kakXA-0003nY-Bn; Thu, 05 Nov 2020 19:02:56 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kakX9-0003mv-B7; Thu, 05 Nov 2020 19:02:56 +0000
Received: by mail-ed1-f66.google.com with SMTP id a71so2658754edf.9;
 Thu, 05 Nov 2020 11:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WRATYPVVpUj0dIlvu1sSRL+DjOGoPhuNmDfmJZyE3X4=;
 b=f/DsMjwjwzF1PKldnGT+VsrNhRc+NSSGgpiEg4PSbQV5D0iwEGHTM9SCFSfjWncgOt
 fPqdijOSqXBO43ECR+hsxlL8H0eTL42JLG/fq7X7i6Qv1kZC+jZ0pE8Loxl21pUv09or
 BkAHOzravGn32fYoVHouIWkoLiVU3/SWjMO/ESCoczYBm8r/zhDSk654DhmK2rE/z1Fb
 xujEGYnY3CXoQ9kRdXW7kHUobxOKRTC9THPlNn/9qG8z+QTT4geFY1Q5Z4LRGpOuNXcJ
 XK1iiuOCB6v0aToRzvkTKWAkSUMewi1yfbvpcojwaE6Mm4bDEdPtkgLnHQCvqDOqd7Ue
 rOGg==
X-Gm-Message-State: AOAM531KaUTGKVuZ+o17C+Y2UOMgQQ63itfjhXdX8gkZofXeHvLD9BgO
 HdXakZCOCNzQ1pd6hxcTbDs=
X-Google-Smtp-Source: ABdhPJy4eek/pneQf2INHGzsXHnasKODWlCZYK99ygc4HT8ykdbZgCZY3RkkdXqf9JumHekNW1uKCA==
X-Received: by 2002:a05:6402:4c6:: with SMTP id
 n6mr4246361edw.204.1604602973903; 
 Thu, 05 Nov 2020 11:02:53 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id e19sm1472305ejz.35.2020.11.05.11.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:02:52 -0800 (PST)
Date: Thu, 5 Nov 2020 20:02:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: memory: mediatek: Add mt8192 support
Message-ID: <20201105190251.GB217610@kozik-lap>
References: <20201103054200.21386-1-yong.wu@mediatek.com>
 <20201103054200.21386-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103054200.21386-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_140255_397629_6D3F3618 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03, 2020 at 01:41:59PM +0800, Yong Wu wrote:
> Add mt8192 smi support in the bindings.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml      | 4 +++-
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml        | 2 ++

Thanks, applied.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
