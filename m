Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB5CC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 19:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCBB561158
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 19:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCBB561158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8GL/LQplVjiCFSdFNb4BEcEm3DjNJd6AY1EDUWaFKY=; b=krGJqub+Kdm4t5
	vVWRmK0VXyMg/KtKnv+dab5qXBjFMfC5PhlFtrxN3K5quaLDF25JKZkaEapoYUwZwu/UY4uYj/UoY
	RNi4rGG/6jghVokZ136wKT/neSrxi4l5JREDkOk/2QgBaLnswIWJVBe3LExihu/S04Kk9Ht+zg4mZ
	ZNqpZgdVCYsUkn4rABbnjksPtwDMRo1Y56p4rutukvwMkFpGPSTRlTM/qwLdDr4k8NpAh91WbyCyY
	/0kB6YPDdZl/Ezng232ho1hyiOj4qkXvK7vPkRxW+U5ZH9Y0Oqfl33nDIyEaFIsmSC3i8orvTJkXJ
	Tps0LJXLXsqJJIzJaVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m31Ip-008ErF-IH; Mon, 12 Jul 2021 19:09:15 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m31IZ-008Eju-4k; Mon, 12 Jul 2021 19:09:00 +0000
Received: by mail-io1-f48.google.com with SMTP id x10so5216234ion.9;
 Mon, 12 Jul 2021 12:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CAts2agLd/mnZviBBFETzZ77DFMUAMf4FEiPP0zP5RQ=;
 b=mQ6bkUjkv1tM3BNvpMWdjrxA3OtaNcQHcXfKKgCB4mnHNLPJf7pCP2Nda+ivpZ70p/
 eeA3rAIHPO+/2JJJCX8INKGRovwjsm/yo/MVjDOAiMHJpqMxU3ONPR/Kv9THA5CJjHxz
 nPyzOR8dKeHR5mUaqpQvn+F8tDMNKMOOODMQYwA1tGBoI8ibeCsi6Lb6NQo4xq6eXWoL
 LSOT3xmx5HtjH/k5rweqJRx9Urx3wM14HIysJjrJKJO6ei0Cz+90TZ1HpNGxxKOumhLk
 nOjCgpBiSgIqV8/lDstJoLCHo7GqHKzgSNEZn+k2yVCn4xbpO/CYdcGY5RfQOVh1FCJJ
 0IeQ==
X-Gm-Message-State: AOAM530X8RmvKuJtKwHofzmrF4MO458enG3spze3fVlLiIQXcmzjBB6A
 dcZwQMTk9KaTGmf3fKN93Q==
X-Google-Smtp-Source: ABdhPJwjUsnO9+0Rr9NHf6pQZ9akG6i4y38MYh/3uuw8waRTheMGMZgLA8Exn9crR+H/HHiCNGNOXw==
X-Received: by 2002:a02:a68e:: with SMTP id j14mr463927jam.104.1626116937046; 
 Mon, 12 Jul 2021 12:08:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id b8sm8308873ils.74.2021.07.12.12.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:08:56 -0700 (PDT)
Received: (nullmailer pid 2312971 invoked by uid 1000);
 Mon, 12 Jul 2021 19:08:54 -0000
Date: Mon, 12 Jul 2021 13:08:54 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <balbi@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 03/13] dt-bindings: usb: mtu3: add support property
 role-switch-default-mode
Message-ID: <20210712190854.GA2312937@robh.at.kernel.org>
References: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
 <1624008558-16949-4-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624008558-16949-4-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_120859_210407_9B66BEFC 
X-CRM114-Status: GOOD (  11.90  )
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

On Fri, 18 Jun 2021 17:29:08 +0800, Chunfeng Yun wrote:
> Add support optional property of role-switch-default-mode,
> used to set default mode while usb role is USB_ROLE_NONE when use
> usb-role-switch to switch mode.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
