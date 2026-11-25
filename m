Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A23606A334
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 18:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T1k/Q8hw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iy5eNDXe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I1kqIhwTQbIYkIwvzTT4amDSc4WG19rX5HvViezhfOs=; b=T1k/Q8hw7vuJWs
	If3tGGcY28Ysge57V7QmV34dxTtCOAT6V2DBSLPwfmnoiMu74p1jbRUlKwocX0U1PuX33Xj2FX1GB
	8/thFLyzWeGVNRV4aNzUvrImI+6KzRdbxLaIT9rCiPgjilp/04sDXd2Kj0kjInE27l9AokfeVft9k
	VCwDPZcchNqc+AOqD9ViMaZIBVcKVSL79z/aN2QZuqJ2krKmcL+VGW57aSyfC5iAUvJAPBqKrlAPo
	bOWw9IqheJimD9XYng0eTE30k1AR1E0Gzipbde7Fv20JotmMnYeojzipE0XYx3R2DENJ6RiADbuZq
	BpNktB18CLDqAVwhdDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHrI-0000000B1hL-00bv;
	Wed, 25 Nov 2026 18:36:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHrH-0000000B1h0-08mx
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 18:36:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8CB74647B
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 18:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505A51F0093E
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 18:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631802;
	bh=I1kqIhwTQbIYkIwvzTT4amDSc4WG19rX5HvViezhfOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iy5eNDXeajlfmYBUi3HVw+ZOUGhwAcS9hIiWwHa7pO/9JaOtuWpfYI/RLwVEFP+he
	 MsCg3O26VBHd/+Y0Sklk7Ge1L5580uROT71jaRSCDeXEgdGg6S+iO+ht2n8b+ATsG1
	 DT6lbqyVjrFBOoKjwEFfDrUxkVgMpJAyHqCWTfNPCWLy2voxOxy8wG+BTMilO9QyjF
	 oO3fltQ8TrI0PeHEl5mTbGB+xETSqFWYD89ZpwHqaa2/TCLonSH0z4/M/LVWl14tHc
	 2Q7yobtKPVNFJWfgdtBP1G5tbQlXVgiXLfhVm4gtKkXX5rthE91pHEZamYLxadoSA3
	 TD1odtsGC4Org==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3adfc004920so58710731fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 10:36:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEyGl2m5C8YsdwXUgWF/zm3yqBOY/gJ50VGiKvUaSf+dAGIqLKyxvqD4uN3uq5i4lSZ6Ku997jOW1YoOf691w==@lists.infradead.org
X-Gm-Message-State: APuU4Z9pH2itY7AyhzX0/qIbxIS0/LeSxFSzTThjVH+fxGJbnm07R7Wn
	iBusXF+iYFE/Mucd+T9dXQLJKC0RFLTcPS52OldWjCz1bd432jPaY7e+pR9OckZM9ByvjzR3ld6
	Je2ilZiQpxJ4hBykiv9zdMNmA6EtMEVE=
X-Received: by 2002:ac2:4c49:0:b0:5c1:6ed3:db66 with SMTP id
 2adb3069b0e04-5c1bc812fa8mr6445916e87.46.1795631801074; Wed, 25 Nov 2026
 10:36:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-1-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:36:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLktj_m6SzohDWE-1P2fktYy50Kq_V83gyAwvu4oHWuo0Q@mail.gmail.com>
X-Gm-Features: Aa3M54qAGgBABpC37EY4s-xGOSAZePImEjc0mtba_-nxodKr3zcHaitgsE_JuYQ
Message-ID: <CAD++jLktj_m6SzohDWE-1P2fktYy50Kq_V83gyAwvu4oHWuo0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] pinctrl: Fix out-of-bounds accesses,
 divide-by-zero, and error handling
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Aaron Kling <webgeek1234@gmail.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Bartosz Golaszewski <brgl@kernel.org>, Daniel Golle <daniel@makrotopia.org>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Maoguang Meng <maoguang.meng@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, 
	Olivier Louvignes <olivier@mgcrea.io>, Paul Boddie <paul@boddie.org.uk>, 
	Paul Cercueil <paul@crapouillou.net>, Qingliang Li <qingliang.li@mediatek.com>, 
	Rob Herring <robh@kernel.org>, "Ryder.Lee" <ryder.lee@mediatek.com>, 
	Sam Shih <sam.shih@mediatek.com>, Sean Wang <sean.wang@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Thierry Reding <treding@nvidia.com>, 
	zhouyanjie@wanyeetech.com
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 9:47=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> These issues were reported by Sashiko.
>
> v1 =3D> v2:
>  - Drop patches 05/10, 06/10, 07/10, and 10/10, already applied to pinctr=
l
>    for-next
>  - Drop patch 01/10 (sunxi) in favour of the broader Allwinner IRQ-bank
>    rework in flight (Andre, Sashiko)
>  - mediatek: Guard against NULL eint in mtk_eint_do_suspend() and
>    mtk_eint_do_resume() before resetting hw->eint to NULL on error (Sashi=
ko)

All the v2 patches applied (for v7.5), nice work!

Yours,
Linus Walleij

