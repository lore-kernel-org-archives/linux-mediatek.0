Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0226CC53200
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 04:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGzlWs6tdF1QMY0fgbav9prDOXBrAsYvphx8445KlbY=; b=PPk5+LnwYSuBrWDB44sB840PKI
	3plY6gNgV43apYN+iOBdOff3HameOpiuQall/N1DHC1ljgKVQV1oeXOXd9PcjDUNPwWNFqPOh6Ai6
	kPQ4ymY2jAQYReebIcsCr1MMSWzWjcbQzd4+o/01Rfa9AdvRpnH6fANWQCq4u59qoOgMMVwef5smp
	moqSDfk0qx0gAy1KhAv4vTxwqYupwnQYr5pm0e0E9P/8WGcaWNKtG53FtDn/3hunwfTQSsjwCq+sP
	BofpYeKUlN+NhpKwhHkV6Siw91dkkA8arj4fOa3q+9eVs+dB4moJ7zbk2l5+kQ8waHK7Gi488WEgM
	DUyifFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wow46-00000006r5Z-2SjY;
	Wed, 29 Jul 2026 04:38:46 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wow42-00000006r4Y-2V9A
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 04:38:44 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-4960fb63c75so275025b6e.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 21:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785299921; cv=none;
        d=google.com; s=arc-20260327;
        b=DwmLad4sJJ+9oh7gZzFdW4kAWH0egVfyltmbmiuITGchy3RpbzBkwtoSGb9AyrIOuQ
         4CDnGd8EWlOOpt/cJhNzKs1oUUU0TUAwNWmzz88GEIxrWp9Mo+N52pNanDQvxEOwksmx
         sgmYY89auwHmzQVD717oQB/bukm81BGDzKzBor17kYTPzpCEgcaG0PXoGYbVvQtRwkZU
         JvJi1TyPrNd9xHrjXb8BfaRpzp1jgcAfL2ITfwh28TCEdR8KREJJTfjUQnKymnefycjA
         gzxOlSunQ/UpXltR7DwLCVxPdBQBhgIvwj6unYvYwOLadPYbVWfpaI6PrdRkbnx50Hgb
         IqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KGzlWs6tdF1QMY0fgbav9prDOXBrAsYvphx8445KlbY=;
        fh=fdnPw0WuFZnRrokwfGZqi6m6xS66jmtHbLRDmwaTEMk=;
        b=Ul0vtC0/Yg9nOZY/ewEkunnTFM2UtcGXOX+pzNCUuLo2ByPfpFy2X0x9eu1oYCs31l
         N1FXZjnShPxTGPZH2RvIFHSAxG9kZueLsyR/oyQlxD7kEZvXyTEXBDpRHMa5+P4dZIIm
         W9spK5/n197r7IG+i9YmJTiM+b7vIAwhhdJkFn6aA+39JjQybJpIKfQtReujbJsrPu66
         QGKSZgWsqcn4eDSZS04Z0sU1cFb+/srgwJI7uVBM2AYyy58I109+E2GrL8tHwbqz+Y+d
         KYs9KXTDnrm9PhgRJdgftfS+mHlvsc5m93SBYq7gOKvBSG4KiQAwIxMT1vmeP5OuHZJZ
         MpIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785299921; x=1785904721; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGzlWs6tdF1QMY0fgbav9prDOXBrAsYvphx8445KlbY=;
        b=L6weF52fjBZ4nMn81XRRyi6k+a9BRHTPoUrUMklbZRpSHJXnTG3ugY61OSnVVaCFLy
         1Wh2MGeoEXOzkISbY3Sq6REdk8rct+DWBXKJnoVRDuvdlEAZ9CQ39D5c6vLetvj1ueHq
         XGdQ0z5Jus9HXYFoDJGw1ZJAW9BrrM+Gq22gG5y3bxmq6bmhFUc8WibsFBd1KVa7j52E
         5QOT3YxA/mGgMPonY5RE7oDS2dbyKxbme2dGlJpBf8h5GLvQgcpQKmbfzR+1Wrep6DxX
         I9XfM2a/Bp02Rnp5i7mBCnQkPsyq07dOagj7kTQbvm6llAVi6ZqU8AAAkWgzyiicfSj0
         fEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785299921; x=1785904721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGzlWs6tdF1QMY0fgbav9prDOXBrAsYvphx8445KlbY=;
        b=ctoA0y95AJJKOM9SrYZnmzafF/mI6fkti5t9grzZ1dUGS61Q2Vj7MdD5+o+GQQqQIn
         MYCHok224HCbnvCti6bImsLOvxkLoosLRoYQ2oxpGjEV8cNUh6fuXgTp7+G85Z0O3JEM
         AhNBPgVqdbl1O3p8l8atugGymRnMEZkgpr96O/KeEAyspOZParnl2fZZvosk8YkmdXDI
         l/5QPwCGczW/C3EMxDroGiY6gTLHSmtBdJj1bN5qR2mQNauw8z4CO6w362Vqe0cWUmEt
         voL9uJzmc6y6fEidhmOXq2TN9ui7YvbbODznG8adQ5+wGz+8PLyq3YXHSwrdP+jkHrC+
         e2/A==
