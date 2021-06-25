Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EC9C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:43:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53B6F61449
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53B6F61449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAwV6usCLMYZfii43VHggBKS4tXvLIU4xJ3amCSKjAc=; b=EXn6aZij7rjRW1
	W3EajvMD0Cv+/KjGuk1jyFYb830noO2X/HV8w+zMoCbOEbl4Zg7voaeHMfnq0So0Sd/m+za3GT4k6
	yO1om+AAPJTL20RXrwRYtohOZZsemEawIdwxAu5kkP6Z9wS3FZ3fSaKJV8GSXx1yrZ27NFcUf4H/7
	NctItac4CU/ex914681DKWkDx4EksNDjySVGtPJLaniCpegcRyMeJZZZVB0V7J+xdVeOmBZC3APm7
	tbIekaEYS+TBuWWydbPo8+g9lyC5umEa7XSBiUU+QtImiuAB7v7T4AAk1bWrmrxe35HceuLAoUYKG
	An9AqUU2dwqPoIJHU4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwjIW-0014jX-2R; Fri, 25 Jun 2021 10:42:56 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwioL-000sI5-J6; Fri, 25 Jun 2021 10:11:47 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1lwioD-0001cS-Mv; Fri, 25 Jun 2021 12:11:38 +0200
Date: Fri, 25 Jun 2021 12:11:31 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Eric Woudstra <ericwouds@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Re: Re: [PATCH] Fix mt7622.dtsi thermal cpu
Message-ID: <YNWr04QQD0tGuW6n@makrotopia.org>
References: <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
 <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
 <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
 <fb633034-96e5-6165-b43f-290ae1a65cfd@linaro.org>
 <189b52d5-b103-43e1-a64f-1e627fbc75af@gmail.com>
 <173e6bab-9d21-eb28-9b91-a5f80c01fd03@linaro.org>
 <3dd22cf2-1186-4870-aa49-e5cddc18c6e9@gmail.com>
 <trinity-7580d955-3187-41e5-9297-1ac8f628a9d5-1624609003739@3c-app-gmx-bs66>
 <YNWgVxvNbwNcT3B8@makrotopia.org>
 <trinity-1a7ab0b7-d895-49ab-b3b9-3bf426889418-1624613519415@3c-app-gmx-bs66>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-1a7ab0b7-d895-49ab-b3b9-3bf426889418-1624613519415@3c-app-gmx-bs66>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_031145_673528_EFC8EB92 
X-CRM114-Status: GOOD (  15.22  )
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

Hi Frank,

On Fri, Jun 25, 2021 at 11:31:59AM +0200, Frank Wunderlich wrote:
> > Gesendet: Freitag, 25. Juni 2021 um 11:22 Uhr
> > Von: "Daniel Golle" <daniel@makrotopia.org>
> 
> > On Fri, Jun 25, 2021 at 10:16:43AM +0200, Frank Wunderlich wrote:
> > > Daniel from openwrt have some other mt7622 Boards maybe he can test the Fan approach below
> >
> > I got Linksys E8450 aka. Belkin RT3200 ( https://fcc.io/K7S-03571 ) as
> > well as Ubiquiti UniFi 6 LR ( https://fcc.io/SWX-U6LR ). Both got quite
> > massive customized heatsinks (see internal photos on FCC submission),
> > which results in much better heat dissipation than just having the
> > naked chip like on the BPi-R64.
> > Hence I also can't test the fan approach on boards other than the R64.
> 
> Do your both mt7622 boards miss the fan-socket or is it not connected to pwm3? then we need to move the fan-parts to mt7622-bananapi-r64.dts instead of mt7622.dtsi

There is no fan intended on both devices.
E8450 has an unknown connector which **could** be for a fan, but I
never tried if and how it is actually connected to the SoC.
It could as well be an additional USB 2.0 (as it got 4 pins).

Hence I suggest to add the fan on PWM3 for the BPi-R64 only for now.


Cheers


Daniel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
