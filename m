Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A2CC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:26:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A69821D7E
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dPMBjBYZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T8vrlsUA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A69821D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0+FDqkI98O18oSHFA8QXfHg7sstMXM1nK005att75KE=; b=dPMBjBYZPQT7Yx7U0+iqGQPV8
	DdIez2GRmbYb+KFod1jH4ug470zVldlGoDuxX6stQLoK4OEckWRsd6Y/HEpOikTVwqvfEFfz4wmLA
	/Lg1thxFd52/D9duFfPOZHPWsXNasJBvUKdSK1M40LuTJ3RC25F15FteIoSVmeYW7UKW8ADyFXEK6
	ArqaRecsm3LapbDgYFF+JL/DBQmjzdKpe9O3V29hNcNbwobGg/L89NaJGTS77RCFqTZQOmPOMacTr
	reG2qiUSGlZCkdAFGo/uiiqUhSomlWix2ryXBhcqwNY4XERqGoPoQs6t1eYCMYoAw+lTb285+zFE5
	4xFiaGQ4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGZhs-0003aG-B1; Fri, 11 Sep 2020 03:26:36 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGZhp-0003Zb-Gy
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 03:26:34 +0000
Received: by mail-ua1-x942.google.com with SMTP id v24so2679256uaj.7
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2020 20:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FvQeieKv5rbJ5/s4eJT2O+IOF1Saic+Crp4J5iKZQf4=;
 b=T8vrlsUAjemV8EhbZG0kArfreNIjgn3IeAZ9umv25OXXKgdAG3mJcTUQXK+AvrXY13
 BAI+4GjON0vIeGj0QPlOIe/Qlb74NnKfR2ocY5plpnUUgw7BwrDWNJRggjmMvQbn3T8Q
 aXC3dFk102DstFA3OZdzhxqeyaAstAE0NfHaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FvQeieKv5rbJ5/s4eJT2O+IOF1Saic+Crp4J5iKZQf4=;
 b=DugHsYr9YtzIhUKJOSUHkM+0DL136jo0AKDYjs76xvY/l0QzpdB877RPt6zXn/rt36
 Eo1t/kotqtWxsrYacyLSgKbhiManeBLh5yE6nE8VtCcJ2h9oiXborwhC2K8Cg3atYiYU
 AurDPrdt8oKqwwKekXbyKRswg0pQUpVUuGYGOemghwOmqyn2/Eli3onCN9JR10fT7Sj8
 wcvmbRoXRbTrLDkuhqFI+aaaqwDNktSeyyiZjztS482ZjihRyTeQJlE6TYoJB8kgxNmk
 Nxwg0pTAc+3VyWIumH0cse2PyHpHYRBEQseQfXpzfKQEcwiM86xgJgdMSYkDWRmoL+eA
 PQsw==
X-Gm-Message-State: AOAM533HhCjXPs/7ADkqrQkatj8hCklxDOdAxLSpIJdW2pNXKiq336lv
 /iOo38w4o3V0aS1uPulZpGdB7AC4f9NGs0DowoNUcg==
X-Google-Smtp-Source: ABdhPJwxVrNhrniN5woxKGWcan1oHwHrjdiscQz8zYmgZM3N/r1SrH7wmqgMzlo7PmXudZk/YFVEzcQkn29JMBnylaw=
X-Received: by 2002:ab0:1450:: with SMTP id c16mr523uae.27.1599794789775; Thu,
 10 Sep 2020 20:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200803071501.30634-1-crystal.guo@mediatek.com>
In-Reply-To: <20200803071501.30634-1-crystal.guo@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 11 Sep 2020 11:26:20 +0800
Message-ID: <CANMq1KA=t8srKfC4XUqk2V2N6Jm0=-P4rQSh9Mqbo2tFFKgTEA@mail.gmail.com>
Subject: Re: [v4,0/5] watchdog: mt8192: add wdt support
To: Guenter Roeck <linux@roeck-us.net>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_232633_583542_331A8773 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: linux-watchdog@vger.kernel.org,
 srv_heupstream <srv_heupstream@mediatek.com>, seiya.wang@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Matthias, Guenter,

These patches have all been reviewed (apart from fairly trivial 2/5),
which maintainer should be picking those up?

Thanks!

On Mon, Aug 3, 2020 at 3:15 PM Crystal Guo <crystal.guo@mediatek.com> wrote:
>
> v4 changes:
> revise commit messages.
>
> v3 changes:
> https://patchwork.kernel.org/patch/11692731/
> https://patchwork.kernel.org/patch/11692767/
> https://patchwork.kernel.org/patch/11692729/
> https://patchwork.kernel.org/patch/11692771/
> https://patchwork.kernel.org/patch/11692733/
>
> Crystal Guo (5):
>   dt-binding: mediatek: watchdog: fix the description of compatible
>   arm64: dts: mt8183: update watchdog device node
>   dt-binding: mediatek: mt8192: update mtk-wdt document
>   dt-binding: mt8192: add toprgu reset-controller head file
>   watchdog: mt8192: add wdt support
>
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  |  5 ++--
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  3 +-
>  drivers/watchdog/mtk_wdt.c                    |  6 ++++
>  .../reset-controller/mt8192-resets.h          | 30 +++++++++++++++++++
>  4 files changed, 40 insertions(+), 4 deletions(-)
>  create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
