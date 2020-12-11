Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40B3C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 03:27:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 599E223E54
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 03:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 599E223E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fwFL/OeYe6KlqkccKHUnSpjdFXUv783Hy44cK4c/qUM=; b=M28Af97feq3CjwDhK6Vrvfs/L
	1UoMcuGjyDx74xq/PMNB5ogiFl3LIOuVtNjsXuIfGZcX2RCCq4mbKTJAs548NFFkrMIwWgUmqIk4A
	8llsrlrWILfD/eOO9LR5gqO1uybN4gogG7+rRMPrJhK5sSa3hnBbhuBVY7VbjiwQOQAtDtoP7V0Ab
	DF0HKTpqYC7yAplBzP9CEiCyU7UAWUsw9PlJjaq/+nAgIvgUkhw3aZhilvH6CwEBU6ex5ULzFe4N5
	iItVbZvCYLCyTQAw1clRuim0PiBAIMPLvblXT4SNDKewDtmMJkcjHvBwY/2RL+tfS7NKa5qLmLbk7
	1XBdVYMrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZ54-000479-6w; Fri, 11 Dec 2020 03:26:54 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZ51-00046d-OP; Fri, 11 Dec 2020 03:26:52 +0000
Received: by mail-oi1-f195.google.com with SMTP id q25so8328357oij.10;
 Thu, 10 Dec 2020 19:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4pSkh7E1xr7wTWhVvXeOpIs5QlUy2hJdM1nCPWkeLMQ=;
 b=si7Pn0qzNMqhPQnV4eL0gVHc5TVxgR62RfxXCXdApc65AK23QVjpMTwkoykgqhlOI6
 yfO7KRpX4jd5pT3yw6WkxuIbqLPP1E9hZ+IFMPmelkn2AJ/8fuske7Z/QWvsD3r4WMen
 wW6LUVIPwBCFwq25BIykHqe59g/CjYH+4N27t3pFnKhMEvFZ8Jsez3w/B866S+mNOkwe
 dw2RR+pNIsqVM+NMVG6KXcKoqYRGD240gqPjcH04sSkWiNxUaxMnatfihGhHaPK+qUFh
 Vc27X94vvaaKVW37Qoyjsx7QLEOkprLL3YK+yNaltmCGkfzVy3CV7J7tVuh44PzFpKn+
 idQg==
X-Gm-Message-State: AOAM530BT/VIk95kXbo4bY3SOgI7GXup2vcC8GeDR58Ka2+E6YYQoS6S
 LQkqIIKjAuUdqM0yi/lf3Q==
X-Google-Smtp-Source: ABdhPJx5205LO26MqKp6Ub/kuVoybUxxhoy/4Vq3DLkmE1Wtdx0C35k3JVlobELwVo+TakeaqYmHyg==
X-Received: by 2002:aca:5204:: with SMTP id g4mr7858444oib.91.1607657211132;
 Thu, 10 Dec 2020 19:26:51 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q18sm1473097ood.35.2020.12.10.19.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:26:50 -0800 (PST)
Received: (nullmailer pid 3575040 invoked by uid 1000);
 Fri, 11 Dec 2020 03:26:48 -0000
Date: Thu, 10 Dec 2020 21:26:48 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 05/27] dt-bindings: memory: mediatek: Rename header
 guard for SMI header file
Message-ID: <20201211032648.GA3575010@robh.at.kernel.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-6-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209080102.26626-6-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_222651_807600_EA8A3A2A 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux-foundation.org,
 Tomasz Figa <tfiga@google.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Evan Green <evgreen@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 09 Dec 2020 16:00:40 +0800, Yong Wu wrote:
> Only rename the header guard for all the SoC larb port header file.
> No funtional change.
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  include/dt-bindings/memory/mt2701-larb-port.h | 4 ++--
>  include/dt-bindings/memory/mt2712-larb-port.h | 4 ++--
>  include/dt-bindings/memory/mt6779-larb-port.h | 4 ++--
>  include/dt-bindings/memory/mt8167-larb-port.h | 4 ++--
>  include/dt-bindings/memory/mt8173-larb-port.h | 4 ++--
>  include/dt-bindings/memory/mt8183-larb-port.h | 4 ++--
>  6 files changed, 12 insertions(+), 12 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
