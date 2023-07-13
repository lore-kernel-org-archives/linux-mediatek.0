Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58EFC001DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 10:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbr5P/iOV1YnDJmD38Ms/Qv1YcU51e/0SbtpdmzhniI=; b=gefROwwEpeeCWMFrWa4s0rfy9U
	CQjM8job4hOAxlriPEJkpJMqm/woNA/mKjXYt2sTlE9UYrVEnK5dTBd8N6oYPug2HE7Yk52i7jeb+
	khskMGB13eeVunzRIQ5qLEFdy+xMHBhXnv9lfgjI9V5nkjQ6Y0vXhy4Vx+OORwjm96W57Mtr1FXoF
	FDBxiO7hXd7D3Zh7r/MYLoCYBl0DbiXudpVdh8pZAWdgtsTyQJ4wE/psSjrTcfA/WVT+DCq1+V/+G
	tpSMo33vmKlGq4viT8ea0GDptXe1F7Qy5L1Pl6QKXBOgnOm3WLlBOaKoi45poyRRVG5EuCZgdOxfo
	KGPFMokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtAX-002jvp-2a;
	Thu, 13 Jul 2023 10:03:29 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtAS-002js4-0H
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 10:03:27 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-78a5384a5daso133701241.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 03:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689242601; x=1691834601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbr5P/iOV1YnDJmD38Ms/Qv1YcU51e/0SbtpdmzhniI=;
        b=N4rq2N3URVjXBjVCI+PLQV79dBXcqUS9YRrsoiFGvTojgP/zZWUg1IkQFmywbx68su
         HYnAAmj22CKy/xLm0B4JFm6OZ3W3pDI3skWRWVriMfzrc5POD53fDieyjqpJmUKOHzd3
         51lOP+06qvUTrhwnGi2xNysl+cnd2DkbLhI1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689242601; x=1691834601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbr5P/iOV1YnDJmD38Ms/Qv1YcU51e/0SbtpdmzhniI=;
        b=Z66m0iJgBd/z+qntkZ5L/eV2gxBvcrfLqOmxhUmKF02nVv0nf94BhqJutVzpn091ZS
         cR5vwTUF70Q5iLX9xed/9s4aRN68TNQQmkK7XnpXGE0dDjytbL/ik4qOKDb1HJBJAS0B
         e8v0cJ2G2IZJcQbmIRtqn5C5Qi0wSPQIwofH6LuPSUbCMgBcIYIkGMUytp+pnayHtd22
         WdECM0E20sxlNGINJ9PmP6poiVuFX5a0BniGI8kaZKXj07zLTZASZSMbEsV3V9/k2blG
         UxgKqMvwZufBvQ07JIm/hO2s0l955R6DPIr59rl0/GZkCeLuXbTQKxYsORd8f/cXI7qI
         Awsw==
X-Gm-Message-State: ABy/qLY2RwOQHTtIZ2k8on/kaeoRANZ3raIpjWA9MIr62Xq0tMcxlv3d
	lEHyTNtfeZncjZswl5JbbwTDQga5MDmOUl/knOwtOw==
X-Google-Smtp-Source: APBJJlH3OAPdkRXJDgrSZSi2f22vQy/OJUNrZ7M+L5K6c2Nu95HGZdPVo9OrdMAO15IRLwd0bIvjnAAVd0U74xMX3j0=
X-Received: by 2002:a05:6102:7b7:b0:444:bb70:db73 with SMTP id
 x23-20020a05610207b700b00444bb70db73mr148641vsg.28.1689242600881; Thu, 13 Jul
 2023 03:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FFO3pDM=2eDscGnRVj34+8t6L02nt7OvPEO_FV8_POVQ@mail.gmail.com> <f6d01998-b469-99d3-48ed-0360c9378af5@collabora.com>
In-Reply-To: <f6d01998-b469-99d3-48ed-0360c9378af5@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 13 Jul 2023 18:03:09 +0800
Message-ID: <CAGXv+5H181rLCjQZTakCswbi6r7jsx_KH4fmnxN9z-KRykhzUQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] MediaTek DisplayPort: support eDP and aux-bus
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	nfraprado@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_030324_151591_FD12D741 
X-CRM114-Status: GOOD (  47.85  )
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

