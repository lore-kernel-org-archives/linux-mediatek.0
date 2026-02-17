Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DF1E909D8
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Feb 2026 16:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIGbAV+8Vnm23slA1If+Si9qq/awHjco1XJ0AGN0iyQ=; b=ojVqvX2P3ow3Ry48d1AP63ZnxZ
	X2kpzvu7Qexic8nlGbj6z9IhiSQ5nkZB5/cTsNu/M0VQL8D24F6Jj1AsDpfMPtpZeY2Gs+foU0O1v
	QSnohkBJSzVPN3PZBTE7UO5h6/W9zOAyCj8MNbk8h2pgSlBQ8QCXbSwt6AyX9g6szKnkhwYDKKStR
	vnsPwtswhf/TRF2InCLUsA3D4r4Auy7Gnvh6rKpchCyGYebkMCrSl9ZTlOIsuREliwd1R81O0YQ7D
	JjR4qLQd+ji450DWTP925im401pNsF+t3m3Jle9gJLwGJcvkjJIMwQr+Qh5PYPqs40I/phSSCWPVl
	mTCejG2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsO5B-00000008a51-3PiJ;
	Tue, 17 Feb 2026 16:37:53 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsO58-00000008a3u-0A0e
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Feb 2026 16:37:52 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-65c0e2cbde1so1825616a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Feb 2026 08:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771346267; cv=none;
        d=google.com; s=arc-20240605;
        b=OVPK9R/CTgc2d0YWGkekbZhWD9FW2rGQJHROaGSvWcCFdlJeD2DlORhNkJ8nxZ2IT/
         9G7fM0lZeg71Si83adCDb7XGY2oq1ARBNDvx8fq46oiSMf6+DpExkEKO9Ar1WLS2zAve
         Vxl7NclIEHZJzly/SZtVMue4qmv22tSAmE1mMcmaa34BcrdFyvwLgiLDAt5ii85MDx4k
         QTiTzKunjZ8ti1d2arZjNCJsLMUzw44aWu7wqIxGLQ/H9aDrjtyJrb5EfuHesQI0vIzi
         u8Q2866Czp+9it2lYBf5R4AEfAJ/wajFGnkCCJGjWnYVx0sqxbhMrUL263XMtqYsLi80
         y/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eIGbAV+8Vnm23slA1If+Si9qq/awHjco1XJ0AGN0iyQ=;
        fh=QApU9iVGuGWwdo+1S6r/GfW/oH8CyMefHMGN2yNm5xk=;
        b=SOqTiCVF/QlHtdOs7UxMJDC1m4Edh7BfLC0LR4ha0g58sWC1b1yHQuvOEcakl8iFUQ
         Bxci5kFKIlOlX9x1hOdVLmvfxOdkxC+7WxADlnZsV5L6HmaUvd1j7PCs52Qas1iuK09r
         Dyj6qYF53l4StMlDe59XPBO4uvyn55FMWDGQ97MPDfZmvgXu8csQzzlinqSbQZ/fFBEd
         eDmUc68DyX77zc8KX6VA4//G3vXX45soT3KhP2ZoOCLbSipweV9KtD5uNhOvu12+Ub6A
         ZHZ+nbQawFoRqzmsmMT2y0aVySIZww4J5nICAdM3OXdgzy/66jM1jXfhRqPdeCJlcK4g
         7a+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771346267; x=1771951067; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eIGbAV+8Vnm23slA1If+Si9qq/awHjco1XJ0AGN0iyQ=;
        b=HQI31/0pakNEaH7kgDRrAcBjXj3DnE41+mkIzXVr6z76QOMZeDs1h9HIpEyBuluNVN
         s/vsLNUFY1eV4tg4YyCherla9PPjGWJ/yanr51A9X0dOMkPckaC2kK5ZkqJ+dzSI9Iiq
         59eIsKctKvOSrMbssJU1NEAqQXuYdtdE0OBGKslQvInoutXuV3jccp3B9vdHPOSPsOji
         5Q4/fbY4biPHvvaHR960vwpkIHIy7wxd5tOwY7uFBqt82pbMogbgT6KBh/Oc9RPUK1Rl
         3jcHkYEUvoB2votg1ZnaJGXNkZU6aul1HtNegZKXIfoH4bYpPyQkeV8pqvZlqvLu9ZYd
         kJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771346267; x=1771951067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIGbAV+8Vnm23slA1If+Si9qq/awHjco1XJ0AGN0iyQ=;
        b=dsSbec+x+sf8RSCBJaKuXkaoylxG3Men2avnD72J1+JCCuJYVePDyGaiQGnq0n4m3G
         /rE1fPL3WgTMpJtxHo3FOHLRBHlqkOFIvcKGfx7X5MPeVhYtWfcgl1E+tgwPTb7KaT+x
         LA/59xXfsEnyD0EK/L91vhetABBJFaQkS5AgBISo+4IQtXZEEoKfqooznzvBcWzGz6VH
         xTkim7WdKSDK2AbFdjAt2pnyNJm1hT+mDvyvyLZObeYLPwbIhHs/ucCOSSzth2N0rSCk
         vXLg1JXgzOQJjNRgGDGOllONKKMFyWR4tdBpMR5G5Yz0n4JmkiyqWVrxe3TmF7J6iCg1
         o8ew==
