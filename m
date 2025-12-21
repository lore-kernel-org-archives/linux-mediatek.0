Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4627E6748B
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Dec 2025 00:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8G9KmswsznvRwWx5QwQoiucqBCNKeB6cJ130wl/F5s=; b=QMVzHMi5dMWh+MS4rjPtgRdXlg
	HJU0rGBBzTHNS33RKEqJMW2UJEhUoWb/Ls3pdrKvFBPA7L51YIm517k03NNuwc0jJRrqgMPS5KPNq
	loKJoHmwACcVuLPq1swmLuQoTwo4cU4Uxcmf0pOUVaSHgB0TD3xLKrWTE7cb9VKmbZ7spmxyNIzW+
	MTu4mx04qubZmmJ/kb7SCJjWJ2kj/u+jxJx7gSJwmf6CvqCC9nMWjxrU4Yi5NseMroltP/vMEP9+J
	cmU6sjZLP7Nemeb7CgOz9/tnM1s9125yCmBEa+oWKnjdJIPD4Z+eLPVcok4/NT0QD0XOiWijpCumj
	1zYz9ubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX7OI-0000000C10n-3hpF;
	Sun, 21 Dec 2025 00:33:42 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX7OF-0000000C10C-1wvM
	for linux-mediatek@lists.infradead.org;
	Sun, 21 Dec 2025 00:33:41 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6467bed0d2fso262798d50.0
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Dec 2025 16:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766277218; x=1766882018; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8G9KmswsznvRwWx5QwQoiucqBCNKeB6cJ130wl/F5s=;
        b=bA2eOykOorCxr2tA/KP+rxkKKvQd56V5lM7FZ9aHdqboDmHZjhrEJvnajbeFEfe1w8
         nkBGCjk84CMBJS40/q7scyJ2EzMaALSZmlGLsiO1fuH2mS40n3xAIcuzkGBtHKMS9CQN
         IHO0PZozK73scW0SSJtOfyNUqmnMxQOZmeONsmXLN+Cfkb/NPlWbmPDVtum6Enxc+H0i
         7fFKCpXT61E8QCsQsOI9SDdVTPfaz74hPfdBZLDr0grmWMZmVxLtEs+CWi5DFiOSW/Rf
         Km8bMbWWy/jrHi1jV8IACWEE9e/YFriRthPKlmsgrx3U4ROEdeShVo3rF+roKBwa14GG
         bRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766277218; x=1766882018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X8G9KmswsznvRwWx5QwQoiucqBCNKeB6cJ130wl/F5s=;
        b=Ib1sti4gwoDupExjinRcJ7j56WsaDiaALaZ6RsRJxTzbH55jEKxbhq8Y2TlLjOAHAR
         FHnr9DoNVZ5clOdsTnsBcN3VEldixma2f98E9bJY3D14+9i5lZ3NgHtKvZ5j1vMdnh5g
         HasJYrGe7ICSoOj8zH2OqpCd+dG6/g+sGGX028r2tnE63bPEps54s9jM186BZLRopweb
         bf7U6lzmiXAEW6JzBvUThI2ZZ1tC984lMAzUwjTa4ejfpBPAWMaxzLnShk40xpJisxeo
         THn2as1KIgxRbDma5PNPFDr50BQi94ZATp2RXdjlV4ymugaT3kv+QbZuL5XnsgaULSbQ
         R3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWyAjmsv5eXQvt3HokrtmHDlSEnLrJ5tZFFjxcQrtx/29UffCGkje1bQHcrvCab9wz2DOMGnVfNTU8SB4EEdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxKthiGfppJS2IdbixlIlNbS31hcTZE0NbTzMDBmMRuGZerzQF
	NFfK+LilARNsUHGZCQmrBTUFkw3E3d1clcqoqe0AIvbBtLaaHp65t0h4XyGedR9bPisQRPXUzos
	achOqvWV9XAnMg+ukXlXuXkEcJAM56ro=
X-Gm-Gg: AY/fxX74X603ZQRT+Q15rgt1zzApI0CM621kcOIICs9jjqBBcCbY2tqrNYHjS0acgJn
	SsZw6Qfmj7sU/rVsIjXxm8yKwSxzLKsYGnOyTEffR5tzsuCN0vSh6yonG/DYNKHxmX0wef86Vqi
	Wl1fXWiTUDkW1vc6NECCB7svJBXyhw2uuMspWJG+rzT9rjIklWBZcUucJuigPABcjreVm7NHrYv
	FMM8E37Ow0kB+jufKklRBCMRsyM1pG5Qt/KvBcafIg7MPYlaDAsHTSh3G1903txGadJrC6EiuGn
	9d3LNRPasSjRfFGNTXEsfxKjM2pj
