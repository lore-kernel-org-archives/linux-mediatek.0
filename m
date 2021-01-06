Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE47C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:26:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 413CC2310D
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 413CC2310D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a834zxghc5NSAbQaYosr/ohai1lr8JVPcdPLKyNW3Ds=; b=U1hzU83bnf3Juy1RLXY3845RH
	gcu+I7bLXTUO1C4qo/eb1Kt+Z4uXX9Lvt8hlSmEjxjA/GvVJJYTCMJ5Amx7SuKjsUahNMFI2KQgCm
	K3L9cvxWcutqDmtIUGTlQODH5GJFM8mJfREmvUoDAX4eCFS8K/sefq2AfTcN457guw0vS7x00J1Oc
	QyPpXQOb/LlWTQjSWrhkXr2l8tjMyoUCeDhUj2brMz9jdNc73u72v8MUQgq23CECYHjSgzKRfdM6B
	y10wyHPt0Jx7YL06ZTXEtjdkjBNQlcL7xeG19N7YRH6HRv9wrZS/r4Rb+53fEw7bFj7gY8sKFsEg6
	PXtG7yoDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx60m-0008Bb-S3; Wed, 06 Jan 2021 10:25:52 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx60k-0008Ab-Sf
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 10:25:51 +0000
Received: by mail-pg1-x531.google.com with SMTP id g15so1927808pgu.9
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 02:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UXZIAZqh+xBfL6TUuJ2CLNmbqo4XogXEQ6f21aMa31Y=;
 b=PvQYGRaylR7ZLMt781fGYH7PAdHnlOlFo5S+lEYXioh2rHtPWzCfHRyIVB+KUg4Uun
 llL7GxDSh2AbRHH6DbNpOA9f7A+/V9L92awzQOhE+TKdAR3MMgLHjaPIjQ6xUL6X3MVN
 2d7Wtvi6gGdp3FR36z7QbJlEGe62xFygXYpO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UXZIAZqh+xBfL6TUuJ2CLNmbqo4XogXEQ6f21aMa31Y=;
 b=hkfNhRYnbz1diP4fjkNZtRBoVqQliGJf0/AD59oqA+N1qS46mEMkGRqxLhYlTEqQH3
 VtqIT7ZWoq45hysg64PvgktMeiDPq8gGwg5F666lxtObY7Q959npWOf/FbR6ofhU19vH
 Baq27Ncsfud+U20vDzeUXvm+8JBvIgtPyxcnqr0WZidE3vz+FuiMCRsiAhe63ne0xzV8
 GTvXBwR4kmVe4CO8bt2Z/yETOG8FQsLTLhVggFeK5I9vI5Rzr/5vS1vpb2BdM34hckdX
 oU9u5bV1S0kowxPNJrrYeRtDpvDdDRF0WSZzcfWe/ra0GBtfMWeOFxYrqNsfVucwZE5B
 LgEg==
X-Gm-Message-State: AOAM530oxG0aos/MqPvz0MnKt99K4lJYDIs6tvru00W8DitGhIKgU8EW
 pIKjcgA34mGqJs67TKG/LKdGi9L96d/q0tilLrsqFw==
X-Google-Smtp-Source: ABdhPJxY96erNkAHFypfbHgSjjHgHmIdlQRpp9DupO/lBseGLPIpK4TW4GgJIKZxB8lnC4qd4HT1DmjRhCQope01kAI=
X-Received: by 2002:a63:1a10:: with SMTP id a16mr3708292pga.317.1609928747355; 
 Wed, 06 Jan 2021 02:25:47 -0800 (PST)
MIME-Version: 1.0
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <1608642587-15634-11-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1608642587-15634-11-git-send-email-weiyi.lu@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 6 Jan 2021 18:25:36 +0800
Message-ID: <CAATdQgC_BnZywDxaZgmF72VRoAZ-1vFGrPD9GL4uEBhsKQTxnQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/22] clk: mediatek: Add MT8192 basic clocks support
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_052550_995840_215D1B76 
X-CRM114-Status: GOOD (  14.89  )
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

On Tue, Dec 22, 2020 at 9:14 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> Add MT8192 basic clock providers, include topckgen, apmixedsys,
> infracfg and pericfg.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig      |    8 +
>  drivers/clk/mediatek/Makefile     |    1 +
>  drivers/clk/mediatek/clk-mt8192.c | 1326 +++++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-mux.h    |   15 +
>  4 files changed, 1350 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8192.c
>

<snip>

> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> index f5625f4..afbc7df 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -77,6 +77,21 @@ struct mtk_mux {
>                         _width, _gate, _upd_ofs, _upd,                  \
>                         CLK_SET_RATE_PARENT)
>
> +#define MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,          \
> +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> +                       _upd_ofs, _upd, _flags)                         \
> +               GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,  \
> +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> +                       0, _upd_ofs, _upd, _flags,                      \
> +                       mtk_mux_clr_set_upd_ops)
> +
> +#define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,                        \
> +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> +                       _upd_ofs, _upd)                                 \
> +               MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents,             \
> +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,   \
> +                       _width, _upd_ofs, _upd, CLK_SET_RATE_PARENT)
> +

conflicts, these macros are already existed in upstream.

>  struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
>                                  struct regmap *regmap,
>                                  spinlock_t *lock);
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
