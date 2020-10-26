Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BCCC4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 17:19:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EEE520882
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 17:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3h1wmM3E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ErGh25PW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EEE520882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kZOnvrf3GiSwOTRJByYONA+5cZDoI7ZJqRamqPe/QnQ=; b=3h1wmM3E9nKERm0ZYbIG3viNl
	PQ6tlGI97o72u3mWpTj0B9nhcFX/uX70aS1GQ0YehCMmMuXFoQVj6xoOGVn+4tDhtBQL49g+1J/TV
	tNaM41M5e7az6V0YHqR9gd+w4/a1c8AKImecq6vn9G7S6alnnSgEkypxSrBtz2eTcPaBtL6gcpOQn
	YN+UsZq9uYF07825RPguxZPvvQahEurUXWuUEuz85NIdJdFFiXC5hwVG76J3CGxHxdLPTdTTXI945
	FRObYAZw5u3NM5h8+sOvDxPWVdGqda5jYqD3Eo9fjABtweUwebBnz+LV3h2R8QCFk2Gc8Rq5m9N3l
	//eClNUWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX68y-0001DC-Mr; Mon, 26 Oct 2020 17:18:52 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX68v-0001Bo-Ux
 for linux-mediatek@lists.infradead.org; Mon, 26 Oct 2020 17:18:51 +0000
Received: by mail-il1-x142.google.com with SMTP id x20so3693943ilj.8
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2020 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kf2slL13S23kIiTkgcu/XH/I01QmvP7nzqRqwTpjchE=;
 b=ErGh25PWSgrRKBR+lrdUtyDZ/6bplQJCyolB3cw/latSi/0fcmf4wuOGOcPlXU3ARd
 /BgN9xUjvux1jSiDAvEtTq7bVbWcd502M4QRu0g8KwHhPLAk5u8QlLTvk7fr69OYtUOD
 pd7oSx2wggH/oh3Fhowo3o1M5CfK5T2ENGfX02C0YLUCqo/haiER/qnns9IbZRSd9GXa
 l/AwzDHEWS9sH0duGobt9yg6Eid7CwK7TmniMjUgN1JQQeSXRSjRo46iathsVBUiCb/8
 Z+dT6jgYR/hcukkj/MUqfA3LFpDBk2/ifZRuAw700nFqfpzGjilxVzVI255cE6fOubN8
 oyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kf2slL13S23kIiTkgcu/XH/I01QmvP7nzqRqwTpjchE=;
 b=BbmLD2wHH4XhqeehqxskMvPU1rHbTVB8FLq0YIQ/zr0C4aMUpYnejn0XQzQn9lKOcY
 pZ+dKU2ypxPkU4jDYzZLt/InNu8JRf0Z0KSfVAU6Z2gkHcmMAjoZmoMd40+ZIlyVB6+m
 oiwYUMPOTZKhnTQMGHUgXce1mJGcHnfTVs/jvSItNtjUGCJ1+Z9i/Nt+sJ6aptkLVZ0V
 rnkasrY1aoMkLURHICdhbF7QZIMkT3Y4Yc1ju61LQ31uVxm/V5w1j7HZU39Ld/zDVTux
 HjHU1j53QqcA4vsEhzRgD1YvZqrDvp7bs1UORynq8L8ge7txqlf+B5gfgRHsgUh9XXY0
 xWtw==
X-Gm-Message-State: AOAM5326XdrTUAO0phyrwnonSWCKOo0Bn6h8qpPM40OiybWmjdz5cPtw
 oHersJfeMO90Iig7IFrLJq+LcTWBr7+KoCmZp0t0fw==
X-Google-Smtp-Source: ABdhPJxaAiZJ2N/5BbUTyaLVKpzqQmGKuG6ERNt1o/WUN1lABApvRd853FwGYPcM3XwTnI0qUj9PzWNbrjk9LiIH7+k=
X-Received: by 2002:a92:7f10:: with SMTP id a16mr12296656ild.134.1603732726663; 
 Mon, 26 Oct 2020 10:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201024200304.1427864-1-fparent@baylibre.com>
 <20201026121316.GB7402@sirena.org.uk>
In-Reply-To: <20201026121316.GB7402@sirena.org.uk>
From: Fabien Parent <fparent@baylibre.com>
Date: Mon, 26 Oct 2020 18:18:35 +0100
Message-ID: <CAOwMV_w5N0_Qgg3MFph1147cbvFP1Y=mUtNjGbcr-Tca4ZJ3yA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: regulator: add support for MT6392
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_131850_038041_AC822CDE 
X-CRM114-Status: GOOD (  16.09  )
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
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, lgirdwood@gmail.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark,

On Mon, Oct 26, 2020 at 1:13 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, Oct 24, 2020 at 10:03:03PM +0200, Fabien Parent wrote:
>
> > +Required properties:
> > +- compatible: "mediatek,mt6392-regulator"
>
> This is no longer used by the driver, should be unneeded and therefore
> should be removed.

It is not used by the driver but it will be used by the MFD driver [0]
like this:
static const struct mfd_cell mt6392_devs[] = {
    {
        [snip]
    }, {
        [snip]
    }, {
        .name = "mt6392-regulator",
        .of_compatible = "mediatek,mt6392-regulator"
    }, {
        [snip]
    },
};

[0] drivers/mfd/mt6397-core.c

>
> > +- mt6392regulator: List of regulators provided by this controller. It is named
>
> This property doesn't seem to appear anywhere - there's regulators, the
> collection of subnodes for each individual regulator which I think is
> what is referenced here, but nothing called mt6392regulator.

Indeed, I will fix it in the next rev.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