X-Forwarded-Encrypted: i=1; AHgh+Rrzz0e5uFLlll0yzs4Cu7I5nb71ogLO+4eEkso/Ik1oVmS0RMs44oVunWcOfiz7s6abMvk5PEopOIzqGmv1MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdQu+zQGchmbl4hHqqmuPehV8nOagLBWFvW2gR2NpbrQ3iwcOI
	hugOWFIhOJPPJvV90hUZFhLgHoTI4vrIkG8BqyCBWPvSaAmkTci1FOgGEQM+7JKiyLlLt2GZANJ
	rESuXd2b1n3V7Fxq4bgrBEfc/g7C1uc0=
X-Gm-Gg: AR+sD11xtjJjtkZjoaSle9E+kUXDzomsoKbW+mC4CBgCWBfoqSLpqxc1SWS2JOuee1L
	BsnXuMHpwLsagB1opFk0bIhUa5utjB7wR49L2IsOyLPbiQLlXuLq1H0UWPtT4ldUa8HFE6KWMMt
	aSbQzgrkMerbevX4ESqc/9ByZ/x7LRShDw4UEsqf9bWSwTVzT/da1MQL6geWjMr2uSDDsyyXeJc
	9v8XvNQbd6AMoIuLDhI+T0BBMTVUi4iN9uOqzgvITxRh8cjtSO0bCSJh9jU2f2cVr69ZBgBu5q/
	JLDEEN8YqHxw/b4074zZus1pZIEfulvwSJ0NA0uI4gidoZ6BZ7w/zOD/BiNq144jygZe4P1/5kD
	K9g==
X-Received: by 2002:a05:6808:1527:b0:4a3:2bd1:5216 with SMTP id
 5614622812f47-4ad5ba77288mr2918774b6e.43.1785299921220; Tue, 28 Jul 2026
 21:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
 <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com> <CA+m4KrAvATV9qMMN9h+tKcPdrHRp7-jFJ0-Jq3DeCZLi3Z6RsA@mail.gmail.com>
 <CAGXv+5G8zPGb3SUwnzuutCF_U=+NKB4VQBsu+the6nLUqM-RDg@mail.gmail.com>
In-Reply-To: <CAGXv+5G8zPGb3SUwnzuutCF_U=+NKB4VQBsu+the6nLUqM-RDg@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Wed, 29 Jul 2026 13:38:27 +0900
X-Gm-Features: AUfX_mxR_oGunwLpbAK7Vqbf4uXNzZjhDaRd7Jvp95pR-HEJXbf9urH4ed-uYIk
Message-ID: <CA+m4KrDQ0tf0ffx9ttARBF-5sDZUz5bF0Apu3-M=wr=psYLogg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wens@kernel.org, 
	Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_213842_784960_AFB88DE8 
X-CRM114-Status: GOOD (  53.64  )
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

Thank you. Updating the firmware fixed the issue.

I replaced my previous firmware blob with the official v1.1 firmware:

  FW version v1.1 (build 6976702 OS)

  SHA256:
  e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44

