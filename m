Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD809C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 19:25:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B30652253D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 19:25:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VLfcUB6Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="BfSP3GbX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B30652253D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xwb12DKFdYoQ8b/hxot90MiUtpAU2bm5eps++gpTb4c=; b=VLfcUB6Q6D9kF5
	uCqE6vjmyQqQiLXMQJFu/jtbC4E/GaIMxBmnMCmv94lo7S2G4IOgNtx8mVMDDBxAMShA9aJ9iXlEv
	oWK1BBgCByNe7Rgwq2UZnhpdcFEX37ru6no0Gs6tbASwq+avvhAAuFV5Teb5VqcgUJs5d4aPC+kXg
	2w74BZOuSk/i2p2hypd2nd7xyfTjC9iHbmWkbv7GC7w7UQO5o427yY3WtvhvK65G1jVDIugWH6g1S
	F6BpRXQzrI/gDurRMZa9oyjarIiJIV6EPzzJ5MkwEX+2WE8TyEhoUh/X3gkEeLOZiOfgjPi6FGVFB
	HvlFB2blzma9Koz8SgUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itcgG-0000Zs-Ch; Mon, 20 Jan 2020 19:25:48 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itcgA-0000Yc-Iy
 for linux-mediatek@lists.infradead.org; Mon, 20 Jan 2020 19:25:47 +0000
Received: by mail-io1-xd41.google.com with SMTP id d15so234203iog.3
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Jan 2020 11:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9bMt15tcXE4PE6qNXyYSET/eEWGyq0OaCNeBHtTvX4o=;
 b=BfSP3GbX71o1SHhA3EFSfMg+GZVaP73XFsEmUaUSwfO3OpnuveGOVJyWzVyYd/MaOF
 c/MsFzArRoclKltktpEVFGDeF7iPcmYEOBsZ+xL4TWvN9Kv4gux+GqDXfyv6SxxNNDd+
 rI8B7t9jh2Tk0f2XZMH62tqkLvhS7ObGiHud6yMUW79P75Fp5ABl7dBLw2vy2tD2nKw5
 gmpiCJl6d2PKMkHLDVI8I54IQeKrxEF+HMR6yuZKg1jucGSj9VqXvFGiDaCZRlt3Gs2d
 9yCvPDPFrV+lPekmbwxCwVkzoXooHZEMgoPToZ5VkuWGPLU3Kl/nJmWI8iH2G5gh9xTP
 Prdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9bMt15tcXE4PE6qNXyYSET/eEWGyq0OaCNeBHtTvX4o=;
 b=D9MSX6D6rDL4kaE+jJ+rWoroAMrKtFCABpQT7C7mfyMhKIfisH7960eYZkaoc0/kG+
 r8SKMgrG15DCc5gpka1gpWMN2jzakJiq2ycR8LfZwoIsnAKwJOQAaHJwqV9IQVHPmYxr
 6NOWbUeQc7SDs5Wm84DMgq0Xf60gdEPrTpPsY24jDoVLsUlNRklLXLrt2QDen6n35ph9
 DpOxbIi1zp1hNZZnISJOdNsIqj8OPT3NPZXI1qcnkYxxKLQiR3NT762PfkX4ScsMB5KP
 HBOiqipi7LzwnbeuWYwRT6YvdKeoiG/+pNQw0RrunUIBHgUz7d0TF8AsHd5O9HroxZTH
 fKSg==
X-Gm-Message-State: APjAAAV7hR5ATS1TRKxBOOW/w3zpOAPPhb+HJ7du59aCMO3woMyUost7
 jMKREVFip0WbQLzxOHM3c/i/wN/kackeLKszUIcfOQ==
X-Google-Smtp-Source: APXvYqwP3SdqgZL0L28y5AAUef6aoJgxodib4PEZiTX3urKp74wX+5wZUuZeJp8kPylinMmxtaotG9Jkl5w2kpe7yIk=
X-Received: by 2002:a02:8817:: with SMTP id r23mr465906jai.120.1579548338589; 
 Mon, 20 Jan 2020 11:25:38 -0800 (PST)
MIME-Version: 1.0
References: <9b365e76-e346-f813-d750-d7cfd0d16e4e@gmail.com>
 <CAOesGMgFXQzHRQVQNwZU7-jO=eqWT5Dv82RRicMP-dKXwbTfvA@mail.gmail.com>
 <18fa6900-1862-d23c-8453-b7b85cac2ab3@gmail.com>
In-Reply-To: <18fa6900-1862-d23c-8453-b7b85cac2ab3@gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 20 Jan 2020 11:25:27 -0800
Message-ID: <CAOesGMgReoumBfqUX7N9aP06OomYiO0Be0Wp67FMVi3UVF1bLg@mail.gmail.com>
Subject: Re: [GIT PULL] soc: mediatek: updates for v5.6
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_112542_620674_5BCCA0E9 
X-CRM114-Status: GOOD (  17.31  )
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
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 Mars Cheng <mars.cheng@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 CK HU <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 17, 2020 at 1:52 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 17/01/2020 20:22, Olof Johansson wrote:
> > Hi,
> >
> > On Mon, Jan 13, 2020 at 2:18 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >>
> >> Hi Olof,
> >> Hi ARnds,
> >>
> >> Please have a look on the following patches for mediatek soc drivers for v5.6
> >>
> >> I includes the stable branch v5.5-next/cmdq-stable which should also be merged
> >> in the DRM tree. I'm not very familiar with providing a stable tree, although I
> >> double-checked that in the pull request to the DRM tree the commit IDs are the
> >> same, I thought it is worth noting.
> >
> > I'm a little confused as to how the dependencies are expected to line up here.
> >
> > Does your non-DRM contents rely on the DRM pieces? If so, you need
> > them to be based on top of that branch to make sure they are
> > bisectable, not merge the DRM branch in on top (since a bisect might
> > land on a commit before the merge).
>
> No, it's the other way round. DRM relies on the four patches I took from Bibby
> Hsieh. They are part of v5.5-next/cmdq-stable and this branch was merged into
> v5.5-next/soc as well as in Ck Hu's DRM branch. My understanding is that Ck Hu
> sends pull requests to the DRM branch.

Ah, ok -- in that case there's no need to bring in the DRM branch to
your contents here, they'll merge them at their end.

It doesn't do any harm (besides adding dependencies that aren't
strictly needed), but we usually avoid doing it.

> > But... I also don't see how there's any actual dependency here? There
> > are a few cleanups, the DRM branch builds without them, and the branch
> > when checked out right before the DRM merge in your pull request, also
> > builds.
> >
>
> The patches add some helper functions like cmdq_dev_get_client_reg on which the
> DRM branch from Ck Hu depends [1].
>
> Hope that clarifies your questions.

Yeah, ok -- merging.


-Olof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
