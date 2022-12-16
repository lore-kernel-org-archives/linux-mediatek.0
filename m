Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0B5C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmuXeaOFho6ANXfp1SQvZE0XFVjmdQ4fKkeYxkg/yyI=; b=HAPcwVgIpjeJIHSvsj1dAwj2P/
	nP6GljUz5ftCis3tLNJNiHDTE0XAZLvxxHIjF8QuZgfRS9dZLG4Of8AKR8GlYdXqHmrqgq4eV5NAF
	sGgQYDWC08LLWFQe6Qn7oEQ8qGzUEv+NF0oHUZaSW4Y7VOSCt9pJ7XJ4MAyG/dnTcbXuMHXXEN5ii
	AIq+JWwNOzce/r2zD5THQg+5o3kf3lEwxjx5Jq7ocorvaHLKoFJglX1hqe2kIfI1LZPlmI9OelJtv
	RPubxICjkVsRNq5eA30CKdLQuXVHUmCooRHjkbDaDqjnZX6D0RCZFsbAbCEPrpx03U9vRD523BcS5
	j2R4w7pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6B9v-00FTG8-7J; Fri, 16 Dec 2022 13:53:55 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6B9r-00FTDv-Uk
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 13:53:53 +0000
Received: by mail-vs1-xe31.google.com with SMTP id q128so2287363vsa.13
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Dec 2022 05:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UmuXeaOFho6ANXfp1SQvZE0XFVjmdQ4fKkeYxkg/yyI=;
        b=eIoiZi/4gDMxj50svw9SyjQJm2BKU8PdksFSnZHmxheG2a9r9aLgKOM4JGzgAx8has
         /04OQuIU9FLMyPBLbimX7c+1Zu/p7boOEIIq3dTGcfVJNqL22uf0DGueJt3HESk2b1OV
         yq4pnhKsdGKcz1sKN14E2/NC/cVGiNVpXZIxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmuXeaOFho6ANXfp1SQvZE0XFVjmdQ4fKkeYxkg/yyI=;
        b=KIP2wLYfBDay2QvI9VaAL2XuqUCLVzMuBIVQVE6bbuI6ZQDvf/lJyiwZtxec9P2bwz
         H+Xw2YPGIVa1bHSVCI5sIGqwGJigGKQUmTBx9f1S3xTgWkdukxY3bbf/udI5adp6KZyG
         VZDu5RCHQOEPi75NbVQj2SricqkwfQ0jVwGLdQSQoqzjss66WozSMuNAmPf0z6N/KpLP
         0KOwuYY1mnaJvukMlz3A8l0J7/YAl5yyoS9njBJusfn7wID1CxjjkmlR+s6i0ZvyWeTS
         B91tuHnAcZXT/rxU5IawEprGune/XtE0LlMbhpFDkIzC7tW7lfLqgdaS5KuKysc8fl2c
         vy8g==
X-Gm-Message-State: ANoB5pkB+GV/CouYryP7fioc65lY06r/4L8DTo3tgB/oWcTp8q3U1qfH
	oVtHFedmHHfFUGM8LqYax1UXdH0HCY8F+3mMxD8CGw==
X-Google-Smtp-Source: AA0mqf5fUQgQ4R2pmyG5UrPUwro7ua/T3KJHAcqYojZPEANm6NoSCU9iii4yBsMFJEDwiY9k+YateBGOjpKKWJfIq3g=
X-Received: by 2002:a67:1c85:0:b0:3b0:92e2:37b0 with SMTP id
 c127-20020a671c85000000b003b092e237b0mr32534397vsc.9.1671198831097; Fri, 16
 Dec 2022 05:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20221111082912.14557-1-matthias.bgg@kernel.org>
 <46c17d4b-d130-86a7-b5f8-73c30d7fdfdd@collabora.com> <CAGXv+5FORS=iGe55StxR_1E3sdtk9cvitfvNa1SydqCjWGcubg@mail.gmail.com>
 <dd474515-4a4f-3925-cc96-068f9818a2f4@gmail.com>
In-Reply-To: <dd474515-4a4f-3925-cc96-068f9818a2f4@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 16 Dec 2022 21:53:40 +0800
Message-ID: <CAGXv+5EzuPrhNGiezJciaj0Hj-U-2KiSZFZc15yhNqNrpYs0Xg@mail.gmail.com>
Subject: Re: [PATCH v2] soc: mediatek: Add deprecated compatible to mmsys
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, matthias.bgg@kernel.org, 
	nancy.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_055352_015245_A704CE52 
X-CRM114-Status: GOOD (  18.60  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 16, 2022 at 9:33 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 01/12/2022 12:20, Chen-Yu Tsai wrote:
> > On Mon, Nov 14, 2022 at 7:59 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 11/11/22 09:29, matthias.bgg@kernel.org ha scritto:
> >>> From: Matthias Brugger <matthias.bgg@gmail.com>
> >>>
> >>> For backward compatibility we add the deprecated compatible.
> >>>
> >>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> >>
> >> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >>
> >> ...And tested on MT8195 Cherry Chromebook.
> >
> > This now seems like a bad idea. In the dtsi we have two nodes (vdosys0 and
> > vdosys1) that both currently use the -mmsys compatible, which in the driver
> > maps to vdosys0. So not only do we have vdosys1 incorrectly probing as
> > vdosys0, we also have duplicate clks being registered and duplicate DRM
> > pipelines. On my device vdosys1 ends up winning the duplicate clock race.
> >
>
> That's true, we should fix the DTS deleting vdosys1 node as it's not
> implemented. While at it we should also fix the compatible for vdosys0 as
> "mediatek,mt8195-mmsys" is now deprecated.
>
> Would you mind to send a patch?

I'll be going on vacation shortly, and will be back after Christmas.

Reading the above, I assume you want two patches? One to drop the deprecated
compatible, and another to delete the vdosys1 node? And both should be
tag with fixes and backported?

I can take care of it after I get back. If someone wants to beat me to it,
feel free to do it.


ChenYu