On Thu, Jul 13, 2023 at 5:57=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 13/07/23 11:54, Chen-Yu Tsai ha scritto:
> > On Thu, Jul 13, 2023 at 5:01=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Changes in v5:
> >>   - Added .wait_hpd_asserted() callback for aux-bus
> >>   - Avoid enabling and registering HPD interrupt + handlers for
> >>     eDP case only (keeps HPD interrupts enabled for full DP case)
> >>   - Support not always-on eDP panels (boot with regulator off,
> >>     suspend with regulator off) for power saving in PM suspend.
> >
> > This still doesn't work when the DRM driver is builtin, and the panel
> > driver is a module. This is still with regulator-always-on.
> >
> >  From what I can tell from the kernel logs, the DRM driver is not waiti=
ng
> > for eDP panel to probe (which sort of makes sense?), and simply uses
> > the default EDID. When the panel does probe, nothing triggers the DRM
> > driver to update its connector.
> >
> > [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:32:eDP-1]
> > [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:32:eDP-1]
> > status updated from unknown to connected
> > [drm:drm_mode_debug_printmodeline] Modeline "640x480": 60 25175 640
> > 656 752 800 480 490 492 525 0x40 0xa
> > [drm:drm_mode_prune_invalid] Not using 640x480 mode: CLOCK_HIGH
> > [drm:drm_mode_debug_printmodeline] Modeline "800x600": 56 36000 800
> > 824 896 1024 600 601 603 625 0x40 0x5
> > [drm:drm_mode_prune_invalid] Not using 800x600 mode: CLOCK_HIGH
> > [drm:drm_mode_debug_printmodeline] Modeline "800x600": 60 40000 800
> > 840 968 1056 600 601 605 628 0x40 0x5
> > [drm:drm_mode_prune_invalid] Not using 800x600 mode: CLOCK_HIGH
> > [drm:drm_mode_debug_printmodeline] Modeline "848x480": 60 33750 848
> > 864 976 1088 480 486 494 517 0x40 0x5
> > [drm:drm_mode_prune_invalid] Not using 848x480 mode: CLOCK_HIGH
> > [drm:drm_mode_debug_printmodeline] Modeline "1024x768": 60 65000 1024
> > 1048 1184 1344 768 771 777 806 0x40 0xa
> > [drm:drm_mode_prune_invalid] Not using 1024x768 mode: CLOCK_HIGH
> > [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:34:DP-1]
> > [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:34:DP-1]
> > status updated from unknown to disconnected
> > [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:34:DP-1] disco=
nnected
> > [drm:drm_client_modeset_probe] No connectors reported connected with mo=
des
> > [drm:drm_client_modeset_probe] connector 32 enabled? yes
> > [drm:drm_client_modeset_probe] connector 34 enabled? no
> > [drm:drm_client_firmware_config.constprop.0.isra.0] Not using firmware
> > configuration
> > [drm:drm_client_modeset_probe] looking for cmdline mode on connector 32
> > [drm:drm_client_modeset_probe] looking for preferred mode on connector =
32 0
> > [drm:drm_client_modeset_probe] found mode none
> > [drm:drm_client_modeset_probe] picking CRTCs for 4096x4096 config
> > mediatek-drm mediatek-drm.12.auto:
> > [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 0 primary
> > plane
> > mediatek-drm mediatek-drm.12.auto: [drm] Cannot find any crtc or sizes
> > mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_probe] aux_mtk_dp:
> > 0x00000 AUX -> (ret=3D  1) 14
> > mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_read] aux_mtk_dp:
> > 0x00000 AUX -> (ret=3D 15) 14 0a 84 41 00 00 01 80 02 00 00 00 0f 09 80
> > mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_probe] aux_mtk_dp:
> > 0x00000 AUX -> (ret=3D  1) 14
> > mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_read] aux_mtk_dp:
> > 0x02200 AUX -> (ret=3D 15) 14 0a 84 41 00 00 01 80 02 00 00 00 0f 01 80
> > mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_read_dpcd_caps]
> > aux_mtk_dp: Base DPCD: 14 0a 84 41 00 00 01 80 02 00 00 00 0f 09 80
> > mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_read_dpcd_caps]
> > aux_mtk_dp: DPCD: 14 0a 84 41 00 00 01 80 02 00 00 00 0f 01 80
> > mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_probe] aux_mtk_dp:
> > 0x00000 AUX -> (ret=3D  1) 14
> > mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_read] aux_mtk_dp:
> > 0x00021 AUX -> (ret=3D  1) 00
> > panel-simple-dp-aux aux-1c500000.edp-tx: Detected BOE NE135FBM-N41 v8.1=
 (0x095f)
