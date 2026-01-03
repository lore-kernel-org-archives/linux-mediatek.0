Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5716FC6182
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Jan 2026 19:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T925OkrZcUDgPFL2mYysHSWwXId47m50zcvgTJvCH2c=; b=gX09yssQC2JLXJWhLSrLpSjgpT
	fnTTquPkgjHHq7I/Z8jtdTiPfuCxkO5WwseWE2TasqG225aUyv7X6kBhjEVGVJs0WXbloEJKMHcEv
	SPOaW2lekDHMmE9WOIb9IygcIMGiII3jZO8bYghlzYiByqejJpHdrSLy+nI61AbXTTPdx3YmxqGcZ
	ejnLJ6elVeeoI1nha1fHDOXw84Fx9msb9LnYHchfhsmC/wGxTOndxnTVEtVxjDGk2kEnL3mZDTn/W
	TPNTyUMj6i+Fkja1Xl64Ik8HXn5rW0breChV6R5PDwTJBWgr7qlwTmyegRXB4qrMtBFTpMjIcjjAI
	Jb7ES6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc73M-00000009iDg-2tKR;
	Sat, 03 Jan 2026 19:12:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc73K-00000009iCx-0Jv7
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Jan 2026 19:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3B0443BF1
	for <linux-mediatek@lists.infradead.org>; Sat,  3 Jan 2026 19:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B267C2BC87
	for <linux-mediatek@lists.infradead.org>; Sat,  3 Jan 2026 19:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767467560;
	bh=T925OkrZcUDgPFL2mYysHSWwXId47m50zcvgTJvCH2c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XwkdHVZV3gQnw/Squqt0WQf2kgDmWCB3uLhB4vNPfLhUYflWMvg0DlOyvLv6lOWkp
	 GxueGN/DejHjmBa9Q90itz6LELagfJKXs/snV9U7yJC+iCD9CyzzFUj6qTUop4scjD
	 pqQ7yjuP3byWkKSdyd0DCyYJ4TLXzhOM0IP5wXrvb8nbbq5WDjvxt5Xo9fPFPOBSOs
	 U85EwkPdKHWSQWmnpVHVj1cmGS9TlzUxF0c0zKJuYHRGeWMrmYAUro96BVlbfXlJaH
	 2lzbhsxLlt/0vTNe6dCS1vYhYKKknqgjcV4eVykEomW57WOKnMJ6d0FKBOmXku8BKA
	 JIQ6TfoXrZcOA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78c66bdf675so112660227b3.2
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Jan 2026 11:12:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUufXL9YAQO4VRV6hlnMP8SARXYEGz4Urh8AjShvrCmlVieHshdh6zT9RjSrqBL5KoJbpfDFaOkHpRir1oREg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHWaml8KekSOHBtFS1RKCvc/sdV/7KIkZA/zKTh0dnEkbQdKo1
	w6Xr3vGlj00XaDJsKsAawZnc2QPDavXDLopH/hsxL7+jmmgp/cdXq+pAr8LOjeDko5tpK+ZyICy
	9xJirdh9hElepSIxa7zh8+EZswB4dNi0=
X-Google-Smtp-Source: AGHT+IGShwlfB3khNYsriA05VuQGUjyDnWfdgI+OFTb0UW6gPumdUc17cvVkNIGVynpsd6//h1UTyWv7gZLMzA3VXbk=
X-Received: by 2002:a53:bf8e:0:b0:643:833:bf3 with SMTP id 956f58d0204a3-6466a8598f6mr27408373d50.42.1767467559732;
 Sat, 03 Jan 2026 11:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
 <3b13c7a2-f7e6-49fd-b3bb-3e0a1fe9acf3@ideasonboard.com> <CAD++jLk8-0Rkh16T+R1dh6=e_f9U1i=AKOk1Y8dLGV4bxzRtFg@mail.gmail.com>
 <817b2358-0920-4b7a-abb1-133103d0f9fe@ideasonboard.com> <CAD++jLm_0xweD4tRJ8ZfwmcOe2BBGCsUuL1UWUiNM+Gpbq3Zuw@mail.gmail.com>
 <6be8aaf6-b01d-4444-9850-967f8e316896@ideasonboard.com>
In-Reply-To: <6be8aaf6-b01d-4444-9850-967f8e316896@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 3 Jan 2026 20:12:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLkWH8xxT+bTXseuJv+pXeEGy7qqE7Z1Mid2CwRg8O5D7A@mail.gmail.com>
X-Gm-Features: AQt7F2oqzhLbhnApuLunbol1WMXqKAfZVNbTglNtWTgf1-h4HM11uw_w8WHAIqs
Message-ID: <CAD++jLkWH8xxT+bTXseuJv+pXeEGy7qqE7Z1Mid2CwRg8O5D7A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260103_111242_195672_D5A79A39 
X-CRM114-Status: GOOD (  14.97  )
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

On Tue, Dec 23, 2025 at 12:48=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 23/12/2025 01:18, Linus Walleij wrote:
> > On Sun, Dec 14, 2025 at 1:42=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >
> >>>> Should we merge this series as a fix for 6.18 rcs?
> >>>
> >>> Too late now, so let's merge it as a fix for v6.19 rcs!
> >>
> >> Ah, right. Indeed, I meant v6.19 rcs.
> >
> > Are you applying it or should I?
> > Not sure if you want some special timing, like outside of
> > holidays.
>
> Oh. No, I'm not a DRM maintainer, so I was waiting for someone to merge
> this. From my point of view it's ready for merging.

Aha OK, I applied and pushed it now. I added the same Fixes: tag as on
patch 1/4 to all 4 patches in the process.

Yours,
Linus Walleij

