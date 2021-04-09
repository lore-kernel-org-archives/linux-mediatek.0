Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7668C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 18:10:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3E6610A6
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 18:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3E6610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OH91EMWaFTpCOAOhVw9geC/h+9grpv56noU/Yh7T20s=; b=TcevcUbo4/uzzYIU/54bOkzP7
	ctWnZWhYlmx5DNVlKpM9kiqyUdiYm/pqMYXdgje9Yaw+XmyL2Rf77RH7TJ+Peb1nPuIXf+bGafmMs
	jNGmrq0jusXC8QjoEr7nWT6RKo54Ao0zcYUysSYxw6k/uglevP7fdMYEql2kp3f6TLvIgOtDjmEKi
	yfqAa1iNpteMkAhAM06zniLsDjhBD5fYYOKYa7DSGPKoFJylDoYd7CVPeuPUD/YJV23zFNxLbWBZs
	rrSUxacWvcxz9OaaFpI6op6k3/F22AhNVwTVCT8BihZZmKbkE1qER0FpRR890tyvO7o63y8mN6zuU
	IF3e0BrQw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUvaB-001HOz-P3; Fri, 09 Apr 2021 18:10:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUvZu-001HLP-Bw; Fri, 09 Apr 2021 18:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fCVQeOozXnmqOmzdZZPptmZjBT4ig9JKwPIdux6ewHA=; b=nJg6bqZNgGuGaAqLTVGXNxFGS8
 ImwGmJOmSkh7/8ariOXFjXpsBs9nsPDHLoVrGd5R998QnKzHBbplKXpRK/cghP1GnQxCZh/ty8N5F
 59QWHDGY9o5AT8hb94X9lcIXn8jhAEry6Sw5jDogBYE5KVd4ipOIFhZ6Fwcl2NFXqWl6oHAxNlhlE
 lsUiAPFAFJAj1VqKam+WeIdd/fRShtm/kppgbALbZtdkTDFuU6wrH1fQiN67g9KpFZxevuDQVnFdM
 lBwj1i3+bhtD3B0b2N6aHQGa2Jwc2Iv/2u4HDliq4XPQE6JDJns2BUjxz2sNLqBQNkfLGbh6Fx8CF
 7Nxr2mww==;
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUvZr-004iQj-Ty; Fri, 09 Apr 2021 18:09:57 +0000
Received: by mail-oi1-f178.google.com with SMTP id i81so6639280oif.6;
 Fri, 09 Apr 2021 11:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fCVQeOozXnmqOmzdZZPptmZjBT4ig9JKwPIdux6ewHA=;
 b=GmH83WmKiKoz1Zelo60Zy6Tz0oAuts81T2FdVA7smnlMFCVIfZqEhxnKslo2ahfzmb
 voV2npNInInacQlZc+qQFTv+bnjhYlel8oxv1Q1eAYuxkALqRWUJOWYXmImlaJbt28lD
 nFqkzBhSeFp/ZjHIIwuw2JSiieTobzhjGAkJGllv+ojAhCjhH/KiN727g+zFz0mvOSVO
 HoXi2h/tcV1/9pSrf1c6/d7p+kFanEfBXiz3emEhIMbnTyVUqlx5nWlxJ/zDgxrfkpiG
 c/SrG6PeeyM0QIZV5hc3ErS+uG9A7l6tawmTs3bHFbdF+2f6SeC0ZhF3XosC+TnddnZ4
 JQJw==
X-Gm-Message-State: AOAM531NOGn5bHPkXR2GqS5y8eCbdRnjs/KxyDTA8c7tA4GT87aCrqp2
 ZIFvW7WfWRnnwAuHxapCcA==
X-Google-Smtp-Source: ABdhPJxlkqQLFI9GS+qKWcK5PFzpk2KHZgmVCIWpe09a7zrV4vqhg64yNKJOaDodgq1VnWReAPY2yA==
X-Received: by 2002:aca:1803:: with SMTP id h3mr10921965oih.65.1617991794638; 
 Fri, 09 Apr 2021 11:09:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 64sm639617oob.12.2021.04.09.11.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 11:09:54 -0700 (PDT)
Received: (nullmailer pid 3895463 invoked by uid 1000);
 Fri, 09 Apr 2021 18:09:52 -0000
Date: Fri, 9 Apr 2021 13:09:52 -0500
From: Rob Herring <robh@kernel.org>
To: Flora Fu <flora.fu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Pi-Cheng Chen <pi-cheng.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: clock: Add MT8192 APU clock bindings
Message-ID: <20210409180952.GA3895409@robh.at.kernel.org>
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
 <1617766086-5502-2-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617766086-5502-2-git-send-email-flora.fu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_110955_986896_1644CA7B 
X-CRM114-Status: GOOD (  10.22  )
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

On Wed, 07 Apr 2021 11:27:59 +0800, Flora Fu wrote:
> Add clock bindings for APU on MT8192.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8192-clk.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
