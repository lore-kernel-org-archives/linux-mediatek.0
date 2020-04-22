Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A1CC55185
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 22:22:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 333E42077D
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 22:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UeDB207z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FVPlhcN8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 333E42077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNCMG2IS2aYMOCTRCakUOHVoWjYL3g0Jedgmp4u+4GM=; b=UeDB207z61cvS8
	FpMsBXWNZgmBi0kgACuo+hu4iEs/NR5ZvTI+JFj/OQQwKxQe2d4+axvHcV/u9Vl3bk+LTqC2dCq5w
	/8pvgxYR+4RnfBEnUnr4ocY+P19nLyY4PEYcFXaqu4WswvLo0lvFDmxWmk6moQ9w7/6LGemJgDYpg
	E+sp8LGgcZDt6PV3XUf5ORxIJSBcdjoD9khUB4fx+AVoGeTwd0wh5aBPzwktAKXT4vUHZYYo5uRFR
	HmBkNdlO8SR9SAJU4E4aOs17WGT+W8UxF65TKjbj+ksOWnUksWUofLgV8ccwc/pTn7/K7Jwbjmp8Y
	XnMd03/JOwbvewNAUjqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRNlP-00033E-5k; Wed, 22 Apr 2020 22:22:39 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRNlL-00031C-PR
 for linux-mediatek@lists.infradead.org; Wed, 22 Apr 2020 22:22:37 +0000
Received: by mail-il1-x136.google.com with SMTP id z12so3615942ilb.10
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Apr 2020 15:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R3pDdZfZ5bLsmtiaX3ho/Prc/GJlaWQtQCc0O+mFKI8=;
 b=FVPlhcN8SpwQ9kar8lLIzkCNOqERTFjDWWPdzkyz6Ph3snI/Dgm1QayGxRrtup/FYZ
 uvwjCAr4kTdVchuqSfKk4YE3zvMCIsjIsWXQYY8daJl3AlcUqfwO/f3EHzOMIUvrUVzn
 EQo3LNEU3QcAEw1oa9YnwK4Jg5j6Pzo+MbrrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R3pDdZfZ5bLsmtiaX3ho/Prc/GJlaWQtQCc0O+mFKI8=;
 b=Ak9146CJy+xKCeQtCd9fDvXiAUJdns7xl/A3T1R/MS6w+MZS9n7RBOwkeszTANQXG2
 ZlagYh+SVIOusF947oPFUKZ1iyruwcx5GKZWm4W5TvBm6h/d3nPmaEagnm3c+owsdw0s
 2geS7ZbcFO7WYZaVPQfHpDSKE6UyBcw85Cx58uB6FT2SIQm7jM+L5D8IhQ4ze9Og4ulJ
 ErMmzZgdKvkotl3zYSnGhj4UzFc53duHZ03aElOM5NsEEQTVr4H5y6haHfvy/aEeYlTq
 JvR9jSC9JRqo2dCvis25cP3LvY8L5EHgS0SSS2OghVunJdYdA/dIRqsLcSYrAiIyyCDD
 QJIw==
X-Gm-Message-State: AGi0Pubs62RV3n9mKlACr/a1tUbM9KrnMGDnQXZH20PcCXpPKmy1JPCE
 XgTdjis/O4FeI0M+3cXq+lMgGFSweCdPLIwSkCr8dw==
X-Google-Smtp-Source: APiQypKiuVyAXmTGcV8md8ByrtcR6N+7n1XLevZ5e2D1tSsN5M7OMFaWAdj4CGmVqHj4ltYZYw7z3KpjuiJzCLrizYg=
X-Received: by 2002:a92:c6c8:: with SMTP id v8mr586970ilm.129.1587594151810;
 Wed, 22 Apr 2020 15:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200421110520.197930-1-evanbenn@chromium.org>
 <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
 <CAODwPW9MtDLSL_up9W0TO1PcjyA_9cUtNo3No7XXusiwqKBLDw@mail.gmail.com>
 <CAKz_xw3-tvYoCDs07xEUBBMf024aezGMoZ35LsTN+_dXT9nC2Q@mail.gmail.com>
 <bbd8f97b-8479-c38e-011f-b52e2cf34403@amlogic.com>
In-Reply-To: <bbd8f97b-8479-c38e-011f-b52e2cf34403@amlogic.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 22 Apr 2020 15:22:20 -0700
Message-ID: <CAODwPW-PGzCzW9dP4UXiR5joKRLOKJVBzXwPS7n_Ne-QedfsCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To: Xingyu Chen <xingyu.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_152235_847939_3465DE37 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yonghui Yu <yonghui.yu@amlogic.com>, Leonard Crestez <leonard.crestez@nxp.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Evan Benn <evanbenn@chromium.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Guenter Roeck <linux@roeck-us.net>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Olof Johansson <olof@lixom.net>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> > Yes I think you are correct. I got some reviews about the compatible name,
> > but I think I misinterpreted those, and arm,smc-wdt would work. I did wonder
> > if Xingyu from amlogic needed to modify the driver more, EG with different
> > SMCWD_enum values for the amlogic chip, he could then just add an
> > amlogic compatible
> > and keep our devices running with the other compatible. Although of
> > course it would be nicer if
> > the amlogic firmware could copy the values here.
> Using DTS property(arm,smc-id) or vendor's compatible to specify the
> Function ID is available for the meson-A1.The generic "arm, smc-wdt"
> looks nicer for MTK and Amlogic sec wdt, but the driver may not cover
> the other vendor's platform-specific differences in the future, so the
> platform-specific compatible string may be introduced eventually.

I think having a shared driver is only really useful if firmware
sticks to the same API anyway. Once we start implementing special
cases where every vendor uses a different SMC API, we might as well
make that totally different drivers then. For now it sounds like we
can fit existing MediaTek Chromebooks and Meson into the same API, so
let's do that (with a single arm,smc-wdt compatible string) and then
hopefully future vendors will see this interface and design their
firmware APIs to match it from the get go.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
