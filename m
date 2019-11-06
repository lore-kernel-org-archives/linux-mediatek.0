Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B16DC5DF64
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 15:59:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30FC32178F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 15:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oWqdwkeX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="ccpy+gS6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30FC32178F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkJSAto4X4h3/fW38/QXiVpAXbS6sewqE3/JFWP0jI4=; b=oWqdwkeXcldIH/
	G0y1QOAAoaJ4tnhfl0c4aN/cyCs1pDMrlZC0oc7HURO9NgnwoLZ5f9SWg6WfOciaZkKurIG45Vpet
	5AwPplzYcZ0s2bNzHQdLSuftRkt21/d86HBJGcxgHIkmrnfLXpIpkb2Fbq3y+N5zymmu+7JTGHIVn
	Sz7wdLi8/JmQx7MlL4sfnTbc+8gfvSxb2QjLkjQNH59/yLcQBDYkeYI9/LI/QftA6mOPjMJIGzOuW
	olnMPwe522Up0EdmLhly8u17HwAA8EJuZNoeKCq67Gjk7qjZ9UnGTUHls0191h71X37rc2F7dwWKR
	B6jrxwkscoBQ8vLqikcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSNi6-0007TB-SR; Wed, 06 Nov 2019 15:59:06 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSNi4-0007Rh-0R
 for linux-mediatek@lists.infradead.org; Wed, 06 Nov 2019 15:59:05 +0000
Received: by mail-il1-x142.google.com with SMTP id r9so5579237ilq.10
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2019 07:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eTmvNusWN2c5MG6/BAIqeUf6hIHOhMcF2KJYDtbtvt8=;
 b=ccpy+gS6IGTTaTTSYtiJSpGEcbiv5wNleb628bgUAiGfYG8qovcbis91IrjxFSiyph
 3HfZZ8GEZqfFDt+kARDudOi3bo/7aW5DX4U8dH7bmhH4S/eOuaKOUrpahD82A4roSaH4
 4Pun2YIuRJIp54fpdSGnX2nYGvSWTZEm3inBN/1Y6y0NIlKCePzb4aQJX28WK/S6qIWG
 BRP0UWMYmC09tCUEXIt5L+5zb7GH36OBmpYYHGpmQl7imB48wFOElu0AlSBGt7dZxZM2
 V8oXCdqUbqkoa4VEY33b9E3erwZvhwW5kdZkadudfGVr4QJqNqKkA1333pCAgqQR6nT3
 /I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eTmvNusWN2c5MG6/BAIqeUf6hIHOhMcF2KJYDtbtvt8=;
 b=pYgN0pe6Flpcexe7lxu/x7cWwCR4WxU/HNPVitDN7su/drZZdzrG8K7+5KVzsvLDZt
 Ylhgk4UFRnV1PRuq1ASNB632LVbc/0Itoj0fU5eHdYUc17+1utxlmsxLcGaQRMJe2kSl
 N2hc9YctNoPu+VVHqhrbMPCUCK9jnUV2KCfv4a5sdaNDoDNHGmnUjX8oF1RybxcE28Mg
 +NzBvGVEHR7qm5P2WrbLgADYRBB8zCmTKIn0y0jmMukjIu0l1lguhM1B2px6Zb2s2D8X
 lXIO4ZlaXXK6/YOnDzH5Dmeq48MbudOhtZGVhhkye/B56Mi1G4jVKmBIWEfbw/EgF0Al
 Njpg==
X-Gm-Message-State: APjAAAVR6KXHRwTSqs0cIyTb/SiPPMjXTaefvX1S6nCHFveoX3+cEwQw
 SdStTEoM8XLIeceqsqZaUSp/qt+bIFLQ2ZwJ4lOdwQ==
X-Google-Smtp-Source: APXvYqyHPDXVunridE8njdx3JYwMYmzHl/72SZR5GTwewyAfNZD7ZXTP+VI3OOz5z37EYlrRoJTSjm4/xhly3AA6geo=
X-Received: by 2002:a92:4596:: with SMTP id z22mr3427340ilj.75.1573055942733; 
 Wed, 06 Nov 2019 07:59:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1566845537.git.andrzej.p@collabora.com>
 <1e343b02195757bfbf60ca8999cadeb376db204e.1566845537.git.andrzej.p@collabora.com>
In-Reply-To: <1e343b02195757bfbf60ca8999cadeb376db204e.1566845537.git.andrzej.p@collabora.com>
From: Sean Paul <sean@poorly.run>
Date: Wed, 6 Nov 2019 10:58:26 -0500
Message-ID: <CAMavQKJhC==nDFFqCXK-J-VLdDkZHUCoSLe6KgALLSYR7kFDfw@mail.gmail.com>
Subject: Re: [PATCH RESEND 07/14] drm/msm/hdmi: Provide ddc symlink in hdmi
 connector sysfs directory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_075904_106056_B1872921 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Harry Wentland <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>,
 Shashank Sharma <shashank.sharma@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>, linux-tegra@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Allison Randal <allison@lohutok.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Eric Anholt <eric@anholt.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 26, 2019 at 3:27 PM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Use the ddc pointer provided by the generic connector.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

Acked-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_connector.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> index 07b4cb877d82..1f03262b8a52 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> @@ -450,8 +450,10 @@ struct drm_connector *msm_hdmi_connector_init(struct hdmi *hdmi)
>
>         connector = &hdmi_connector->base;
>
> -       drm_connector_init(hdmi->dev, connector, &hdmi_connector_funcs,
> -                       DRM_MODE_CONNECTOR_HDMIA);
> +       drm_connector_init_with_ddc(hdmi->dev, connector,
> +                                   &hdmi_connector_funcs,
> +                                   DRM_MODE_CONNECTOR_HDMIA,
> +                                   hdmi->i2c);
>         drm_connector_helper_add(connector, &msm_hdmi_connector_helper_funcs);
>
>         connector->polled = DRM_CONNECTOR_POLL_CONNECT |
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
