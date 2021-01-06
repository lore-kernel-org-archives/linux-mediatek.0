Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84300C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:36:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 225D22310E
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 225D22310E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p/gp54g3x5fil2SGz7q6jlKsoDF0gN27qAbrNIZyav4=; b=vVPV/K4EKSk3SUEIb2FD++UZM
	asbVWuMV936pT8G47FP0vdmGOAu5j0xMW5POB9gAlxPgMBnrjKtgGXB6ldIq/AI1FickzVd99FPSo
	Cx6EnFW9vKrT1/nE3yq1HxRTmDr4s7HGLPYAcSmIryyj6qmzSXeGSvZqQpxrAGF0YM2/TtMgX125+
	Oc5qd3p/vCyC8pNtfcQKAl9QvVDecLOnsGGfkBSseO8EIjwyyyPdrGVylbytR0hmCQrm+6JwxFzjp
	P/KSGrfq+DC1AI/DDHQgzXugxy1LltMCgnLR16S9SoeVhTPprNo1eiu/9bR77KNfPyfOtZ8pOrUst
	BWto47Ecg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx6Aj-0001Kr-Di; Wed, 06 Jan 2021 10:36:09 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx6Ad-0001FS-Mg
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 10:36:05 +0000
Received: by mail-pg1-x529.google.com with SMTP id n10so1929445pgl.10
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 02:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L1cnw9R84EcEuAFdK1gfbZr56hSK67LYzd81NwtsrhE=;
 b=kVWP/wme3R43+nk50jvq2W8wtGsaGw8tt8AOLznBqaA1DqI6V6QfeiFaDbHXeQ00OO
 e+tkHQF+hkuv60KBtm2Yg1ALnf9EGmpWGgjinLNB9nAAqpFnLfkxefN5GzaQDeov/DUD
 +tlI5ThdjJiK2FMt7EM/n+p5nPySuLyju2C4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1cnw9R84EcEuAFdK1gfbZr56hSK67LYzd81NwtsrhE=;
 b=BIwXs3gd8rzCwVmZ3OpSTj+qjH67nUzBcU+8ovQAKkjyHMi2LQKHSUptPSR9H3R5Fl
 J+qo7WGP47ky5aJvqkRbHew+/r1N0BFpecntQpBYCI9aHTcr/i7eMHswB+nCx/7k57yq
 aTM4PFSiJj/4ChTn6qXjjPd730b6xOyx5lCQxqMBq0zaSTRmE3nXxPIINgrQjUEHYPkB
 jtc56oOiVRaxQCKfJGQL9XdtIu9+L/QO2GHSuPEU0dX2dTJ31oJMTV0JxbSG/bz33Ht+
 cvshU+iJT8pq+gAb5g6ZyCRDMF3vwY2MxllkqgJybKOrRmVmJL50yG+D+cfL9+sB3RbF
 ZzgQ==
X-Gm-Message-State: AOAM532KLs0WORiOztNiVS03nuxItd9P88zMbzTtyQd48X8N1iiU7ssD
 1c+EroNC7BcTVmpBTEb+5gCAyT6CHHbQ/2Gn0neF0w==
X-Google-Smtp-Source: ABdhPJwQotc5tTnS5l/MtLNrzr2++ahdfA3h44+Jt2jOSMPGuXsyacnypQTKNZfqRAmEOf4NC9M6sNI8OmJyKB6pDlo=
X-Received: by 2002:a63:1a48:: with SMTP id a8mr3889041pgm.257.1609929361226; 
 Wed, 06 Jan 2021 02:36:01 -0800 (PST)
MIME-Version: 1.0
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <1608642587-15634-8-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1608642587-15634-8-git-send-email-weiyi.lu@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 6 Jan 2021 18:35:50 +0800
Message-ID: <CAATdQgC42v+yj29df+CbP=6grhS-YMaw01NsCZBHmDJJ8zBt4A@mail.gmail.com>
Subject: Re: [PATCH v6 07/22] clk: mediatek: Fix asymmetrical PLL enable and
 disable control
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_053603_846143_58CAC5F2 
X-CRM114-Status: GOOD (  20.33  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 22, 2020 at 9:12 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> In fact, the en_mask is a combination of divider enable mask
> and pll enable bit(bit0).
> Before this patch, we enabled both divider mask and bit0 in prepare(),
> but only cleared the bit0 in unprepare().
> In the future, we hope en_mask will only be used as divider enable mask.
> The enable register(CON0) will be set in 2 steps:
> first is divider mask, and then bit0 during prepare(), and vice versa.
> But considering backward compatibility, at this stage we allow en_mask
> to be a combination or a pure divider enable mask.
> And then we will make en_mask a pure divider enable mask in another
> following patch series.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/clk/mediatek/clk-pll.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index f440f2cd..11ed5d1 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -238,6 +238,7 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>  {
>         struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>         u32 r;
> +       u32 div_en_mask;
>
>         r = readl(pll->pwr_addr) | CON0_PWR_ON;
>         writel(r, pll->pwr_addr);
> @@ -247,10 +248,15 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>         writel(r, pll->pwr_addr);
>         udelay(1);
>
> -       r = readl(pll->base_addr + REG_CON0);
> -       r |= pll->data->en_mask;
> +       r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
>         writel(r, pll->base_addr + REG_CON0);
>
> +       div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
> +       if (div_en_mask) {
> +               r = readl(pll->base_addr + REG_CON0) | div_en_mask;
> +               writel(r, pll->base_addr + REG_CON0);
> +       }
> +
>         __mtk_pll_tuner_enable(pll);
>
>         udelay(20);
> @@ -268,6 +274,7 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>  {
>         struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>         u32 r;
> +       u32 div_en_mask;
>
>         if (pll->data->flags & HAVE_RST_BAR) {
>                 r = readl(pll->base_addr + REG_CON0);
> @@ -277,8 +284,13 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>
>         __mtk_pll_tuner_disable(pll);
>
> -       r = readl(pll->base_addr + REG_CON0);
> -       r &= ~CON0_BASE_EN;
> +       div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
> +       if (div_en_mask) {
> +               r = readl(pll->base_addr + REG_CON0) & ~div_en_mask;
> +               writel(r, pll->base_addr + REG_CON0);
> +       }
> +
> +       r = readl(pll->base_addr + REG_CON0) & ~CON0_BASE_EN;
>         writel(r, pll->base_addr + REG_CON0);
>
>         r = readl(pll->pwr_addr) | CON0_ISO_EN;
> --
> 1.8.1.1.dirty
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
