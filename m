Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCAB606A339
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QnpcVMZR;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z4AlVUDG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=; b=QnpcVMZRKrTnaI
	+RatrF5tutc7KD4bE7rKvijxqGeZKaXrZpqETrJX6VvxLmCbujvB+oWq0qccTejCMH00dHLejtkdp
	lvlMDAKj9po2LfiUloaB/1jqEtvZGvHIOSU6ojkAJZrtUF2AXwsOUufkOFGXY89uWOc3KvVXcOV5s
	bMi4CfDIxaUywrRA3XTcBHBBSsL8slrlupKJeuv0tzSAAtEZUOi+hNjNEu/ebDZQrfqM4/oZ/ImyT
	hfw5uKKS+DoVPhN3K329T9E1VcYePKPyTaIfa0AS63XJ6fdPSU4k6CGSHa6HpAq1gQAgV6bEM4/Es
	BVJF9iMAtqvezAOdjXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWI0-0000000CgpJ-2pZV;
	Thu, 26 Nov 2026 10:01:16 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWHx-0000000CgoA-2Ywe
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 10:01:14 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cde1479f76fso3772104a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 02:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795687272; x=1796292072; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=;
        b=Z4AlVUDGQ8tZbHlLKUhOBncfI5YWkBb9rkSs99wtbhrwg+jaPGCaqYIIGwQllWL+L1
         DimJ87fqcabAtt/De11oM+uQDL/x38g5oJYCVmpBFhbiKokBVy3r423exr0D16lOb+BU
         Rm774UIeeLWFN1ibTZd95Q/tRN++Le8Wo4xJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687272; x=1796292072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=;
        b=zhvi0+mp2Sa8hF59EdxZ1c4IUysFG4dz+xiWfNImPGH3NnzzTlRHnezLAAFP3pN6I1
         5S1yYP1NAqyJ1GHrQ3pbNC3w7krH5FNOSKdWSOF7xXPfaqBVm4bUjofuogr1ik9oUNvF
         a4vDodpzwvvqqqh2LKMnL4UKiTYqHjQ97c37D6XkhGvutn8r7KPvhhLSkO5yUgFY+BSj
         dLmskRVLnknVhFFJvQoOBJIZqxBOS1uOkmcS5R4co6brdqzNcxWQtHNe6joGLFrCvmQy
         voRx2NWzx/AUCLuobAIto4ykvyNL/2wktk7JwMpq8CJyMgt+pY7PQN4uuiYZkjzyTn7p
         U1KA==
X-Forwarded-Encrypted: i=1; AL+hErHquGfI28BCcoBlTX9pVnNNtzaCofxtZvewAzCxne5hJq+rFFBgamENMMvIMv6f1NlRqnqR3ltASsxGXPtivQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/b7FHxCHT4vI8twZ7HcTGLxdBYZ1m6TSDYxYG+GZm3Cx4XvrKM
	dERmnEnNUvP99dUVD3+SxLAty8Ufb6Sj2WO1bqkIz7jRZxZ1KnrVegtO1nkx7rZ9n7mrzxvlrt5
	gxecepg==
