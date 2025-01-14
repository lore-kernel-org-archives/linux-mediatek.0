Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BE5C02180
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 01:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+8EgI35uv9hF/0OPf+vuhBaBLFzRkr/a46A2Dy1sAk=; b=LuQgArjoM6cmzo2E7lSeazFs8Q
	UIWEWTQbJJMbeNF6BpCtREmyk2QOAwyZj9lptsYvNovZDP3WfPmoAYIBSzbiVh3Q+yuGPtv6hdoQO
	BZeWmaYqQud/FRdnl3/iWm6ArylC08kjKzHDg3rpU8t3QrRAdr44MBgxigPMcC+ijn+3bxnYxMxwU
	YU7bO8Ij9fYGIjc5ujCWZfI2So3Seo53v9ZehHo9uxUkPgwIL8eb4xlptSdYngY773wd3aJbvXqfm
	Hc1KLIYqCDqtzJzhbtUUBeTLLZoGVY/QwF8sZ2P5HcSZ5zxJMquIujFDXb7vqBxxT3bLDa564FCo3
	wLims0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXVzm-00000007Aul-0Yg8;
	Tue, 14 Jan 2025 01:45:30 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXVzj-00000007Ata-22Xe
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 01:45:28 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so8386953276.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 17:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736819126; x=1737423926; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+8EgI35uv9hF/0OPf+vuhBaBLFzRkr/a46A2Dy1sAk=;
        b=Mdm08VwHvmu9GjL49NPuQQvBJ2p9Y8tWZUPSOu64eNLOulL7jRtt5GIHmHQzi0GIux
         jsH9i6R+XYZY7Lo4sWdURiWIbY72+uyCKliAMOZRz8SWdGYMFBwsaLSAGwawH3bMwX61
         Whe37ZlHQcsWKwHErgUIznYgToDsPZvW+GiLZa8Glp6K44s09VDOBbZHQwjq1JLU0PJv
         am0JVUgR95eR5v+nZWVQcOb2q8hb3thQME4IioA8v+5M1beDtxxZvnMuFxSciX1/nxsa
         Wm4l8b14wlN0IGqOs808Vc5wqouB5i629FN6TPGHbpDyhUb+VMKYncjpuv1qnTwYj/ro
         BFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736819126; x=1737423926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+8EgI35uv9hF/0OPf+vuhBaBLFzRkr/a46A2Dy1sAk=;
        b=KIHjPiOjC+nYrvVFwTPo1J1OySNqbMSFX2Nkb9gQYtCC9ICxSC+jznR+1SUB+Js5a3
         +aRWuzL485D+7K0jZ1O424h9hb4aUd4/5cIcNMlUharr4Zg+dxsO8ob4LpyDt314GKK6
         2WNirLX0YeLUFQ/NnINCQDQWyRPItJFdGRLyB7nI9ALEIqbEDy4YB6JZ9N2O7Dq9dyXz
         nCKu6vdrB6cPSGEro1ZP63A2rkzGad0v+v36fDTtarvEQto6rJq3yMlk6ewbMVelvEi6
         EiUHqT2v9xG+yV0YEmfnSqzqyTAruvH7sy1ejovBMEcJtbDRk4mJZHGfb8+mRYcH2Y+u
         MF9g==
X-Forwarded-Encrypted: i=1; AJvYcCWSbp5aInlpODvQpVoHN+jSsSfVXUVoWoUBI0DzFo/U/qLPEfitHC4Q34T5k6GLq8TH7XbPfiUX88pD7nn7Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAClEvkL7BkA/qklmYZFeP0fQjzy21/l4vu8xJluHWSW49yaKC
	tFn20odvQjoCnyObDBm7WCb4O1OAoyuG4EEuliWd7Px/PaNLknnzQ0Swc0aFB5xSbXI6q0wPEWT
	nAJ3xfUzV3Vw9KwNk/bgDpXAWMORXi3FQ1/iS3w==
X-Gm-Gg: ASbGncvyNC2NbLU7kQIA70VpSfu3sq/SC+ylQJTL1qwJ6AB8vNVm2OEPBjUd6exX+JL
	XRQ82s8XEALFuv8NHnMovF1PTwUiAD316kvfx6XvAhMGyvVmfpYYYsHC7pc/D6qyLRLOirA==
X-Google-Smtp-Source: AGHT+IFw+8EJH3+sYLytBcSM829UVF01V8OV1UAI+CzwsaCh0PJQpMGC1iXxd5V1WhnvSyXdw+9iFPxRIV5QmN5E1YE=
X-Received: by 2002:a25:2055:0:b0:e39:8482:5d5f with SMTP id
 3f1490d57ef6-e54ee2026femr12527255276.46.1736819125705; Mon, 13 Jan 2025
 17:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org> <173680655387.149204.17517246537828613856.b4-ty@kernel.org>
In-Reply-To: <173680655387.149204.17517246537828613856.b4-ty@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Jan 2025 03:45:15 +0200
X-Gm-Features: AbW1kvZk-xrGSPiMdguMFD_hc9SYyHKa4i2bZt-kcCNVjxqbFCr5K6kr1tPBECs
Message-ID: <CAA8EJprDaOTEOYf5JHC7UYwqRn2vXUH9FT==HjZg1QNfDMmBcA@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] drm: add DRM HDMI Codec framework
To: Mark Brown <broonie@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_174527_534080_56A3B200 
X-CRM114-Status: GOOD (  21.94  )
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

On Tue, 14 Jan 2025 at 00:16, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, 24 Dec 2024 03:47:52 +0200, Dmitry Baryshkov wrote:
> > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > there was no simple way to get the drm_connector that stayed at the end
> > of the bridge chain. At the same point the drm_hdmi_connector functions
> > expected to get drm_connector instance.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [01/10] ASoC: hdmi-codec: pass data to get_dai_id too
>         commit: a8e792d3f0bbecb87ab05e9592cadf0b178ab952
> [02/10] ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
>         commit: 5b0779ae13de345b405a67c71cbb63705cadb295

Mark, they had your Acks, so they were picked into drm-misc-next.
Would that be a problem?

>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>


-- 
With best wishes
Dmitry