X-Gm-Message-State: AOJu0Ywvbz3Ms1KnG2dzk8+q/nukK2HHJzvfo02pXToPs8EdE2gLYpfO
	WwDIWx33P0VvqJcjiTDmv20dtVzozDjsoBwKP/yQZJSM/s01fjLjTxUobDhcg/52RcqFSxjUNE7
	ceOcG9zVzPbMCIpCotI25eLHDSlud4t4=
X-Gm-Gg: AZuq6aI7m1rDDC6uBU1NW8Fcc541XVcLswM8UMt1GbJfkNugn8SFKlm4llOof27sXoI
	Iimw8JWt5Itjzd0Ddv0ol0IZeyKTNs12c6bsCcZ540O0tctKMzlNBe973sw/ZGB5VjA3pTI00lj
	IY8AvODZGHzpWRj7PM+JvBlbYC3fIUeDvji4PY0aHkTnwKXSaMOpMOD/+UoHXje8UcvelPt700C
	mt75+f+Mva2tLDNDqVFiCLg2mNXFBJf8O+3j9/q5KJHEEV4QJXPa5a8rMsnRkOG8DHEmdRq0XMI
	qtU1rw3EEd0xnMw3
X-Received: by 2002:a05:6402:3648:b0:65c:1f0f:e6f6 with SMTP id
 4fb4d7f45d1cf-65c1f0fee06mr2535558a12.22.1771346267257; Tue, 17 Feb 2026
 08:37:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771258407.git.l.scorcia@gmail.com> <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
 <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
In-Reply-To: <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Feb 2026 17:37:36 +0100
X-Gm-Features: AaiRm51UVemOzhQMk6xoVI4EJaD4w62lgA3q3kyqzB9n5tt-MdAm1A1cRwc2sAA
Message-ID: <CAORyz2L6_4yLb7t6-H3MjCu7QJtPF0QTvdsvdBw8f9zTey_tBw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
To: Vladimir Oltean <olteanv@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_083750_924096_23031BF1 
X-CRM114-Status: GOOD (  29.96  )
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

Hello Vladimir,
thank you for the reply and explanation. As a new contributor it is
greatly appreciated.
Those patches are definitely intended for next since as far as
I know there is no mt8167 device using upstream kernels out there.

As for the Fixes tag, the rationale for it was that it's ultimately
not coherent with both its original author's intended usage [1] nor
with the current code as it's not present in [2], possibly due to the
fact that at the time of the original contribution bindings were text
only and less accurate, so I described is as a "Fix". I understand now
that the Fixes tag has a special meaning in the merge process so I
will just remove it in v3, it does not add much information anyway.
Also thanks about the git commit prefix suggestion, I didn't know about it!

I apologize for the confusion and I appreciate all guidance from maintainers.
I really want to do stuff The Right Way, it's just a matter of moving
along the learning curve.

[1] https://lore.kernel.org/linux-mediatek/20210406113631.2675029-3-fparent@baylibre.com/
[2] https://github.com/torvalds/linux/blob/9702969978695d9a699a1f34771580cdbb153b33/drivers/gpu/drm/mediatek/mtk_dsi.c#L13061

Il giorno mar 17 feb 2026 alle ore 16:35 Vladimir Oltean
<olteanv@gmail.com> ha scritto:
>
> Hi Luca,
>
> On Mon, Feb 16, 2026 at 04:22:14PM +0000, Luca Leonardo Scorcia wrote:
> > Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
> > describe it as compatible with mt2701 instead. It is safe to do so because:
> >
> > - Bootloader doesn't rely on this single compatible; and
> > - There was never any upstreamed devicetree using this single compatible; and
> > - The MT8167 DSI Controller is fully compatible with the one found in MT2701.
> >
> > Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")
>
> Not sure which direction this patch will go in the next revision, but
> (if this patch remains in this form, and intended as a bug fix) please
> do not mix fixes for the current (and stable) kernel with new development
> for the next kernel in the same series. They are supposed to be applied
> to
> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=next
> and
> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=fixes
> respectively.
>
> (also see Documentation/process/stable-kernel-rules.rst for what is
> generally considered to be a bug fix. We don't use the word "fix" very
> lightly, there needs to be a user-visible impact.)
>
> To help the build test automation select the proper base branch, you can
> use the "phy-next" or "phy-fixes" git subject prefixes when generating
> your patches.
>
> You can send fixes at any time, but please send new development for the
> next kernel only when the merge window isn't open (unless it is marked
> as RFC, then it can also be sent any time).



-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

