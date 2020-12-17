Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DA5C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 19:28:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E232239EE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 19:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E232239EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=02l+ZjwFKRozN67YL/FDG/1c9GuZY4x3Kk1t5yXGbD4=; b=V/cCfvtbsXnsT0XRZimOBhpzA
	gqBPwF66qOHLXWlYMTm0ZbvXoacaHrGXy859uZHbUDkZUYiRwX2FQora5sndYeZTjorUnqLL1Hnj7
	rXWrIR+yerVgJS/UWGrT8UL5KwIJcJER8Ruj2Y595njfVI95WGk4nkzOJDofyj4QqX8hzT9V5jwoa
	goUdRYaTzCgCJ30+LKoe9N3/0U+6y6X8ru3wLq882nhu1ITgBlt6bPEd6MsQJ5B0N9pYtP8Ee0yl+
	CORYWGAY0m0aqFJUU3JdVkTZcSG9aRPBIuXXc/fnlIHajNsXSbIq6kAy6jJDpAZkHAhT/tSqU2dP9
	II6hctsGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpywq-0005XU-QB; Thu, 17 Dec 2020 19:28:24 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpywn-0005X4-UI; Thu, 17 Dec 2020 19:28:22 +0000
Received: by mail-oi1-f182.google.com with SMTP id s2so161659oij.2;
 Thu, 17 Dec 2020 11:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OIqxJlEr6qhscRY9Nj69alb23UGeDiYW09DXVg3bkF4=;
 b=IKtwKsJlqHa9LpybMYFYClfmuZ3FD7oO5KXNUuXYOMz9eattXU0m2VY8dgnchrbgKE
 HAOXCCKFL3lmPeVMQ3veANAgiCkQOCNry+Bc69seylOHG/7lB/BnA3aCkX7sxb6WAv9Z
 c3CvGhC9/E5QA9XMRGN334FBpdtOQCkjUm1g2Z+3oSUu9iqbtLArjcz5NcTKyVdzVKyI
 Z6V97Jgv3A5vYcOawwMwYJwW3nhMlnsiYncoBQsJNNJOwxE47uJ+bqfGwTQD++ZnREeA
 q63xG4fMgQRdN37KCDxuSfxGcQf1HzA2bFtPNlXp+L2kwgDo96RZDt14MgVwizyD0vQO
 Oxew==
X-Gm-Message-State: AOAM531++Y/ENEmH3YRxhFzjzpH2A5nVnIur9R6pojRxHmVLs0KS1ZCR
 mIF5pynJk7/ctJZn8r4WoK0ESK/Y4Q==
X-Google-Smtp-Source: ABdhPJw3bvC0XYf+pKjCMi2TrfV+zkB/AwPcr+ycvAdNFlDT5V1e88wLbTciwmx3HwL9jGOPY4nPEQ==
X-Received: by 2002:aca:3257:: with SMTP id y84mr518377oiy.132.1608233301052; 
 Thu, 17 Dec 2020 11:28:21 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b25sm1497885ooe.18.2020.12.17.11.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 11:28:20 -0800 (PST)
Received: (nullmailer pid 101991 invoked by uid 1000);
 Thu, 17 Dec 2020 19:28:18 -0000
Date: Thu, 17 Dec 2020 13:28:18 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v4 3/9] dt-bindings: mfd: Add compatible for the MediaTek
 MT6359 PMIC
Message-ID: <20201217192818.GA101889@robh.at.kernel.org>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608104827-7937-4-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608104827-7937-4-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_142821_987233_ED82C3A1 
X-CRM114-Status: GOOD (  13.86  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com,
 Alessandro Zummo <a.zummo@towertech.it>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>,
 Yuchen Huang <yuchen.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 16 Dec 2020 15:47:01 +0800, Hsin-Hsiung Wang wrote:
> This adds compatible for the MediaTek MT6359 PMIC.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
