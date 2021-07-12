Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE6DC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 20:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC1A61263
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 20:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CC1A61263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdjZ5RAedNh/EQJ2rt9rKhTjExJpHNSUQZaYoaoc1tM=; b=Uycaufx4Ndiaqv
	z9EaHVG9yaYMJ60IYtbJGZNzS9v/r15N47d5dTlvC1QgPTm7jGPUZsCzXV0shWq+C42ioJG3UfXnO
	3FlyJBQJBzqmHTID0CKriyycYMeDWJVqKlldssyUnbr3e23WHbixGmXApjjCLBxt/woegEspjWFbd
	YOAKZaJXuY7m5y0EMEhUgfqVJy4XeIf14RJKeLcPRvKoq8dN8yu4Ip/69AiFneG6oqIsLj6zIQjIo
	3B+istxDqZC0cjETujYDtrQJuAmhxP6XAdA9UQuUe6SM4dasb3rrhEPyXsu/psxqqkTdBxp8QaQEi
	/vGv2fDkr6gvfq5UiAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m32IS-008Lxj-Gp; Mon, 12 Jul 2021 20:12:56 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m32IP-008Lvz-QZ; Mon, 12 Jul 2021 20:12:55 +0000
Received: by mail-il1-f169.google.com with SMTP id p3so844170ilg.8;
 Mon, 12 Jul 2021 13:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tXKPZzwXcZV9/HhIQdnNlNgejKZgtrP4Woag5BXnZA8=;
 b=fasYGd55DX3tNXdlFT7W9qsw/3ABF79MxLQztL78NxTvIebkjITkmm6+0m5oJ5pmpm
 PLW8IBlyKfusHqoYyX4dm3YkQI7opDbKd/uur2XPqsgtTLxM+28Q6nOC7W92CVsyZyRD
 laHiKdYfJtTwmn9ieDOJUBdlBnqbqnhJmAf/XkI0GuC2Xc8mD2yN2+4wo+ptoptc2u+1
 iSWTokGFAuWRAx47AKy11Zup/BosJDA+z4fkkFfFDBG+wag0REBhVqH0Tfd+mZM5U12J
 8/q1phe7+XXW9ACsDVUdZVwYLBRdo1wx4P8SPFFkweSJs6MnM7xal0zwuyXha61QkykS
 XSqA==
X-Gm-Message-State: AOAM533BaIy03IK7HJZrV4igu/8ujNvDsSt6gy6EMbgz2PuisJIkTxnm
 tTCg8t+kDGUAooMvYjeGhQ==
X-Google-Smtp-Source: ABdhPJwEiRi1fPrJ1vXs/JakffS9HIKIXv05lezYQORSM3cPk//aDIffadrxDcsjEBtl/OQj9SenMA==
X-Received: by 2002:a92:dd02:: with SMTP id n2mr376597ilm.259.1626120772614;
 Mon, 12 Jul 2021 13:12:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id u16sm8177345iob.41.2021.07.12.13.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:12:51 -0700 (PDT)
Received: (nullmailer pid 2410180 invoked by uid 1000);
 Mon, 12 Jul 2021 20:12:49 -0000
Date: Mon, 12 Jul 2021 14:12:49 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: mediatek: tphy: add support
 hardware version 3
Message-ID: <20210712201249.GA2410138@robh.at.kernel.org>
References: <1624070839-1233-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624070839-1233-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_131253_909222_5E5A8833 
X-CRM114-Status: GOOD (  14.64  )
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

On Sat, 19 Jun 2021 10:47:17 +0800, Chunfeng Yun wrote:
> The PHYA architecture is updated, and doesn't support slew rate
> calibration anymore on 7nm or advanced process, add a new version
> number to support it.
> Due to the FreqMeter bank is not used but reserved, it's backward
> with v2 until now.
> For mt8195, no function changes when use generic v2 or v3 compatible,
> but prefer to use v3's compatible, it will not waste the time to
> calibrate the slew rate, and also correspond with hardware version.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: add more commit log suggested by Rob
> ---
>  .../devicetree/bindings/phy/mediatek,tphy.yaml     | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
