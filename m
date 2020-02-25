Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055BEC35E04
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 20:35:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE05B21744
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 20:35:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uz9nQmDk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/zmMhCk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE05B21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxbYQoTwXNJax1wvQmDiyM8nzaF49H/dwvfVoFOmsJA=; b=uz9nQmDkUe9OH9
	8ozq9mfAOOZlML9L6Y1leUi/3FUYcLc2bUdM5be/nL1jx/4zt2DS3xYdwuBQ6p25puTyzUv/0aABg
	bqkUW46Qhwm+Avxl0T5CiG84s+uQot+DU81HKQUBNrLFKieStGlKpyKd8QLErkpkIuTJSWAjyTJlZ
	Nmlwl/3XvWgD4WurCpqlPmAiq2OlkmxDiVJbd8qoTw3b64/eFtIW8GVcINhmeza8FZ1vHl19ZDV7N
	5h9JuCiMuBcRpPlHg/hurBmRyH2McAHoCDQjhsNOGrjcxLQMr1O2Ipy1FI1kFFZh3tiNhc0uduSCG
	KHrf/7fHJxqNoFxgBO4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6gvS-0007jF-Bk; Tue, 25 Feb 2020 20:35:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6gvH-0007Uc-Em; Tue, 25 Feb 2020 20:35:21 +0000
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5DB8E2465D;
 Tue, 25 Feb 2020 20:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582662918;
 bh=IlMHPJZoi6qlavWG4Ahbm3IprtnpXIxML8X3NnRiesw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=M/zmMhCkKG5ZR2aALAAcDqwXx55QaZ79a6R/kP7ncLhvfpPHN14IL07ANpCOk/KqL
 osvvkEIyAzlIUNoWzB9MFSu4Mzp/XQ0NZA31wZHfw19OqWb3jgSh+XeQHJsnDnOcTS
 kP8Q5MyOjKWvQsQjsJ4mhFk7dYdaIU4SDmwTej1w=
Received: by mail-qt1-f178.google.com with SMTP id d9so591786qte.12;
 Tue, 25 Feb 2020 12:35:18 -0800 (PST)
X-Gm-Message-State: APjAAAVGQTDjWly1zSEQmm7ahz/xnDSzy4ub7VTDQnBjVqa7gYg+q2yx
 IfwHYcO8h5nOctJQj54OYyx57GfZn7awdPdRog==
X-Google-Smtp-Source: APXvYqxghQYLQ6PnllHaIfdR/E6y+DaIAu6c0wU88JtyBWhTwo7n81Ke2zCDhWVpQ1z8bFO/Ygmz9cAyLAvnFp0aF5U=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr568504qtj.300.1582662917307; 
 Tue, 25 Feb 2020 12:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
In-Reply-To: <20200207052627.130118-1-drinkcat@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 25 Feb 2020 14:35:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJb2aFHKcVdD-FM2To71iRUJ2nMniw7aZUVXmPmBkazNw@mail.gmail.com>
Message-ID: <CAL_JsqJb2aFHKcVdD-FM2To71iRUJ2nMniw7aZUVXmPmBkazNw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
To: Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_123519_562504_1FC61C14 
X-CRM114-Status: GOOD (  19.89  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 6, 2020 at 11:26 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> Hi!
>
> Follow-up on the v3: https://patchwork.kernel.org/cover/11331343/.
>
> The main purpose of this series is to upstream the dts change and the
> binding document, but I wanted to see how far I could probe the GPU, to
> check that the binding is indeed correct. The rest of the patches are
> RFC/work-in-progress, but I think some of them could already be picked up.
>
> So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
> backports to get the latest panfrost driver (I should probably try on
> linux-next at some point but this was the path of least resistance).
>
> I tested it as a module as it's more challenging (originally probing would
> work built-in, on boot, but not as a module, as I didn't have the power
> domain changes, and all power domains are on by default during boot).
>
> Probing logs looks like this, currently. They look sane.
> [  501.319728] panfrost 13040000.gpu: clock rate = 511999970
> [  501.320041] panfrost 13040000.gpu: Linked as a consumer to regulator.14
> [  501.320102] panfrost 13040000.gpu: Linked as a consumer to regulator.31
> [  501.320651] panfrost 13040000.gpu: Linked as a consumer to genpd:0:13040000.gpu
> [  501.320954] panfrost 13040000.gpu: Linked as a consumer to genpd:1:13040000.gpu
> [  501.321062] panfrost 13040000.gpu: Linked as a consumer to genpd:2:13040000.gpu
> [  501.321734] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
> [  501.321741] panfrost 13040000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
> [  501.321747] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [  501.321752] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
> [  501.324951] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu on minor 2
>
> Some more changes are still required to get devfreq working, and of course
> I do not have a userspace driver to test this with.
>
> I believe at least patches 1, 2, and 3 can be merged. 4 and 5 are mostly
> useful in conjunction with 6 and 7 (which are not ready yet), so I'll let
> maintainers decide.

I've applied 3, 4, and 5 to drm-misc-next. Patch 2 should go via Mediatek tree.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
