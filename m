Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B759C83F2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Aug 2024 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7oF8QjA8URCOczJYNwybo3H+1gYE24ERn5aY12Z/dI=; b=vy5byxuv2+4B/p5g1OFWOyFix/
	LEZSawE6/KuH7p4YWXy27c1MjGLfHAFMPGrUHjTGpe0+rqQpOao2XdSLFCQyHxE1EcrPkrzjQ7Y63
	T2uuqSjaDPCFMthPfq8jb5uDjV6t/ErZXFuKwemBcuujKegQKjhdH+nhbxpLI0u/4oPWv0S8b9MRj
	xF+6o8U1jigHU26trGAmxHG4LgrMvZTFY0PnOcvklk05mX1/g4U+Tp1pihOvpbqN354kE0PqnPqWG
	aEwrj1Axvyi7vRjy8FrTOM0SWmldGiSV2dd6yDXX2jGOjcyo2yr87yIol4U/cmWDZmrGKVRw/xLKR
	R82ZB5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjgah-00000002Vat-3bCe;
	Thu, 29 Aug 2024 14:57:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjgZB-00000002VLd-2Mfz;
	Thu, 29 Aug 2024 14:56:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CEC3EA4411A;
	Thu, 29 Aug 2024 14:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69575C4CEC1;
	Thu, 29 Aug 2024 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943364;
	bh=Wa7GEC+jmKeo4NSPW1Bo0oimfIIbKS9WMiWx2F1YMMI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UfUr/3gGVA3aySXOeeNVdUpeDbxqN2i9g3FvtooXpWy7a9+AV2Z+AUhvZFTDtW0cj
	 ijUnF16/ekARaheHS783rlUwngZn6F2zbJ88dZobL/0wP03OCCUwgS2FcQpGCvEe/0
	 sRfEI90qWQOHfc3QeoHfbQPY7+b5zdufsBuldxJHjnLQ6EHLjnwKID9TFHo5bx2tka
	 FepC0lHnUF7xk/c810ydVnCXD7Ta9+hmc6brQ8N7JjCY1IsgTlxMyUmp6uh/5vm+es
	 3F3iS5J/aaNHYHnidDhAK7KCWRkJf8jsoLlDcu4fUeLpqNYqI/9hHjvngUCHny5Y3w
	 +eL76R5jhPR1g==
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71423273c62so596610b3a.0;
        Thu, 29 Aug 2024 07:56:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUx1W6/8TZlA8q96K+iIJQSmSHTHYxK1RAbj1O01iEHPorF7Fkez4GN5UowPihZ4X+fTVYRmZM4qEwYaCO9quY=@lists.infradead.org, AJvYcCXjWjct1sonXzDX+vSKq/7KhMDmHdw4BoqMIg6FX4SPsSm0jDeZMWoOFchK+ona+greZcaYGOEIkUwlNcgnDdq2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0mV81YFtfHtM+/IsiiS6zh+cUWj3ZMVol4B78ttZxqClfWXpJ
	syiJFUlipJHZPDgWJDP6Ryn3SV8MXof3xPAHF4Zq/MTdaNXrF32U4OQiBH9+v2mdsgBmIOnSRGS
	gIDFaYMV5Ot7PBE71WA/VcHJVug==
X-Google-Smtp-Source: AGHT+IHOHmvJGn9XBz6AncThotzVydHX29A8RmV2+ScX8Y16nl8lRqvlZcttdvPWazADk9wtRFMpp2To9vbVhRKrL9g=
X-Received: by 2002:a05:6a00:21c4:b0:70d:2583:7227 with SMTP id
 d2e1a72fcca58-715dfb6917bmr3828262b3a.6.1724943363419; Thu, 29 Aug 2024
 07:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240827-drm-fixup-0819-v3-0-4761005211ec@mediatek.com>
In-Reply-To: <20240827-drm-fixup-0819-v3-0-4761005211ec@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 29 Aug 2024 22:56:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-LX_aLLJpquJSYMu1uQ4v0nbEToVOBnV7Qr4vwBtoauA@mail.gmail.com>
Message-ID: <CAAOTY_-LX_aLLJpquJSYMu1uQ4v0nbEToVOBnV7Qr4vwBtoauA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Fix missing configuration flags in mtk_crtc_ddp_config
To: jason-jh.lin@mediatek.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	CK Hu <ck.hu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_075605_688166_4956DE6B 
X-CRM114-Status: GOOD (  12.35  )
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

Hi, Jason:

I squash this series into one patch and apply to mediatek-drm-next [1], tha=
nks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

Jason-JH.Lin via B4 Relay
<devnull+jason-jh.lin.mediatek.com@kernel.org> =E6=96=BC 2024=E5=B9=B48=E6=
=9C=8827=E6=97=A5 =E9=80=B1=E4=BA=8C
=E4=B8=8B=E5=8D=8810:56=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> Change in v3:
> Change config_lock from spin_lock to spin_lock_irqsave
>
> Change in v2:
> Add spin_lock protection for config_updating flag.
>
> ---
> Jason-JH.Lin (2):
>       drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_confi=
g()
>       drm/mediatek: change config_lock from spin_lock to spin_lock_irqsav=
e
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> ---
> base-commit: 469f1bad3c1c6e268059f78c0eec7e9552b3894c
> change-id: 20240819-drm-fixup-0819-f51e2d37fcd7
>
> Best regards,
> --
> Jason-JH.Lin <jason-jh.lin@mediatek.com>
>
>

