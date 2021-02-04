Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637D9C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 02:56:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67DC64DFA
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 02:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67DC64DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bo6rMxngC/r8oK4TWxaD5su4vLxKm3QB0K9dLf6Ds2k=; b=F0/6r56oLOMPIa15q33ZAo9Up
	BRM7s7Z8fnzLIVFqjsSB4BbtWPAGFDACi1m/OsJ206dV1YAtMzxkGvvtftH1FaAR8LEdsjBsdLrJf
	tVBx+8ThCMZRtKadpxsUUzlQ+i+lgBywtmmGQ2Unq8fFs+sshGYS/W7v9qM/35UlEg0gJ/GDi4lJx
	6P9LQXkjSmRc9n3i786Nmkivn5usV2byZSyd1rFTQDEh5fwXBi8++RV15HViZ3jLPsdJJDawRA+cI
	i8lwaEskR0BHXtqgW+paip6OnWOu97UodcGsUCSN4mQgPkGnDSZRl11NfoZt86VVmgyYaQPUEXbXv
	CBtuhIiRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Uok-0005HN-IL; Thu, 04 Feb 2021 02:56:26 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Uoi-0005Gt-3k
 for linux-mediatek@lists.infradead.org; Thu, 04 Feb 2021 02:56:25 +0000
Received: by mail-ed1-x52c.google.com with SMTP id y8so2258818ede.6
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Feb 2021 18:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpW3Ky1drUwlFecwfnx3HP9HFWTcK7Ckd6mLp1ho73A=;
 b=YHVIVvQEFcABsDPIiTMD07s6HiyI15ikbyENtqZhgNr0sPUCXiiqHgpUHv3TpL3iEL
 MHKE716pZtDiXAsXg/m4vKQKub4LWpi/uSqLhh7/UGmu/c9xAtZhx8r32U1l0Nb8Juws
 XGkwNzHrnzLkeIs/kBssHKsMKnaunuNhzaxu1oyYZFAwJP5uU9lhwAI/xRUuDYwErtzj
 ygBGcrGaGF8pvwY35XGy5ZQyCCLAkG0WotlrtXvLQP/BGo3SnBZbaa3rMl05Pd6RQsAZ
 PhdULfNxaD722kiUwq3j4qekN59LmNMHR/vqgjIN1qEkg50R+zbRTGKB+O51yhLeTmqm
 VJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpW3Ky1drUwlFecwfnx3HP9HFWTcK7Ckd6mLp1ho73A=;
 b=kCvlYVGbrEmtoUaDvGoy66XMRaFQFD/zKOPnQuLIBNKDYJyb9cznp0dkJeWVRZAbZ3
 CRH5CeYZV6ploPQOmJt9Mo/oXgqKPfanbypCvhzSLsQ3qEkiwYFs0+fqRL+p4kNs50L8
 aS24LHIoggKMO/7kaZgdlmkgNalUTVI6LwVnGz/JDADoqvgJOhfIavzYv7dMJ9EHb8dQ
 yONlfiRHwzZU5dwYxxnl/AuJ0EpLrI4/djP0ZfBB+GpWFVukfF/68IJ/YleobghJRzCU
 /X1X5aURj3XZOeAIh2JFaZJnjt/W3gVHAWcmeSw0Av6OfI1ns3gxMeFxboulSUNFjJOW
 VkCw==
X-Gm-Message-State: AOAM53166bWWtIOcl7fcDqs6GKbDK21ODIeIVTgIJCHptzk9P2J5PWPE
 Q7Zg6D6S4KsDeEm5m/YrsNl5KaAto7qRk9KXzkE=
X-Google-Smtp-Source: ABdhPJxyj/o7XR1+NjtDC/kW1Sa34CUe1xCFo6gBQ+8JL8CYUznTU3dazdYrsKyUpQhTrE6JMjCmz3HKkleHwfQY/xI=
X-Received: by 2002:aa7:d649:: with SMTP id v9mr6056996edr.383.1612407381187; 
 Wed, 03 Feb 2021 18:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20210203232247.30902-1-chunkuang.hu@kernel.org>
