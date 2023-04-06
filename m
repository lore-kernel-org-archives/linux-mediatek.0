Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55C4C76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 07:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQZnNfr+rBhTTZliY5pXLRCg5E7GawaSZx7bLaXCUWA=; b=hraUebPEf+djYuqsrEOgJEyXGl
	LEsUVeChr262Ww/892sBVBipsHSLDweZtzAQ7loVu7VvkPH2T7zDNwbYmoWwMzccZo8xS2t5NlvIn
	1F1eluP0mxcXCCGBtCUJPUu5ghKSePUz0coimOdY777SHsuViC2C1xD7cvFEDfGhAV05VB5zRK07B
	eR0IjqKbsej+Y8PN5/rELt8aP6uKj977L7vqN5MOXxJomOtsMMcqJYQN/4rDRtPTw1mC8WIZNNRjK
	K4uRBQVqj4V7h+l9Lt8Jg5cUssdIUbYSw+5IS0as2w823CZXWDQBu8u0uv8v58JhZ6iY8kdVt1Zc7
	2Y1YsoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJvT-006c6K-08;
	Thu, 06 Apr 2023 07:20:55 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJvO-006c4k-2x
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 07:20:53 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id cu36so33622373vsb.7
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Apr 2023 00:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680765648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQZnNfr+rBhTTZliY5pXLRCg5E7GawaSZx7bLaXCUWA=;
        b=gr03IPWw8xCzO8z1s3XXV8rA2qkRF5MmfLt98sAud2m8xi8lHXgs60q7bNsxZL2Smi
         gl4QsqQiSVY1Y6QC4MOOGJUcCUc+Bl7XzvwW6pKcVW+WPYG9F2fhIvv+IuZYXlwMTX+s
         jfF8gl0U1RG9xhEe0cfOB6cNyJ2Q4H65kuKiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680765648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQZnNfr+rBhTTZliY5pXLRCg5E7GawaSZx7bLaXCUWA=;
        b=UAidkPjgGlgNWHo/NNbVaAoZOpSRu9tk3iashvAQTO+tlGy6Y85nl2MrkSKSEKt7sw
         j8JEhUdMB0ZfIBiie95dWyVNo8jzY00MwJqYowD0+oi6RfPmxD5mlErbuz6aWsX7CHGA
         enWrEySFV8D/M9FqiX+hR24LQ6Kr7/MkcVVHixCGNBqnttWa+EZOmI76fapShd3aKdAL
         D/JL2xfsQRyu0ZN0+8JsL06ZO1xcR16HgQ8pahu0eilQtNBM3BfFd9lxJPRm+Ub4Rb2o
         n9P+LppahVc6rtbiMzv5z+JUf2Q3gdiCyGm+0YhtJbzmv85bYOJNWbKICKCJfoA5BDPG
         doKQ==
X-Gm-Message-State: AAQBX9fKJ4NProhQO1jEXfUa5Mhh/920JEx9qAAFWSnd9PTlhqv9krAV
	FF1rC2ucZnBKhGm/c1ZanHRj+A1P/rPTZf86qFEnpQ==
X-Google-Smtp-Source: AKy350ZKHVlhoBhxEN/6Xhz9wuYrGUS4GAEp7DN3aTjD5fTNIAiVKilFb0mDuij13QyIaSLsC3aOGmsypz86GhOovyQ=
X-Received: by 2002:a67:c01c:0:b0:425:cf00:e332 with SMTP id
 v28-20020a67c01c000000b00425cf00e332mr6176192vsi.7.1680765648481; Thu, 06 Apr
 2023 00:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 6 Apr 2023 15:20:37 +0800
Message-ID: <CAGXv+5FEEkMg+SY7ZkSHN2G9jtT6TBiN9MadZmYGMX_uVi5=gQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] MediaTek DisplayPort: support eDP and aux-bus
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_002050_970856_581DF3D3 
X-CRM114-Status: GOOD (  30.48  )
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

