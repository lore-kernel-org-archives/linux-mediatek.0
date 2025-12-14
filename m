Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7E3D3E787
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Dec 2025 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QLe5DRA4R5uIxIMYOd08sO2x/axkjdz2V3xzbL3jPA=; b=y8rX5PjVU9cVUZIF3sIuOqR7gX
	3YlgwOB3sCkr2Cl1LzYFf/TdlC+ygQWIg3IFv8qCQLI3f/rCGuI0zGfcUNPFO48S9ssrkFXRbi6pF
	jrLv8mVFIAMyjRwuI7YHbUwHNFqw2C6cTE8kE7XthxGcBZh4tSdFoQxU8pfvidnsUmDzwv4u/9hkt
	opeslVhgwK0VMkrzMiXt4bi1wdvn+4yd7X3WCRatC+A3S9oQfndIkX0pIfJ6OQR0U9/K/f7pC62uf
	/tCmKu/SQMQzLAUjxfU8RwdDDQSYutWhqHshGFfgDNaQba0wu6AO9zPT92B7asb7RfvaBmx95utYn
	UO6hNppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUk3Z-00000002OQq-1ZUC;
	Sun, 14 Dec 2025 11:14:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUk3W-00000002OPu-3Avw
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Dec 2025 11:14:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE1C04438C
	for <linux-mediatek@lists.infradead.org>; Sun, 14 Dec 2025 11:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CC2C2BC9E
	for <linux-mediatek@lists.infradead.org>; Sun, 14 Dec 2025 11:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765710864;
	bh=/QLe5DRA4R5uIxIMYOd08sO2x/axkjdz2V3xzbL3jPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A+LFESQIXd3zItQtPPuxev+VA+1XilaSrnOr/SEUs484jKGiSDLhqWpVkx5ciMeZK
	 ilVLuA/AvXxLj5d9VY7W0g60E1WXQfidapl/33Iw+hUiU1z/fPedpgw4bpqMPV7Sax
	 olfFMfBho4k/nSmFzuyBNHwuYQXdnRM0CcgE0VMeJ56Z8e6rN6GJ3wBnRW9kQBzwv/
	 486z5UGraXFdTNqLeP0a8ajpjRvnHw2zEMpcX0MI1Juk+htHW9SYk9ccaTOMmdwXtz
	 N0eV/QSjZK3SXVYp1Si4XIxH7DXy4crDghAuzSQ/npx1hRPdVscQTyZzOfdVYhzcJc
	 XJCl55l0Xq4Sg==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6446ba3d337so1913271d50.1
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Dec 2025 03:14:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZCpda7r0u43GHIvsdDJVF9k4N8m6N80au+oM04ufg1irFppC9xJGYL2kn7kceNdNXNMx1m/tPQ5zpW+jnag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1Myr/NNwkPdEzElfz2ah/7FzOydejh2XyXsX1dlwcvM7J9jWi
	UyMUjTQCec0kaJ0ZiiDOW+fTCM0LS7vEb1OCWFgJ/8nYJkzieFR0l2cOktu2muV1jo5AaG++W2/
	KRB9jO4TKBp8PgV+1iIlKB1XjIQpGtyc=
X-Google-Smtp-Source: AGHT+IF59cxs2kdU4eDBNHMhmLTNz8MsYKlAx9mrL803Pj47S8lUi3lkvhPPv1HSTCcC+HsFx/YkSG29wQ1pVt26PNc=
X-Received: by 2002:a05:690e:20a:b0:63f:add1:e6da with SMTP id
 956f58d0204a3-64555651315mr5936681d50.57.1765710863949; Sun, 14 Dec 2025
 03:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com> <3b13c7a2-f7e6-49fd-b3bb-3e0a1fe9acf3@ideasonboard.com>
In-Reply-To: <3b13c7a2-f7e6-49fd-b3bb-3e0a1fe9acf3@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 14 Dec 2025 12:14:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLk8-0Rkh16T+R1dh6=e_f9U1i=AKOk1Y8dLGV4bxzRtFg@mail.gmail.com>
X-Gm-Features: AQt7F2ocpq33b3u9qnsKC4Ot3iW4zl2olWm7s8rxLgJ7ka5jFZMptEaRqkUdvZI
Message-ID: <CAD++jLk8-0Rkh16T+R1dh6=e_f9U1i=AKOk1Y8dLGV4bxzRtFg@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm: Revert and fix enable/disable sequence
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Aradhya Bhatia <aradhya.bhatia@linux.dev>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Vicente Bergas <vicencb@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_031426_847770_059A538E 
X-CRM114-Status: GOOD (  17.83  )
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

On Fri, Dec 12, 2025 at 3:21=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 05/12/2025 11:51, Tomi Valkeinen wrote:
> > Changing the enable/disable sequence in commit c9b1150a68d9
> > ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"=
)
> > has caused regressions on multiple platforms: R-Car, MCDE, Rockchip.
> >
> > This is an alternate series to Linus' series:
> >
> > https://lore.kernel.org/all/20251202-mcde-drm-regression-thirdfix-v6-0-=
f1bffd4ec0fa%40kernel.org/
> >
> > This series first reverts the original commit and reverts a fix for
> > mediatek which is no longer needed. It then exposes helper functions
> > from DRM core, and finally implements the new sequence only in the tids=
s
> > driver.
> >
> > There is one more fix in upstream for the original commit, commit
> > 5d91394f2361 ("drm/exynos: fimd: Guard display clock control with
> > runtime PM calls"), but I have not reverted that one as it looks like a
> > valid patch in its own.
> >
> > I added Cc stable v6.17+ to all patches, but I didn't add Fixes tags, a=
s
> > I wasn't sure what should they point to. But I could perhaps add Fixes:
> > <original commit> to all of these.

> There has been no comments, so I assume this is the way to go.
>
> Should we merge this series as a fix for 6.18 rcs?

Too late now, so let's merge it as a fix for v6.19 rcs!

Yours,
Linus Walleij

