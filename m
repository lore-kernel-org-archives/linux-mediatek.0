Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30E3606A32D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PB0pPDB+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhxF28VO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SCQzlcbNwCmuhr5iFrK9gJq6siqjEJF99ctxEcILNVU=; b=PB0pPDB+IH82fW
	0MKo08pk7tAaYhb5BPW7Qsut3pVNwEKhmvMbL+k62LHPq9395QvC2t0O7AIywFM1h7rcKIN+wtcOS
	jo+q+bfroZyC/57wplXquzX/GWdlwoGyL0hMyd/TDEPmg29ti4NcHAcCVJIAYKKynHLZGFU9s7pTv
	Qp0dIUhm5nLAh+RV6d99BstB+BmclJ846sQtwW5Ge/z6tCOczF+5Bh/gN50fDLjNPZZPq9vBLoYQj
	/ZlZ8PpeBdM+CYWhist/Bd0LJoaBoPHAREXPDv8s2dksIpAUgnQdhg1El9+3Ebq083d6E6LS7s+cF
	2BdaNRpdgjGP7gfyxP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWIq-000000044mg-1poK;
	Mon, 23 Nov 2026 15:50:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWIo-000000044mE-2ufY
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 15:49:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD042622E0
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 15:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879BA1F000D1
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 15:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448997;
	bh=SCQzlcbNwCmuhr5iFrK9gJq6siqjEJF99ctxEcILNVU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FhxF28VOIx6y+hROoeNp60dLhhrLpae7rXzvw5rF7qUHPlYBCLyMDNMQrcWOhiw+K
	 JOho/jbZlZPyi/MQG4qrbOTx6O2AC+OlL0ImJHsNE0LlHpxtBfDzhLu35Yc3hfleS2
	 ihgiKn7z2XWHEBsgVwvIEcniBlcJpVjzCmrj4zEmHNqUfPvlqH3QNhxNUqR4e/eo3H
	 h6lnzAzDOV+cx6KIn2xsrZSX3gL8aAGSYVRRpmSdUv6WOpi6ANFIcZ0ulo0yf2is4j
	 URk3Qs2PoDSTaxmIQ3BmGcwDoC8R99MU4xDeAYvMS3AV/kqFPabpp+UfMAigDS9p7q
	 wXQ2sWK9pU6yg==
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3869f03af6aso2567551eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 07:49:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGqkLOf07KR8Mx33c2y2GCorHGlIYabKk7FxvT02UL26ivQXiezeOEscKH5mQSeREqz72MK5pztT0Ldnm3cCw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+fMbdktfE5hAHsc6DFDUgSNLSpi75/J19J82CO0bUrrC+K333k
	mmQcIKnflR3gvK+USitApyMPftKHAtdGsdBeGYcUA5qkQvxAtm+0q/LmWfcVou3gJh9ZI3ZxQPW
	HFg2d7MeaD9fjDs/XRNyOgpiR5oq0yw==
X-Received: by 2002:a05:693c:8943:20b0:386:af00:e9a6 with SMTP id
 5a478bee46e88-386af00eb48mr3600530eec.2.1795448996995; Mon, 23 Nov 2026
 07:49:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261011004248.1117649-1-agentzoan@gmail.com> <20261011004248.1117649-4-agentzoan@gmail.com>
In-Reply-To: <20261011004248.1117649-4-agentzoan@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:49:44 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8NSXSj64NBQN11kLs1ik0YXWH1FZ5gzJtzWYNEozQ7Lg@mail.gmail.com>
X-Gm-Features: Aa3M54oYdPL6VD3WqMQ7QRwBmptZ5_Vy6FcQra7b4AqYYR8h27_8PCC_wigfSRA
Message-ID: <CAAOTY_8NSXSj64NBQN11kLs1ik0YXWH1FZ5gzJtzWYNEozQ7Lg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mediatek: mtk_crtc: Pick the connector route on
 every CRTC enable
To: zoan37 <agentzoan@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jason-JH Lin <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

zoan37 <agentzoan@gmail.com> =E6=96=BC 2026=E5=B9=B410=E6=9C=8811=E6=97=A5=
=E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=8812:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> mtk_crtc_update_output() only picks the output component of a CRTC
> with connector routes when connectors_changed is set in the commit that
> enables the CRTC. But connectors_changed only says that the connectors
> changed in that commit, not since the CRTC was last enabled. A connector
> can be attached to (or moved to) the CRTC while it is inactive, and the
> later commit that only sets ACTIVE then has active_changed but not
> connectors_changed:
>
> - If the CRTC had never been enabled, the route slot is still NULL and
>   mtk_crtc_ddp_hw_init() dereferences it (mtk_ddp_comp_clk_enable()
>   and so on).
> - If the CRTC was driven through another route before, e.g. a CRTC
>   shared by an HDMI bridge on DSI and a DisplayPort output that is
>   switched off (DPMS) while the monitor moves from one to the other,
>   the pipeline is set up for the old output.
>
> update_output() only runs from atomic_enable and the lookup is a short
> loop over the routes, so do it on every enable.

With modification, applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capab=
ility")
> Assisted-by: LLM
> Signed-off-by: zoan37 <agentzoan@gmail.com>
> ---

