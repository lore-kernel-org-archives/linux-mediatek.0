Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC8AC432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 13:23:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A3052070A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 13:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gKdAYrpm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwcHFup3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A3052070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mi0zMUuE5zdeN19OGG1PG1jNVclAagBkqeRj18l1Wns=; b=gKdAYrpm3SAaru
	TVlQIZPa95UPJtlyarPrGskYjESGOvEgANguUTBhe576IlB3npShPuc9U49mrOoEQmhO2n7xI9fIH
	l7xnmYC5dO/tpm27Cf8luQ8c0IM5IqhpHEjL9E9wNoAIm7I/DnygVHFMNHgdw/5IVsSaZUrAtQZlG
	FyKUiFalByORWz+VdMT0qi8ta6UtumF1L8q2bZ3aPQ/YbZT8pvjj+C/xE1dzrruxS7gKSeh4qsj0z
	e3ig1/eFm6h2Tcy/s7ji/eoZXx6G2cMIjaWzOj/xAvQ0Jwf/Q3R6ZCcq+T91NgStuzvPUBYFlaY3C
	TiNI61KJ2KtxgfzEynaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic88z-0006fk-Ui; Tue, 03 Dec 2019 13:23:09 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic88u-0006cv-BQ
 for linux-mediatek@lists.infradead.org; Tue, 03 Dec 2019 13:23:08 +0000
Received: by mail-lf1-x142.google.com with SMTP id y5so2938751lfy.7
 for <linux-mediatek@lists.infradead.org>; Tue, 03 Dec 2019 05:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lefF5BM/gcR+So8Ygs7RCzWIIBhGl0bonM5D7lIAz2M=;
 b=ZwcHFup3L1FGPGk2xtvdRZFPmqpjl+1VvQLCjzq0rimrVIVqaG32x7PCDfBwRBdhIo
 wfFVMCzt/nwBpmmu726MfJIBszKsNjFvMWKcURMFeYoJFnyFPvGbWfNUAkjmA0arprAH
 xxbwDWIJo9nDwD2K3RFDnub+OayDe800qVEItuex48rNok6smlLWT62Pp3P8wxG/YbWQ
 q5dde7mJTd61eoUyIeQ0PMpdo8DxM6TZOnmuYEYlu4eIbFMQ/aYRNjWF4Qj24lP7V1JO
 X4rGteLiKCtTpowk5xUuEB1HkwUeJ5Mr5SgOtJornUUaf2Dz/nR/O6sc39dTBk+hVW6X
 1kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lefF5BM/gcR+So8Ygs7RCzWIIBhGl0bonM5D7lIAz2M=;
 b=PvXN9uxlD21trn64tnw7sl+96buBDWcQAF6zMJHY9LvGiZRHFsn4Yjcr+7i9MW2qY+
 D/Bpg0//qVuMNTYZ0u/IFekUb3uuckc6gXWEIwG/lleSq1YRWFRDLiMBsx2Qx6vepqQu
 xckBsbC0qovbe+lqtMrUVYsURIPc91b9i853R0vq+hyGBJucOZKQPKt8fKt2aE5Dw4+c
 VIPAe8ElJIP2u9Cg8VdOQsUK451ULrdCT7PxydnxUbeFqb6HPFAdAvnPwyG2wwHfadMX
 EjMm9fZdFGwG7KZAM1j9zf7e/rAbeZcb0dBWzd6GeXqRTznF5VaTCbBINnQct5VS0fTD
 Qw4A==
X-Gm-Message-State: APjAAAW+pVRtM0zcDKw6+h2hL/+S/z9R5GiucldZI6FNKb8Mt8JPilGm
 DFm3PAobeGjBbZ+LFDXU1WWnTXLtDz95/zlo5b60kw==
X-Google-Smtp-Source: APXvYqx22ebZnmuYdNzG9TrFSZg4isgk95/zsKEGLemAt431mQBCED4F4+fJ5lhPiKhrPXI40LsyMbi9cYOMTmUUeRQ=
X-Received: by 2002:ac2:5083:: with SMTP id f3mr1970416lfm.135.1575379381560; 
 Tue, 03 Dec 2019 05:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-5-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-5-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Dec 2019 14:22:50 +0100
Message-ID: <CACRpkdYT8u2Liq60xtTWeLc2q-R16XWtE1YstGp2WTgM2Cc6CA@mail.gmail.com>
Subject: Re: [PATCH v1 04/26] drm: get drm_bridge_panel connector via helper
To: Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_052304_438245_552C03B1 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stefan Agner <stefan@agner.ch>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Eric Anholt <eric@anholt.net>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 2, 2019 at 8:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> The drm_connector created by drm_panel_bridge was accessed
> via drm_panel.connector.
> Avoid the detour around drm_panel by providing a simple get method.
> This avoids direct access to the connector field in drm_panel in
> the two users.
>
> Update pl111 and tve200 to use the new helper.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

With the little issues found by Laurent fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
