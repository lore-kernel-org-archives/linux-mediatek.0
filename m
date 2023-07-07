Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ABBEB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 08:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UICQMdLCdvd6RrW7LjkYioIbHWT7wIioRRBI6u6YoTQ=; b=2fPpLRN9waR9NRrh5E1VMzl6uc
	fJGlNp0WaT5SfCUJ8ywqJimEc7Dps93B8qzaCOE881d2DtlIXmP52mY+5m4Nr7mavyScOuQcoTRJf
	HkhSfY/w7Q9DSaEQ4DfUUkg3xG6jLhjD1g83ycTrFfZUDCWnXygPbimIpxMgCE5q83QQ111SGHymZ
	9wY50i2Kt8sR1IiSD5WnlY6SYHU6plhcSH1vuW4zXNXL1feRzpcAB+ERCojYYuUg9fYyFyCjvB+VD
	O0Kfh8kK6haKEQqkfzK3muw0uweDK3ysp9BnuOKOL/0DvGcc+6byMZqK2bhkH2JuSfByd4+B06FRx
	D0VCm4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgkW-003zEB-0j;
	Fri, 07 Jul 2023 08:23:32 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgkT-003zCi-1F
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 08:23:30 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-47e35eba3e9so564288e0c.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jul 2023 01:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688718207; x=1691310207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UICQMdLCdvd6RrW7LjkYioIbHWT7wIioRRBI6u6YoTQ=;
        b=hz3k4VuEy6wOXt0lpPW/xMVBDzyZvDuKbgWkY4EGFNjYwXz8DCR8+LcYru9Byh2iMT
         SDaNg56+FHWdEK4jTB1lH6ryhTs8aNRFH17wBz/E2P+TyLbJm3RmEpaf++GYdKuilvo/
         xQUM55FuqVn8TNmVKwPczVS0HW9/lr3B0W1Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688718207; x=1691310207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UICQMdLCdvd6RrW7LjkYioIbHWT7wIioRRBI6u6YoTQ=;
        b=ltLMBtTMuvfpy238bTMkXjH5PPJ/3W+Z0+tqYJZDIqNR9mXt6A9JgfLx9eXZ/cEQd8
         OZNw2kZ5Y+iejfpbO/POEKM9O0NFe6VkK7u59hsxioL7wNy9ifMIyX+Z7wsNIMV3q8MW
         f0oetgAT8kWbjUzp27SECG8CVbxdGrmoga3RCEHRHNuKcVojdRE2V7GDTo55R4sWziZR
         Gbz7+TwL5Dt7vw9w7DsDKaQ7g+byByd8wCFe2NHVxQzfZb16il8EqHyNpnxG8sKI9qLs
         TubISDjIA+q0zTiSbCZV2nPKUg5pPzC4yb7HUusAYkrWCrq5OYcBxhRD3Fqb8a9BxaNe
         44gw==
X-Gm-Message-State: ABy/qLa0pUk+rtiRRv0iVzEzzk9p0ZBxfz47wUGfsvODpwzxRxRd5X/v
	ucPdHxi9aP5YkwB1yq9nUpEEs5iUuihwfFsHYdhrRg==
X-Google-Smtp-Source: APBJJlGvUYzs6kqfoBR7guDmWvUdTBV4+dxg/LGaHxj/ZWQDKLYy/+hENdwRNzqMUFiPa0wdy0CneTJF76dXm8qQU2U=
X-Received: by 2002:a1f:4144:0:b0:47e:9bbb:103b with SMTP id
 o65-20020a1f4144000000b0047e9bbb103bmr1455691vka.6.1688718206907; Fri, 07 Jul
 2023 01:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Jul 2023 16:23:15 +0800
Message-ID: <CAGXv+5HzQhoz0OUhifQC0vr44O5VwvuYnsHSA2jK0FjwJT3OBA@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] MediaTek DisplayPort: support eDP and aux-bus
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	nfraprado@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_012329_448214_4103CDEB 
X-CRM114-Status: GOOD (  35.72  )
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

On Thu, Jul 6, 2023 at 8:30=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v4:
>  - Set data lanes to idle to prevent stalls if bootloader didn't
>    properly close the eDP port
>  - Now using the .done_probing() callback for AUX bus to prevent
>    probe deferral loops in case the panel-edp driver is a module
>    as previously seen with another bridge driver (ANX7625) on
>    some other SoCs (MT8192 and others)
>  - Rebased over next-20230706
>  - Dropped Chen-Yu's T-b tag on last patch as some logic changed
>    (before, I wasn't using the .done_probing() callback).
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

Do you have panel-edp built as a module? If I have it built in, the panel
can correctly display stuff. If I have it built as a module, the panel is
correctly detected, but the panel stays black even if DRM thinks it is
displaying stuff.

And it looks like EDID reading and panel power sequencing is still not
working correctly, i.e. needs regulator-always-on?

ChenYu

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
>
>  drivers/gpu/drm/mediatek/mtk_dp.c | 197 +++++++++++++++++++-----------
>  1 file changed, 127 insertions(+), 70 deletions(-)
>
> --
> 2.40.1
>

