Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EE2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 07:00:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E0566117A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 07:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E0566117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVw/y9IkYkx95QAzbtaxSwWpxvg1xSGPR1HN3tdfFP8=; b=u1xII6Z5G+LsQZ
	LX/K4WmRiDynMhaZa8Q0ooHZiXoB78shxMh1XvlBJAbmyeCfr5dDe/B5Lg1BFNME0oRNiNPU5vMBP
	eilc0TQmH55KDy+5D20NCDZ1kTw1XhRb5y3/wZo0qDqNdAd8S9gFgLhxydvhia9fYhldh3a6swaDz
	KIpFivMEt9mnpJ5aQX55fS3Ur9XWdzmV1PgLd5pcls8m3oS2n31Q5MZufQJEPqvdrJIB8tbnnsreK
	jrHowycoZ3AnBtdEUey4LCLac3COb22Mlbb4aBTE49DvdPpnl/Cmou30yKMLy+2Hnvbe1hjSul9zl
	uiW01za7N09jqIN26iBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkhaU-004dNY-Tp; Wed, 10 Nov 2021 07:00:02 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkhaI-004dKv-Og
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 06:59:52 +0000
Received: by mail-lf1-x134.google.com with SMTP id f3so3568450lfu.12
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Nov 2021 22:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vdxDgkfSTqFGdQ9nDCOLn0v5httxiDKsh2lfCR5yWNY=;
 b=Dk3IOruuqqmTO1uvCBdJDOnwTShbARFlEa7a72kpdIZbwDpDv1/19K09eFtjI9d1Rp
 L7NgTo5zlaLhCJy3gxA1EFIPDpPmhlhWYAuJmRRXEYi7kKvZP0GnINLWmfQOtH+bAH0X
 1uk2w5BAryoSpP/Adl8gFAtAItfFwRQ7SO0eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vdxDgkfSTqFGdQ9nDCOLn0v5httxiDKsh2lfCR5yWNY=;
 b=ASuSEvPg7FLwzuH1UQ+h0NZ0quSp4qBGvHrUO5c+nT5NWdPtTI5D9Y+71gkVL4lgy7
 8+ymP7N+v2xQ4Bn4cOal7YWz7DYO16nTrbYzo8aT0Bwdn/5uGCzFnoiv8AVXXy71swuC
 +FeuxiYqToMVhF5bB/s0GHKQynMKj644RxQtWfKNagKnZ9JJbnZeqS/EJwI6wqUOehZW
 SFxKySsN3DN5AmPxo3uPi9x/mCmRxpX1gB1Ga5ZY35sJsbcbWjvffG1KwbBxxmH9K/oB
 /Kb7QCNfaZZH/LufmLbCfO3yCQP7y2qo1N+sgPlVtDMHLYx2xlgpgu0knLdLXD6HTCAM
 FhmQ==
X-Gm-Message-State: AOAM5311hhVVRSUoHF+c9KwTbPIXAIHV5dOhz0rAnb7SMgVN6G0kSm8b
 9CUml8wpBA4TK1IKObd+UnZziA2cCHR7wHyk39JgbQ==
X-Google-Smtp-Source: ABdhPJzT5pYmXA23R9a52Ed4Op1U7q1rOPubOphl6Ca2rdZzbRShMNUyX0q+L+xsyqB0W6KpQBQgEilils07ZGIo96w=
X-Received: by 2002:ac2:4e09:: with SMTP id e9mr12444311lfr.308.1636527588591; 
 Tue, 09 Nov 2021 22:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20211110022258.2358-1-chun-jie.chen@mediatek.com>
In-Reply-To: <20211110022258.2358-1-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 Nov 2021 14:59:37 +0800
Message-ID: <CAGXv+5G5vnOuW46q7b7m6BDS+R4vCLJehrofjfv95uOFbwyzEg@mail.gmail.com>
Subject: Re: [v1] clk: mediatek: use en_mask as a pure div_en_mask
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_225950_850667_2B7E3E2B 
X-CRM114-Status: GOOD (  15.33  )
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

On Wed, Nov 10, 2021 at 10:23 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> We no longer allow en_mask to be a combination of
> pll_en_bit and div_en_mask, so remove pll_en_bit(bit0)
> from en_mask to make en_mask a pure en_mask that only
> used for pll dividers.

AFAICT this looks like it continues the work done in commit 7cc4e1bbe300
("clk: mediatek: Fix asymmetrical PLL enable and disable control") and
commit f384c44754b7 ("clk: mediatek: Add configurable enable control to
mtk_pll_data").

It would be nice if you could mention this in your commit log to provide
more context.

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
> This patch is based on v5.15-rc7 and [1].
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=546235
You can now base this patch on Linus's tree as the latest changes have
been merged already.

> ---
>  drivers/clk/mediatek/clk-mt2701.c |  8 ++++----
>  drivers/clk/mediatek/clk-mt2712.c | 30 +++++++++++++++---------------
>  drivers/clk/mediatek/clk-mt6765.c | 20 ++++++++++----------
>  drivers/clk/mediatek/clk-mt6779.c | 24 ++++++++++++------------
>  drivers/clk/mediatek/clk-mt6797.c | 20 ++++++++++----------
>  drivers/clk/mediatek/clk-mt7622.c | 18 +++++++++---------
>  drivers/clk/mediatek/clk-mt7629.c | 12 ++++++------
>  drivers/clk/mediatek/clk-mt8135.c | 20 ++++++++++----------
>  drivers/clk/mediatek/clk-mt8167.c | 16 ++++++++--------
>  drivers/clk/mediatek/clk-mt8173.c | 28 ++++++++++++++--------------
>  drivers/clk/mediatek/clk-mt8183.c | 22 +++++++++++-----------
>  drivers/clk/mediatek/clk-mt8516.c | 12 ++++++------
>  drivers/clk/mediatek/clk-pll.c    | 12 ++++--------
>  13 files changed, 119 insertions(+), 123 deletions(-)

Code-wise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