> >
> > If the panel is also built-in, then the eDP panel probe happens between
> > the drm driver adding components and binding to them, and everything se=
ems
> > to work OK.
> >
>
> Argh. I actually forgot to test that case. Sorry about that.
>
> Anyway, you don't need regulator-always-on anymore, nor regulator-boot-on=
...

Confirmed this case works now.

> ...I'll recheck with panel-edp as module and fix.

With the module case, I also get an devlink error:

mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180)
with regulator-pp3300-disp-x

which doesn't happen with the builtin case. Not sure if it gets a retry
or anything later.

ChenYu

> Cheers,
> Angelo
>
> >
> > ChenYu
> >
> >> Changes in v4:
> >>   - Set data lanes to idle to prevent stalls if bootloader didn't
> >>     properly close the eDP port
> >>   - Now using the .done_probing() callback for AUX bus to prevent
> >>     probe deferral loops in case the panel-edp driver is a module
> >>     as previously seen with another bridge driver (ANX7625) on
> >>     some other SoCs (MT8192 and others)
> >>   - Rebased over next-20230706
> >>   - Dropped Chen-Yu's T-b tag on last patch as some logic changed
> >>     (before, I wasn't using the .done_probing() callback).
> >>
> >> Changes in v3:
> >>   - Added DPTX AUX block initialization before trying to communicate
> >>     to stop relying on the bootloader keeping it initialized before
> >>     booting Linux.
> >>   - Fixed commit description for patch [09/09] and removed commented
> >>     out code (that slipped from dev phase.. sorry!).
> >>
> >> This series adds "real" support for eDP in the mtk-dp DisplayPort driv=
er.
> >>
> >> Explaining the "real":
> >> Before this change, the DisplayPort driver did support eDP to some
> >> extent, but it was treating it entirely like a regular DP interface
> >> which is partially fine, after all, embedded DisplayPort *is* actually
> >> DisplayPort, but there might be some differences to account for... and
> >> this is for both small performance improvements and, more importantly,
> >> for correct functionality in some systems.
> >>
> >> Functionality first:
> >>
> >> One of the common differences found in various boards implementing eDP
> >> and machines using an eDP panel is that many times the HPD line is not
> >> connected. This *must* be accounted for: at startup, this specific IP
> >> will raise a HPD interrupt (which should maybe be ignored... as it doe=
s
> >> not appear to be a "real" event...) that will make the eDP panel to be
> >> detected and to actually work but, after a suspend-resume cycle, there
> >> will be no HPD interrupt (as there's no HPD line in my case!) producin=
g
> >> a functionality issue - specifically, the DP Link Training fails becau=
se
> >> the panel doesn't get powered up, then it stays black and won't work
> >> until rebooting the machine (or removing and reinserting the module I
> >> think, but I haven't tried that).
> >>
> >> Now for.. both:
> >> eDP panels are *e*DP because they are *not* removable (in the sense th=
at
> >> you can't unplug the cable without disassembling the machine, in which
> >> case, the machine shall be powered down..!): this (correct) assumption
> >> makes us able to solve some issues and to also gain a little performan=
ce
> >> during PM operations.
> >>
> >> What was done here is:
> >>   - Caching the EDID if the panel is eDP: we're always going to read t=
he
> >>     same data everytime, so we can just cache that (as it's small enou=
gh)
> >>     shortening PM resume times for the eDP driver instance;
> >>   - Always return connector_status_connected if it's eDP: non-removabl=
e
> >>     means connector_status_disconnected can't happen during runtime...
> >>     this also saves us some time and even power, as we won't have to
> >>     perform yet another power cycle of the HW;
> >>   - Added aux-bus support!
> >>     This makes us able to rely on panel autodetection from the EDID,
> >>     avoiding to add more and more panel timings to panel-edp and, even
> >>     better, allowing to use one panel node in devicetrees for multiple
> >>     variants of the same machine since, at that point, it's not import=
ant
> >>     to "preventively know" what panel we have (eh, it's autodetected..=
.!).
> >>
> >> This was tested on a MT8195 Cherry Tomato Chromebook (panel-edp on aux=
-bus)
> >>
> >>
> >> P.S.: For your own testing commodity, here's a reference devicetree:
> >>
> >> pp3300_disp_x: regulator-pp3300-disp-x {
> >>          compatible =3D "regulator-fixed";
> >>          regulator-name =3D "pp3300_disp_x";
> >>          regulator-min-microvolt =3D <3300000>;
> >>          regulator-max-microvolt =3D <3300000>;
> >>          enable-active-high;
> >>          gpio =3D <&pio 55 GPIO_ACTIVE_HIGH>;
> >>          pinctrl-names =3D "default";
> >>          pinctrl-0 =3D <&panel_fixed_pins>;
> >> };
> >>
> >> &edp_tx {
> >>          status =3D "okay";
> >>
> >>          pinctrl-names =3D "default";
> >>          pinctrl-0 =3D <&edptx_pins_default>;
> >>
> >>          ports {
> >>                  #address-cells =3D <1>;
> >>                  #size-cells =3D <0>;
> >>
> >>                  port@0 {
> >>                          reg =3D <0>;
> >>                          edp_in: endpoint {
> >>                                  remote-endpoint =3D <&dp_intf0_out>;
> >>                          };
> >>                  };
> >>
> >>                  port@1 {
> >>                          reg =3D <1>;
> >>                          edp_out: endpoint {
> >>                                  data-lanes =3D <0 1 2 3>;
> >>                                  remote-endpoint =3D <&panel_in>;
> >>                          };
> >>                  };
> >>          };
> >>
> >>          aux-bus {
> >>                  panel: panel {
> >>                          compatible =3D "edp-panel";
> >>                          power-supply =3D <&pp3300_disp_x>;
> >>                          backlight =3D <&backlight_lcd0>;
> >>                          port {
> >>                                  panel_in: endpoint {
> >>                                          remote-endpoint =3D <&edp_out=
>;
> >>                                  };
> >>                          };
> >>                  };
> >>          };
> >> };
> >>
> >> AngeloGioacchino Del Regno (10):
> >>    drm/mediatek: dp: Move AUX and panel poweron/off sequence to functi=
on
> >>    drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
> >>    drm/mediatek: dp: Use devm variant of drm_bridge_add()
> >>    drm/mediatek: dp: Move AUX_P0 setting to
> >>      mtk_dp_initialize_aux_settings()
> >>    drm/mediatek: dp: Enable event interrupt only when bridge attached
> >>    drm/mediatek: dp: Avoid mutex locks if audio is not supported/enabl=
ed
> >>    drm/mediatek: dp: Move PHY registration to new function
> >>    drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
> >>    drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus
> >>    drm/mediatek: dp: Don't register HPD interrupt handler for eDP case
> >>
> >>   drivers/gpu/drm/mediatek/Kconfig  |   1 +
> >>   drivers/gpu/drm/mediatek/mtk_dp.c | 335 ++++++++++++++++++++--------=
--
> >>   2 files changed, 224 insertions(+), 112 deletions(-)
> >>
> >> --
> >> 2.40.1
> >>
> >
>