On Tue, Apr 4, 2023 at 6:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v3:
>  - Added DPTX AUX block initialization before trying to communicate
>    to stop relying on the bootloader keeping it initialized before
>    booting Linux.
>  - Fixed commit description for patch [09/09] and removed commented
>    out code (that slipped from dev phase.. sorry!).
>
> This series adds "real" support for eDP in the mtk-dp DisplayPort driver.
>
> Explaining the "real":
> Before this change, the DisplayPort driver did support eDP to some
> extent, but it was treating it entirely like a regular DP interface
> which is partially fine, after all, embedded DisplayPort *is* actually
> DisplayPort, but there might be some differences to account for... and
> this is for both small performance improvements and, more importantly,
> for correct functionality in some systems.
>
> Functionality first:
>
> One of the common differences found in various boards implementing eDP
> and machines using an eDP panel is that many times the HPD line is not
> connected. This *must* be accounted for: at startup, this specific IP
> will raise a HPD interrupt (which should maybe be ignored... as it does
> not appear to be a "real" event...) that will make the eDP panel to be
> detected and to actually work but, after a suspend-resume cycle, there
> will be no HPD interrupt (as there's no HPD line in my case!) producing
> a functionality issue - specifically, the DP Link Training fails because
> the panel doesn't get powered up, then it stays black and won't work
> until rebooting the machine (or removing and reinserting the module I
> think, but I haven't tried that).
>
> Now for.. both:
> eDP panels are *e*DP because they are *not* removable (in the sense that
> you can't unplug the cable without disassembling the machine, in which
> case, the machine shall be powered down..!): this (correct) assumption
> makes us able to solve some issues and to also gain a little performance
> during PM operations.
>
> What was done here is:
>  - Caching the EDID if the panel is eDP: we're always going to read the
>    same data everytime, so we can just cache that (as it's small enough)
>    shortening PM resume times for the eDP driver instance;
>  - Always return connector_status_connected if it's eDP: non-removable
>    means connector_status_disconnected can't happen during runtime...
>    this also saves us some time and even power, as we won't have to
>    perform yet another power cycle of the HW;
>  - Added aux-bus support!
>    This makes us able to rely on panel autodetection from the EDID,
>    avoiding to add more and more panel timings to panel-edp and, even
>    better, allowing to use one panel node in devicetrees for multiple
>    variants of the same machine since, at that point, it's not important
>    to "preventively know" what panel we have (eh, it's autodetected...!).
>
> This was tested on a MT8195 Cherry Tomato Chromebook (panel-edp on aux-bu=
s)
>
>
> P.S.: For your own testing commodity, here's a reference devicetree:
> &edp_tx {
>         status =3D "okay";
>
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&edptx_pins_default>;
>
>         ports {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>
>                 port@0 {
>                         reg =3D <0>;
>                         edp_in: endpoint {
>                                 remote-endpoint =3D <&dp_intf0_out>;
>                         };
>                 };
>
>                 port@1 {
>                         reg =3D <1>;
>                         edp_out: endpoint {
>                                 data-lanes =3D <0 1 2 3>;
>                                 remote-endpoint =3D <&panel_in>;
>                         };
>                 };
>         };
>
>         aux-bus {
>                 panel: panel {
>                         compatible =3D "edp-panel";
>                         power-supply =3D <&pp3300_disp_x>;
>                         backlight =3D <&backlight_lcd0>;
>                         port {
>                                 panel_in: endpoint {
>                                         remote-endpoint =3D <&edp_out>;
>                                 };
>                         };
>                 };
>         };
> };
>
> AngeloGioacchino Del Regno (9):
>   drm/mediatek: dp: Cache EDID for eDP panel
>   drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
>   drm/mediatek: dp: Always return connected status for eDP in .detect()
>   drm/mediatek: dp: Always set cable_plugged_in at resume for eDP panel
>   drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
>   drm/mediatek: dp: Enable event interrupt only when bridge attached
>   drm/mediatek: dp: Use devm variant of drm_bridge_add()
>   drm/mediatek: dp: Move AUX_P0 setting to
>     mtk_dp_initialize_aux_settings()
>   drm/mediatek: dp: Add support for embedded DisplayPort aux-bus

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8195 Tomato: eDP panel works if the display panel regulator is always
on. External DP works.

Maybe it has something to do with the driver not supporting .wait_hpd_asser=
ted
and not using a GPIO for HPD?

