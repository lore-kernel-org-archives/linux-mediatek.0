Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE96606A32D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ftRmnPEb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqHVOFQr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LA9T27Ncxx+yiFs4glj94r98G+0HTVpceCAL9vn3vWw=; b=ftRmnPEbxs2Dmj
	67EcappGROVPEzgFUEYzyw+r/1oRN8PsYDmF/t/CFmmSgwJHVrJzMAGrM39vXP6ILGgoKsc4uxfSM
	u1kN2IbluVQHVOJjq/bNXBe8pYbdvTl9fMZKvm/8I3aRSyoXBRz8nywgw6mC5SapehRnVlWOalynw
	2LwKmJ6mK2IBX+0rkvTmK2HV7VsODGpUG2sthKadzOZwLa0NeFa6CBNOQFoQ371bibfUniXR/n+Mw
	FCgD5s2QzIOLKfXCw5BpLH/RQxaYnNrrG1WSlh3M+Z9I5VWVmHXZ6tGBnEZAXbrtPoEINKJ+CsVS4
	TTEp/tnspTjC85Evimvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWVh-000000047Ud-0JHs;
	Mon, 23 Nov 2026 16:03:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWVf-000000047Tt-2pQZ
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 16:03:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2311560221
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 16:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA66A1F000E1
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449794;
	bh=LA9T27Ncxx+yiFs4glj94r98G+0HTVpceCAL9vn3vWw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iqHVOFQrPft4VbHPO76CWA1BpOC8W4aQgOxO3192qIaqhDWkCGOtIb0zf/9957cRv
	 OY85scrKfWlovZrSWtNcS3a9Q8U73Hfbm+coaw4eyVUB9BpYXPP8ufRQ1vqSyifmnD
	 GtKhnQioCnsdrMqz0NNrpXa3I+lDjm/djiJOxcaenqqLRIsMyoPEbvKA0iIOmQ1Mqh
	 E31X06nJhd3iS+BAkIES0Qj+kIUKrBf7FuZhY3tvLO7x6ZOFXEiTju2n2L6cG8mxtq
	 GvbRtan+t8cXskamWaKeYYP9GvQgPhtp4s9+xxc2Rc3UJiBh83g5C7ROESeB/qhE/k
	 2vch88fK6Jnqw==
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3269466c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 08:03:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHkgPBA1QRXD0ZqzaKh3FtrSy7pIBGQae6YB3k5ueWuEdT5wQ1pY2/E9YVP7flKSmSlbV/UHN4tlNUbO777Zw==@lists.infradead.org
X-Gm-Message-State: APuU4Z93BuyJ+Pwd5QV0G661NCKBERzb8KZJS6W9sITuPVnbWhN9z1ny
	Bhtxh0/LdSyPsRl7NZOQJyuRn9lZEzp1BNGL7l9o1KId6PrL9SKuP9Ba0PdkF4n7JnNGdlJZwA1
	u2dmfamCJWapR4rcOt6HPHZ2UX6tBVA==
X-Received: by 2002:a05:7022:f118:b0:159:2c6d:fcc3 with SMTP id
 a92af1059eb24-1b5568d34cbmr10453148c88.33.1795449794126; Mon, 23 Nov 2026
 08:03:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106103932.1219696-1-fshao@chromium.org>
In-Reply-To: <20261106103932.1219696-1-fshao@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 16:02:57 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8GoSOkVYeH6qGYxidNJaHF+5sOBs9rbmNNT0JTRRyUhA@mail.gmail.com>
X-Gm-Features: Aa3M54pCW39BI00fZZY2JtJokM0N_1IJyOAlnAV7U4nNlRDiy6OFr5lwg7Buxk8
Message-ID: <CAAOTY_8GoSOkVYeH6qGYxidNJaHF+5sOBs9rbmNNT0JTRRyUhA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Validate gamma_lut size
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, David Airlie <airlied@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
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

Fei Shao <fshao@chromium.org> =E6=96=BC 2026=E5=B9=B411=E6=9C=886=E6=97=A5=
=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:39=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The DRM core checks that a gamma_lut blob is aligned to
> sizeof(struct drm_color_lut) and at most GAMMA_LUT_SIZE entries, so
> shorter blobs still reach the driver. mtk_aal_gamma_set() and
> mtk_gamma_set() read up to the fixed hardware LUT size, which is an OOB
> read when the blob is shorter.
>
> Add mtk_crtc_atomic_check() and reject gamma_lut if its entry count does
> not match crtc->gamma_size.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---

