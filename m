Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040CEC54F51
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 00:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=; b=a2lHtcUIZtuHwMCkiY0ScpHzhR
	ToTvVAXEP8haklipT9XdyIVMz+f7MfkDIeMvDOyIWKrOK5XQVCixXdn48+lbqHDNTxPUdPgcIDPmF
	HcBd9zY6dd11r+FOtYKAnxNvvw9Vovs8UVKtu+++kzXklCxXd2DAfJpYlu2hit6ARVkzCV7hTc8Pr
	911cZJ3EwxVYYDW5+HC9Rb2TdRcDTslUV5btWqH1X0tg7juPByBSvLE85JVs1ukIxOw2b3FgqQC3u
	kC26lk9veIFNfgykTtKkMu8Slsv2DsGQZpzWz6pmsIw/sd7fA97uKdI/cZpn4l2Dw9QlWjmhylTSZ
	z5I0yLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1worr0-00000006VLi-0BY1;
	Wed, 29 Jul 2026 00:08:58 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1worqw-00000006VKo-2fJp
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 00:08:55 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7ee37dc91f5so310050a34.3
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 17:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785283733; cv=none;
        d=google.com; s=arc-20260327;
        b=lPTY3XmHDI7VEwCzV45Ol6U26uBWsAw55tEYOJLbLy9uj81AkDR+TDrCM0XGpfLcki
         YbAsicG3uyrAg28UOSO+6P7upXZA7G+zH4fEf1rGup4L+CIndX1d+wDQTi+6aLx5uWf3
         F0pYQC4v+Oo31YodmqoclMriHXZzoBu9iCqvaXxlyGx8ofnxp5BvDlbb9P9JImxvCkMW
         zhONDpQNygCvi0VopC8oOP3vr6XDg/dSaGr6rh+RZ/AK6JoIgH1kcvLRuOSdaxvgP/4N
         h9fBWdlQxLK/7IxjiWqs05oGn2NFPpkxqZjflGo/MMVAQJgbGQVNG6wM6MKQ2S/rieCR
         itcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        fh=Xm8sWKCdIq/8UAIPN5UsSEmAOKcsGqdeaiD5TReNtZU=;
        b=AVBP1IcPleyv43sr5pCBrqgnrFFBwbXogZGkSEoV+UC40vk+62mT9i8M8eQlWKvByo
         teleJ2dMkHjOtEVNu6RpZGtoBJsTAa3BygYa1v1B5DWAPoiNNaGrPqps2M+zueqZwzyB
         nIl4tLzgoqnz/NPzgWPZJm1bzIFmAM6TtAnXAxVnd+fHvtT+d9P0Fctii0vsF/K+nWGF
         F9dHa1wFvFFXBUB/0ihpxRn76JhqL9BccG7dh+zLc1oJyAv+brLFlkHJndUUij3KG5Dt
         aTLMpQglrXaX2PmVLqA6MajZkMBD3L11pWAng8B05quVIL92Yk1u+LvVJ9UFa59PB6mb
         WZIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785283733; x=1785888533; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        b=Z/RBCAFlO/R7umNx8sl43wW2qSp4maIqsqbVUdavY1yhXp3PVY/qhFYZ3rx2TtX++f
         3+u2m9fyKAQhLsmF2ll4/vBtpFaZqwFZsqsDbp1OC/aUp1rjPzmMpe9h11u+CiaT80xm
         U+rb7DFvLvXnAJz8Ti0AsmtoYYF1EPaD9AAcZkhRg8ENPMkJ1/sIeuN9kxh2RkIW7e/5
         UUnuAhaSZqicLmL/qGz7u1stH57UeMo+YP3+9gbf+15yVrHZNNXMBg0Xza4WY/qTYKrr
         psEOq//IxC5GjGxuhRla8aYbkY66LQUM5ThZ17UOXhUgc9sN+oTW9dTLXlmozHgdADpz
         savA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283733; x=1785888533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        b=GWVMhRWQykt9r8XsfIWiENW5qcOnZI7J6yCWWa2NyfE3h7MQCqHbDXjfcVVpwPukqz
         WPg6oFRAmv+Zv3RNJ1ZGCWkuIZMupREtewJjbZ/zMJ8lUkl7HEpNOyjfwMK0iv2M4WRs
         Ov1iDq7atBFQ0WhCR4+9jW6EGwjOJOyMfDcD0hOXT1XIhTOq5PlLfN6RaEqrCP1Z+3NM
         xAFEML9cwP1vUG86/7OYCsnDhONueEXIuWZcP09vXIDl7c956znxniqEfZcw9xW75391
         trlMHRkckmLkktd0/h14Jm83wrJSY9Lm87vcp61qNiweIuNn1WVxqsOnim2CL7vMy4uW
         qr3g==
