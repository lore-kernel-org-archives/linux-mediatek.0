Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC47606A329
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NELA41GK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFWU1dbh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OLWrs6wHPjIfz7q4sqV0vSP15dB9qR0xZiDxNkgRnPs=; b=NELA41GKCtGGTE
	xWoEvvhK64cMCkkv4GdZzLXLCGcUO82HVa5t8tElYVvR4bh/kdI9xLqfdnrH4BZrNrVHJZz2JwCJJ
	EWNz16XLWysWHhBpZJk+6pUDI9EgNQyWUOAT7fEGWwYHHqZs+AZJXLP039NKzHXZvC1VJOKoq6E+X
	83BHp09ISfeDX8BQEJRBrxD1zZx/J2f7XWwFEip2pl6mHno68vB5E13SegaQe/dhoYH7DetIykLUx
	7swkXykg+Xq9ksGiYUKrS26P6S3unsTVWpzuGdfFf67uueDEUmTeWXryGr5Ph0OkgewRbVN+xx2BB
	yLeSsZryE8bFRlMHpVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyHO-00000002zDu-3Itj;
	Mon, 16 Nov 2026 15:05:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyHL-00000002zDB-2nx6
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 15:05:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2042E46304
	for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C131F000CD
	for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841555;
	bh=OLWrs6wHPjIfz7q4sqV0vSP15dB9qR0xZiDxNkgRnPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FFWU1dbhaoZvQa91GRdHI8OMpKROvy42/LGrcfuQXbdf73zihIiGdYVwNZODlPIbV
	 Q5czS1aAFUldNovu3EQYEfoc8NHu+qSDhm6v6a8eCG4NjUp76kfyw8lV9DsKKVk32O
	 CcIoLaAkJxaGHLILcqeNkWcM46hNELFAqOhyLM6uSFD20cXkC38iqTJWOeahtcSyYd
	 gl0YXDYAHTXv1NBld07Xow1K8b2g7I8++GShq7P5vme83fnO0wDP07J8foPfiJr0EU
	 +rycpV7xKfNuwSFM0D1jd7RIE4w+CF+RlYtMpdD4VUI53TH4XpcHTY33zunLN8yGxa
	 pKvVYF2ayle9Q==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so4023496c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 07:05:54 -0800 (PST)
X-Gm-Message-State: APuU4Z//Dl+PRCDudItOid42jJUPRjaCikEFzI3DLpr2cVXZ5jDNZiDh
	H+y+3wpo39JXmy8y5HOuqWZAwBQk+WHfJHtOYfxeyHe8F+Vf8tnk5zCIaykynMJBVdEjnsdRoyI
	g0v5EUPI+0AouADZlC/cOZ4advQQ+kQ==
X-Received: by 2002:a05:7022:170a:b0:1b3:b3de:9232 with SMTP id
 a92af1059eb24-1b503115668mr9409313c88.9.1794841554483; Mon, 16 Nov 2026
 07:05:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-3-l.scorcia@gmail.com>
In-Reply-To: <20260921113914.779393-3-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 15:05:41 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8o7CQQ=GiRX9hiPOjWs=DMP_XSqhpz21d0cN_w3E5LdA@mail.gmail.com>
X-Gm-Features: AclHuK__YOxqBRiQVL1fHhE6d4s71_dwL_BIXyQUunv6tKh3Bya6r5Lxps8nc8A
Message-ID: <CAAOTY_8o7CQQ=GiRX9hiPOjWs=DMP_XSqhpz21d0cN_w3E5LdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/mediatek: Add support for mt8167 Digital
 Parallel Interface
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=
=8821=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8811:39=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Add support for the two DPI blocks found in the mt8167 SoCs. One of them
> can be routed to a DPI connector and another is directly connected to the
> HDMI IP.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

