Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92013C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 16:49:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1BE223EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 16:49:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eashZYYe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1BE223EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bua7w5t0y/eZAtttMhrEH86S95YGiD/g5UJHrVZsMIs=; b=eashZYYecArYoe3MIx6PmmiS3
	sys9Uoi1rQ7lFfJa7bzIE+xQLMQP+dvt6adY3YxkMQ7ThIuNYKccwWKr64QMiqBSyok4vH7gOrsW3
	AUxFnXFgORyeJ7PuohsdluDSJMZlSu1EUnjHdFryE19UcDCcaslwz0UtsQ9xxEM6HdxMTJl6WO6/E
	r+OjKF+dYN5PzetVHASxJDWcrMWWLlgG39Bh9H7miIGnwwraU2u4XMpEIXC7JFEXXsZmRegNOEdau
	mXRKImZgmzueLaNPO6/aeQaFEJJXPCMCFXVctUSkNkz1d8t5fYl6+vUdhQK/7qwGfeCQ+oPE6fOpK
	smdmBQh/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kW0G2-0003Rh-T6; Fri, 23 Oct 2020 16:49:38 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kW0G0-0003R3-0g; Fri, 23 Oct 2020 16:49:36 +0000
Received: by mail-oi1-f194.google.com with SMTP id h10so2542491oie.5;
 Fri, 23 Oct 2020 09:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sNWKGn3DDIoyEpIxZv2Re159Qqhhyn1QhElnu+a7Lmc=;
 b=P4ynyD6PeaGIgyRkTAut0GobWAtcXXkxhNvuehUTOjqET5+grYOIu03Tiw14fSnUMl
 aSykvH7LQjfHQijfKZK+Fa+cFnBO4V9zcJUghigFZsSK5VT1bUdRrhCV2JMA+NJlzDvH
 MiD4ASRlMtKdVP06x45W1KXtkgLq9Z+Lzj+gASPnFmpo8Z/CIkm34LjOKjcUJH9fZbcl
 GhxirvX36NEoT0z0GCBN5lFJl5JkCPrlcVCtwbKS5VohCRvc0TwdPGKWkjKya4FSGeiJ
 kxHcLZ8tu7mJtQ4xoB1GYP18LSknX8om+SajoEjgYmeyd8gjEUlgwDTRDG2V6gKt0LTW
 qeZA==
X-Gm-Message-State: AOAM533fmpX2lJ749oSYZ9qmPvEr8GV85xuuaLK+gRN1ZQO1dG6xZHto
 o8sNEhUkoF9p6AOft16vq0LkLFY7lw==
X-Google-Smtp-Source: ABdhPJw+inBHwHbjguZV3WazG0/oY/ETAyqQeaGUd3GD5InJ8OviJOAS4DVeUgezdEFSV2ZlJjHWEw==
X-Received: by 2002:a54:4812:: with SMTP id j18mr2536886oij.70.1603471775270; 
 Fri, 23 Oct 2020 09:49:35 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f124sm595217oia.27.2020.10.23.09.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:49:34 -0700 (PDT)
Received: (nullmailer pid 2851617 invoked by uid 1000);
 Fri, 23 Oct 2020 16:49:33 -0000
Date: Fri, 23 Oct 2020 11:49:33 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH] dt-bindings: mailbox: mtk-gce: fix incorrect mbox-cells
 value
Message-ID: <20201023164933.GA2851393@bogus>
References: <20201018193016.3339045-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201018193016.3339045-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_124936_083581_038420AB 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: devicetree@vger.kernel.org, jaswinder.singh@linaro.org,
 linux-kernel@vger.kernel.org, dennis-yc.hsieh@mediatek.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 18 Oct 2020 21:30:16 +0200, Fabien Parent wrote:
> As the binding documentation says, #mbox-cells must have a value of 2,
> but the example use a value 3. The MT8173 device tree correctly use
> mbox-cells = <2>. This commit fixes the example.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
