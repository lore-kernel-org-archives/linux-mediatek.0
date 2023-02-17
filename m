Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7240C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6tSzB6GogvHu+/Sj0xL4Z/TCcT8KX/q0mTJTQsyK7Q=; b=V1lfpl1JZ+qS4A/bbatH4R6wCM
	XXtj+aOyf/wrKrmmy4n89ipoYMGi2Y1n9D+GSuDZuWDLCojwY1LNfRFJdwn7WkU2rmGge3CwEaV/2
	xGCXkqq4Qqpu7EWA1ZH5TeVlPouxm/6k9Nz/iJLoLGKZ+AQM9sWuGc1CQcQwJkm0QVXTBzC4NoZuE
	CmZl2AEpnnkkbu+u1ExW0EbN+BZLR0wRi2W2IoayBIckA677c/nnaOZjANd17lffJL+76Zu7Kn/ZP
	l9A6voKwzlWySF51ujsx/AZsXf1O4ENMpK4av4wwD8jAzAFjjgivXgbn/ZU0+jSIUz1pLqRXRvo2s
	jgVJ6qoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2Te-00EpJO-Ab; Fri, 17 Feb 2023 15:16:46 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2TJ-00Ep8y-PW
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 15:16:28 +0000
Received: by mail-io1-xd30.google.com with SMTP id s10so507128iop.4
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Feb 2023 07:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y6tSzB6GogvHu+/Sj0xL4Z/TCcT8KX/q0mTJTQsyK7Q=;
        b=OfLZ+n93gBE6JvkCeqIGlnC8EIWeE8iaemwIwdZO4mH8UCtTnPE7WBlzR0w48SrvVA
         lWlf7c9NRg0a4o1ixTNkNXrxTq301dM7B1noIBSe5AIIU4tqwWWtR+92s1zlFLwdkG2A
         hRFzbk1CV2c7DL0f0FGcIgHJjv/5hBFBO8gck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6tSzB6GogvHu+/Sj0xL4Z/TCcT8KX/q0mTJTQsyK7Q=;
        b=Zld4WmHMgVt6MJHyAUsvSbHRWHAqiaWUimCHWHTGTSBR6H9baaASfr2FxWsj5zfzJT
         0rKkGgA/mM/1pejhxl3HZL5xqPAKSYbv6LUf5hM+WRVrBI+LcrI8ao422jbky8/t4VqS
         T4pdQ0Y8tTvsmPkmhDlr5q95gDjxXLQ82F7ShqXA1u29WoMWhpnQ69WjMDSDnQH3Kywz
         QkV9h9R6pfIyFmw2HFf6oLVy3gcALP2+8uIH+fEsdNFGDL8s8ZCI8opiYOanjMz93eHJ
         pp46mSiqnjNcYG7LUHHYcgKSuGrxeuu0jHoPP1Ra7wsuPO9bSiSYdGG7XKythLItobQ+
         peGw==
X-Gm-Message-State: AO0yUKVMrYaXymZHnyf043gMY77x+XMzK6IFK8w1LCDBYpXl++GD1cNL
	7qKy3DrmkliY6NXFE8jHh+jZ+ax3ABhV/nB97vZDog==
X-Google-Smtp-Source: AK7set8VgsRphz5Zi8p+HUY1vqyOrAxOOrq9Nf9k7JovWnJ/H3Qd2Ajyc+oIGlzTDEOE6C0axpa5HWHEqdT2NLOEaS8=
X-Received: by 2002:a02:2907:0:b0:3a9:6e13:781b with SMTP id
 p7-20020a022907000000b003a96e13781bmr544032jap.3.1676646982352; Fri, 17 Feb
 2023 07:16:22 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
 <20230214134127.59273-38-angelogioacchino.delregno@collabora.com>
 <CAGXv+5H7=rOwVK2SapqyeKHKnRJMwXFf1OSD-qhgjkbkoR=Zmw@mail.gmail.com> <c9bd53f9-7d5a-6e2d-4062-297158661422@collabora.com>
In-Reply-To: <c9bd53f9-7d5a-6e2d-4062-297158661422@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 23:16:10 +0800
Message-ID: <CAGXv+5GigndbJ2rfpRUfti-9DO1gyfOQ-difX-oOqSTF2dup_g@mail.gmail.com>
Subject: Re: [PATCH v2 37/47] clk: mediatek: Split MT8195 clock drivers and
 allow module build
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_071625_929003_1FCA5B7D 
X-CRM114-Status: GOOD (  27.01  )
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

On Fri, Feb 17, 2023 at 7:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 17/02/23 05:31, Chen-Yu Tsai ha scritto:
> > On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
> >> option: there's no reason to do that, as it is totally unnecessary to
> >> build in all or none of them.
> >>
> >> Split them out: keep boot-critical clocks as bool and allow choosing
> >> non critical clocks as tristate.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> ---
> >>   drivers/clk/mediatek/Kconfig  | 86 +++++++++++++++++++++++++++++++++++
> >>   drivers/clk/mediatek/Makefile | 20 +++++---
> >>   2 files changed, 99 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> >> index 45b7aea7648d..88937d111e98 100644
> >> --- a/drivers/clk/mediatek/Kconfig
> >> +++ b/drivers/clk/mediatek/Kconfig
> >> @@ -692,6 +692,92 @@ config COMMON_CLK_MT8195
> >>           help
> >>             This driver supports MediaTek MT8195 clocks.
> >>
> >> +config COMMON_CLK_MT8195_APUSYS
> >> +       tristate "Clock driver for MediaTek MT8195 apusys"
> >> +       depends on COMMON_CLK_MT8195
> >
> > Would something like
> >
> >            default COMMON_CLK_MT8195
> >
> > help with the transition?
> >
> > Otherwise we'd need to add a whole lot more stuff to arm64's defconfig,
> > and anyone running `make olddefconfig` would have many of their clock
> > drivers no longer available.
> >
> > Same applies to the MT8186 split.
> >
> > Seems like not all MediaTek SoCs apply this pattern, but at least MT7986,
> > MT8167, MT8173, MT8183 do this.
> >
> > ChenYu
>
> Right. Since MT8195 machines have been out in the wild for a bit of time now,
> I think it's worth following your advice and add `default COMMON_CLK_MT8195`
> to the new configuration options.
>
> As for MT8186, currently, there's only one board supported upstream, which
> is the "unobtainable" EVB so I would rather not do that for MT8186, unless
> you have any strong opinions on that.

I'd like something that provides a reasonable working machine if possible.
If people need to customize to shrink their kernel, they could disable the
options later on. At least for ChromeOS we'll probably start off with them
all built-in, and later on maybe experiment a bit with modules.

ChenYu

