Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DBEC10DAA
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:19:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A2F32087C
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXaey+as";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BzvSFaQJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A2F32087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9X9CeGf1D9yYQtLGtACUX4XXcOGjRKOfg+JxAXiX6F4=; b=TXaey+asD5v7jgxXdfQoM3Q3T
	3UQG3lLlWyXcexruX5VOQLTglmgUAl39B0houYwpdvotg2C/4CEY7jQ+8q59aAO7zv+wynT3wSS4y
	gL/wGcXRGBre0pnWCNl7aBMn+IuUSI1ElH/djZsLxjr6s4Qr5X1fk8JYGWG+hyG7opKlvkcKB88BJ
	OQXcgqGwe8PHZISKh77TNTlhgfPZmxYT5GAuTEMna12JK96mprCvxf2IO5rDrxb+y1uVRGUs0zKT3
	/bl3XBYKjNt9YQzNZxW5AU27Pl3nhxOdwNM9Exu/hZqHkKRyYjRlJWeIjUIYGza1zzJu/qRA9dqQ0
	WOmRZKgZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFvKH-00049z-Vj; Wed, 09 Sep 2020 08:19:34 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFvKD-000495-SA
 for linux-mediatek@lists.infradead.org; Wed, 09 Sep 2020 08:19:30 +0000
Received: by mail-ej1-x642.google.com with SMTP id i22so2277160eja.5
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1pXeIVny4SCjQpHOWRmhg1e5D0Af+TbFGDr+gvAazg8=;
 b=BzvSFaQJLJILAdbXFT5uKFET8GO6bhTFU1aGXOdyFeuKWcsNprgoucxgyYron9HPfk
 HZ97W1WAJu2i1eDwe14xs0xptM1CRb0niUmbUMgS/GaowyFio56M3+/7vkgyS/mZ9TA+
 pkreEdffWjXtuxoj2tazieSNZxqOVRvmruuzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1pXeIVny4SCjQpHOWRmhg1e5D0Af+TbFGDr+gvAazg8=;
 b=U1xCm6TaYTpjEEReoylPpgs5gTtKug4CvLgK7DIoQvSIAzDAHhBteYwRWoXw5Ja8rZ
 tLibwspBEgtMhGzKQCSX89TchA9MvlJX9sVqa+RolkUsbZ2Vf4aSj5tSqoRlIzqr1ZE1
 mR6GmoCH8xO6BJeBz6iJJPekVJhY0xMypfEKt5S9g5Hrz1YeFlljHKCY2yH/yrHrrwY4
 +ir1BLCHdVRVfo+dz/uX3eTVVryC8s6quUIoFzR16Or/oAqb7mH542fDWp6dr4CZ6Yet
 tx/JHflt2Km8vmVEF/bq+p52NXKnTunN1JLMtvpUKsqiIXHy4Ihn4sA0v1ULtI4LBEMJ
 DLsg==
X-Gm-Message-State: AOAM533M+KQDo0VpxZp67uwL84xeSZz9Qnpdm2HzHh8o5cm3hJC+Zp/A
 nlGZSEDWkmJyKCTNgpbDGWzWuuVda7uteNByUgERUA==
X-Google-Smtp-Source: ABdhPJzvfIij7YO4hihFiSb4hxA+NHJOifz4cTebwv29YbC+ZXbvBjLWdaVioZkEamOkVZ0ebFwb4JDa7iEPkbmLQ3o=
X-Received: by 2002:a17:906:f150:: with SMTP id
 gw16mr2384862ejb.528.1599639568574; 
 Wed, 09 Sep 2020 01:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191112110330.179649-1-pihsun@chromium.org>
 <20191112110330.179649-5-pihsun@chromium.org>
 <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com>
 <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
 <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
 <ab35a9c7-1b33-dc75-8520-ee072ff1309f@nvidia.com>
In-Reply-To: <ab35a9c7-1b33-dc75-8520-ee072ff1309f@nvidia.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Wed, 9 Sep 2020 16:18:52 +0800
Message-ID: <CANdKZ0eGTqxkcdgyAR6ay4yJNy74v5SqAOh96u+v4WzbZRf32Q@mail.gmail.com>
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To: Jon Hunter <jonathanh@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_041929_953455_2753C86D 
X-CRM114-Status: GOOD (  21.14  )
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
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkft-triage@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 9, 2020 at 3:37 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 02/09/2020 17:23, Krzysztof Kozlowski wrote:
> > On Wed, 2 Sep 2020 at 16:45, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >>
> >> On Thu, 27 Aug 2020 at 15:44, Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >>>
> >>>
> >>>
> >>> On 12/11/2019 12:03, Pi-Hsun Shih wrote:
> >>>> From: Eddie Huang <eddie.huang@mediatek.com>
> >>>>
> >>>> Add scp node to mt8183 and mt8183-evb
> >>>>
> >>>> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> >>>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> >>>> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
> >>>
> >>> Sorry I somehow oversaw this. Next time please don't doubt to ping me.
> >>>
> >>> Bjorn, do I understand correctly that you don't send emails to the list
> >>> informing of the inclusion of a patch/series in your tree?
> >>>
> >>> Anyway applied now to v5.9-next/dts64 :)
> >>
> >> arm64 build dtbs failed on linux next 20200902.
> >
> > I just hit it as well... I wish the kernel was built after applying
> > patches... it would make the next a better place.
>
>
> Any update on this? It is still broken as of next-20200908.
>
> Jon
>

I just sent https://lore.kernel.org/patchwork/patch/1303034/ which
should fix this.

The build failure is because another patch for the mt8183-kukui.dtsi
(cd894e274b74 "arm64: dts: mt8183: Add krane-sku176 board") that was
merged after this patch is submitted to list is missing the
scp_mem_reserved field. Sorry for that.


> --
> nvpublic

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
