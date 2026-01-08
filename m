Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDCFCF6C15
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKx0mVwbH19vuBhzvaR+1yZmiHRKxSzYZXrkt7qWcIc=; b=KttinKWclX45q1Zl6foNXlUCfK
	u+9P7Ol1JxkggvUYdVPbgTBn+zjidY82Y5mk4XH6VUl+4bQoDsqJytvuCQK9q+fqzfxEnHktTR6/b
	OhZg83XbLD44ISscAXunaSXpKTnHdq2c7nPSAhxYZVpTDzIgAcZZUpdmhKv1f22yf/w4PjkxXgscy
	Nmr3yFpfQWsdloGm3E531TWXlfpdd06htC32Eqcy/PtKXQ87tzlN/D00xsTxvuUzNf/jlKSZ5w8MQ
	RVYaBSG9Jq6vgR/LSFAAs5d41GmW5zpfdnGtOev6fRBg9D2Q+4z/W0LvVgA7+lwWaxnC3UUH5KsIt
	wbqR10Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl8s-0000000GEid-1Lc1;
	Thu, 08 Jan 2026 08:13:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl8p-0000000GEhS-1By1;
	Thu, 08 Jan 2026 08:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60F9E43D2B;
	Thu,  8 Jan 2026 08:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A5DC116C6;
	Thu,  8 Jan 2026 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767859990;
	bh=zKx0mVwbH19vuBhzvaR+1yZmiHRKxSzYZXrkt7qWcIc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gcK59WjK6IwUT12wechfhjhX6s021QUj4wR7GFRWe/KHrOOI3w1Ng2AHChaciqJyk
	 84J6i7OP5B4eBbukfnRtk1mcnlTmicyXHcH7d0B9Y/9fuds5G/84Wn4KhDPu2V3C5n
	 YIwklbf//9x22qXMeYp3ZifHW1tJ9vP/hnDRZWAWI6eJSoCAc3he9cRGeMO+K+ekpt
	 k/mfqIsnh1JOoXYQOxoEstfHecTbd+Zr+ysnpOT3EVU2FrT6Rv5yiDCo50IQDk6XCJ
	 BL3RXp8kntOF+PxwjWBcAcQRUuEIn8irecdDRYyHoZUz6lztsTu4W1kjoHK9/xo2TT
	 umoQWDPjU5gpw==
Message-ID: <3d61916afc22b4ef596cee46473a29dd@kernel.org>
Date: Thu, 08 Jan 2026 08:13:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-2-ef48a517828e@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-2-ef48a517828e@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Kevin
 Hilman" <khilman@baylibre.com>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Seung-Woo
 Kim" <sw0312.kim@samsung.com>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_001311_369337_892E7A2B 
X-CRM114-Status: UNSURE (   6.07  )
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

On Wed, 7 Jan 2026 17:22:00 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

