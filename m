Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E819606A33A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4FxqSFfD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKh2I4UW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jsBT0FZpMNikULzHhEfNl07JkOQbHVwUC1+MdqdHryk=; b=4FxqSFfDsT88Ll
	N6IIZTZkYvEnJZTrOo1RsJir5BLLkWy2k5xrX8eaM7l2lKP3aDUzC9tpx1Wod+wxH3/c/V8Xr8QVl
	F22lvy9DD0ptDNOI6nz/nYTx7lq0blBVNsVnPPUdj+uEEl+0aKxePCVdbgMbhavccrAIoFZtYzSgJ
	OBaStroV5sybL6jMASCaktU48thBTs6r9WBEve9NgvDVh8JNBEUG5ehmV1OUW1vjtbwBwfWKdvPNY
	8qtZaeFYw2J44farTMTEIUEvVitaVNwu8SoTRD5uR85faXBT1W4zW1goVOte3oVyLWQdMbxjU2I0v
	dEVu2/tsJOPtAhNvGSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyD3-00000002yMs-3xR1;
	Mon, 16 Nov 2026 15:01:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyD2-00000002yMe-3fLW
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 15:01:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E36F62D0D
	for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69F21F000CD
	for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841287;
	bh=jsBT0FZpMNikULzHhEfNl07JkOQbHVwUC1+MdqdHryk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HKh2I4UW8urBSFUrtUHbQuwz1uPcC4POn0U8BTVb7KejMbcKTgiiMvkB1Gmm25liB
	 kJv7PCgqbShOR0u8F+r7n/QRCEEJAujbdR+CpHaW2UCq+S4bYSu8E6kodZ2CCmqdV8
	 RUk4aBXxZGJnapTndxlNM/KubIf9b1TS3QCNuKzzeIsnGlDSZ5EhWbHUew0yjT1PbS
	 LUm/DK0W9tLuC1jwPG8sDSwj0F60JVcBeCPGxQFMbYdJCQvTOeS7kPHcFwzOXE8zUq
	 8Qa5Yed6nZ+W+AQpcGVxYJUgDX01x1woMkdkKv9nBVR/BMdXCWDW02zAUN+3wo2rQL
	 O8W6dKmmqGGJg==
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b24f4b15c4so1134225c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 07:01:27 -0800 (PST)
X-Gm-Message-State: APuU4Z/pLgV07una9fK/RCGaOTZqoKQ7dN+cEVqEz4iPU0W9J0YUMXXk
	ihX3FoUYa2BXFAoX2VgT+HsXscfIfANFkxwfpjY51NbwSfscNuy9eH8xZP6d489wl72/qXUOpZV
	5X5IVB3e4NyAefvXvM2A1gUUNyerqOA==
X-Received: by 2002:a05:701b:4648:b0:1ad:1574:aa9d with SMTP id
 a92af1059eb24-1b502f8a3femr9454273c88.0.1794841287247; Mon, 16 Nov 2026
 07:01:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
In-Reply-To: <20260921113914.779393-2-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 15:01:14 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9W4MmG74gMgXx=6-QncXs2-DqdR6FqjckJG9bsevyWnw@mail.gmail.com>
X-Gm-Features: AclHuK8ZIdYSrxKs1dMZwhPrKku_6kwGWxmzNQVSAncsA778TJy7Qtii6vDGXkQ
Message-ID: <CAAOTY_9W4MmG74gMgXx=6-QncXs2-DqdR6FqjckJG9bsevyWnw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
> MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
> one can be routed to a DPI display while the other is wired to the HDMI
> block. They are not compatible with any other device, so add a new
> compatible to describe them in the device tree.

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

