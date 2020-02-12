Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413E0C2BA83
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 18:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1144821569
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 18:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HZkHc7du";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0t1S9X9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1144821569
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFqZaFh0s1xB++pipfKcLl7tiISnwaD7CP055Jq1vFY=; b=HZkHc7duOCRde0
	39h/TbQXYrfnrzGK02zKYaW6+a/At7FZhxHnUD5PC+8vDNJ7hxror0u565Eks7kP9Zb8dDbAePtSw
	5/LeSBYLku55NkxMI9p7appX0DvYCETrUALMijImq58ZgI65P3SIpH53lMvpkzCZfJymeNDuDjncd
	3EYRmBibdTLTlqBFsDpWdhLEx5qf3S7grR9yr1CrnmxRBZczPiAfYqH0U9vLb3p0G4P98y9YBD2ZN
	D8viyiGiVaNEGFB8BiatPt1uf4w2Wug1s8yt0M5S/r0fQ1I9tCbAxiB6G2uS3dvsTP2Jm7cacYvaK
	11JA8EHRRsqnQY+DMZ/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1wWu-0002mG-Bz; Wed, 12 Feb 2020 18:14:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1wWk-0002ik-Gb; Wed, 12 Feb 2020 18:14:25 +0000
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 255FA24649;
 Wed, 12 Feb 2020 18:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581531261;
 bh=XPutHtfrd9L6DCjKR/i4gzTwtBJqO9VVCF2dsQMhOT0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H0t1S9X9r5QrGUd7DvAOuSUSqqXDsgdC1XTVAcFbzj4EY2h/S8r/mWZNvB10mdCQa
 38EaQisKKJidSQ7TOlCXmLvne+3QnPgrSM7v03v8XngdUW7peGivsjAvtTOAtfr4CA
 wewf/BxAmAKE916HXnBmP76nvVhL3jH9qCPQp3LY=
Received: by mail-qv1-f53.google.com with SMTP id db9so1363424qvb.3;
 Wed, 12 Feb 2020 10:14:21 -0800 (PST)
X-Gm-Message-State: APjAAAWj/Gc9lpFAm6Y6KUN4V+dyNriHskEFpxJ9jktH7EIr3zY8+GDr
 /O7WuqVCx+REaEyLG4SicEXYB3a8zHb5f7hQzA==
X-Google-Smtp-Source: APXvYqwYf7OiqvLmE/STxKkwBxfQm+rxJyw5z6FFooFuohKsTmQUlxLvZAqUvV1R4jPQEGjoiAS5DvHkVqtRkL1b//c=
X-Received: by 2002:a05:6214:11ac:: with SMTP id
 u12mr8482894qvv.85.1581531260167; 
 Wed, 12 Feb 2020 10:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-8-drinkcat@chromium.org>
 <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
In-Reply-To: <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 12 Feb 2020 12:14:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLuo+2G2MjiwS9cwNhMV2pGBojXFGNqEfLv3fP-Y04mfA@mail.gmail.com>
Message-ID: <CAL_JsqLuo+2G2MjiwS9cwNhMV2pGBojXFGNqEfLv3fP-Y04mfA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
To: Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_101422_982531_1EDFC21B 
X-CRM114-Status: GOOD (  22.09  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 12, 2020 at 2:49 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> +Viresh Kumar +Stephen Boyd for clock advice.
>
> On Fri, Feb 7, 2020 at 1:27 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > The Bifrost GPU on MT8183 uses 2 regulators (core and SRAM) for
> > devfreq, and provides OPP table with 2 sets of voltages.
> >
> > TODO: This is incomplete as we'll need add support for setting
> > a pair of voltages as well.
>
> So all we need for this to work (at least apparently, that is, I can
> change frequency) is this:
> https://lore.kernel.org/patchwork/patch/1192945/
> (ah well, Viresh just replied, so, probably not, I'll check that out
> and use the correct API)
>
> But then there's a slight problem: panfrost_devfreq uses a bunch of
> clk_get_rate calls, and the clock PLLs (at least on MTK platform) are
> never fully precise, so we get back 299999955 for 300 Mhz and
> 799999878 for 800 Mhz. That means that the kernel is unable to keep
> devfreq stats as neither of these values are in the table:
> [ 4802.470952] devfreq devfreq1: Couldn't update frequency transition
> information.
> The kbase driver fixes this by remembering the last set frequency, and
> reporting that to devfreq. Should we do that as well or is there a
> better fix?
>
> Another thing that I'm not implementing is the dance that Mediatek
> does in their kbase driver when changing the clock (described in patch
> 2/7):
> ""
> The binding we use with out-of-tree Mali drivers includes more
> clocks, this is used for devfreq: the out-of-tree driver switches
> clk_mux to clk_sub_parent (26Mhz), adjusts clk_main_parent, then
> switches clk_mux back to clk_main_parent:
> (see https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#423)
> clocks =
>         <&topckgen CLK_TOP_MFGPLL_CK>,
>         <&topckgen CLK_TOP_MUX_MFG>,
>         <&clk26m>,
>         <&mfgcfg CLK_MFG_BG3D>;
> clock-names =
>         "clk_main_parent",
>         "clk_mux",
>         "clk_sub_parent",
>         "subsys_mfg_cg";
> ""
> Is there a clean/simple way to implement this in the clock
> framework/device tree? Or should we implement something in the
> panfrost driver?

Putting parent clocks into 'clocks' for a device is a pretty common
abuse. The 'assigned-clocks' binding is what's used for parent clock
setup. Not sure that's going to help here though. Is this dance
because the parent clock frequency can't be changed cleanly? If up to
me, I'd put that dance in the clock driver. The GPU shouldn't have to
care.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