X-Forwarded-Encrypted: i=1; AHgh+RrK4WUlquxcG7+wYgAZf3ytembTk+4o+lQPoVMmJ/xwWsQp84MJ8Npi+qCU4vx+f0ERDHiofMoBT79XDeSuNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3W2alYmqaRow2PzuSjjowIOlNFb6upVMf6uyp0G//Ykc6ziTz
	c19E63Z5hfqvhPjBmwHWuwRyX/s7VFnkCPgSNi58DEhJrO2kz4IMl+2PLLL18OnnaBhQc85l5Z6
	znqCGrDlbnKBx6LIrbcF4vHc6oDrHqpU=
X-Gm-Gg: AR+sD11a0TcDU08RatIpCmHYt2X+jqK6cZQn/QOTINl+IlRyuSGEw+/cO/typylBZgD
	lplWfnXxMUMtfzvhJuaHB0QPTCREu6FDJqBjFvux51th4SG+egvw5nixoiynHEIDuTawSfFvCXN
	/x0ou5KH4SIEWbR3NxliEsFBHygqNqIMe6xdt12xneBETjo7/OCpmR3kQjwNZXqGQSbUa2H1V52
	1eVxN5OVg37EXsCiJoIaNgCSb6jGb+7Hn5+b58XTEUmqUe9tDVdD0DITivhLQVcZG4i1oN4kiud
	ewJ30/BKZvBkqv0DbJ2xMEkYANa9eI7QUmWAtHKgDyl9fd/PmRdoh0t56xyyEq3yF2WaKA1IQHl
	GUGo8j24zSaJW+A==
X-Received: by 2002:a05:6808:220f:b0:496:2b3:ae71 with SMTP id
 5614622812f47-4ad5b9cb9dfmr3003896b6e.18.1785283732989; Tue, 28 Jul 2026
 17:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
 <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com>
In-Reply-To: <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Wed, 29 Jul 2026 09:08:40 +0900
X-Gm-Features: AUfX_mxJyiSm31bWY5a0snpvZu7asEtmvztGs1v4_zBGPb9VpXQsQKFqM4tmGnM
Message-ID: <CA+m4KrAvATV9qMMN9h+tKcPdrHRp7-jFJ0-Jq3DeCZLi3Z6RsA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wens@kernel.org, Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_170854_688986_90D7D05C 
X-CRM114-Status: GOOD (  30.35  )
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

Hi Chen-Yu,

Thank you for posting the v4 series.

I tested the complete v4 series on my MT8173 Chromebook, but I am
seeing a GPU device loss as soon as Mesa initializes the Vulkan device.

My current setup is:

  Board: Google Elm / Acer Chromebook R13 (CB5-312T)
  Kernel:
    linux-next next-20260727
    commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
    (next-20260727-5-g33d6e5134c70)

  Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+

  Mesa: 26.1.5
  vulkan-powervr: 26.1.5
  Firmware:
    rogue_4.40.2.51_v1.fw
    SHA256:
    f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d73f2