After rebooting, the driver loaded the new firmware successfully:

  powervr 13000000.gpu: [drm] loaded firmware
  powervr/rogue_4.40.2.51_v1.fw
  powervr 13000000.gpu: [drm] FW version v1.1
  (build 6976702 OS)

I then ran:

  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary

This now completes successfully and detects the PowerVR Rogue GX6250.
The previous "GPU device lost" error no longer occurs.

So the issue was caused by the older, non-official firmware blob I was
using, rather than the v4 kernel series or my kernel configuration.

Thank you for pointing this out, and sorry for the noise.

Tested-by: YoungJoon Lee <getfeus@gmail.com>

Best regards,
YoungJoon

2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 12:32 Chen-Yu Tsai <wenst@chr=
omium.org>:
>
> On Wed, Jul 29, 2026 at 8:08=E2=80=AFAM YoungJoon Lee <getfeus@gmail.com>=
 wrote:
> >
> > Hi Chen-Yu,
> >
> > Thank you for posting the v4 series.
> >
> > I tested the complete v4 series on my MT8173 Chromebook, but I am
> > seeing a GPU device loss as soon as Mesa initializes the Vulkan device.
> >
> > My current setup is:
> >
> >   Board: Google Elm / Acer Chromebook R13 (CB5-312T)
> >   Kernel:
> >     linux-next next-20260727
> >     commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
> >     (next-20260727-5-g33d6e5134c70)
> >
> >   Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
> >
> >   Mesa: 26.1.5
> >   vulkan-powervr: 26.1.5
> >   Firmware:
> >     rogue_4.40.2.51_v1.fw
> >     SHA256:
> >     f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d73f2
>
> My firmware blob is different from yours:
>
> powervr 13000000.gpu: [drm] loaded firmware powervr/rogue_4.40.2.51_v1.fw
> powervr 13000000.gpu: [drm] FW version v1.0 (build 6503725 OS)
>
> SHA256: 1456504351bd041f0bf96667403ad32460fc7b807c09858df1f083e207323e4a
>
> Funny thing is neither of ours match the official firmware blobs released
> by Imagination [1].
>
> The latest version is "FW version v1.1 (build 6976702 OS)" with
> SHA256: e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44
>
> This version also works for me.
>
> The "initial version" is "FW version v1.0 (build 6734358 OS)" with
> SHA256: baa227de4f297b7c0928c6535d15affd80aa9c5f528d2d5dc4b764ad050d22f2
>
> And this version also works.
>
> It seems your firmware build is even older than mine. I suggest you
> update it and try again?
>
> [1] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/powe=
rvr/powervr/rogue_4.40.2.51_v1.fw
>
>
> > All five patches applied cleanly. The PowerVR driver probes, loads the
> > firmware, and creates the DRM render node successfully.
> >
> > However, when I run the following from an SSH session without GDM or
> > another graphical session running:
> >
> >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> >
> > Mesa prints the expected GX6250 warnings:
> >
> >   Missing reset support for brn51764
> >   Missing reset support for brn58839
> >   Missing support for brn62269
> >
> > The command then hangs, and the kernel reports:
> >
> >   powervr 13000000.gpu: [drm] *ERROR* GPU device lost
> >
> > There are no additional timeout, MMU fault, firmware, clock, or runtime
> > PM messages immediately before the device-lost message.
> >
> > I originally also observed the same failure when GDM started GNOME
> > Shell, but reproducing it with vulkaninfo from a non-graphical SSH
> > session indicates that this is not specific to Mutter or GNOME.
> >
> > Since your cover letter reports that vkmark and glmark2-es2-drm work
> > with Mesa 26.1.5, I suspect that there may be a difference in the
> > kernel configuration or another part of the test environment.
> >
> > Could you please share the following details from your working setup?
> >
> >   1. The exact Chromebook board/model used for testing
>
> The codename is "telesu", which is basically a hana in a different case.
>
> >   2. The exact kernel base commit
>
> I have a whole bunch of patches on top of next-20260727, but none
> that should affect this.
>
> >   3. The kernel configuration, or at least the relevant DRM, PM,
> >      generic power-domain, IOMMU, and MediaTek clock options
>
> All relevant options are built-in.
>
> >   4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
>
> Module.
>
> >   5. The firmware SHA256
>
> See above.
>
> >   6. The kernel command line and bootloader used
>
> Chromebook's builtin bootloader.
>
> cmdline:
>
>     cros_secure root=3DPARTUUID=3D824526A4-24EE-344D-85A2-20630C42D31A
>     console=3Dtty0 console=3DttyS0,115200n8 earlycon ro text drm.debug=3D=
0x106
>     panic=3D30 rootwait log_buf_len=3D1M no_console_suspend
>
> AFAICT nothing special.
>
> >   7. Whether `vulkaninfo --summary` also completes successfully
> >
> > My current relevant configuration includes:
> >
> > CONFIG_PM_SLEEP=3Dy
> > CONFIG_PM=3Dy
> > CONFIG_PM_GENERIC_DOMAINS=3Dy
> > CONFIG_MODULES=3Dy
> > CONFIG_DMA_SHARED_BUFFER=3Dy
> > CONFIG_DRM_POWERVR=3Dm
> > CONFIG_DRM_MEDIATEK=3Dy
> > CONFIG_SYNC_FILE=3Dy
> > CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
> > CONFIG_IOMMU_SUPPORT=3Dy
> > CONFIG_ARM_SMMU=3Dy
> > CONFIG_MTK_IOMMU=3Dy
> >
> > I would be happy to test additional patches or provide any further
> > logs, kernel configuration, or debugging information if that would
> > help.
>
> As mentioned above, please try updating your firmware blob. Your
> version is even older than mine, and neither of ours is the "official"
> release.
>
>
> Thanks
> ChenYu
>
>
> > Thanks,
> > YoungJoon Lee
> >
> > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchino Del=
 Regno
