Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D364C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:27:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6B3F20724
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="efsADpEn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kCTP4aZL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LFNJdaR0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6B3F20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KOI5W963Z4wQYY+tXS6JVlB+buaUqv5EqQ1py9T47Js=; b=efsADpEn3mQTOF0lvA4YMS+m9
	o4m0vZPad5HgXNWJlNsikZCU2DQP+T6x7yQd0CQpwEo7xJ4L/mPUJeuNJhBtabKdPqriIDQ3w/0lS
	9yBxcILxAtTzOcRlCo0mDgj5CY87I72NLqEN59C1HKNDPi4XiWE8IUVQEhWDvZ6YfrnIhOwa+HYXE
	yu+ALWGPPRIPn/ieOFy+d7J+HHsOZrIAF3TTSia689m+Wz4P2J0O8u3VjHH7UPVPDFWHyAecxT7Kh
	MUGzfiXdMqWI5nLYOvQDZocgYYyM0zVkHuxG890KJxdzTxRTwi2ptVvTNC8OtFMnr02dnDNLJYLtS
	FfCrq5RoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomVU-0002hZ-Um; Fri, 26 Jun 2020 11:26:57 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolFB-0000bm-Nd
 for linux-mediatek@merlin.infradead.org; Fri, 26 Jun 2020 10:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Wi1GFCWALRog62SpR3oo7ajuACihs+N37wB4PqfLs6Q=; b=kCTP4aZLy7zI80DKYalvgLXzw+
 To0JCU2f9FIUQYL7ajUKlY2WxviIRORC9crm3QDWqU1w/HiRwDvSBuCNEHplZ3pts07cVuTF28d6F
 EC+ZDUXMhR3/wdOkGfhSdmIyFwCOxEMmzv/3ICXRUdUol9Y/UipN7612rorLiaUOznm4X5WkjbvYj
 7wEW4NN+WECsnU4pR0gOPySIYZdePMgAoNqUyVOGcnllOjm0uDRy+EXNNTWNt964rp4Fxco0f+CJT
 X/u2YUhSbcyEJ0CDyjgY1M9kJDlRxT5tCpVSyuvY/BDnfTLDvpY82iff/HRE74ewd3kufabNuk78r
 jRTsZJ7g==;
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joksN-0005eD-Gn
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 09:42:55 +0000
Received: by mail-ua1-x941.google.com with SMTP id q15so2608946uap.4
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 02:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wi1GFCWALRog62SpR3oo7ajuACihs+N37wB4PqfLs6Q=;
 b=LFNJdaR0AkSuh3MJcgNrsQlDU/7wrBA3cC9RvNe5/S1FtK59iGcfNz1pqPRCOOZOHM
 D8oaKjuHKvY6H/P77GhepO6B2WNZrUoi6FKBVN7WfMu5721zquQvROmijyOcMMjgU8KS
 zanPdyNJEkfk2FvZ/WiZyQyGddNJ+XFEiseu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wi1GFCWALRog62SpR3oo7ajuACihs+N37wB4PqfLs6Q=;
 b=OI87ffpOtquyvr5PIUM6eiFkkMTJ4xWxMTM9XrxaxpoNAljDG24K1Q508kEfCPK87H
 AGnpturp/zU9FlXfFKIsmEI0qSzC5v4zD2XYGzCINzDT6ezUUzkKiisN3lO8EHwVsT0Y
 B9o63TQ9iG8dx88rTQm40y7NFGaX1YGzwXhA5d94mkzKVK++0YhaCcIOXwnQiFQdhoIR
 VdW0fuE3fdb/+Di2t4vd9yPL3qHUk8jl7eKl03YqsvsJxTNqCUgZ5LDYAf7P/lxSMC6o
 0W68efuNrHHZApU6G4sL/HN81rXaNU3MOeCRt6wjwx6G0AMP6UyQ7xUXb8Hb7crsHWHu
 y8rA==
X-Gm-Message-State: AOAM530xJ26KzCHVfz2H3RJBUMAQlRlsAuVDEdK2qAJZw+jMnSg2qQNP
 hmvhOLqscdwmxNmHfTTU2GSKJlXCs71V2g==
X-Google-Smtp-Source: ABdhPJyUtpd7RE64IsTAUAnr7hmLZ0tkkNoScWgLEzrjnJRj0VCPjcd/sKQukZd/WSr2zIds89AU/Q==
X-Received: by 2002:a05:6830:610:: with SMTP id
 w16mr959035oti.165.1593147311606; 
 Thu, 25 Jun 2020 21:55:11 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49])
 by smtp.gmail.com with ESMTPSA id y206sm6142740ooa.32.2020.06.25.21.55.09
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 21:55:10 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id d4so7504013otk.2
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2020 21:55:09 -0700 (PDT)
X-Received: by 2002:a9d:64da:: with SMTP id n26mr976709otl.36.1593147309361;
 Thu, 25 Jun 2020 21:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200520082723.96136-1-acourbot@chromium.org>
 <20200520082723.96136-7-acourbot@chromium.org>
 <1592551593.32358.1.camel@mtksdaap41>
 <CAPBb6MXOPMhtSrAa+F+0BcC7Uzc4UJQU29eBMi5fv1zjF2D0jA@mail.gmail.com>
 <1592875738.26708.5.camel@mtksdaap41>
In-Reply-To: <1592875738.26708.5.camel@mtksdaap41>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Fri, 26 Jun 2020 13:54:57 +0900
X-Gmail-Original-Message-ID: <CAPBb6MU6GRwaSkJWkdt3_0a=TDoCuoBTv3QKuRDbDQ0htCYS5A@mail.gmail.com>
Message-ID: <CAPBb6MU6GRwaSkJWkdt3_0a=TDoCuoBTv3QKuRDbDQ0htCYS5A@mail.gmail.com>
Subject: Re: [PATCH 06/10] media: mtk-vcodec: venc: specify supported formats
 per-chip
To: Tiffany Lin <tiffany.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_104227_957584_EB2F92D6 
X-CRM114-Status: GOOD (  19.80  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tiffany,

On Tue, Jun 23, 2020 at 10:29 AM Tiffany Lin <tiffany.lin@mediatek.com> wrote:
>
> On Mon, 2020-06-22 at 21:44 +0900, Alexandre Courbot wrote:
> > On Fri, Jun 19, 2020 at 4:26 PM Tiffany Lin <tiffany.lin@mediatek.com> wrote:
> > >
> > > On Wed, 2020-05-20 at 17:27 +0900, Alexandre Courbot wrote:
> > > > Different chips have different supported bitrate ranges. Move the list
> > > > of supported formats to the platform data, and split the output and
> > > > capture formats into two lists to make it easier to find the default
> > > > format for each queue.
> > > >
> > >
> > > Does this patch pass v4l2 compliance test?
> >
> > This should not change the behavior towards userspace at all (it's
> > just moving data around and making it more flexible), so the test
> > results should not be affected either.
> >
> I remember that passing compliance tests is required for upstream.
> The tests try to make sure that all V4L2 driver implement interfaces in
> the same way.
> So user space applications could find/enumerate HW capability.

I have confirmed that this CL does not introduce any regression with
v4l2-compliance.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
