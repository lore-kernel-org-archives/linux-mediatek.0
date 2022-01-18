Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7555EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afOC+ez+mtAKwbPcCEJDIxRwi1wf0DUvgZ51ZZDt/aU=; b=zFxvwffeH2FKQ9
	APL1DY5BJNvUBzzsMZ5iWmtV4U6LObxU5L/TKkcSzFlpJAMBN5w5x7P7FLjBelQ54CIxuW3VkrVgz
	10tdMBDrESjjzMuBGm1JmkQ23jrH2kxZYnDHCUx6jKBg7XN90euOK4KjGKDCCjXkTlG4814kT6q6q
	qTNuc48Y3QvXgL20Ebk4dhEXSdlH7rycKIs4SP4JplNr/BUzk9PijQaw8tS4Sep3fEytn19jeZ54U
	CpeU6tusLvkqifcgbSnkqw5VVF4ifsznjE2NsJGF/Ef8Z5XXOoipD3f6BwKzUpHa3pTToeFMAX6rz
	6PCK5ugQekfSfiLEJBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9imZ-000ZN6-QG; Tue, 18 Jan 2022 07:19:55 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9imX-000ZMP-1j
 for linux-mediatek@lists.infradead.org; Tue, 18 Jan 2022 07:19:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id m1so67013470lfq.4
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Jan 2022 23:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QErlBlCXc+a1jsNeHhAG3QvKs8DThEwDqqGrTQJEmKM=;
 b=Cjars/H6j45gYLQkoPMsEllTMBG70C1LHa06SGInYCzXmoS9ijngx+PwY1cWhsnV69
 67f28Y8J8i3CWhggCTKFSIppeyJizkiI/eHKsQ1CvQl3hxZl7oDW9MzjhA1XilWmuXdd
 OuqkvduOPVXfWSYLn/rrthFHAgqKX1wsAIhy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QErlBlCXc+a1jsNeHhAG3QvKs8DThEwDqqGrTQJEmKM=;
 b=6mwXWkJdfkZP4vmHdRZHuhMFkogriFNQ3QjMszE6FNUHrbfXKZr6e7w36Fec91LfNY
 5ni4x6p4lne4Nb21HcnotIvwCjMahVeHS+tqGjLJeu3m8K1ROTM/znljV/rkyGRYUHH/
 aRIOeAkc/NrBc+5XArhvp4UIde9APd8pqjSggWhl8XkfNSI3XvsMZtpw4WxCfzORGN3o
 VcmiYCiE7kns9+mOMAxsccyvFXwa0ZYqyt2kfmDT7UaJdSwTZYH+wf//4UabgPJ5n6e9
 23hyD1R6mQO3i0/nsKoK6kvq+lvN/Aa0Aa31/izY4Tp3pW+ttI4vnK3uJQthidPuQSl3
 P/QA==
X-Gm-Message-State: AOAM530y17JBEonSxaEn07GY7+bO/EuVK00iUCvmav8g03Fj/IblI53T
 pRNIQ9Jl2wHuM2GkJhkZK+DdwSaJiqqjma4zR5ViWg==
X-Google-Smtp-Source: ABdhPJwXqSU3eM+obWywWHyddOWfpjQDK/HtlFI7KumYOm8sZXw1tbMN6njQNPqs6dDTjFNH7waDHttj7UPplBOmsPg=
X-Received: by 2002:a2e:b70a:: with SMTP id j10mr15365829ljo.376.1642490391444; 
 Mon, 17 Jan 2022 23:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com> <YeF/AYZ0DuKGwLLk@maud>
In-Reply-To: <YeF/AYZ0DuKGwLLk@maud>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Jan 2022 15:19:40 +0800
Message-ID: <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
To: Alyssa Rosenzweig <alyssa@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Nick Fan <Nick.Fan@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_231953_130998_CBF0F20E 
X-CRM114-Status: GOOD (  23.58  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, Jan 14, 2022 at 9:47 PM Alyssa Rosenzweig <alyssa@collabora.com> wrote:
>
> > > That links to an internal Google issue tracker which I assume has more
> > > information on the bug. I would appreciate if someone from Google or
> > > MediaTek could explain what this change actually does and why it's
> > > necessary on MT8192.
> > >
> > > At any rate, this register logically belongs to the MT8192 "infra" clock
> > > device, so it makes sense to set it there too. This avoids adding any
> > > platform-specific hacks to the 3D driver, either mainline (Panfrost) or
> > > legacy (kbase).
> >
> > Does this really have anything to do with clocks?
>
> I have no idea. MediaTek, Google, please explain.
>
> > In particular, "ACP" usually refers to the Accelerator Coherency Port
> > of a CPU cluster or DSU, and given the stated symptom of the issue
> > affected by it, my first guess would be that this bit might indeed
> > control routing of GPU traffic either to the ACP or the (presumably
> > non-coherent) main interconnect.
>
> I'd easily believe that.

As Robin guessed, "ACP" here does refer to the Accelerator Coherency Port.
And the bit in infracfg toggles whether ACP is used or not.

Explanation from MediaTek in verbatim:

-------------------------------------------------------------------------
The ACP path on MT8192 is just for experimental only.
We are not intended to enable ACP by design.

But due to an unexpected operation, it was accidently opened by default.
So we need a patch to disable the ACP for MT8192.
-------------------------------------------------------------------------


Regards
ChenYu

> > If that is the case, I think this would logically belong as a SoC-specific
> > quirk in panfrost, where we'd need to retrieve the syscon regmap for
> > ourselves (see around line 800 of drivers/iommu/mtk_iommu.c for a similar
> > example).
>
> Alright. Doing this in panfrost seems ugly but if that's the right place
> for it, that's the right place for it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
