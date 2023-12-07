Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED968C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FpbQI5Mt0gSqQq/XXJLLf+1SovVdA+maQYMnRTJ0m4=; b=i5Y3lEcSSJFYznAPWgEidMaSl8
	gwnZ0QDE2zLHf6kqnG1o0rFsQDrbqcytSt7KY8yXB0YHv38SZQK3+IXk9PwIILGFTIzutdN333nH+
	yBNXkrf6Etj80U6p7kf1GupVHGA8hFD5XLSxbpiILu0s7fvzhnViPhxghvEHplbEqCY6CHL8tn61g
	18rAOOxdrUVT5Gj6qUlEo5kDBogenlk8BmP1MbXeGfrjBkTjGmOOpDExmsJUJ/d9JC30KMbTvJF00
	B5qB5xgxJTpSB8jaDIk0ySA9iEk3ISlCbNVh+7kPJJjEXdfsqM4Kc7BwoGKoPDkZAmbRYq8lu1U4M
	2KDd1x8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGrC-00DM3V-1q;
	Thu, 07 Dec 2023 16:04:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGr9-00DM2N-1I;
	Thu, 07 Dec 2023 16:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B47CE61EA2;
	Thu,  7 Dec 2023 16:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA54C433CB;
	Thu,  7 Dec 2023 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701965045;
	bh=2FpbQI5Mt0gSqQq/XXJLLf+1SovVdA+maQYMnRTJ0m4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K1poRaLOvXp7vPNZy1zTsvpIEeSRBjZnrNr1knbGToNVPOkTEZeVMv3dLcA9/wUAt
	 f/GaW2gY4cuyGpYx/hvja35r+6rddX/MDh2l8j5PS8IiniikINpA6Uw4qcpFwC0NO+
	 Qd+MguwDTW8PLznyqXlZKjUO3wTXFaZjWXqHThLNOC+1h2kg7KyKA76KWfgHpa1vZa
	 AAHyWxy1mLsVob6lMPjInBaIarOditi64w63T0yENhrTRmxjW0qZgvj/YHcGBexZ0n
	 IabUplIYdGOZPkUY7RM0j4klzy91ov/RSobm2wRqcvq5cDqzfETvf+XlknuhT60rp6
	 I74mVI0oK+IWw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c9eca5bbaeso11564851fa.3;
        Thu, 07 Dec 2023 08:04:05 -0800 (PST)
X-Gm-Message-State: AOJu0YzmIqkHd9QHuFHsQfoj2HTDWCoSMBmzfbxMS9hDEwe09pSswAbG
	wZ3rlKK83yvPgFaV+ICAeF6oAZsDxHbb1RQKWw==
X-Google-Smtp-Source: AGHT+IF1cG0pFemXauUHVxHSNj9qWubes+vp4DakrHk/R1risj9jDhlo+9GulMhEdM2kdfcyW16MHWWxKi/zTK9166I=
X-Received: by 2002:a05:651c:1030:b0:2ca:bcb:e798 with SMTP id
 w16-20020a05651c103000b002ca0bcbe798mr849220ljm.157.1701965043173; Thu, 07
 Dec 2023 08:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
 <20230412064635.41315-3-yang.lee@linux.alibaba.com> <de13cb5f-abf2-86b3-d2e0-2b1131cd8dfa@baylibre.com>
In-Reply-To: <de13cb5f-abf2-86b3-d2e0-2b1131cd8dfa@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 8 Dec 2023 00:03:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-cO3P2GnMPK68GSRJKe8jguCK-cWENiu-3mXaRaHwmMA@mail.gmail.com>
Message-ID: <CAAOTY_-cO3P2GnMPK68GSRJKe8jguCK-cWENiu-3mXaRaHwmMA@mail.gmail.com>
Subject: Re: [PATCH -next 3/3] drm/mediatek: Use devm_platform_ioremap_resource()
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com, daniel@ffwll.ch, 
	matthias.bgg@gmail.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_080407_508421_C107CD1C 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

Hi, Yang:

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B44=E6=9C=88=
12=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:49=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On 12/04/2023 08:46, Yang Li wrote:
> > Remove variable 'res' and convert platform_get_resource(),
> > devm_ioremap_resource() to a single call to
> > devm_platform_ioremap_resource(), as this is exactly what this function
> > does.
> >
> > Signed-off-by: Yang Li<yang.lee@linux.alibaba.com>
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

> --
> Regards,
> Alexandre
>