In-Reply-To: <20210203232247.30902-1-chunkuang.hu@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Feb 2021 12:56:09 +1000
Message-ID: <CAPM=9tyx82qNF7EDSfq0u6dHJRKjdsYU1RBROM29sS8vc5tNPw@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 5.12
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_215624_177223_3585CA71 
X-CRM114-Status: GOOD (  20.93  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 4 Feb 2021 at 09:22, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> Hi, Dave & Daniel:
>
> This includes:
>
> 1. Decouple Mediatek DRM sub driver
> 2. Share mtk mutex driver for both DRM and MDP
> 3. Add support for SoC MT8183

Hi Chun-Kuang,


dim: e83421b9acad ("drm/mediatek: Fix aal size config"): Subject in
fixes line doesn't match referenced commit:
dim:     0664d1392c26 (drm/mediatek: Add AAL engine basic function)
dim: de945f3098af ("drm/mediatek: Check if fb is null"): Subject in
fixes line doesn't match referenced commit:
dim:     b6b1bb980ec4 ( drm/mediatek: Turn off Alpha bit when plane
format has no alpha)

Can you fix the Fixes tags, it should have sha1 ("commit") they are
missing the quotations.

Thanks,
Dave.

>
> Regards,
> Chun-Kuang.
>
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
>
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.12
>
> for you to fetch changes up to f289eb1db7d7e6132c3ecf5049435ace2967b0fc:
>
>   drm/mediatek: Add matrix_bits private data for ccorr (2021-02-03 23:54:07 +0800)
>
> ----------------------------------------------------------------
> Mediatek DRM Next for Linux 5.12
>
> 1. Decouple Mediatek DRM sub driver
> 2. Share mtk mutex driver for both DRM and MDP
> 3. Add support for SoC MT8183
>
> ----------------------------------------------------------------
> CK Hu (15):
>       drm/mediatek: Separate getting larb device to a function
>       drm/mediatek: Move clk info from struct mtk_ddp_comp to sub driver private data
>       drm/mediatek: Move regs info from struct mtk_ddp_comp to sub driver private data
>       drm/mediatek: Remove irq in struct mtk_ddp_comp
>       drm/mediatek: Use struct cmdq_client_reg to gather cmdq variable
>       drm/mediatek: Move cmdq_reg info from struct mtk_ddp_comp to sub driver private data
>       drm/mediatek: Change sub driver interface from mtk_ddp_comp to device
>       drm/mediatek: Register vblank callback function
>       drm/mediatek: DRM driver directly refer to sub driver's function
>       drm/mediatek: Move mtk_ddp_comp_init() from sub driver to DRM driver
>       drm/mediatek: Remove redundant file including
>       drm/mediatek: Rename file mtk_drm_ddp to mtk_mutex
>       drm/mediatek: Change disp/ddp term to mutex in mtk mutex driver
>       drm/mediatek: Automatically search unclaimed mtk mutex in mtk_mutex_get()
>       soc / drm: mediatek: Move mtk mutex driver to soc folder
>
> Chun-Kuang Hu (2):
>       drm/mediatek: Get CMDQ client register for all ddp component
>       drm/mediatek: Use correct device pointer to get CMDQ client register
>
> Hsin-Yi Wang (2):
>       drm/mediatek: mtk_dpi: Create connector for bridges
>       drm/mediatek: Add mtk_dither_set_common() function
>
> Jitao Shi (1):
>       drm/mediatek: dsi: Use IRQF_TRIGGER_NONE for dsi irq trigger type
>
> Yongqiang Niu (15):
>       dt-bindings: mediatek: add description for mt8183 display
>       dt-bindings: mediatek: add description for mt8192 display
>       drm/mediatek: Check if fb is null
>       dt-bindings: mediatek: add rdma-fifo-size description for mt8183 display
>       dt-bindings: mediatek: add description for postmask
>       drm/mediatek: Fix aal size config
>       drm/mediatek: Add fifo_size into rdma private data
>       drm/mediatek: Separate gamma module
>       drm/mediatek: Add has_dither private data for gamma
>       drm/mediatek: Add support for SoC MT8183
>       drm/mediatek: Enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
>       drm/mediatek: Enable dither function
>       drm/mediatek: Separate ccorr module
>       drm/mediatek: Fix ccorr size config
>       drm/mediatek: Add matrix_bits private data for ccorr
>
>  .../bindings/display/mediatek/mediatek,disp.txt    |  12 +-
>  drivers/gpu/drm/mediatek/Makefile                  |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          | 223 +++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_color.c          |  89 ++--
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  92 ++++
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c          | 197 ++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 254 ++++++-----
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           | 194 ++++----
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 |  57 +--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 107 ++---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |   1 -
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |  28 --
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 503 ++++++++++-----------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        | 100 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  88 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   5 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  50 +-
>  drivers/soc/mediatek/Makefile                      |   1 +
>  .../mtk_drm_ddp.c => soc/mediatek/mtk-mutex.c}     | 328 +++++++-------
>  include/linux/soc/mediatek/mtk-mutex.h             |  26 ++
>  20 files changed, 1446 insertions(+), 914 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_drv.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>  delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>  rename drivers/{gpu/drm/mediatek/mtk_drm_ddp.c => soc/mediatek/mtk-mutex.c} (53%)
>  create mode 100644 include/linux/soc/mediatek/mtk-mutex.h
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
