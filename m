Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648C5C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 07:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMsaA1R54toCB0sODBn1IRuW1qV2rbWOFi/r6RagXRs=; b=zoBIPklHdazw8tA9R7I8diTqPy
	IB7p8MdQzjiA6Cke9I2MFZCmsZgK5gbjpY+3wf7lPkRUpE8Oen0kKych/OT6gCpZ5Hyed6Yhvroqk
	mgP4ir78Ld3X+xprd3D5IlE8VGZ1FCCfPcZFm+2cZdhgdu60uTCSAhZoCUXYqFTzR8Gk4D6SySzhF
	3Tnf65mGvRpHETj2QbiYAgKnA2KG5yIfuIy8Lp/J1LL7HLEnqWesIaCSZZajBKHnL5+Udbl+RuuwP
	MCBpsceURnk9QfvE2y5EKU++FeTAwGArbxG2spHeq6/dH16WIqYrFPnUPNk5TPo3NKAhLBtFjJ2oO
	BcUqN6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3sbu-00000006Qdc-46JI;
	Mon, 06 May 2024 07:18:06 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3sbp-00000006QZU-3VOd;
	Mon, 06 May 2024 07:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1714979875; bh=d8SJOyUIc2J3LR7VIsmTy7D1ZJOEc6JKqIUdB2lDlmw=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=b2LiA2BLlOeyGiTncOSQrmOt/k18VLlKiFTeTx88nWuIztBQRWAHSZL5ssr6c45PB
	 DLhCsdxtACJAkCwOqu5QYepbeJnwATGvmVNYMPxk/Ux8qMUd7zqmREMf4MyY/R3sI7
	 fW1TZBotsxiRGoexNi2/z0n8MmtFCM1vpL3aEgZQ=
Date: Mon, 6 May 2024 09:17:55 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Yuran Pereira <yuran.pereira@hotmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, 
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
	Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [RFT PATCH v2 00/48] drm/panel: Remove most store/double-check
 of prepared/enabled state
Message-ID: <c6mip7ueabtsmod4xn4zlpzlgwhpk5fdi7rnkklibkiwbrwepi@vddtiw2xlc5a>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Linus Walleij <linus.walleij@linaro.org>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Yuran Pereira <yuran.pereira@hotmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, 
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
	Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240503213441.177109-1-dianders@chromium.org>
 <CACRpkdYbtfE9RLsDewV2UwnJknCp_sFEgc+cq=OF+Qd3tkTcwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYbtfE9RLsDewV2UwnJknCp_sFEgc+cq=OF+Qd3tkTcwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_001802_351817_A744B47B 
X-CRM114-Status: GOOD (  35.13  )
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

On Mon, May 06, 2024 at 08:52:39AM GMT, Linus Walleij wrote:
> On Fri, May 3, 2024 at 11:36 PM Douglas Anderson <dianders@chromium.org> wrote:
> 
> > As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> > prepared/enabled in drm_panel"), we want to remove needless code from
> > panel drivers that was storing and double-checking the
> > prepared/enabled state. Even if someone was relying on the
> > double-check before, that double-check is now in the core and not
> > needed in individual drivers.
> >
> > This series attempts to do just that. While the original grep, AKA:
> >   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
> >   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> > ...still produces a few hits after my series, they are _mostly_ all
> > gone. The ones that are left are less trivial to fix.
> >
> > One of the main reasons that many panels probably needed to store and
> > double-check their prepared/enabled appears to have been to handle
> > shutdown and/or remove. Panels drivers often wanted to force the power
> > off for panels in these cases and this was a good reason for the
> > double-check.
> >
> > In response to my V1 series [1] we had much discussion of what to
> > do. The conclusion was that as long as DRM modeset drivers properly
> > called drm_atomic_helper_shutdown() that we should be able to remove
> > the explicit shutdown/remove handling in the panel drivers. Most of
> > the patches to improve DRM modeset drivers [2] [3] [4] have now
> > landed.
> >
> > In contrast to my V1 series, I broke the V2 series up a lot
> > more. Since a few of the panel drivers in V1 already landed, we had
> > fewer total drivers and so we could devote a patch to each panel.
> > Also, since we were now relying on DRM modeset drivers I felt like we
> > should split the patches for each panel into two: one that's
> > definitely safe and one that could be reverted if we found a
> > problematic DRM modeset driver that we couldn't fix.
> >
> > Sorry for the large number of patches. I've set things to mostly just
> > CC people on the cover letter and the patches that are relevant to
> > them. I've tried to CC people on the whole series that have shown
> > interest in this TODO item.
> >
> > As patches in this series are reviewed and/or tested they could be
> > landed. There's really no ordering requirement for the series unless
> > patches touch the same driver.
> >
> > NOTE: this touches _a lot_ of drivers, is repetitive, and is not
> > really possible to generate automatically. That means it's entirely
> > possible that my eyes glazed over and I did something wrong. Please
> > double-check me and don't assume that I got everything perfect, though
> > I did my best. I have at least confirmed that "allmodconfig" for arm64
> > doesn't fall on its face with this series. I haven't done a ton of
> > other testing.
> >
> > [1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid
> > [2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
> > [3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
> > [4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org
> 
> This is the right thing to do, thanks for looking into this!
> 
> As for the behaviour of .remove() I doubt whether in many cases
> the original driver authors have even tested this themselves.
> I would say we should just apply the series as soon as it's non-RFC
> after the next merge window and see what happens. I doubt it
> will cause much trouble.

In the case of st7703 driver, yes tested, and proper shutdown of the panel is
necessary, because lack of it can lead to otherwise inexplainable blinking of
the entire screen, when the panel is quickly powered up and re-initialized again
(eg. as happens when bootloader has display support). Blinking then only ever
stops if the panel is left completely powered off for several minutes.

There's a note about this in the controller datasheet, that proper power off
is needed to enable dicharge of the panel.

Kind regards,
	o.

> The series:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij

