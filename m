Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E61D5E133
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 12:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hHeRHBPz8FHrfA8wBRwIPdvL07IcL4vWcbkjQN6o5U=; b=17TAf5Sxm5sQ8OSGPxBscg6WyD
	f+3sWhrRYCaw8vMyQwe9Njhp3CBqK3+5bD1iAtexmtLRsOiEDYDaiTVhtl6CZqIZ966ocGsuOooPL
	Wf7BCBRk06d5egY20gjaydor6/jVik0rKY2XSN3VG7XeXQMEn4CP4N2GPPjVh1C/3LYvtKtS7NnSO
	4OUhY74J0iA2gvFOweW8dExewxyuMk5VX1l5uQf9C1PBkZ3SjUMd3pfoHySQ3JZ9A4OYBhqqIusB2
	VHLGGQG2t+lR3isiG+60syGMmEl20H21/do5U15IE/OHYH+ZAVMAJKzQJluFXTFitgupUiBVT/WW0
	bPQBaeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVURp-00000005CzZ-3Ml2;
	Tue, 16 Dec 2025 12:46:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVURl-00000005Cxk-01Kk;
	Tue, 16 Dec 2025 12:46:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ECB634E41C29;
	Tue, 16 Dec 2025 12:46:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0B896071C;
	Tue, 16 Dec 2025 12:46:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F6D9119434E1;
	Tue, 16 Dec 2025 13:46:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765889187; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5hHeRHBPz8FHrfA8wBRwIPdvL07IcL4vWcbkjQN6o5U=;
	b=m6Q9kiwXvA4v1X/hP/+JyTcjUw1OsRZD6sX9zF23Uc56YUe0aF7FfA2KCuP1M2obR4PlMb
	aPzIj3mIE/PPPTiVXNNK9IvGfQU/IcRxA1u3tSisdJ4StT4ZwIhS9r2tuvD4DcqrWN6HK7
	r+Fv7dhPRtuhT08YnqBBjRN6nck6Vv5kD/gUckn233hlRlfhJoVzlbq0b8DUv//EcPVzWh
	C+Xfl+is9PJ7W3ZgO6EOYgUa9QWFL4H0SQzz534bgN3xNr/BymxAexqEz6ffIeUj20qWGx
	KQmu8ehyJNbQzZEDn46VBO1vOEXe44XkhxfLx234QUnyLF1DRhsghK7L/S8xtg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 13:46:11 +0100
Message-Id: <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 17/26] drm/meson: encoder_*: use
 devm_of_drm_get_bridge() to put the next bridge
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan
 Corbet" <corbet@lwn.net>, "Alexey Brodkin" <abrodkin@synopsys.com>, "Phong
 LE" <ple@baylibre.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Adrien Grassein" <adrien.grassein@gmail.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Anitha Chrisanthus" <anitha.chrisanthus@intel.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
X-Mailer: aerc 0.20.1
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com> <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com> <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com>
In-Reply-To: <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_044633_446217_5B315E66 
X-CRM114-Status: GOOD (  22.26  )
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

Hello Martin,

On Sun Nov 30, 2025 at 2:09 PM CET, Martin Blumenstingl wrote:
> Hi Luca,
>
> On Fri, Nov 28, 2025 at 5:54=E2=80=AFPM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>>
>> This driver obtains a bridge pointer from of_drm_find_bridge() in the pr=
obe
>> function and stores it until driver removal. of_drm_find_bridge() is
>> deprecated. Move to devm_of_drm_get_bridge() which puts the bridge
>> reference on remove or on probe failure.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/meson/meson_encoder_cvbs.c | 2 +-
>>  drivers/gpu/drm/meson/meson_encoder_dsi.c  | 2 +-
>>  drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/dr=
m/meson/meson_encoder_cvbs.c
>> index dc374bfc5951..bf8588a5f6dd 100644
>> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
>> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
>> @@ -241,7 +241,7 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
>>                 return 0;
>>         }
>>
>> -       meson_encoder_cvbs->next_bridge =3D of_drm_find_bridge(remote);
>> +       meson_encoder_cvbs->next_bridge =3D devm_of_drm_get_bridge(priv-=
>dev, remote);
>>         of_node_put(remote);
>>         if (!meson_encoder_cvbs->next_bridge)
>>                 return dev_err_probe(priv->dev, -EPROBE_DEFER,
> Would you be happy with me sending a patch that replaces the whole
> logic in two meson_encoder_{cvbs,dsi,hdmi}.c with
> devm_drm_of_get_bridge()?
> I see two benefits:
> - simpler code
> - a patch less in your series (less maintenance burden for you)
>
> What I'm not sure about is how this series interacts with
> devm_drm_of_get_bridge() which is why I'm asking before cooking a
> patch.

Apologies for the long delay in getting back to you. You might have noticed
some discussion about the overall approach, and I waited for it to settle.

About devm_drm_of_get_bridge(), it is a very different function so it does
not affect this series. The name similarity is confusing indeed, but
devm_of_drm_get_bridge() has been removed from my approach, so one less
source of confusion.

I'm soon sending v3, and I have updated my patch to
eson_encoder_{cvbs,dsi,hdmi}.c, actually splitting it in 3. I'd be grateful
if you could reviewd and/ot test them when I send v3. But I don't think
there is a need for you to send any patches related to this topic.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

