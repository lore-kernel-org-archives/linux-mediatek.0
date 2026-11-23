Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE77606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=htB0Q0nL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ScMHru2V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l4IBb4xjYzTBoSi6YXuP+odsV5j50E3nqTxEjgiJFXU=; b=htB0Q0nL1LwIwD
	s9g+83/fYcdsoRxlAZ7qXPUFDJuy3h7newrFJtjzeDKX9R3gpckMJ86KPCdmOjEueeh0zaC41Z/eT
	eLT8yx7oFDqiAO/H24sMooJ6XtVV6W3LDTFg9AvlEFxe5nG11zUu2mrjuB0j3R67k6KsIjcIlogTP
	H7ZfJ90XPNZwXSdu7IMg1Iv8219kXD4KL/ulGNg2HWuEbgcO6X1rJySPndQEd694uYnkei98E237B
	8/ID9D5NcE9gFEd/urOvzFxMC001M0EI22KPgF6Np09x3Uuw1TqIdhAl18MEJaHE7CXnhz9OndpJK
	KnEBMFRq1W/h/uOMIKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWZi-000000048Ob-0l64;
	Mon, 23 Nov 2026 16:07:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWZ3-000000048Du-2klD
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 16:06:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA23E62368
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 16:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902271F000E6
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450004;
	bh=l4IBb4xjYzTBoSi6YXuP+odsV5j50E3nqTxEjgiJFXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ScMHru2VIvuBRXLr3rU7S50QEYGVjq8CNRcZ90X1RmgFFmqUXmI3YULA3G4VvlSEq
	 6mWi0Mkcg2NuWySrlMfFaQ4/x2Y4L6H8elSGIcBStc29EiUNOuhieiTLqJpRHA7mWU
	 GR8SMyiofhxm+IP4nVcQwSQZzhs3MV1VXi+S/zSDs4xJP2J2jqOTFed7e+gIF0Ss+C
	 SHJj9cl6aFc/v7iLXUiIWzzKBMuJU8l0Mp/CyL1OHWbZXjGWWJt9D5TqcYLtSuWfeB
	 KnvoDyxvXa6KA+WRga2yvZfaxAnV3N2jlDdP+Cpzr6WRV6vy+ctOrPsqL/m7vH5am+
	 cXJXpWRXCxqUQ==
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so5804066c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 08:06:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGaSWQ2nIoBHmMjBjX2vRrYPwzNyjpRObOn1ALQsQ+YLrz1hqzjoQTfipE1ht3ZIyzsICRkA69xWacBi2oYXg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+uc5oUyyxKRDI/5wrcqK2Vk0ZLHgAVqB8evhWovWwt+IElTUDK
	NXgiIeLt7W/+heNFv/9zukJOu8PT1Ou7Ciykr8E5jDAR6h1NyxNxmGg/vzRr49HJPOXpIWkuTuj
	c3l40VkMd/H0nlL8R7hMxF8Ses4wTDA==
X-Received: by 2002:a05:7022:b056:20b0:1b3:ac53:da84 with SMTP id
 a92af1059eb24-1b5568e371bmr13106997c88.32.1795450004014; Mon, 23 Nov 2026
 08:06:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117-6768-dsi-fix-v2-1-6654a072884e@protonmail.com>
In-Reply-To: <20261117-6768-dsi-fix-v2-1-6654a072884e@protonmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 16:06:30 +0000
X-Gmail-Original-Message-ID: <CAAOTY__tykvuoNWOD3ZMy1etCEwPPJrvY=y5xOO7h7DL=ErRdA@mail.gmail.com>
X-Gm-Features: Aa3M54q66gFGZx_hKSNABqOrF2C_XAAy0XYCXxVeneDbJLO5H6L8BwiOx2EzBXg
Message-ID: <CAAOTY__tykvuoNWOD3ZMy1etCEwPPJrvY=y5xOO7h7DL=ErRdA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: mtk_dsi: do not enable HS clock in
 pre-enable for LPM panels
To: rva333@protonmail.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Gary Bisson <bisson.gary@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
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

Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
=E6=96=BC 2026=E5=B9=B411=E6=9C=8817=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=
=E5=8D=886:27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Roman Vivchar <rva333@protonmail.com>
>
> Commit 76255024cadb ("drm/mediatek: mtk_dsi: enable hs clock during
> pre-enable") moved HS clock enablement from mtk_output_dsi_enable()
> to mtk_dsi_poweron(). Later, the commit 3e191eddbdcb ("drm/mediatek:
> mtk_dsi: Enable HS clock only at pre-enable") moved the call to the
> mtk_dsi_bridge_atomic_pre_enable().
>
> However, mtk_dsi_lane_ready() explicitly sets mtk_dsi_clk_hs_mode(dsi, 0)
> so that DSI panels with MIPI_DSI_MODE_LPM can transmit initialization
> commands in Low-Power mode during their prepare() callback. Enabling the
> HS clock unconditionally in mtk_dsi_bridge_atomic_pre_enable() overrides
> this before panel prepare() runs, causing command transmission to fail.
>
> Only enable the HS clock in mtk_dsi_bridge_atomic_pre_enable(), when
> MIPI_DSI_MODE_LPM is not set, and restore mtk_dsi_clk_hs_mode(dsi, 1) in
> mtk_output_dsi_enable(). This is a no-op for non-LPM bridges.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 76255024cadb ("drm/mediatek: mtk_dsi: enable hs clock during pre-e=
nable")
> Fixes: 3e191eddbdcb ("drm/mediatek: mtk_dsi: Enable HS clock only at pre-=
enable")
> Cc: stable@vger.kernel.org
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---