X-Gm-Gg: AZFdTZcviCxCjlPf/MAupSRGtVoPptYqPENmxABQge/8+BIUt9hbr3dcg/hD9rCoGxj
	72K7yg9TE2F3t5/ycjRdC57GCRAW3uiBNYKt/F0oheeXfSxf099qg6FfN33aCCYTyNT2zovLTAO
	W2WJJYqHtucBkra3bK/ze4Pow1LRU+OJaHzCOFxCkKXrBcaUs57jjHckv/8THNYcAVK3Dy9WAYH
	r958VJbLxEAaKK3UvBKSHNlp0TjRyfYbxJADVi2vo93R0cefxoCH0G/gBxEGdbCz5BNNVta+Gps
	DyfExRiFmDmYVs6n0UgDUTwKxAd51gGiBIeL+s8qOBJsXcdThPMyGtc5lbNkNyGapMOK4qrbvWB
	zUWO4Ay91lG/zSDL2LqPw5xXC01VAbpcttkVZdglfhFhaCnQNquDaGWhyexthT/VRlmJDQu28W9
	spGSvPfF2CRGZqyIFyx3IFKSKzqPWKq+2zWcEIoAj1ufQzj1wq9Zt6rgWBd2Q1gaVD47O/nsQ+w
	YfmDKEBAidBZjJtbObw5rR4RVE1z6ib3q8rrbRTDLR/D5V0LgHHkNky4bUB4PZCWMY8hpLdziC6
	1rkFrCsGfHXfYZxZTMW7QkrLQSCWb9fHYk6BsFNQxEXiKl0IkROpwigAfsPHXO/RsBc=
X-Received: by 2002:a17:90b:3c11:b0:3ac:8fff:5a1b with SMTP id 98e67ed59e1d1-3b41c905970mr19929843a91.34.1795687272338;
        Thu, 26 Nov 2026 02:01:12 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b21e19fsm12067652a91.0.2026.11.26.02.01.11
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:01:12 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so13316499eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 02:01:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGsEzF/Out8YjP0QomxNYWUwCuLVPuPdy9yjyt+mnl/P96uLavLF0UiSrh/yLkdwudGDilaKhCbvTtaxGLRBw==@lists.infradead.org
X-Received: by 2002:a05:7300:e9cf:10b0:386:e571:4bb4 with SMTP id
 5a478bee46e88-386e5715040mr399450eec.13.1795687269562; Thu, 26 Nov 2026
 02:01:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-36-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 18:00:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj8rJ0WJp7DcO68zyejSvzFhhB5Q_q+_jKY2itMAJ64eA@mail.gmail.com>
X-Gm-Features: Aa3M54r8mZgCPYkjyk_HhGWN4kbWoWQVSbV0f4Pj7KzdyzjM_U47c8LDiim4nPQ
Message-ID: <CAC=S1nj8rJ0WJp7DcO68zyejSvzFhhB5Q_q+_jKY2itMAJ64eA@mail.gmail.com>
Subject: Re: [PATCH v2 35/46] drm/mediatek: Add support for Display Output
 Processor component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_020113_683488_CE9B4B16 
X-CRM114-Status: GOOD (  14.17  )
X-Spam-Score: -2.1 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Jul 14, 2026 at 7:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add support for the Display Output Processor hardware component,
> found in the MediaTek Kompanio Ultra MT8196, Genio Pro 5100 MT8894,
> Dimensity 9400 MT6991 and others.
>
> This hardware handles the post-stage of pixel processing in the
> layer overlaying process and is also capable of performing gamma
> correction, ensuring that the per-pixel values are within the
> expected gamma range.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c     |  14 ++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
>  drivers/gpu/drm/mediatek/mtk_disp_outproc.c | 247 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h      |   1 +
>  7 files changed, 281 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
>
[snip]
> +       priv->irq =3D platform_get_irq_optional(pdev, 0);
> +       if (priv->irq > 0) {
> +               ret =3D devm_request_irq(dev, priv->irq, mtk_outproc_irq_=
handler,
> +                                      IRQF_NO_AUTOEN, dev_name(dev), pri=
v);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "Failed to request=
 irq\n");
> +       }

platform_get_irq_optional() can return error codes that need to be
handled; otherwise, mtk_outproc_bind()/unbind() will pass the negative
values to enable_irq()/disable_irq():

ret =3D platform_get_irq_optional(pdev, 0);
if (ret < 0 && ret !=3D -ENXIO)
    return dev_err_probe(dev, ret, "Failed to get irq\n");
if (ret > 0) {
    priv->irq =3D ret;
    ret =3D devm_request_irq(dev, priv->irq, ...);
    ...
}

Regards,
Fei

