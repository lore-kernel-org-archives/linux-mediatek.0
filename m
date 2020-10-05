Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2C6C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 11:30:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34C872064C
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 11:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z2GA6N2J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lfmbCeTL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34C872064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sPCdTZq5fzq8xY96Vfs33wOf+JnN2weP8UGa1Vflkxs=; b=Z2GA6N2J+xo67jm3m2+mhqTMd
	Ql33t1xNFPk5jWok3mVaxj6ELKOxS1ywoKMz7MKX90pt+9lnjDfuJYBklNmP0QdCxJ7yeBLNCkLXE
	t5/UovPtF4sWLiKzZY82ovVirz7BS2tH8++Fae0kbZRnHdDPjq/wSyOK9NTvaepWAWW+ZdFV0EVxS
	PBmH1NpBusV+QkBUoN9r5EQOP8HLYbd3cwsilm/tThCYD6U2RT5jGGRGhaRKt9B1yo1eSv6XZQPUY
	KMI37M49qNMGsn5aK2OOTmJMwrj0bq6E1ncQee/h7UH3Ms9feegfUQGrOnu8RJ0ZAN4uPPiWhnN73
	FYh3I8KDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPOgu-0008N7-65; Mon, 05 Oct 2020 11:30:04 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPOgn-0008JO-Nm
 for linux-mediatek@lists.infradead.org; Mon, 05 Oct 2020 11:30:01 +0000
Received: by mail-oi1-x243.google.com with SMTP id m128so8360454oig.7
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2020 04:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ggA5atN6eXRjeLo7yvkHNomWP+hkWtIfIwIhYjP1RoY=;
 b=lfmbCeTLipcxNCXRSk9JM5iW0S48sRevkAiNTwMwzzjWmxq60GoNTNWIfkAnenaOB5
 DrvEfTr38jJPy93c3xrCyUT/aZr87z4leJZVuLUje7BWTJkUcXvcjHbsO/AUlcR4SbF/
 yDgDCBbxYo3HAZjc4V8xzdnZq1f4t5Z1W9PLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ggA5atN6eXRjeLo7yvkHNomWP+hkWtIfIwIhYjP1RoY=;
 b=TbYZ/6BiH4EzmDYuupI/l1dre7gyycw9L4cVon/ZPrHkLa0+taaszwzmPD8iqdXT5Z
 g0XdjCFg5DueL9l9ZpYAB1PZjnaXl45J7FTcc5Pdks/G1QDuFn9CovGcqHWGHKgkJgzh
 wq7G90fzVlVkCHWMflBUl6etq/RFX6OcwHs3qafIdaRN+c9yGBRKKc6k/+3jK+rhQAFn
 gJEQeyvC+KmOj8237whVzX9EGkBgeCGSkbMM6zdANz9Im+IyEqJqqpJlolbKtfYYB8Cj
 16fF3y/zuKN710NV5iNtxZdEJ5ZDWxAHwTIcWhpKjZ/Db62o1zV965mlP63tW/rlYRrH
 XOyA==
X-Gm-Message-State: AOAM533fL2s7rAuqiyFZ4qTIwa6YfLSAVMunXtZ7Q41V+sX6oZNe40GE
 WfSSaBXthR8bd+S8PXFb4AiVyY+gKCmfUAsF
X-Google-Smtp-Source: ABdhPJyL5wNypsoYnQ0ndhOkt94bt0bkcy0gvx7+uoP8IVFyKxQR+W5gY+4aBpoCrP6Y2Gvj55xzLA==
X-Received: by 2002:aca:58c2:: with SMTP id m185mr8684923oib.75.1601897393741; 
 Mon, 05 Oct 2020 04:29:53 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54])
 by smtp.gmail.com with ESMTPSA id k128sm1452997oib.52.2020.10.05.04.29.52
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 04:29:52 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id m11so2612003otk.13
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2020 04:29:52 -0700 (PDT)
X-Received: by 2002:a9d:6445:: with SMTP id m5mr11285660otl.36.1601897392041; 
 Mon, 05 Oct 2020 04:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201004122234.802044-1-acourbot@chromium.org>
 <20201005084852.GD26842@paasikivi.fi.intel.com>
In-Reply-To: <20201005084852.GD26842@paasikivi.fi.intel.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 5 Oct 2020 20:29:40 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXujfdLaMhcW4vj2U_Ev-H74Fu-a6D1HEyhyrQ3huV8vw@mail.gmail.com>
Message-ID: <CAPBb6MXujfdLaMhcW4vj2U_Ev-H74Fu-a6D1HEyhyrQ3huV8vw@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
To: Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_072957_865229_1B86502F 
X-CRM114-Status: GOOD (  23.53  )
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
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 5, 2020 at 5:49 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Alexandre,
>
> On Sun, Oct 04, 2020 at 09:22:34PM +0900, Alexandre Courbot wrote:
> > The addition of MT8183 support added a dependency on the SCP remoteproc
> > module. However the initial patch used the "select" Kconfig directive,
> > which may result in the SCP module to not be compiled if remoteproc was
> > disabled. In such a case, mtk-vcodec would try to link against
> > non-existent SCP symbols. "select" was clearly misused here as explained
> > in kconfig-language.txt.
> >
> > Replace this by a "depends" directive on at least one of the VPU and
> > SCP modules, to allow the driver to be compiled as long as one of these
> > is enabled, and adapt the code to support this new scenario.
> >
> > Also adapt the Kconfig text to explain the extra requirements for MT8173
> > and MT8183.
> >
> > Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>
> Thanks for the patch!
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks!

>
> I wonder if this driver suffers from similar object lifetime management
> issues than V4L2 and MC do, albeit not related to either. Say, what happens
> if you unbind the other device while mtk-vcodec is in use?

That's a question that maybe the driver maintainers can answer, but
from my experience during development I have been able to unload one
of the two mtk-vcodec-* modules while keeping the other one active.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
