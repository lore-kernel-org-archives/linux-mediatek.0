Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48441D41D68
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 17:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdMujCpfMDsauoGRdezM3N4cIRdRlpVSTZ0VL4qIJ0k=; b=ydZ0IB7Jw9YaiNpd7bEFIE55UZ
	7+hZNm4TDYmBAR57Bww4ghZKSq5Xx07mH4vg2asZT+mdGsLRAx0BmGsOi6ETuYaGusSBSOUwdH8Mt
	oez5q65LeCT2ZY/WOjnQJY/J9SnegldPZ5yYxeTSxhwDiUL5w47ytumT+/EtQQWsWwE/tXMom48fu
	O4MV7ykGDr7nC+KE4nJUO/VV8AdERM+3sBoo05gXUrdCWMUaDUy5REtFpS0e1lpsgLykwcnghv2XH
	u2cTHtH+VNOUPMJ7M89CSGdFXkyfmo300CvDtkSDF0OevOdQobEcpNWwM/E6ppcjc89uhSmB47kl7
	Uf5Ps2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkmO-0000000H5s7-0Px8;
	Thu, 11 Dec 2025 17:48:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkmK-0000000H5qe-05SZ;
	Thu, 11 Dec 2025 17:48:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 20210C1934E;
	Thu, 11 Dec 2025 17:48:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2267B606AD;
	Thu, 11 Dec 2025 17:48:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 617BE103C8DF5;
	Thu, 11 Dec 2025 18:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765475312; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JdMujCpfMDsauoGRdezM3N4cIRdRlpVSTZ0VL4qIJ0k=;
	b=N/APjRAuZRjcepImCR5G2n0aklAPp0QVq+Xp2siA7jweLGkdyHaQZ9ed1h7Z2KQ/B/s8oo
	w1bnUgTXF+F0xx+rLlvjNK5R4AMYiX8jWbhZnk+qbWviSBpOs/KxyPy49grVjAncDSKHwm
	dq7t9bGV0iZ8j+h3cSc+jFPQBuuErDwOLHcR952kApoPm0210VuZZdJxTU+NME4GeWm2xI
	Fhr6WO8MojPTEn8vlpd0uHAACCjJ6ztebwi/aqRS9ARnbac4d69hfu0UMvYqriANXqYIy4
	Vk27ZayUl0h+sdJhHl0P77wzQaAnrHZlfbmA53ZDRZ20m/NXWNQpBEacxNq76A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 18:48:22 +0100
Message-Id: <DEVKRHI0WLHG.1J4ULCK2DYF2Q@bootlin.com>
Subject: Re: [PATCH 04/26] drm/bridge: make of_drm_find_bridge() a wrapper
 of drm_of_find_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>, "Alexey Brodkin"
 <abrodkin@synopsys.com>, "Phong LE" <ple@baylibre.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus"
 <anitha.chrisanthus@intel.com>, "Edmund Dea" <edmund.j.dea@intel.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 "Anusha Srivatsa" <asrivats@redhat.com>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com> <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-4-0db98a7fe474@bootlin.com> <wxxjp7fmsnh2k4huvg2thmfi6kcszdphrag3zosrnykn7abeua@cdlywqj32jd7> <DEH2R1Q0XJJG.1NMESYMX9GMFL@bootlin.com> <20251201-fragrant-kingfisher-of-expertise-e43bff@houat>
In-Reply-To: <20251201-fragrant-kingfisher-of-expertise-e43bff@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_094836_217673_DF7D597F 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi Maxime,

On Mon Dec 1, 2025 at 5:34 PM CET, Maxime Ripard wrote:
...
>> The main user to be converted is drm_of_find_panel_or_bridge(), which is
>> very tricky, and in turn it is used by devm_drm_of_get_bridge(). We
>> discussed this in the past and the conclusion was a rework of the drm_pa=
nel
>> lifetime was needed to be able to properly replace
>> drm_of_find_panel_or_bridge().
>
> Yeah. I wonder, now that we have a proper allocation scheme for panels
> too, if we shouldn't just create a panel_bridge for every panel we
> allocate.

I would definitely second this idea.

>> Maxime, Anusha, are you aware of any steps forward about dynamic panel
>> lifetime, after devm_drm_panel_alloc()?
>
> AFAIK, Anusha stopped working on it. I'm fairly busy at the moment, but
> early next year I'll try to revive that effort.

That would be great! Please Cc me so I can review and test your work.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

