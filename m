Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92980C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 17:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfmAyoMMb2wOrJd1JOChx63QvBzEFg9LxEcj6r2lKq0=; b=P338L0ezVsC4t6mDC6xL+ftHLA
	oiUU+MQrE3iG8eRQr/iHmq+ZQmJ8YlPSONXLy0zdU4aL0c1TBWyUJ6RLFrPN2jqv4G7fengdk+Y/c
	nNY0G5pCVdUTP/O9Q7JC1nhwtJVdvEN2KDCUcGlmYRGrSEr34oAVq5yUSvUvMxMup1U8EwkLO447n
	/pbgMMbPV6S0NwZqQ77QbCG1dPVlntW0a4qF4YD7DHHP17OwRKvXnu9ywHE+gMvDKqReMs6E8emoy
	6or3vO2w6p65Bv07OCgOfpbsIQfdJ488OrfDHlwvapR60e2GHdB5S+ZU+K/Pke4A3ngWqT1w8dLd0
	5x8U6iEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVpp-000000004FB-1U3p;
	Wed, 08 Jul 2026 17:13:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVpl-000000004DY-3DZN
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 17:13:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B7DC54E40CF3;
	Wed,  8 Jul 2026 17:13:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79AB260339;
	Wed,  8 Jul 2026 17:13:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 537A811BC19AE;
	Wed,  8 Jul 2026 19:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783530790; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zfmAyoMMb2wOrJd1JOChx63QvBzEFg9LxEcj6r2lKq0=;
	b=NULni/6NFJ20KXh/pLbAeGrodYIPFdy8eBKw/RzQ8jTjYVIOvQUspy5qI1oy+zxGvEH+zJ
	WvoEK/O51fn4m48VZqqjYI81CQOxKWiScZbhJgJK2YVbNsZS1VGyuYZaMx3SLmnfr6jQoI
	YR2AKo/UgzIYjSUwzS3rpj+IKjb2Q+LhZ7cuFyaUM6XIR+e8wEmd4HbVythE68S0mmv3Cs
	j3oVLe6v+J9QSUhcNCD7mRipL0D8vtu88BOWe2ZQTs+kPxWTy/tKTtUto+VyBJhtPXpxqr
	+JFdA0Avyf2sOR23P7FkAyhriBrPYmbpdEOaTOxocTMTFz9QJqO1ky88LwxwQA==
Date: Wed, 08 Jul 2026 19:12:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Joshua Peisach <jpeisach@ubuntu.com>,
 Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 asahi@lists.linux.dev, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: Re: [PATCH v2 00/37] drm/bridge: Convert all bridges to atomic
User-Agent: K-9 Mail for Android
In-Reply-To: <20260707-drm-all-atomic-bridges-v2-0-21d03cbca446@kernel.org>
References: <20260707-drm-all-atomic-bridges-v2-0-21d03cbca446@kernel.org>
Message-ID: <CB4505B9-E9E5-402D-B5A6-A72395D2E5E9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_101317_948035_68369FB6 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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



Il 7 luglio 2026 17:11:07 CEST, Maxime Ripard <mripard@kernel=2Eorg> ha sc=
ritto:
>Hi,
>
>Over the years, most of the bridges have been converted to atomic
>modesetting and hooks, but not all of them=2E This forces us to maintain
>two different code path in quite a few places, which is pretty
>bothersome=2E The switch to atomic modesetting for legacy bridges though
>is pretty trivial, and we don't have a lot of drivers still using the
>legacy path=2E
>
>This series converts all bridges to atomic modesetting and drops the
>legacy codepaths where relevant=2E
>
>Let me know what you think,
>Maxime
>
>Signed-off-by: Maxime Ripard <mripard@kernel=2Eorg>

I'm out of office so I'm afraid I can only reply from mobile, but I review=
ed the series on a real laptop:

Reviewed-by: Luca Ceresoli <luca=2Eceresoli@bootlin=2Ecom>

Luca

