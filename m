Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2752CC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 18:56:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F211120786
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 18:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v0ODNu4M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WTR0UU+c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F211120786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CD0gB+cmaPxYdRCwm2Un+65EgzIryn9Eg51Qy50yTAg=; b=v0ODNu4Mu3H+Y0LvEyAq49nYI
	TQwvoUi6oYagosylp4xB4jKupJEEx9o4LWfHMqvyrDzsegEUypwYBTNGND5swbMo31aCoyOyMKMPi
	vRufW0hyzjKFYwlrtYr+vXyhh8lSW6lTQW5GyAEL4/12jzu89Rw1wYt2UKjr0TdFEi/NDBo3Ud+fe
	0acxiSTKCerp1KXmLGTGOnkBaQ3EY4f1xRmppIO12T/oxKe3RlDP7AG7L01JnSI2fmG4UcPsI/72y
	WDpg6RFdhoRsuY37UDOMkH6dK4wIDksnail6o2056U4IVkxII57W5mUsHN5jkBNXMxxXSRrYsCtxk
	Ky4m1jcxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtFEb-0005VQ-Uq; Wed, 08 Jul 2020 18:55:57 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtFEa-0005UP-A6
 for linux-mediatek@lists.infradead.org; Wed, 08 Jul 2020 18:55:57 +0000
Received: by mail-io1-xd41.google.com with SMTP id k23so48087036iom.10
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2020 11:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vXGMQZ+ve6vZ2ipClDFItUU2Pup1l9wXtQM6u8l2wRM=;
 b=WTR0UU+cLf/XEP87GLSFBm7SBz61LfJDERL7qcx5aNGpJ4xKKFcfpXrp1VM6+ndif4
 vboYGkDtU7eYOijYqByrCREubsQoF9vgkH0BIYlODGvvdhM/iap/4z+bYI98qdZrpnlG
 dge/8N3LXSf6ugqKZqcKGDhvdEaPiAeiyF2Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vXGMQZ+ve6vZ2ipClDFItUU2Pup1l9wXtQM6u8l2wRM=;
 b=AO78Yl1WjTwAKK/G+0Xmuz6bAFW5nhVJKzAZTCTOlN6jSVxoefyj18HFeGsx+gHRlf
 Fd2FwWs3PAp28AQfHhcGhBsa3Jf61YWmsRSdWTmRkauGIMLcS4HqyxKLujWWUu1CK1b3
 REn0n/Lx9F1vgO8ssgmBfUwlm8YEMuMHeCIHsymKIIBfzM0yRhhgUcWQuEZtPFnqXRZ7
 j2tTBRBWEiTaaRJ0EkOISfz6mHj3tPvloZvyccCm/7S17l4ZBxbCT0wImVgIrcmXeujD
 +CIY5AUVKKTm5z/Gsg59iLuSYJFAad6MzETcXhjxZza8yfjufn6yORUkRxuYlQDjpD/7
 LQZA==
X-Gm-Message-State: AOAM5303Mli6hYgekXeWvRHKom3igJ5j0Dlbytq7I6ScLThbWSeD+LS6
 WQYswpZ6EV+Pz2LtlLE/xkODuvnBgtoAQ5mpq7HAWA==
X-Google-Smtp-Source: ABdhPJzdCydagjZvwmwK0JpNPyAeyndzEPr04+dzCQTBNIw3Ti5enn4p2nsuhiQVZuzypoOF9uSyxTYnUmkeedTcbEo=
X-Received: by 2002:a5d:9347:: with SMTP id i7mr18216963ioo.40.1594234552664; 
 Wed, 08 Jul 2020 11:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200706083705.2343150-1-hsinyi@chromium.org>
 <71bc5fa2-0869-5d91-6bb8-e8d59176e19c@gmail.com>
In-Reply-To: <71bc5fa2-0869-5d91-6bb8-e8d59176e19c@gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 9 Jul 2020 02:55:26 +0800
Message-ID: <CAJMQK-iGwXFwkvY_1nYiVQ6D-N5yU8YNqxeaSy-1XNMJHj1H0A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: Re-measure capacity-dmips-mhz
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_145556_365863_1758A7F5 
X-CRM114-Status: GOOD (  15.45  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Ikjoon Jang <ikjn@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 9, 2020 at 1:01 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 06/07/2020 10:37, Hsin-Yi Wang wrote:
> > Re measure capacity-dmips-mhz on elm and hana:
> >
> > cpu 1:  9502 DMIPS @ 1703 Mhz
> > cpu 3: 16250 DMIPS @ 2106 Mhz
> >
> > ==> 740 : 1024
>
> I have some trouble to match the commit message to the actual patch. Commit
> message talks about cpu 1 but patch changes cpu0. Where are the values of the
> other CPUs?

Small cpu on 8173 is cpu0 & cpu1, while big cpu is cpu2 & cpu3.
Small cpu: 9502 DMIPS @ 1703 Mhz
Big cpu:   16250 DMIPS @ 2106 Mhz

9502/1703 : 16250/2106 = 740 : 1024 (scale big cpu to 1024), and this patch
changes the small cpu value to 740.



>
> Regards,
> Matthias
>
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index 70b1ffcab7f0..5e046f9d48ce 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -167,7 +167,7 @@ cpu0: cpu@0 {
> >                                <&apmixedsys CLK_APMIXED_MAINPLL>;
> >                       clock-names = "cpu", "intermediate";
> >                       operating-points-v2 = <&cluster0_opp>;
> > -                     capacity-dmips-mhz = <526>;
> > +                     capacity-dmips-mhz = <740>;
> >               };
> >
> >               cpu1: cpu@1 {
> > @@ -182,7 +182,7 @@ cpu1: cpu@1 {
> >                                <&apmixedsys CLK_APMIXED_MAINPLL>;
> >                       clock-names = "cpu", "intermediate";
> >                       operating-points-v2 = <&cluster0_opp>;
> > -                     capacity-dmips-mhz = <526>;
> > +                     capacity-dmips-mhz = <740>;
> >               };
> >
> >               cpu2: cpu@100 {
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
