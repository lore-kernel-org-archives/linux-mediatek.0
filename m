Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16E8C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 02:14:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68C0960FE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 02:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68C0960FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pQhGkrRWf/2rCXa4CKMUR/zhu+dUrLgzkk1YMQQUi8=; b=dw5dae7z7sMZpzTSdhTXgYd7bQ
	mdhvPHe52TJ30YFOI5UNXbxRDze5AAbuqmryDSRFjM3UB7xlzckhYA8eyyYpQHRESq9rRp9SeowXM
	Ig5ho66EU5B5PVTXZ4SqvXw1xcTOonBIlicf60XB9Y2cWpSWj1M9HFuKN9zsuKimQvUMLPypO7S4f
	Jgu6AbkECsQhkHv6UWYE0R/YmFwl1nYSyu2Y8IY8aB3wrSHdijsAft/tgxVsgGbm6oigO9HI8SWO5
	+evhH6b/juz3t7eHTHwgV7CAXatq4T4R58J/0jz2d5WehUfF8FZBzpjtA/SlbS1nUviZCYvaPGFtD
	RScz84ZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljufc-003Sdw-W7; Fri, 21 May 2021 02:13:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuWQ-003QVt-CK; Fri, 21 May 2021 02:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/OGghJHG106SuqKR1QhblR0v6y3pgFgWrTyUNUTN0wE=; b=MIfivQ7F6NMH21RCf7mn60hCaW
 PM3Ti6sgjBnJPq74yrPqHj07k7nqJQYq4/ymFBVtMhQRoDHoE4zDaXXP67EkQWP2UpfI+ZFhDsLUC
 Ny6SrfH1eojopbtsbGyYhE73eXwyY48Kx/1Zegau16/y2YvS7RrGIX+/rHB6042tqKgXlxJAjJXE7
 EU20jduxABea0F7J6xSBeOyQKYhMXXK040QSbKYQk52Q1pyewZAx2v91Rf4D1FEdGYGb79mSwMfef
 QgaCwTLkgstrLj+RZpTAwET0RV8OepYOFtwLgsEpDYtQl/h+KA8KgHatEPCddx6e5Xfxzml/32DQB
 8N5FJXKQ==;
Received: from mail-oo1-f53.google.com ([209.85.161.53])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuWN-00GlOe-N4; Fri, 21 May 2021 02:04:16 +0000
Received: by mail-oo1-f53.google.com with SMTP id
 o66-20020a4a44450000b029020d44dea886so4241116ooa.5; 
 Thu, 20 May 2021 19:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/OGghJHG106SuqKR1QhblR0v6y3pgFgWrTyUNUTN0wE=;
 b=REOt874VbMt0W2wF5jQVV0NtTsgDtVnX7A+cCmfPda7nT/gXqA+8yK5hBiDt0KQpZP
 KbwvyjH3c7s4IaGWUMyhirCbcpsRyiiYCLa3ZzqwQZBlezFcq6/AOYZZpzlyxbVG5fkz
 500wYckYz3641/zB2FjsLJWnZeq36jMd6X0iKKO9o/+CeIQ/g1dXL2zOHyA/EBTkP0Xn
 wW4hkfgokt3so6azp9p4vZiw8iFhwpq6s9zRenmPjZceBYKqpgHjOG+NWNt9JwHsHuOD
 n3l3jdDAxE3oyrVia0be/Vm3/rArPQQGoYBCLp7HVv6wNvLLNRFrD+Aye0ywuhhPOMdM
 ExIw==
X-Gm-Message-State: AOAM532QPle32Qe0OKIyI6UELtWaZycDmiVp5G6nqIIE2VF3vtZO8v42
 LBjvQLQrKyinHeCSkaDFbxXoKg3FSw==
X-Google-Smtp-Source: ABdhPJxce3VVn9haIq3nvXcLvbajq9qtS10MN8rsPsS5TeO9pBfLXmkcP8odoYhDzmoUk703Oi1nXQ==
X-Received: by 2002:a4a:d442:: with SMTP id p2mr6077638oos.89.1621562654437;
 Thu, 20 May 2021 19:04:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h59sm991917otb.29.2021.05.20.19.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 19:04:13 -0700 (PDT)
Received: (nullmailer pid 2507565 invoked by uid 1000);
 Fri, 21 May 2021 02:04:12 -0000
Date: Thu, 20 May 2021 21:04:12 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>,
 mkorpershoek@baylibre.com, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: rng: mediatek: add mt8365 to mtk rng
 binding
Message-ID: <20210521020412.GA2507536@robh.at.kernel.org>
References: <20210520111656.66017-1-fparent@baylibre.com>
 <20210520111656.66017-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210520111656.66017-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_190415_769876_AA463633 
X-CRM114-Status: GOOD (  10.76  )
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

On Thu, 20 May 2021 13:16:56 +0200, Fabien Parent wrote:
> Add RNG binding for MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> v2: Write the compatible in a more compact way
> 
>  Documentation/devicetree/bindings/rng/mtk-rng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
