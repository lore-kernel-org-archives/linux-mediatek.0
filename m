Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417FBC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 19:01:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 166DE20826
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 19:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rkn91H/b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ctQ6SI0E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 166DE20826
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09oLRAoVCbFOJxcT0ubPu9I8KKo9FjfonzhZPHcN9vA=; b=rkn91H/bcEu9r3
	8+wmdo4YDnGCWhBlOZ9yLNKLL1K8PnxmWRolpu1a355lc5rvlWSFKF86nN2twP2DDbT7u9VaS8AmJ
	cgQripp+ByG6o1QmRtZNaJfBh9kvZ5klfSMIyRBn60/2HCxkc+D6Ta8Vcf6tGZUL11cLJ7/ZPAymp
	jOvvl/umn7kGf0MuX9zv17OGnTYfboDN9fqZwOOcmVQJ3+9/ugp87JHX4Gk95pBIVC/dmKUgb3XyI
	jNULDzpKwY7/cRdyeseCfpK+IrupjiEwwOTjmBOVjMZ52DkM8xC70ggZ04l8zPkNLnl8gahKEkhzL
	VLqH1UO+l1EQH51b5UnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbqRG-0001Ex-CU; Thu, 21 May 2020 19:01:06 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbqQR-0007sX-3m
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 19:00:17 +0000
Received: by mail-ej1-x642.google.com with SMTP id s3so10147494eji.6
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 12:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UqwEmbeOGGl5axCIs5ejLFLJkH/v9z3WmODPpOgQhPw=;
 b=ctQ6SI0E7ok+GU+8Ex3LjacXwtrRve+ePuCEcSI/JDcGOh6Bp1+Pw/A6KoAtjV59F2
 z+5NwYvl+gbitSQKeu7ZlBFIhO5ZeBNaIg/x6qgzUh/ARMapWSn6guWiuKv17MDKIHa4
 hpfKR6y5Gzk//on7cJenwGp+e9HRXublre33g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UqwEmbeOGGl5axCIs5ejLFLJkH/v9z3WmODPpOgQhPw=;
 b=a5C6Lswc0g4KWNmhz/1hbZC6xI5WICBmpJvl40DuekgAdtZlbvl+KrhDzOtUbMcGew
 8wFrfIX0obz0fRhF7J+4S7CF5i3xCwlZRbD4yx1YNPe/XQDADaHSFOwSwus282iaZsZZ
 85BV4dIbevuGGKJyqwD3AsI23AQ1+U0v1eTj5vSl8hz6BezkndTr9vALvKCpaUHz9w8F
 05FdxarKpMPo/th1WxwLzn958uz703ybRGrth+fwkRrQMtz2L6203VxWFwAzHPtW5nhD
 pTcS++iFFYRB9LjnAFsbUrpFSG/8kLikFzLF2xWxZyASv+4DfiR4GtxnvlESUk3D1bHA
 bpaw==
X-Gm-Message-State: AOAM532BXj9XWnPJX7RbKxt0b7XQ2lHS1sR1WMJL7gO+aTbLcygnYPGO
 yMHx4qObggji9O3MgBeP6l11sNykemD9/A==
X-Google-Smtp-Source: ABdhPJzPgFduGHbP+yRlAXlh9Stqmubsba1iB1hOsYRMNvXa1BAYwEEWHati/86nNSOhLBWhXaUPRA==
X-Received: by 2002:a17:906:b859:: with SMTP id
 ga25mr5163085ejb.523.1590087611882; 
 Thu, 21 May 2020 12:00:11 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id g13sm4158919ejh.119.2020.05.21.12.00.10
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 12:00:10 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id e1so7720362wrt.5
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 12:00:10 -0700 (PDT)
X-Received: by 2002:a05:6000:ce:: with SMTP id q14mr42592wrx.105.1590087609172; 
 Thu, 21 May 2020 12:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-2-dongchun.zhu@mediatek.com>
 <20200511160207.GA32476@bogus>
 <1589251221.8804.289.camel@mhfsdcap03>
In-Reply-To: <1589251221.8804.289.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 21 May 2020 20:59:56 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DgrDwPEpdN9ErJWsHbMDpo2s_u3pwsqtpNwVk4g3_CdQ@mail.gmail.com>
Message-ID: <CAAFQd5DgrDwPEpdN9ErJWsHbMDpo2s_u3pwsqtpNwVk4g3_CdQ@mail.gmail.com>
Subject: Re: [V8,
 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To: Dongchun Zhu <dongchun.zhu@mediatek.com>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_120015_250019_427D18AD 
X-CRM114-Status: GOOD (  13.37  )
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
 linux-devicetree <devicetree@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dongchun, Rob,

On Tue, May 12, 2020 at 4:41 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Rob,
>
> Thanks for the review.
>
> On Mon, 2020-05-11 at 11:02 -0500, Rob Herring wrote:
> > On Sat, May 09, 2020 at 04:06:26PM +0800, Dongchun Zhu wrote:
[snip]
> > > +            port {
> > > +                wcam_out: endpoint {
> > > +                    remote-endpoint = <&mipi_in_wcam>;
> > > +                    data-lanes = <1>;
> >
> > This doesn't match the schema which says this should be 4 entries.
> >
>
> Property "data-lanes" shows the number of lanes that sensor supports.
> If this property is omitted, four-lane operation is assumed.
> For OV02A10, it is one-lane operation, so the property is supposed to be
> set to <1>.
>

To clarify on this, the ov02a10 sensor supports only 1 lane. It's not
a driver limitation.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