X-Google-Smtp-Source: AGHT+IF+DcP7RBnj1eO65Ay4KAdaw9prgtbEqd38CqDRILia9eh90RWgdc07UopBt80TakLnfpkNrhhTAdF11Rmi1Ew=
X-Received: by 2002:a53:b08c:0:b0:644:6422:cb2 with SMTP id
 956f58d0204a3-6466a8c09ddmr4928743d50.47.1766277218122; Sat, 20 Dec 2025
 16:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
In-Reply-To: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sat, 20 Dec 2025 16:33:26 -0800
X-Gm-Features: AQt7F2pQeCDszCkhBlVBNoYZ8W1xv30ESuUDKy-HkDBic1PvCA7PvceQ4heu6Pg
Message-ID: <CAPaKu7QST65NPQ7rZAGhqLsb4FN21D-rOvUf-UzgsBCrOv1skA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Make MT8196 get its Mali GPU shader_present from nvmem
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_163339_535468_4CA719C8 
X-CRM114-Status: GOOD (  24.99  )
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

On Sat, Dec 20, 2025 at 10:50=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The MediaTek MT8196 SoC's Mali SHADER_PRESENT register does not list
> only functional shader cores, but also those that are fused off to
> improve yield.
>
> The SHADER_PRESENT bitmask with the one fused off core omitted is to be
> found in an efuse. However, the efuse address is considered
> confidential, and is not public knowledge.
>
> The MT8196 GPUEB MCU, which does the power management for the Mali GPU
> on this SoC, knows and reads the efuse however, and exposes it in the
> shared memory intended to communicate state to the application
> processor. Reading the bitmask from this shared memory area is the
> vendor's intended solution.
>
> This series models this in the binding and implements it in the
> corresponding Linux drivers:
> - the mali-valhall-csf binding gets an nvmem-cells/nvmem-cell-names
>   property to declare that shader-present is in a different castle
> - the mt8196-gpufreq binding requires nodes to expose the shader-present
>   cell
> - panthor checks for the presence of the shader-present cell and uses it
>   as the shader-present value if it's found, instead of the Mali GPU
>   register contents
> - mtk-mfg-pmdomain becomes an nvmem provider and will happily serve
>   queries for the shader-present cell
>
> While it would be preferable if we could read the efuse directly, it's
> not possible as things stand, and insisting on it will just keep this
> hardware from working in mainline. Running a GPU workload with a
> SHADER_PRESENT bitmask that includes a faulty core results in corrupt
> GPU rendering output.
>
> Modelling the mt8196-gpufreq device as a nvmem-cell provider however is
> not lying about the hardware's capabilities, as it truly does provide
> access to the nvmem-cell, even if it acts as a proxy.
>
> From a bindings and panthor perspective, this is also generic enough to
> where hypothetical other vendors doing the same thing (even with direct
> efuse access) can rely on the same cell name and implementation.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Series is Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
> Changes in v2:
> - panthor: move to nvmem_cell_read_variable_le_u64
> - mtk-mfg-pmdomain: put of_node in error path
> - mtk-mfg-pmdomain: remove leftover stray of_node_put on NULL
> - Link to v1: https://lore.kernel.org/r/20251217-mt8196-shader-present-v1=
-0-f6f8f3aa1e93@collabora.com
>
> ---
> Nicolas Frattaroli (4):
>       dt-bindings: gpu: mali-valhall-csf: Add shader-present nvmem cell
>       dt-bindings: power: mt8196-gpufreq: Describe nvmem provider ability
>       drm/panthor: Implement reading shader_present from nvmem
>       pmdomain: mediatek: mtk-mfg: Expose shader_present as nvmem cell
>
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 14 +++++
>  .../bindings/power/mediatek,mt8196-gpufreq.yaml    | 13 +++++
>  drivers/gpu/drm/panthor/panthor_hw.c               | 36 ++++++++++---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       | 59 ++++++++++++++++=
++++++
>  4 files changed, 116 insertions(+), 6 deletions(-)
> ---
> base-commit: 638148c6ffa31d2e4958d51708ff3675221e2da7
> change-id: 20251217-mt8196-shader-present-e2dc3f97fc74
>
> Best regards,
> --
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>