All five patches applied cleanly. The PowerVR driver probes, loads the
firmware, and creates the DRM render node successfully.

However, when I run the following from an SSH session without GDM or
another graphical session running:

  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary

Mesa prints the expected GX6250 warnings:

  Missing reset support for brn51764
  Missing reset support for brn58839
  Missing support for brn62269

The command then hangs, and the kernel reports:

  powervr 13000000.gpu: [drm] *ERROR* GPU device lost

There are no additional timeout, MMU fault, firmware, clock, or runtime
PM messages immediately before the device-lost message.

I originally also observed the same failure when GDM started GNOME
Shell, but reproducing it with vulkaninfo from a non-graphical SSH
session indicates that this is not specific to Mutter or GNOME.

Since your cover letter reports that vkmark and glmark2-es2-drm work
with Mesa 26.1.5, I suspect that there may be a difference in the
kernel configuration or another part of the test environment.

Could you please share the following details from your working setup?

  1. The exact Chromebook board/model used for testing
  2. The exact kernel base commit
  3. The kernel configuration, or at least the relevant DRM, PM,
     generic power-domain, IOMMU, and MediaTek clock options
  4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
  5. The firmware SHA256
  6. The kernel command line and bootloader used
  7. Whether `vulkaninfo --summary` also completes successfully

My current relevant configuration includes:

CONFIG_PM_SLEEP=3Dy
CONFIG_PM=3Dy
CONFIG_PM_GENERIC_DOMAINS=3Dy
CONFIG_MODULES=3Dy
CONFIG_DMA_SHARED_BUFFER=3Dy
CONFIG_DRM_POWERVR=3Dm
CONFIG_DRM_MEDIATEK=3Dy
CONFIG_SYNC_FILE=3Dy
CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
CONFIG_IOMMU_SUPPORT=3Dy
CONFIG_ARM_SMMU=3Dy
CONFIG_MTK_IOMMU=3Dy

I would be happy to test additional patches or provide any further
logs, kernel configuration, or debugging information if that would
help.

Thanks,
YoungJoon Lee

2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchino Del Reg=
no
<angelogioacchino.delregno@collabora.com>:
>
> On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.=
com> wrote:
> >>>>
> >>>> Hi Chen-Yu,
> >>>>
> >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>>>> Hi everyone,
> >>>>>
> >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>>>
> >>>>> This time around Mesa was ready for basic testing, using both vulka=
nmark
> >>>>> and glmark2-es2-drm (with Zink). Details below.
> >>>>>
> >>>>> Changes since v3 (all in the clk driver patch):
> >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>>>> - Added missing of_node_put() in remove function
> >>>>>
> >>>>> Changes since v2 (all in the clk driver patch):
> >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>>>     - Needed since the driver implements PM domains using the gener=
ic PM
> >>>>>       domain library, which also depends on PM
> >>>>>     - Fixes build breakage (kernel test robot)
> >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>>>> - Dropped unused mfg_desc (Brian)
> >>>>> - Added check of clk_prepare_enable()'s return value in
> >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Adapted to changed DT bindings
> >>>>> - Dropped driver change
> >>>>> - Use same power domain for "a" and "b" GPU power domains
> >>>>>
> >>>>>
> >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, found =
in
> >>>>> some Chromebooks.
> >>>>
> >>>> I'm making a pull for Stephen for the clk changes. Should patches 1,=
2,4
> >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> >>>
> >>> Only patches 1 and 2 should go through the clock tree.
> >>>
> >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick=
 up
> >>> DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >>>
> >>
> >> Not sure if I can really take the DRM bindings patch through soc.
> >>
> >> I will take the devicetree ones exactly right now, even though it's go=
ing to
> >> give warnings.
> >>
> >> I trust that you'll make the binding get into linux-next before it's t=
oo late.
> >
> > Rob beat me to it. :D
>
> Love it!
>
> Thanks Rob :-D
>
> Cheers,
> Angelo

