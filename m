Return-Path: <SRS0=DZB5=26=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A81C32771
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 09:09:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 454CD20673
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 09:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lmh1/rBB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QGT9LAJa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 454CD20673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpXbXvoSmNKGwf6rkyotH/Ia03MdzSMrBzrQsONKIX0=; b=Lmh1/rBB8YdYx2
	481qGUbIkZ1h/Q5arXTRcDbZSJzlntAYcuoeaDJUrHFIiTXcupXbU+NAK9j47H+xZ2bg5HCZyBK9T
	wjMa092JpGq1VyPdXNsuR15q00ZAJ2JnSj08sl2VuCzJkGz06qLVBBEh88Uk3ts5QlM/VDLj/vx3I
	kEdnqmM8DeBgUNb10PFFWkQ8cZFt1f5EJLLM9/gnUBiVwbYHasSTUT5BfIJK2+99Kn6ek04qacHcM
	ofCmYnX0thfrRfMFhtwqm2KTBZq71sxg/Bwrlz0GTha6+0/cW4l78kw2TMOtx2flYnAALoVWTMUBj
	IkeQixT8upOohD3ksPWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipToU-0004Zi-Cs; Thu, 09 Jan 2020 09:09:10 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipToI-0004PK-Nw
 for linux-mediatek@lists.infradead.org; Thu, 09 Jan 2020 09:09:02 +0000
Received: by mail-qt1-x841.google.com with SMTP id k40so5259682qtk.8
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2020 01:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iWKF4KF9Y1CtiEun++0rxUUQMRPGqGyeC6hWhJkdSUc=;
 b=QGT9LAJanjfXKoCERl6lGxDO5mX9gXrEuQ7sDttgSjCnzBSKSYfwnG4X9f+Ngw4O1v
 Jkhrpm+DlIJNPfdLLVhSKTc7QDIodBcyMEhHwaxzV8RY5q+Ffgk+1IFXnbZvNBlyfPV8
 UQwFDYjv97NNGovIbt5sPou5JjNNOYGlmCfeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iWKF4KF9Y1CtiEun++0rxUUQMRPGqGyeC6hWhJkdSUc=;
 b=Nuvvss7xNut6XWBJMuLykQ4kdiAFPwHd0n+Xox1EK2ZEcPB/+ucNjy6eADur2YNfZq
 7qLFaB7zM07pGsUE9Tsq/g0lCX37uYUPQV999mhNb8fCyLYkraH+AUCwHzbsxXgBE3LD
 o+27OzOQ5kQS3xXBOWiWjM+umCE/ZILcL7bvZv4JuippCjroz3DyYjJF+r+6z7r+D9qE
 luktQ26q2BuiuRl1N687AoQU+fly6doCN+pE7iIfdDAZ5WzDvB4KWlDbouAJX6kjrk/s
 N3z0Wu8XHu2UOnkyN1nBsXByO7P2jAMGtPXlkHeSLCQxkYVbepzy1l3NUnV4hB/7P1kH
 fL1Q==
X-Gm-Message-State: APjAAAWryloPSn8yFq96bj5ZH7MDLoTAsRoSvVSApFh1F3xo8zWqsIOp
 PlmkzXGPp6G9XL1CevlPyBRpYik88CMuFmSEeaw48A==
X-Google-Smtp-Source: APXvYqzHUEojTodwcrGuQpgaBY41guNbk/ZtFyS1AoJQRt5Iu+x8Niu+YYkIDEdBurliWcTM+tgf2nUl95GTV1rYpXA=
X-Received: by 2002:aed:2f45:: with SMTP id l63mr7382614qtd.221.1578560937298; 
 Thu, 09 Jan 2020 01:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20200108052337.65916-1-drinkcat@chromium.org>
In-Reply-To: <20200108052337.65916-1-drinkcat@chromium.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 9 Jan 2020 17:08:46 +0800
Message-ID: <CANMq1KCKuOTvyDxhnL1baEeRSxnaPdgMp9Lj2pcHwj-30n2-5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
To: Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_010858_823158_5BB3FEDD 
X-CRM114-Status: GOOD (  21.93  )
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 8, 2020 at 1:23 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> Hi!
>
> Sorry for the long delay since https://patchwork.kernel.org/patch/11132381/,
> finally got around to give this a real try.
>
> The main purpose of this series is to upstream the dts change and the binding
> document, but I wanted to see how far I could probe the GPU, to check that the
> binding is indeed correct. The rest of the patches are RFC/work-in-progress, but
> I think some of them could already be picked up.
>
> So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
> backports to get the latest panfrost driver (I should probably try on
> linux-next at some point but this was the path of least resistance).
>
> I tested it as a module as it's more challenging (originally probing would
> work built-in, on boot, but not as a module, as I didn't have the power
> domain changes, and all power domains are on by default during boot).
>
> Probing logs looks like this, currently:
> [  221.867726] panfrost 13040000.gpu: clock rate = 511999970
> [  221.867929] panfrost 13040000.gpu: Linked as a consumer to regulator.14
> [  221.868600] panfrost 13040000.gpu: Linked as a consumer to regulator.31
> [  221.870586] panfrost 13040000.gpu: Linked as a consumer to genpd:0:13040000.gpu
> [  221.871492] panfrost 13040000.gpu: Linked as a consumer to genpd:1:13040000.gpu
> [  221.871866] panfrost 13040000.gpu: Linked as a consumer to genpd:2:13040000.gpu
> [  221.872427] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
> [  221.872439] panfrost 13040000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
> [  221.872445] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [  221.872449] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
> [  221.873526] panfrost 13040000.gpu: error powering up gpu stack
> [  221.878088] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu on minor 2
> [  221.940817] panfrost 13040000.gpu: error powering up gpu stack
> [  222.018233] panfrost 13040000.gpu: error powering up gpu stack
> (repeated)
>
> So the GPU is probed, but there's an issue when powering up the STACK, not
> quite sure why, I'll try to have a deeper look, at some point.

Just as a follow-up to that one. stack_present=0x00000007 on my GPU.

However, the ARM-provided driver I use on this platform doesn't have
CONFIG_MALI_CORESTACK enabled so the "stack" is never turned on.
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/arm/midgard/Kconfig#101
. So possibly this does not need to be done on Bifrost GPUs (and the
error should be harmless).

> Thanks!
>
> Nicolas
>
> v2:
>  - Use sram instead of mali_sram as SRAM supply name.
>  - Rename mali@ to gpu@.
>  - Add dt-bindings changes
>  - Stacking patches after the device tree change that allow basic
>    probing (still incomplete and broken).
>
> Nicolas Boichat (7):
>   dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>   arm64: dts: mt8183: Add node for the Mali GPU
>   drm/panfrost: Improve error reporting in panfrost_gpu_power_on
>   drm/panfrost: Add support for a second regulator for the GPU
>   drm/panfrost: Add support for multiple power domain support
>   RFC: drm/panfrost: Add bifrost compatible string
>   RFC: drm/panfrost: devfreq: Add support for 2 regulators
>
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  20 ++++
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 ++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 104 +++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  18 +++
>  drivers/gpu/drm/panfrost/panfrost_device.c    | 108 ++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h    |   7 ++
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   1 +
>  drivers/gpu/drm/panfrost/panfrost_gpu.c       |  15 ++-
>  8 files changed, 267 insertions(+), 13 deletions(-)
>
> --
> 2.24.1.735.g03f4e72817-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
