Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A592C87FCE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 12:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=; b=ZEgXoITkQjW0pT5uhXgyY4ixzt
	dIR/pvhtgUok/9vlZ40gHhkFWvjke7LOAqnezi04UxDMyhnaq1fSj7m3bhRI4uh/VNQ6WCk4RcQv/
	kCV1RxiLFdkIRZB0QCWkbq95NSVlMJdp0gK5qICd7gQkIU97YQNWifZ7pGNV69hupfkL7enah+SIh
	Wjc2pOTMZPefflq44yRNYQQ1L4tMyB47ncKPe42AqvtRNGaVLn+amA6gV6N9zJ9LtfvJ1dzfSHuFy
	UQ8i815UG8VFV1NIfmKHlXWvAXx2Sclvcxu8mYRBKz3++1nERuG3QrShq2tRku5V4q6K05TzjADRp
	1xgAn13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHL1-00000009nSz-1jxD;
	Fri, 25 Jul 2025 12:15:47 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGvj-00000009kqQ-2gfS
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 11:49:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23dc5bcf49eso26316125ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 04:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444179; x=1754048979; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
        b=eavYPbaYfaQ2HIEUjIc3aL2zS9es2axEk9aY0zx23GNTaGE1ItByF0c0405NK9PNl2
         sUk99eC1or3HcfFbki/YyZmBDlf9LQGmUdMx1LLqMuVtZmVYxaBeDm3ZITp92YPeqgO/
         FaQIjMPVZEk1aVAnUDLVUna2kA9/ry+CLu/pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444179; x=1754048979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
        b=oHHA134jaeTm6tsrVfQgq0Mm/fLkCTy1dvIXjHbXt2RoSIOi8nvS8Pnr6bhODXmmkM
         phYCsCIK4ghD5bjZSfnz5gPa7BQFQyVVsKc99udJXHlBfDsywBwd+99Lb81dXZ6kWCrA
         E3TAGbQ40y6fR9CLJcLOUbMSEPkZBk9GqauBnVr5nGHRk+E/clZby7dYSXYjkPiuF2FP
         E+QkXFaH+n6f5t6VVYfAGYUBFNp01lVSAf5/MXOfauSCvRmy7fhbQ7lsQISfL4PcX1fe
         yorByg+Vb7NxDBuQtaFd8vfYEat+mNrXUAgEwcewHp29zL9HQZzWdCs1EnO7QisS1zyu
         UPpQ==
X-Gm-Message-State: AOJu0YwgVy2rft+DEQy/ykyGOaAvMOD11vAqI7wyQudfTxDRBhhIkT2a
	kF3n+k/618eCWoU1N5wBk4q5MygsE9/PMvIo14LQ/In7gTvoJBEMrPQJfPFAEeADBAfygFLifLG
	XxWqMAiDX
X-Gm-Gg: ASbGncsrCAYb9qacStXuu/jwbYrT4HC1/Bi48VA4yiNlyFrkSR7htrqYWJ9dthi1lZ/
	+nBlVAtpS9dt8F5l6ryn+yaQ8c4BzFu48uYA6LwzisN9RyjZ8l29DRb4lCviOuzuljm7wsndcsJ
	vRilPMbMJBPC8/dj+8MPK72UBLVhJJhJWiLL9/MlwK6gJ9bQaWp2zldxKVU7igB+XtD+eRwZEnP
	xP9HcjnklYl87hLBZy/f5gOnFhn3ZIv1aK5bvnzsFHQjSiCPLy5eWp6DJZRkzwr3QJ5wVpBYaAJ
	svu+wK3me9xO43jTNh51X2ivNpGlJn4Qcq58lQqNMZ5xk5dTbBHFOcShmrNnR9nDGC388pthJs9
	BLh//VRLMNlTwm06E6RlT+vveva8dJRNO5j4p7+Cs3Z+SDFRRWUtLi/dOgg==
X-Google-Smtp-Source: AGHT+IGTSjUKNd8zgpW2xHCCGOALj4fE5m0pQeYoMfkJT8cHGNmfEO8R46fYklq6ClrcIfA/CwP4IQ==
X-Received: by 2002:a17:902:f745:b0:234:e3b7:5ce0 with SMTP id d9443c01a7336-23fb31b544fmr24203645ad.47.1753444178651;
        Fri, 25 Jul 2025 04:49:38 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa4785f54sm35934395ad.77.2025.07.25.04.49.38
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:49:38 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso1803646a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 04:49:38 -0700 (PDT)
X-Received: by 2002:a05:6102:3053:b0:4e6:67f6:e9af with SMTP id
 ada2fe7eead31-4fa3fa71860mr256656137.9.1753440125688; Fri, 25 Jul 2025
 03:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:41:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
X-Gm-Features: Ac12FXwspafB6XO0s33DaaDCIfXTapXC0TbPbPDsXvwxpmO6Wfy_iIb8kWhO-Rk
Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
Subject: Re: [PATCH 26/38] arm64: dts: mediatek: acelink-ew-7886cax: Remove
 unnecessary cells in spi-nand
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_044939_673079_FD809437 
X-CRM114-Status: GOOD (  14.22  )
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

On Thu, Jul 24, 2025 at 5:50=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> There is no need to specify #address-cells and #size-cells in a
> node that has only one non-addressable subnode, and this is the
> case of the flash@0 node in this devicetree, as it has only one
> "partitions" subnode.
>
> Remove those to suppress an avoid_unnecessary_addr_size warning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts =
b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> index 08b3b0827436..30805a610262 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> @@ -98,8 +98,6 @@ &spi0 {
>         flash@0 {
>                 compatible =3D "spi-nand";
>                 reg =3D <0>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <1>;
>                 spi-max-frequency =3D <52000000>;
>                 spi-rx-bus-width =3D <4>;
>                 spi-tx-bus-width =3D <4>;
> --
> 2.50.1
>
>

