Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99993C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 19:29:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 453836115C
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 19:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 453836115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KtV6ibtm0Zl7UKFFacdAygahnf4Qr16DDmlk2MGjVQU=; b=b4JGqzgOTvkVQlrJiLwbkloCZ
	rvxnJCMdjNlu2nkYunk2oe6rcsGy24AbixA2Nu1SXYNv6zuVRCPwnEP50witWgP3BYwx5WgJQOSQl
	tkQG17zTQL30X4atMDpo5124AmJ4uRCKZjOEdC7bcRoo6lMVdDDWSq3BzI99apnDUTD6i1Uq/CBnS
	xHJKO06QN78wWjYRH6Hw71ItgwqBxlQ+lnAcOmXPrh1hYfjzrK0gjACrEsM+KLVUC6MBO9eHBu4Gq
	4SGNPyHewIrLPA93xo7KJpsbRY04ZxhKOb5XJ9HiwcImC6kLyU/Svbq3tgKJRO2fGSLn7bnZKUdpH
	obeYFWaCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldeFQ-00EiN9-Nx; Mon, 03 May 2021 19:28:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldeFP-00EiMd-AY; Mon, 03 May 2021 19:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Jhhpn9NYBV5aYOb5xCU71puhRz+23sT/8/8mM+p2NaU=; b=l26wSPcFbq+6MO2LZCi55vQVi0
 yFPtCsNvFOE8Rk2HaHTGh0mSfh+VH6HDiNRO2+qAF3/O86iKaeuUBYKN2IPO5ovMOGnsRffCOLCoG
 nxdPnW9oX91Rt9xkpsnM5flerksxEMbwYpD13ZhGFXWy3A8Q4RfBm0kCkDMMGiFFN9gRUUI9DHI/5
 x71G+aMCxZABsSS50osGnZw3S7DJjuvn5acXs4PNr68ORb/1RSUaD9HHKJzmFyAdqGIWWcr6djgVy
 rEtYNLpQNJx1QaquWMW2yfD1bRkyasaTaaAk+QXmRh3XgdCnLhsPjLkTsP0wFYwZBgogtXNGpxVjz
 BWW1/DKQ==;
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldeFM-003Qut-Lz; Mon, 03 May 2021 19:28:49 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 x54-20020a05683040b6b02902a527443e2fso6140814ott.1; 
 Mon, 03 May 2021 12:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jhhpn9NYBV5aYOb5xCU71puhRz+23sT/8/8mM+p2NaU=;
 b=nP7t4wZOB7iBZgBSmIYXRrzi5dGrCsfye1UjKGj/3GMdIQ8tXsPlxDPpYPVDIs9rNY
 dSaFeA9C6eiPPc17aOcFkz1BjxH+Wows7Jg1jl9J9M3YxD3l6HQXx3ovyKR7uTSi9lxB
 Tm73b//D9bimHUps/1r6rBn+uhUGWobecoVDyFM8w1AdXXdwVn/gJxWijkK+A6CEwUBI
 iZjiTrV5OG5dOSWk/+JA3ii9URQZUyLQl4/BuDRGVbyCD+FZzW0sGc1Rcc75d67lQRqv
 +qb/N1KoxRrGEr4TOoyPCJwJXpHkyLacE6C3LNJDBG8om8BTPUgv+iXp+jks3fhvNA5x
 eC/Q==
X-Gm-Message-State: AOAM530AY01y+CdZsckqNSvGvH3sDkoNThxRaAbxW1ftc1bFBR86PTNm
 m7LwQuYbvPAh6Y78Ka04lg==
X-Google-Smtp-Source: ABdhPJygRYjzKbasu80k7e5nA2cdJ4GM54d+Z/a/gZynHxWgtO0WH5vsHQtLcp7+z0aWiRVcNEwk/g==
X-Received: by 2002:a9d:10a:: with SMTP id 10mr16199332otu.188.1620070125193; 
 Mon, 03 May 2021 12:28:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z9sm165458oog.25.2021.05.03.12.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:44 -0700 (PDT)
Received: (nullmailer pid 2242383 invoked by uid 1000);
 Mon, 03 May 2021 19:28:43 -0000
Date: Mon, 3 May 2021 14:28:43 -0500
From: Rob Herring <robh@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: fparent@baylibre.com, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: input: mtk-pmic-keys: add MT6358
 binding definition
Message-ID: <20210503192843.GA2242334@robh.at.kernel.org>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
 <20210428164219.1115537-5-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428164219.1115537-5-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_122848_744464_DDE6A165 
X-CRM114-Status: GOOD (  12.26  )
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

On Wed, 28 Apr 2021 18:42:16 +0200, Mattijs Korpershoek wrote:
> Add the binding documentation of the mtk-pmic-keys for the MT6358 PMICs.
> 
> MT6358 is a little different since it used separate IRQs for the
> release key (_r) event
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