> > <angelogioacchino.delregno@collabora.com>:
> > >
> > > On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > >>
> > > >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@red=
hat.com> wrote:
> > > >>>>
> > > >>>> Hi Chen-Yu,
> > > >>>>
> > > >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > > >>>>> Hi everyone,
> > > >>>>>
> > > >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> > > >>>>>
> > > >>>>> This time around Mesa was ready for basic testing, using both v=
ulkanmark
> > > >>>>> and glmark2-es2-drm (with Zink). Details below.
> > > >>>>>
> > > >>>>> Changes since v3 (all in the clk driver patch):
> > > >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > >>>>> - Added missing of_node_put() in remove function
> > > >>>>>
> > > >>>>> Changes since v2 (all in the clk driver patch):
> > > >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > >>>>>     - Needed since the driver implements PM domains using the g=
eneric PM
> > > >>>>>       domain library, which also depends on PM
> > > >>>>>     - Fixes build breakage (kernel test robot)
> > > >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> > > >>>>> - Dropped unused mfg_desc (Brian)
> > > >>>>> - Added check of clk_prepare_enable()'s return value in
> > > >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> > > >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> > > >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> > > >>>>>
> > > >>>>> Changes since v1:
> > > >>>>> - Adapted to changed DT bindings
> > > >>>>> - Dropped driver change
> > > >>>>> - Use same power domain for "a" and "b" GPU power domains
> > > >>>>>
> > > >>>>>
> > > >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, fo=
und in
> > > >>>>> some Chromebooks.
> > > >>>>
> > > >>>> I'm making a pull for Stephen for the clk changes. Should patche=
s 1,2,4
> > > >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> > > >>>
> > > >>> Only patches 1 and 2 should go through the clock tree.
> > > >>>
> > > >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to =
pick up
> > > >>> DT binding patches. Otherwise I can push patch 3 through drm-misc=
.
> > > >>>
> > > >>
> > > >> Not sure if I can really take the DRM bindings patch through soc.
> > > >>
> > > >> I will take the devicetree ones exactly right now, even though it'=
s going to
> > > >> give warnings.
> > > >>
> > > >> I trust that you'll make the binding get into linux-next before it=
's too late.
> > > >
> > > > Rob beat me to it. :D
> > >
> > > Love it!
> > >
> > > Thanks Rob :-D
> > >
> > > Cheers,
> > > Angelo

