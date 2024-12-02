Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72E3D78321
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rju8sEpE6sdROgx04VbEZEe0Z4Dqml8d9fp2hAHZz1Q=; b=1EJxpyY/Ts+WlvhzITufvyP46P
	nPbo3yNB19SZedpQr+7jhvY24qvZ/IZbwUYTeNBcO1aLwtdx5Z/YoAQ2c5yVdcDkqnyVbUTxNyY1J
	82OSlSXrbXHpcPrWvb8cOqm5O2G/hfPxq1197ker/WvFlDgFTUgsj0uargVIWuHkcHh0N1p7eLa58
	grzEuRdkzblY+JIfQ4Awiirmyt6adiUXjbZeTHVIwoZ95MOH4RwipWoLt/J8skRwYqlCFZ4M6UF/6
	bwMUrWLwW/ptfGaA7I5IIWpzadTZBdwGkU9eMkM/yEuQbMewDlDh+sL6w03bD9hy0ItuxnwX00aOY
	LmxOcQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7ui-00000006Ydw-3jt3;
	Mon, 02 Dec 2024 15:00:40 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7tH-00000006YJ4-0DyE
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 14:59:12 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53dd2fdcebcso4923075e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 06:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733151549; x=1733756349; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rju8sEpE6sdROgx04VbEZEe0Z4Dqml8d9fp2hAHZz1Q=;
        b=tmMnSBKYQcUbFKLOyUa3APf/TSvndYmHDI+Q+9/TD2HTJH7d7ZfWRNQmd2/SDVaOXY
         pv7YOnYBfFvv6TG9KhcYxTqlvC3bBbdYIAjH4on7EQV67RsKe+Fch/hg4K3VPU9FiOay
         48Op9EpNqbyYFVQPUE4KIr5cNcOeTR9hlPpWMTUvijjaH4Vlo/LelOlNXA1G4zC+5X06
         m0Vkqji9o3okTXUo9dbL7XlvqKX3AtFgwtoYszNi3FpHc0rFD2AC4r0sfK5svCzHG8YJ
         txpHfhSiQloj2/jZ8+uHCFnMq42nGY8x0elN8keQXtiO38bfPGRDqGFr9g0P8Pwl1PST
         cfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151549; x=1733756349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rju8sEpE6sdROgx04VbEZEe0Z4Dqml8d9fp2hAHZz1Q=;
        b=Qs6+42O/3QeSrUefwDnYgOw1S62sMuKcfUlpaiYYply8/ADAWgWGrWZo/NrIxyphPV
         ze5ffjDdpsj7kkrJZ8aK3Ju/XpEM/0GQBnZd1L+p9v4LZvOSA02CSllxPY00gpViQd7q
         //KJtVdQ1EHnpzLOpAgfQafUVZ/+0JDGnrfe/dDo2pwRJlFt86MWh4Gq5Im7rfDH9w2U
         L+mesPRpgteip26s84H6PVp0elAHRIEToMLf9di5vUvPZFNKVTu72p7ukjT+tRmf365M
         w44g6wPzJdt+OkXeANewcrCKQqKkFalb2+9Lfd0ATXIBRbxQR0V+maweSIFcZNGzaZU8
         hRng==
X-Forwarded-Encrypted: i=1; AJvYcCXSQW/TdNVHRX6UW+qANqjb+tNJJr1U43MJJoInIDl/HBTQZNxiV3gA7kT+G7FTBIGu3xeyAKXcqPrKmmD/NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ+FeR7eud/Z82gchGobMYXeEmVorPocCYpDiXiS82lU9OFO7T
	+IILO8J9kpA3+e6kVyeB+JG84imjRe6SHw43u8cuuh9ELTO3RnOBzIGr+r4d1Yo=
X-Gm-Gg: ASbGnctTvKVVdyxyqEDYtxkPH0x/t0wSu1zPxq+RQtXfU9GC+MvPRnxcGOBhjScnO3j
	kzGql46+CXxm0Td4DQOufj+ld1s3MSa/vEuOGebqX0g0e1DFQSL2oVerDl2VTfT3LYAEsXL6ky5
	GzWlIsIlRYoZLqoVqLcT8GjSQy8mW5GY4joahUJfh8k0Y2uf16Eo3bBkhHwt26VYSPijroSTXDz
	MQVKhYQ9TSqZhqnECH8jH9RmB+ohGI2L8/aQopAu698TsXZxpWkWw5iwpIeQKYgRbY5TTEPr708
	kvGPCmPF6xRzViaGpB8Yqnf8wIftjQ==
X-Google-Smtp-Source: AGHT+IFqUZg6UxbmPBpmmNDChC/PhM5ksog1SlPE5I3zx5OIy0xNoMEVpgKx1uItUxOnsjp3icE8UQ==
X-Received: by 2002:a05:6512:b26:b0:53d:edba:d40b with SMTP id 2adb3069b0e04-53df00dc8d7mr12039335e87.33.1733151549347;
        Mon, 02 Dec 2024 06:59:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f2c3sm1480384e87.126.2024.12.02.06.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:59:07 -0800 (PST)
Date: Mon, 2 Dec 2024 16:59:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
Message-ID: <onq2djvtvxvr3a52s6sin3dstwdctyyz2lxpx47lk7ndxtza33@odldgvhryw4d>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
 <20241202-bald-just-guan-c5d41b@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-bald-just-guan-c5d41b@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_065911_099414_5CECDA65 
X-CRM114-Status: GOOD (  18.53  )
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

On Mon, Dec 02, 2024 at 01:06:09PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Sun, Dec 01, 2024 at 02:44:06AM +0200, Dmitry Baryshkov wrote:
> > The no_capture_mute flag might differ from platform to platform,
> > especially in the case of the wrapping implementations, like the
> > upcoming DRM HDMI Codec framework. Move the flag next to all other flags
> > in struct hdmi_codec_pdata.
> > 
> > Acked-by: Mark Brown <broonie@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I appreciate it might be a dumb question, but I never really understood
> what no_capture_mute was all about. And in that context, why some
> drivers would need / use it, and some won't.

Some platforms can not mute the HDMI capture (ARC?) path. See the
following patches:
- https://lore.kernel.org/all/1606372608-2329-1-git-send-email-shengjiu.wang@nxp.com/
- https://lore.kernel.org/all/1606372608-2329-1-git-send-email-shengjiu.wang@nxp.com/

Russell added a way to disable capture / playback support, but only TDA
driver uses those. I think generally we should change those flags to be
opt-in for capture, but that requires carefully reviewing all the
platforms (and is a separate topic anyway).

-- 
With best wishes
Dmitry

