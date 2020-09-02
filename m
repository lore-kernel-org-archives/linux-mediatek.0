Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5290C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 16:23:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4A132072A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 16:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hp8eRxwK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2W8hvQF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4A132072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xZ24xUqXCP3aIh0ffUbQg3S2gWPIG0ducLqJwZFEaEU=; b=hp8eRxwK+b4te6vsq6StM5KAv
	co0Af3w7W2gRbeT9toZZUcpPqCRyB0f3ETF1fYZnY/pxD7tsenLV+9c52/7AE8h/cDDg9xcxg72vM
	zMw9m9ZCHcMnlYGVgVR0N1ZhFfZRg+Xyha65jHCu75IZ0olRN7vfJcwZfIKpHYeNUU8KwXlW8k2Oi
	FrdWvbze7DxqeqMBlQmXiBtuXNlhl2Qw/RESudkeiZjORg8dpnxR+CuuwPf+S5TBARsCWOZJyEH20
	ZfGnX1Um9WcnekBysXo+FtCliZe6TngtgmFtFZeM7oyNOQAs8FbViU9+0cIFykwZO44H55JYiStP5
	Qkas9DtAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDVXw-0005lb-1a; Wed, 02 Sep 2020 16:23:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDVXr-0005jq-Ur; Wed, 02 Sep 2020 16:23:36 +0000
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC19F208CA;
 Wed,  2 Sep 2020 16:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599063814;
 bh=RJITFA13mQCqYxoOB5UPOQVnK4Vx480+dtACmh6ut/o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X2W8hvQFB4ALK9iv68uHX+G1jHVkBtqL72qdB3KH1GQfSk07N39TEWUrf4X+EKoU7
 vu4w/Sn1BNuBJK+hmrEdjtCqAt7dJpo5MAGOixqbkc2tzltTA1OAapRjqDJAvDV/px
 o99CjILlylsFoibtHn/r1/fMRVKFXhQuJuBaKSUc=
Received: by mail-ed1-f50.google.com with SMTP id a12so5509787eds.13;
 Wed, 02 Sep 2020 09:23:33 -0700 (PDT)
X-Gm-Message-State: AOAM533utLNcgK5RXFqY3X8IkHjQzzNlgAmiyAgbABeGlxes5C5Oadic
 evtEgFn3y5HADTsAByHA+N3bzumIbSA9DDjXocU=
X-Google-Smtp-Source: ABdhPJzUU8aJWJbuyjEWTDBzeTSsYZUP7N9/p6dhBdP07EBrMjqVyaYzkDcmRbTXkPN8IbfThl9NYXrG39SJOGiVlIE=
X-Received: by 2002:a05:6402:180a:: with SMTP id
 g10mr878676edy.18.1599063812518; 
 Wed, 02 Sep 2020 09:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191112110330.179649-1-pihsun@chromium.org>
 <20191112110330.179649-5-pihsun@chromium.org>
 <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com>
 <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
In-Reply-To: <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 2 Sep 2020 18:23:20 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
Message-ID: <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_122336_062267_3C4A749E 
X-CRM114-Status: GOOD (  17.84  )
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Erin Lo <erin.lo@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2 Sep 2020 at 16:45, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Thu, 27 Aug 2020 at 15:44, Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >
> >
> >
> > On 12/11/2019 12:03, Pi-Hsun Shih wrote:
> > > From: Eddie Huang <eddie.huang@mediatek.com>
> > >
> > > Add scp node to mt8183 and mt8183-evb
> > >
> > > Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> > > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > > Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
> >
> > Sorry I somehow oversaw this. Next time please don't doubt to ping me.
> >
> > Bjorn, do I understand correctly that you don't send emails to the list
> > informing of the inclusion of a patch/series in your tree?
> >
> > Anyway applied now to v5.9-next/dts64 :)
>
> arm64 build dtbs failed on linux next 20200902.

I just hit it as well... I wish the kernel was built after applying
patches... it would make the next a better place.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
