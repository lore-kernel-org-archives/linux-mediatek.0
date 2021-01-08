Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2690C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 03:51:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E22236F9
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 03:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E22236F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uBR/YT+bG2JWKQruLWjQsSMYz7ix7+rB86Pba7bF3YE=; b=xVEe3zRcjkgNgAWcKLw9/S4tL
	pND5VS0mmoxpurTSxOR/LgIGkCfwbOtHf36BD7Y1m6kkmdT0+qHUxm0z3aLPu1IUax/jBBihXE7g+
	TO9iICefZPXpTPfjQitZtSyp/J6o3cmJ+D8jaortmmGIK1dguhQ1YAz4JTIZetbfBaGqJJoCb7pfC
	nV/nYVO229J17yJQmLQytOH8BF0UtTQr200s2dl4Y/qWIzwg6TuUXAfdpOp2LJeTGCwlrpOlcUdZI
	KZHgZKbUE+TtSB0TG+Q5AymKgNsIH2Sjk3IjcEqOae0H5OYJGi2jzOC/BumDduRqSwdTz1UXWgHzF
	VcclTWqyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxinv-0006Te-Mw; Fri, 08 Jan 2021 03:51:11 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxins-0006T8-7b
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 03:51:10 +0000
Received: by mail-il1-x133.google.com with SMTP id w17so8977405ilj.8
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 19:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gVf7bu6Nsu2ua5VOikl5v7fFKv6Yu0gqM05VCXf0qhY=;
 b=h+LkWYQcdF3kk/iqn2pWOUXwGwQr2QEL4e6zRaLimgnTWX7ANxMaV682G6Ow1eVzG0
 S+NGG4hsS3gs35M3yRZCEqUYO9m3TtzKBUvRnuDUWPQj2Npnw1U8+4S8EOmerBQ0+SH3
 NONwYbswkRMgcwFI/pLwj57Dw48sGqVunROLgHgPPQtCJEkmNyc6/qhuf+wwVBLN/7Yd
 KwFANbPQouZppPh1LTZzJNl8EOWKHlLVMqaj3L39f+gvHqm2B2ri16TLbt4ftAv4tNxO
 hcYy+PdGCbO3Ipbt77lozxzOaLszNkoChXza6+Gr3AlMgBt1/4SdV3S8PM1ODCcotj7G
 eoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gVf7bu6Nsu2ua5VOikl5v7fFKv6Yu0gqM05VCXf0qhY=;
 b=rGPqHoXQl3p9/2Ey2HBrnmeUaIwOb2hnXvx0cSETyQbmKiNkp0wsjhmJz6Vc0lBXIw
 CLH20pe80kY5iVCmjKneRam2cBSW0YH3fBDYBL/hdeTzwS3tFmaBa8bA7s8Xduwk3PHH
 9ok37uuF5ZLLEh+3H5GmprwRk6OStHq3Fkoualjk3MiVjCHew80azkNfP9IKFJ9uneey
 DPjfVT5uZxFUIVA3Ld+TMkwXjaVi0Xfz7GM7CvyXw3MdCd1ZSsuvBnjX43iZFCwAgaZn
 IgyLkvZW1nGLzMorQ/wwBJQaB/NbEu/Y0bhvQ44fiJi3xa2NDW8kHX6GKp5Cm7C4nLDz
 bBcQ==
X-Gm-Message-State: AOAM531XyL8pvDd1gWJuUYr8nwIJ/ythYQOKEU43q+RQCUyojFRx4Au+
 dIjMdDtdK5HuNrxEWHYk0SbEbZNf8l0ih8WrGPC54A==
X-Google-Smtp-Source: ABdhPJz/VgWpHgfJHOK0cpNd/VE6tSJIp3+rFKqNNAlfgbYW/M7WvoKlBJKjetj7hGoSK2Qoofe3HpuG54uTzPFdM70=
X-Received: by 2002:a92:7f02:: with SMTP id a2mr2072521ild.204.1610077863853; 
 Thu, 07 Jan 2021 19:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20201214050521.845396-1-tzungbi@google.com>
 <20201214050521.845396-3-tzungbi@google.com>
 <20210106231513.GC9149@xps15>
 <CA+Px+wXEV9GDCMjR8inbQ89tNV9n7RedeAOGJL_yATmeCLjXJw@mail.gmail.com>
 <X/dMvWdwVfnjsUXM@builder.lan>
In-Reply-To: <X/dMvWdwVfnjsUXM@builder.lan>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 8 Jan 2021 11:50:53 +0800
Message-ID: <CA+Px+wVBqup0dMvo-d-4s=jQByYPrSTtopz-8Vc7saihJvELpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc/mediatek: support L1TCM
To: Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_225108_339527_E9E0C66D 
X-CRM114-Status: GOOD (  19.81  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 8, 2021 at 2:02 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 06 Jan 19:50 CST 2021, Tzung-Bi Shih wrote:
>
> > On Thu, Jan 7, 2021 at 7:15 AM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > >  static void mt8183_scp_stop(struct mtk_scp *scp)
> > > >  {
> > > >       /* Disable SCP watchdog */
> > > > @@ -714,6 +749,19 @@ static int scp_probe(struct platform_device *pdev)
> > > >               goto free_rproc;
> > > >       }
> > > >       scp->sram_size = resource_size(res);
> > > > +     scp->sram_phys = res->start;
> > > > +
> > > > +     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> > > > +     if (res) {
> > >
> > > As far as I can tell the if() condition isn't needed since
> > > platform_get_resource_byname() returns NULL on error and devm_ioremap_resource()
> > > is capable of handling that condition.  As such the code to parse "l1tcm" can be
> > > the same as what is done for "sram".
> >
> > The "l1tcm" memory region is optional.  The if() condition is for: if
> > DTS doesn't provide the memory region, kernel can skip the code block.
> >
>
> People are actively looking for platform_get_resource_byname +
> devm_ioremap_resource() pairs to replace with
> devm_platform_ioremap_resource_byname(), so we're probably going to have
> someone try to patch this soon...
>
> So please change the pair to devm_platform_ioremap_resource_byname() and
> treat a returned -EINVAL as the memory isn't specified and other
> IS_ERR() as errors.

Will do but what if we need to access the "res"?

For example:
scp->sram_size = resource_size(res);

By using devm_platform_ioremap_resource_byname() which will drop the
access to res.  Shall we add a new variant of
devm_platform_ioremap_resource_byname()?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
