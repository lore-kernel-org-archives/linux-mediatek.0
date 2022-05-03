Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C23EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 16:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NuMsY0ODWAnJ1haIQbx/v43fFhXO4o2J5x8MiCaK1jk=; b=LxzhAuMNo6otbL
	mp+IL23eDNTGYINP/wf2gZMyrjivjV8cRWQwXn+pyirn56Y7PtWKA1K9Qv5VMVhWOhFB2EflXrNH7
	CAbOJO/vzEpJGaGGWd5P5Etpzyr3ziX2gRyjqUYRpSSsMnVxFjFsxf070lMjxotXWwR9Rc+blakKz
	dBzFLOmWR1TOYRKDv2jczNFrUGFsaPU6wZzuQLb8wTmwC5LzYi4oFKs2hY6URIzYfVCEeftyLsD8A
	SsGGL0mcRKXuMvS3pov3fl0iEIhpG7f9qfitMH/U5w0Ks4za53fp0qAntKXTuUrb6RfffECywTyYX
	ToAbjhvxAPJC3ITqZNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlvO9-006ij1-DL; Tue, 03 May 2022 16:28:37 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlvNy-006ieW-9B
 for linux-mediatek@lists.infradead.org; Tue, 03 May 2022 16:28:28 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id e12so31926637ybc.11
 for <linux-mediatek@lists.infradead.org>; Tue, 03 May 2022 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OioOkp+daVjcm8WittR1Tk/UQnINHvqB9L6l895CXcU=;
 b=f1y/Ry6FhhCoj1O6PNJ4u5oIsObhMzvEvN+EpK/DPgP920QWICa8XWxxM25XxlWXdv
 obO4g6HLcH9ipII7mEKHk9PRypuAKrviNfo558KwuHEF8fBitw+prwaFnLfwUa+1nhIH
 /P21JCHt8jb7Swm3CCCtQhFK7/V68tTG4IlpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OioOkp+daVjcm8WittR1Tk/UQnINHvqB9L6l895CXcU=;
 b=Tz5ciY6yjFo94aupJKdosVF1DAvBLH2H4Qc2a5JHAdPZ2PaKOu+LU6qcC0jkdTAzjg
 iQKjkskyoGeW/zSHVYTqY8vFfrnVv9CGj8BZX8uyT7hy9Ytkm+EVkIDTekNxNsIjiRVU
 xar3AqZKNgzkVj0pMSpfb+tDghIsjPdRIeXbQbGBmX/GQ+IeYYU30i38WrbwkUGPuR6e
 FAao1hu3hRa92ixKjAOMkmkLSf5QhGFAwiPqFEJna15jhOXaESDPb71RLMgm4q6iu42l
 rtTUxW4Gg94PiAB/gDifufT83ca7CTAWLBe8qkuk6DQ7LVsErP07+H8NKdC1K1itXwef
 eAOA==
X-Gm-Message-State: AOAM532ckTL6GG04hSc/JAFnr/Ev37TT0Itz8eUevTNo5tA9txlZGneC
 vsMxEuzsJwLPAaBEW07JFFoMTd/d3T9oMZhRMiBV7w==
X-Google-Smtp-Source: ABdhPJxFCzQne8oT1CxNLdigS5RxYgArTKd3K7idnnn5ydcbSbJ7D8zB9paqLbN4J1UhMNtOHiclj9HdbDT1+FIkJcs=
X-Received: by 2002:a25:4c2:0:b0:648:6a77:5da0 with SMTP id
 185-20020a2504c2000000b006486a775da0mr13553377ybe.203.1651595303696; Tue, 03
 May 2022 09:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220419081246.2546159-1-wenst@chromium.org>
In-Reply-To: <20220419081246.2546159-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 4 May 2022 00:28:12 +0800
Message-ID: <CAGXv+5FSscb0F2VBMbSOHRneksZi-WSFTeFATDkY_JHoY=my+A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] clk: mediatek: Move to struct clk_hw provider APIs
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-kernel@vger.kernel.org, 
 Miles Chen <miles.chen@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_092826_349409_49D12DDB 
X-CRM114-Status: GOOD (  13.72  )
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

Hi Stephen,

On Tue, Apr 19, 2022 at 4:12 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Hi everyone,
>
> This is part 2 of my proposed MediaTek clk driver cleanup work [1].
>
> Part 2 involves moving the whole MediaTek clk driver library from the
> old `struct clk` provider API to the new `struct clk_hw` provider API.
>
> Parts of this series were done with coccinelle scripts, while others
> were done by hand. To facilitate review, these parts are currently split
> into different patches. As a result however, this series is not fully
> bisectable. Later on, the related parts should be squashed together.
>
> Patch 1 and 2 are minor cleanups around code that is touched by later
> patches.

[...]

> Chen-Yu Tsai (7):
>   clk: mediatek: Make mtk_clk_register_composite() static
>   clk: mediatek: apmixed: Drop error message from clk_register() failure

Could you take a quick look at the first two patches and pick them up?
They are unrelated cleanups that touch the same code sections as the
other patches in this series, and thus were included.


Thanks
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
