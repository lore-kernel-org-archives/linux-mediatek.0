Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5ADC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 12:36:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F75A60C40
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 12:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F75A60C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g95J7feTUeOruGUK7wGPjxJxZAScKSkCUeVK5n6d+go=; b=z+H5hY21acb7KV
	WbGcyX7FkIi6MjsleNFbRhZm/7C0Bpqq/bOVq+9+QhtP8ALoinS5HdI+LFARmsi9IL2gspjhE1IVo
	kNG9B6sbjbJOTscSvLGCaMW2/BbxUXZz6QbxOxXhbX/gyV6RuRecf4BHuSTLSvKEqQnv5Gwh8H+Cv
	O6seijKsI3XxS2ozTZJi6IjSxcNezMVngutwwG9R6JScwQ56vq7uR/qVHdDHFTCsT9ZiZc4RzWU0S
	hwqaIyyRIR3PBQt1pVW/bgZYPTrYs18tJVNhAM88WDBA5Ro7y5z1Jkzvrjv8XAyQbnSA89UKQAOWN
	PdfoGCBLvJOdyHmpr7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKgWS-00HFjy-0R; Mon, 30 Aug 2021 12:36:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKgWD-00HFhV-A5; Mon, 30 Aug 2021 12:36:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 907AB61027;
 Mon, 30 Aug 2021 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630326964;
 bh=VSnG7ci/z6It+oL6KcTBEhuTf8u1sv3TMd5qXRIvpQw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z9VrAPSYu3o1kLTK5GooxotaEz5m+jtqVGPk8x4/xsNs4xSvwITYKkramNk5d/Ds0
 Teze/fJvUS5JD3p4PamiFqb8HZjoQyXqOhTqZWPGvRcsAursOrRZnb9c31yWhB6kP1
 z7J2AvmUKIV07RunGf8O9elvEyIotC5c1kW9YeGN8AstPmq2X97tMbSCFduB4B7put
 Gjvg/TCjEPgvqzH+1XqWBuZcnDX3l3ZBslHmIwBQ4ginqBAmsCLQGEUmFYThNrvgKJ
 M0cHM01VOqLFW+6ei0XINX0sckimNyiqcvkXgF7RoCI43TdCyB0U20iL6wW7xeU/LQ
 mw9nffcTzgXBA==
Received: by mail-ed1-f46.google.com with SMTP id i6so21413675edu.1;
 Mon, 30 Aug 2021 05:36:04 -0700 (PDT)
X-Gm-Message-State: AOAM530qaaIxDA89NB45+5SFmFl0DKFhX0PGSL8FR89rtodZJggE26rU
 GD8K+vEtjLYamMUc1JScKZV/R1eJLn/FIuOxTg==
X-Google-Smtp-Source: ABdhPJzKe9hTkHckfNaR1ucxYim8h6wVK9o1P5JmQEu+WRbO6Yl0Gq0AZ2KqnNnrX8JgVC8B7aRTlLvuFbVruyQ61UA=
X-Received: by 2002:a05:6402:70c:: with SMTP id
 w12mr24307350edx.289.1630326963208; 
 Mon, 30 Aug 2021 05:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210819084144.18483-1-trevor.wu@mediatek.com>
 <20210819084144.18483-8-trevor.wu@mediatek.com>
In-Reply-To: <20210819084144.18483-8-trevor.wu@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Aug 2021 07:35:51 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+bLVLqqVKfYuXDVYexMojMgZ5p34Pcx7_7LwU40b-2dA@mail.gmail.com>
Message-ID: <CAL_Jsq+bLVLqqVKfYuXDVYexMojMgZ5p34Pcx7_7LwU40b-2dA@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] dt-bindings: mediatek: mt8195: add audio afe
 document
To: Trevor Wu <trevor.wu@mediatek.com>, Mark Brown <broonie@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, 
 bicycle.tsai@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, Li-Yu Yu <aaronyu@google.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_053605_422412_3E105BB2 
X-CRM114-Status: GOOD (  13.46  )
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

On Thu, Aug 19, 2021 at 3:43 AM Trevor Wu <trevor.wu@mediatek.com> wrote:
>
> This patch adds mt8195 audio afe document.
>
> In order to support dynamic clock reparenting for ADDA and ETDM, PLL
> and MUX clocks are requested even though they are not consumed by afe
> directly.
>
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
> This patch depends on the following series that have not been accepted.
>
> [1] Mediatek MT8195 clock support
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=501923
> (dt-bindings/clock/mt8195-clk.h is included)

This dependency is still not applied, so the example fails. One of the
following needs to happen: the dependency needs to be applied, this
patch reverted, or drop the use of the defines in the example.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
