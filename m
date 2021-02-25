Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B0DC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 22:00:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FAE164F2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 22:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FAE164F2D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qn7LBwk2N21aFJSNLwwGc2zUkEp3ffr0RCLrPrU0n9Q=; b=P6TXwrbtxNESArDCmbyFI+v58
	YF5k+oI4pB3BgHPTbFsyXXx1Qnwe29RqPbvoHTj9mLrGK99+8QBz5UmPj+R7/NbH8JA4dyIYMozMu
	aPedbWZZTRQs3IlUdTF3B4Qn1LX66XwWUaMXosAOrao4Z03Ou1xIEd/D1c8JgJArnWdAXt5Q0Z8lT
	EbKgTjFfV/h1pe01NjMhVPerWn04pF3BHOioXJyPd3HyTKGATfTILuCeZGPCQDp4HrNFKbHKTdJHC
	qlSnQrfTKGxVC1yePZ09x+fVfrtp52o3LHqohKKLf8Yhg1HmDRy9oF4Sj58oqBRnNABb4FiW39kPw
	dJS0hRr+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFOgd-0006w0-3f; Thu, 25 Feb 2021 22:00:43 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFOga-0006v5-B7; Thu, 25 Feb 2021 22:00:41 +0000
Received: by mail-lf1-f53.google.com with SMTP id d3so10841529lfg.10;
 Thu, 25 Feb 2021 14:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hwZzks7Q+wOWRhrZQ3mgFpMbrn31iT5NyLTYPPzf06c=;
 b=Xhx79ImKSxn2vBHAMduZSJcHyjvYtRLx26IVQ6yc/BnqTo0DrpIHzr+DTN8U9Xtuh2
 uLEddsrwjbCnlqgTev4EXbN98dk8/5aPGAUlLshBRlZrR07vOUOT3b7bqKegNUGOYN36
 hITSxQMXAIOmQHBcyR2qHh8z0U9j6UWRRhPuH4a3eSwi/idLyIZD5GIUcNSYZw29LFFA
 mHk2qnRDLFZqCYfrRH9yfy8tmYDP1FTMGr+SdacmDjp/fsQB3UXkYoOH23noGQFQtutH
 YpX3I0a6E2Os93LNwNO5rJwHfxTZi2Irbn1inIYDLa1fvOf/AirVsYN+DU/Q/U1WaOql
 jhsQ==
X-Gm-Message-State: AOAM530PKfNy05KQ2MtOOW5P9bUeRjeg8DPlI8ya6KUTpxTtjZjO/b/w
 eCeedOQADV7sh6cjwafFFZg=
X-Google-Smtp-Source: ABdhPJxQhSDTdjqQUt4Uhh4bJavdU7KNQTizh7/YRmYQ9PMRZYRbGObddOL6QGouxeeQ0cAjfwn15g==
X-Received: by 2002:a19:b47:: with SMTP id 68mr2844434lfl.343.1614290436989;
 Thu, 25 Feb 2021 14:00:36 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id r9sm1228682lfn.200.2021.02.25.14.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 14:00:36 -0800 (PST)
Date: Thu, 25 Feb 2021 23:00:34 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v8,6/7] PCI: mediatek-gen3: Add system PM support
Message-ID: <YDgeAoYHgiAyU16a@rocinante>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-7-jianjun.wang@mediatek.com>
 <YDZeRc6CHV/WzyCm@rocinante> <1614224089.25750.14.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614224089.25750.14.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_170040_440398_25098A0B 
X-CRM114-Status: GOOD (  12.63  )
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
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rex-BC.Chen@mediatek.com,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com, maz@kernel.org,
 drinkcat@chromium.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, sin_jieyang@mediatek.com,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, anson.chuang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jianjun,

[...]
> Thanks for your review,

Thank YOU for all the work here!
 
[...]
> > > Add suspend_noirq and resume_noirq callback functions to implement
> > > PM system suspend hooks for MediaTek Gen3 PCIe controller.
> > 
> > So, "systems suspend" and "resume" hooks, correct?
> 
> The callback functions is suspend_noirq and resume_noirq, should I use
> "systems suspend" and "resume" in the commit message?
[...]


What I meant was something along these lines:

  Add suspend_noirq and resume_noirq callback functions to implement PM
  system suspend and resume hooks for the MediaTek Gen3 PCIe controller.
  
  When the system suspends, trigger the PCIe link to enter the L2 state
  and pull down the PERST# pin, gating the clocks of the MAC layer, and
  then power-off the physical layer to provide power-saving.
  
  When the system resumes, the PCIe link should be re-established and the
  related control register values should be restored.

The above is just a suggestion, thus feel tree to ignore it completely,
and it's heavily based on your original commit message.

Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
