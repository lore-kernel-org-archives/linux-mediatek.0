Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E551606A31D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2026 12:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=08xbdCkU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTLPdmUs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=; b=08xbdCkU1j10X0
	s8hGFIE2JRG+OgOQUNnBLJqJRz1NlteiDumLMADP2TAF0lQGoBIuInnyQssGmVXfPQW2HFchJhAC7
	2NS33y2mVdOv5Vp9G3YBOGUBuq4IisTqQRSDUhvTicmFyS85UZzypRjJQ+2H+lqywhJpCsxarZIHi
	CBL78MSslXdJaO6Pep4D/6MrSITIJeISS8UvpWsKBh2LmzD7dXT4OYrxn/2BLwRPRezU8ncpZwk0q
	8Kay/ZfmI5zaJiSwbLqmcAGvwq5FVkMezKd4WRuLA3L9SamLvTDNrI7qrzUP0WYHzFn15uo1BoVE9
	kdd3SgOLveVYhGch5+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMP0z-000000097xy-2jjC;
	Thu, 29 Oct 2026 12:13:53 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMP0w-000000097wE-0my0
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Oct 2026 12:13:52 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5be47aa555cso2385609e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Oct 2026 05:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276027; cv=none;
        d=google.com; s=arc-20260327;
        b=D6Dhc5F2z6gNN9TQV4EGdqniGDFbEfYDoP8AfDr7hBrGR+Ai8IpKgLAmz3N9lDFwlX
         LxUO7CDyqL9RutJEPotkY3digzGmpUG5457XwmBkjLsZWQs905tbfTqXfn8ZSZI+/d+f
         zLBlFoHeqy+WffvloU+QMPxZZHvCOHzGTkvW/cX1LLJMTrcoaOak7Emlg3rT7pzThGPj
         gg4U8AnhASUhAiDX5y4rbPt7byKi5IQCzYjgxhkRxT5X1vnWV7fJZOI25epaMtFk8Zez
         ppZZd/2ya4AeZzpeVu9mCs13qsUIF+tDIqQFD5J+rcLpIwr157BevPAGXdlQlnALgc4x
         QC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        fh=Tn3HGofIdNy2mk+3beJ5gT20OqpbtSvklj4+Fxm8zO4=;
        b=m39kRqQhmAYPmd0TbFzqHVlKEym8/oOM8A001W1fbR8AF4wOYNsvBMvULrUi0hhvcO
         5XvEQlHwwg/+I4F6Uwy0CrOaMaOH02XGDSkvhcE+gp6hujeFR/OjVttyAR1CNPiXtrMV
         TOkwbtVOHZQmeeLbWW2fsw8Uef1EN9y6lONjma3KdElaC8fHUPQq59Ua0MCsh/Ao0dE0
         PxReNE+5XXyxAeFQkBXRx4HxJfmITOjWE9ORMUJg7JJiR5Zc9yGlKJs4yUS6czXJGhrg
         HMFkgSyS2Pyb7xFuH1NKRldugbmH58uh0PplXeDcN+KTRHDu27ErzqAfFScsHhgz61+3
         pwbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793276027; x=1793880827; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=JTLPdmUs5eVdtSSrKrnfdQDr+8m+s31sNFBqp5Q07ScQa3hSzx2gyIz8z1Aqm9lRCk
         x98oiS71iJ5iR8rkWtitkXjRxKSXiq6trgtPo3LLGUK4YhvL84U5F2hOUWaRUjFNa3nh
         +hbmllypF+uvYHm5wSTKUQYvaOBqXiXzEDfzhIto9xBNkp15GnfGR8fiUH5yTB9R0vxa
         Gqk0aTF/DojiA9O0Hqmj+BInBDlWM7BFiO+tPgGgOMo/g2DTKrcUfkuhyMUAnu5NXXMU
         c+oqYstncuTlfAX9Qr9+/IBHYn8+eeCtrj9toDTo6UyTRhjQgaZrSBfIgJPgSK2QjRF4
         yHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276027; x=1793880827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=q5ZSz8dhqq3r26ZUYKnfpnxVMtjk5FrFQCkXauqepitCWIN3cZbv72zgJXROZ8rY5X
         5j4m9sxHboNczXwvRr3kgavXbzdalIs62iJoXHU1/D6I4mdMG/vsCC9eeaoOGgUZzNO8
         yemGv3tZOJ7ZmN8aczhjhCFYuCRaEZBEL9rLn8I0VFIx5Is0yzdJNWz/juotS5no2gML
         Yrqn935WgwWsoHclJZY0ZenV2flYqU1fvZoW0LuPiTLjKWf9rpQAbW2pUSg9wp9qbdGJ
         9rgxbPXYT7q3rIgS9rtxYY5+RcN8aM8cXQKPonCzn4VL3Uwr/PID8jyCFciOKsRY/JO0
         BPaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzT/BIm4v9PC5XAJNE8kC0ZXCbMFBDgyjT/TmR1GUSxAFzNTzEk8nf3t9QD4D/AF+YKWjFBjYmd8TUwddrPIA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ12Zix8gjXQm68jG7lPi15FI+Gg7jXVJMk6AP9gbGLXJet7gLD
	usvtLNflR5PBbzBkZ5U4TB6Ls3JuyITPjrpJ/PwQSw63pugbi65E6dp6dOeQjqTKBKPUzhBGsin
	O6QF8aLgmBIO50Uw8aVGM9DdQVxPFfCIDQHyr+RSIqg==
