Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F920C33CAB
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 04:44:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B772082E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 04:44:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nH2AAzrw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YtzQLMTY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9B772082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JF4Xe59mUVhpPlyB0vQMyVG2uoabC9eDgIilzT97I+Q=; b=nH2AAzrwoNaXrv
	Al0pVK2exAtbNITMfSLoGU1+92vVT+jBtntYRcmOIgmB2UCaTXqp5ymGQrjpQ/YIH8n+/13nyEK4W
	fMXlKT3Ot2wbsCizULBb6ThU2fAKaK6msNo7qj7OWC55IriuP8CTNBOzRZYvDLuacOoiUE2wntqtk
	a+qTimpiRTH0dJdwIEk9tumw4VJZpwkPdTk3dEIzZMqBjNUKy+yxQakVE8LQxQQf37SJYUOwYwy3c
	P5VOo2nVpt4nMxVtFg/tObzPNfTw/4/4/Lqq1k8fkRYbedIZOV7i3SVky3iJA+hxccVqytq1cUOTJ
	nAxB8FBBKOaXL+nfFgUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqraX-0006fj-6t; Mon, 13 Jan 2020 04:44:29 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqraU-0006ef-3Z
 for linux-mediatek@lists.infradead.org; Mon, 13 Jan 2020 04:44:27 +0000
Received: by mail-qt1-x842.google.com with SMTP id d18so8044910qtj.10
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jan 2020 20:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RyRzsNkAooAl3CXmjsa9W0SlFMm2BfQr/u0cFTqztIs=;
 b=YtzQLMTYi/kldBF6YYcIPuroqqYIvxXUvFONigR4Dfl8w2speTLhMOoGxcDZYw9OM1
 FgtbFKU2OvsDiZvseynxkHwklMLh5YKPOusMg0dToNRHh+bLHTwU9e0XaYmOYIn/vI94
 dEcwcU+iGg0HkoyHc5LThywaVg+FZ5hhITBYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RyRzsNkAooAl3CXmjsa9W0SlFMm2BfQr/u0cFTqztIs=;
 b=DawExLKa8Y2Rd7Hvfh0ZzGURxbEAR7me34uicoaQcpUBROjIAWpN9uVq/0KI9c5FEn
 wNnglqa9lJbig/5IeUy+OX9RX1J3eOI0yVOIoCMWnLG8qwZzD7/5JbhqAe6YHsZ78tj/
 siVedvf3NM0sVNwA5h2ziuiogzFv0Bbci/9BPPA+19vIjHKhZO7sjncUJ4FzOC3OPa2g
 NNHBJHVtNrV67Xf9PduZj6RpcA+Yl7yaL2Zy2HhRSYv/Psc5oBe8YAWWODb+DIQASVh+
 kmri+gmTsS2C3KGNN6Oiq/3wjJF8TT9kv5TXU1TDrJ54R9rzKp3TrFy9Qb96KLFnQMT1
 68Vw==
X-Gm-Message-State: APjAAAWLeOZ5laF7C64U/1UwhL/+ApUr63RixuB3t1+Y2bIMPSXNi/PB
 eKv1dq+oMjMhrA88n58OSnj8W3hRypkQsjkkMxjUYw==
X-Google-Smtp-Source: APXvYqy3LB6U150QIptmA2JsO9/a4I+iPJJewaoaUQbDRBc1Zx9V28Z/ANjOmYw2SHIkmhQ0FjMPTtUiqVGwYQaYARk=
X-Received: by 2002:ac8:750b:: with SMTP id u11mr12533148qtq.174.1578890662186; 
 Sun, 12 Jan 2020 20:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20191227141405.3396-1-yong.liang@mediatek.com>
 <20191227141405.3396-2-yong.liang@mediatek.com>
 <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
 <CANMq1KB4PzAUdp03go0Ur_khi2bM3+oNUhHtMK=--V6DmGXiDA@mail.gmail.com>
 <2bbd8f47-fe68-574c-cbe9-bcc680dd4c84@gmail.com>
In-Reply-To: <2bbd8f47-fe68-574c-cbe9-bcc680dd4c84@gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 13 Jan 2020 12:44:11 +0800
Message-ID: <CANMq1KCXMUP=5ijqLsZ67MvO2ROFkG0vSX64KqmWtYKm7w8f2g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_204426_154617_0B2C9AAC 
X-CRM114-Status: GOOD (  15.39  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Yong Liang <yong.liang@mediatek.com>, linux-watchdog@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux@roeck-us.net, wim@linux-watchdog.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 10, 2020 at 6:09 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 08/01/2020 10:14, Nicolas Boichat wrote:
> > On Wed, Jan 8, 2020 at 4:56 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >>
> >> minor nit, s/amr64/arm64/ in the commit title.
> >>
> >> On Fri, Dec 27, 2019 at 10:15 PM Yong Liang <yong.liang@mediatek.com> wrote:
> >>>
> >>> From: "yong.liang" <yong.liang@mediatek.com>
> >>>
> >>> 1. Include mt8183-reset.h and add reset-cells in infracfg
> >>> in dtsi file
> >
> > Err, wait, doesn't this depend on
> > http://lists.infradead.org/pipermail/linux-mediatek/2020-January/026170.html
> > ?
> >
>
> That's all a bit confusing, I thought we are fine to add the reset cells to
> infracfg as we have the resets defined in
> 64ebb57a3df6 ("clk: reset: Modify reset-controller driver")

You're right, we're fine. But at least in theory, we should still have
the binding documentation that I linked above.

I will try to pick up all the required patches, split them across
8183/2712 and resend as one series.

> That's why I took this part from:
> https://lore.kernel.org/linux-mediatek/20191226093930.22413-1-yong.liang@mediatek.com/
>
> Please let me know if I'm wrong and I'll drop it.
>
> Regards,
> Matthias
>
> >>> 2. Add watchdog device node
> >
> > Can we have a patch with just this change instead, since you're
> > sending the binding with it.
> >
> >>>
> >>> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> >>
> >> Tested-by: Nicolas Boichat <drinkcat@chromium.org>
> >>
> >>> ---
> >>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>> [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
