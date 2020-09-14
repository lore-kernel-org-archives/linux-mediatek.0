Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94202C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 15:31:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48793206E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 15:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z/exrTvb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0tBg5CS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48793206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gPOMppoTtVhoei9t2LC177pQBoKdaC+o86EdjSlxyBc=; b=z/exrTvbs8gz265l6YfZMOdGw
	Bs3Zqk0h50n0RXeZ+XdtgO+x4evfFzG5/Um9OVhzeMUq4zWA8/JQoEKgujPS8+cmx5xgncRx8AvSM
	FqYHUMMrbeiwLQ7W7xs37TtMjgKMo8ulM27Z4DyiIJZJFP6+rER1XtufqDarv07lEJCuG6Jo7i1HD
	v+Id8RiLsIPk3wYZjlYYcznldyZPyOUd8F9F+JFeyJ1+S0e3Mhji1eGWhToSyvyDc3mjhV1Tzg9bC
	frv5kSncnmmNfOxOyM34ESvpnYR/x8KN/VUifpIWxDYE0eoSB3lpOBl5RfZCIyKsEU5qqzZN4+g8R
	4/vmcGxTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHqSG-0001y8-Ux; Mon, 14 Sep 2020 15:31:44 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHqSE-0001wT-7f
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 15:31:43 +0000
Received: by mail-ed1-x541.google.com with SMTP id t16so18052991edw.7
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2020 08:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=fLNb41VIkD/RuPBy33egUq3B1KbchS1GHIy2wAcNoFg=;
 b=d0tBg5CSotliTfnKU7Ilv5nD9qZmOmvj/sU2Ziv6THacAnNAFTW90Yu2SPIxroUKsV
 xrmiUPNCSlyl3aS/OnAPZLAxu0/xuDAcixMjklz/Zrg9fu+RzNHWNFCCDDmRV9jPExea
 EyTMhntUbksZ0nXC2jqaVEeNjXq/LcWt0oZy4H/4LLABUKEBm15YPRUshQarzoAzB4ZO
 2RUhIwMFPfuM7dHoPvA8v/G6CLw9kdLaWm3xbA+CAXO7WNT4W7Wd4QEF+utG86NZbIbL
 YurdpOElqlpSsf5ChLfltUGYueNj2XYA+YtnRMEU/+e+jAYqUtR5LXlCJ6NO9gB8c7l7
 mz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=fLNb41VIkD/RuPBy33egUq3B1KbchS1GHIy2wAcNoFg=;
 b=T75iNHY5GD0hfiojf2YwOoqAk4wc+te/MaRDE7M/W7rLRXonK5eF9qnbc8JTHEIkrt
 Wl+2OrhVJw+b+ek5zKJb9Px8U8wEHHhtnzlZjJUDk0iALHPNp4c1eJskVoXBnSRggMSk
 DkSaXGhtWHgSNLdcOkjEM4HukFOHScDWVk50f3/MkGfwJAFWc2mjruUVa8lC6zL0I0B+
 1xqQ4f9RywiZ9BuzBG09H6LkrRsTS3BgjbcT8W/vaenJYPLjXpASvXqCbkhtCAizmD0V
 R1N7BMBg+mM88W5YUumyhn02VEDpUEDXKLt2UU2JWvvVXlIZfivFyXDjItIwUuKQO1/R
 dsTA==
X-Gm-Message-State: AOAM533Rzg4jP43Hu2knKN4fWM7KhP71pwVoFwfF4zr3SdjDNc8dk7VK
 7/iFDErdddPGTUKJ5JsEm2I=
X-Google-Smtp-Source: ABdhPJwRC+BDZn+93nSISeCmb/4S7FDAVbfdIR/fBXtuiCtf3Xc9d5JcoVVQV7/DqrSLMq3Wh4zs0g==
X-Received: by 2002:aa7:cd90:: with SMTP id x16mr17354077edv.302.1600097500699; 
 Mon, 14 Sep 2020 08:31:40 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
 by smtp.gmail.com with ESMTPSA id bo8sm9559422edb.39.2020.09.14.08.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 08:31:40 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 14 Sep 2020 17:31:38 +0200 (CEST)
X-X-Sender: lukas@felia
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
In-Reply-To: <bc5ba52bb0c123d0ed038e5dce9474f27ac2f750.camel@infradead.org>
Message-ID: <alpine.DEB.2.21.2009141731030.17999@felia>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
 <alpine.DEB.2.21.2009141208200.17999@felia>
 <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
 <alpine.DEB.2.21.2009141552570.17999@felia>
 <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
 <alpine.DEB.2.21.2009141615020.17999@felia>
 <f511570405799df421397ff65847e927745dad08.camel@infradead.org>
 <alpine.DEB.2.21.2009141717470.17999@felia>
 <bc5ba52bb0c123d0ed038e5dce9474f27ac2f750.camel@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_113142_329920_524358ED 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Joe Perches <joe@perches.com>,
 linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On Mon, 14 Sep 2020, David Woodhouse wrote:

> On Mon, 2020-09-14 at 17:23 +0200, Lukas Bulwahn wrote:
> > >  # /usr/lib/mailman/bin/config_list -o- linux-mediatek | grep -B5 ^generic_nonmember_action
> > > # legal values are:
> > > #    0 = "Accept"
> > > #    1 = "Hold"
> > > #    2 = "Reject"
> > > #    3 = "Discard"
> > > generic_nonmember_action = 0
> >
> > David, I guess if you have access to the ground truth on 
> > lists.infradead.org, maybe you can dump the actual setting for all those 
> > lists?
> 
> ath10k:generic_nonmember_action = 0
> ath11k:generic_nonmember_action = 0
> b43-dev:generic_nonmember_action = 0
> kexec:generic_nonmember_action = 0
> libertas-dev:generic_nonmember_action = 0
> linux-afs:generic_nonmember_action = 0
> linux-amlogic:generic_nonmember_action = 0
> linux-arm-kernel:generic_nonmember_action = 0
> linux-geode:generic_nonmember_action = 1
> linux-i3c:generic_nonmember_action = 1
> linux-mediatek:generic_nonmember_action = 0
> linux-mtd:generic_nonmember_action = 0
> linux-nvme:generic_nonmember_action = 0
> linux-parport:generic_nonmember_action = 1
> linux-realtek-soc:generic_nonmember_action = 1
> linux-riscv:generic_nonmember_action = 0
> linux-rockchip:generic_nonmember_action = 0
> linux-rpi-kernel:generic_nonmember_action = 0
> linux-snps-arc:generic_nonmember_action = 0
> linux-um:generic_nonmember_action = 0
> linux-unisoc:generic_nonmember_action = 1
> wcn36xx:generic_nonmember_action = 0
> 

Thanks, I will provide a suitable patch for MAINTAINERS.

Lukas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