X-Gm-Gg: AYBFou2g/NxhYLZZ7dNxYeVFuzYGxJgBfzWlbsXeuYObO6NhnJoz4LXuq5iBhlQy6HB
	mfVcUHogK2oWaqob5pXUaViaIFc7WhQA6COEWCZW/K4ICwoGBciM+zJ0Vw/V05gJ/VuLCqBKn/G
	wB599h8zmOk0/m5YosdKsGG4IQOhx7oy7HbQ5tQJEUavOcx4rlQL8wewVTVCcTvk2Z2H5m5w62v
	SSWixHAb3C6FxIUxUS6FC7mMCav74hyC79obnCePrmpiO0aMS2SIIMONTQxli+dIkvw7oSzAa82
	T0u8G7T4wlTzEM8yhUz9LOTq36ZjWRBUM3FVPZZ5WGDU90EiPRY+i0D+lgQOu1XvE3f1T1KjXYH
	a+5oNodQs9q0hVa5Lo9FEDjfjOkopXj7s5b9m5mU8fhP7D55ODWYUtCZoQM6+iUTMEzU2eoUchP
	4ixE3f7/BoVy6r5sCD1fog88M=
X-Received: by 2002:a05:6512:3d86:b0:5bf:b5a1:3c09 with SMTP id
 2adb3069b0e04-5bfcaddbde4mr1985707e87.31.1793276026925; Thu, 29 Oct 2026
 05:13:46 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 29 Oct 2026 20:13:08 +0800
X-Gm-Features: AclHuK_9NKjNXktxauulycDv6ofwBJPad2Bl9GVrdKZysKXzXdts0yEdkZdQ85I
Message-ID: <CAJhJPsVQjajTzOwXyqUkdTT+Cw8wEX7-0NOS63S9cByvDSYLng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Andy Shevchenko <andy@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, 
	=?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_051350_248944_96A905D3 
X-CRM114-Status: GOOD (  10.31  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 2:43=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Several virt-dma drivers implement device_synchronize with a wrapper that
> only converts the DMA channel and calls vchan_synchronize(). Provide
> vchan_dma_synchronize() with the DMAengine callback signature so these
> drivers can assign it directly.
>
> Document the requirement to stop the channel and prevent new callbacks
> before synchronization, and the context in which the callback wait may
> run. Replace the equivalent wrappers in the existing drivers with the
> shared helper, preserving their callback-wait and descriptor-cleanup
> behavior.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ...
>  drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com> # loongson1, virt-dma

--=20
Best regards,

Keguang Zhang

