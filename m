Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E83CA0EDC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGbsuPE+0ODe6PuJ1PHV7gxJ5+99ZGIndY0/S7JkxJw=; b=1LH97h9lTAQ1D2saZXRAlX0HV4
	m/GBvRGr0z8xylroWOsYvR3z/WPiZ5Tvy6Zx01T5krKw7UKFeijmJDPYdWybqgi2/7nuXZFQGqsGv
	Jfu0ikjDwyNjFaZ99v7Orq6R2j225IUEzxAiYiWql/ByjTg92UGrzMRArxvxWpJd+XXU5tglht5ty
	g1rOOAsYdrWTt7jWw5NzKPgG58Ebdj6G8w+shm38yk5Tb13jEtzw29qriXb2SdkhLFAvXk2OSUWP8
	4mZWQ4pOnAcy7+SEqyLnL6UzWL/uUsLXwpHsW/7ve5tTtrEMw7q2cTjv+SvksAzf5sk3JZT5Yld30
	6tSZt23Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoh4Y-0000000DQH5-0Hgo;
	Wed, 20 Aug 2025 11:33:42 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogCE-0000000DC2y-3Xf4
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Aug 2025 10:37:36 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-53b1717c562so4302398e0c.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Aug 2025 03:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755686253; x=1756291053; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGbsuPE+0ODe6PuJ1PHV7gxJ5+99ZGIndY0/S7JkxJw=;
        b=eUNxXzIm6urUf2cQ6ei9fMg1eafY5Mx2JSwNBQaS3te9FiUVZ0hYO1F+KpiiyUlIHX
         FkvfX4uqUPCp3zKoRcFlPggb3MoaBQlXeEuRtsbeJxJg/O+uoZOGC+r6JCQ6zFTj5p2c
         aeWJfSeITuwmyJTMtqLWqhTs8cAXTYdzHbMBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755686253; x=1756291053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGbsuPE+0ODe6PuJ1PHV7gxJ5+99ZGIndY0/S7JkxJw=;
        b=E2nVT3Q0EU/dSXyZNVK8PX0oln7ee5kClr7XKkdap4GywyQiTtM1KN/Y+EkmRl6Ca6
         5nrt1bsl86dJX14p06AaVLgaMrTQgiQwM/UeL/hQ3LkBLCF+5zD1TArCCtKwWWJDtjPE
         6Xi/lbE29PkUbT0QaqtntdixYZOr3euVY9Y3YJnEJ9lQArPm5wdzhBB0H0oIMTrr56w1
         u3IfMcOJL4Ie2eKdqiUuQPTQ+gNSzBIjaQ5siRnzxQVF0sgQK3vWXUaofkFRemm1lSe0
         /PY0Y5Wl6Zir7d0bfehL2c241wgUQZ2duJyfXYdo5FHzBbV/NDnrN3CpLvm117i4oAW6
         iMsA==
X-Forwarded-Encrypted: i=1; AJvYcCXmye2f6EtRq35KCtqt1mc5ZxR62LgpasU3qHDbOeNUTPsMUGYdrXLwYu4klgP8sClyFxsem8uJgqZGiaOLqA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw9Ca+8qLwilEFiHRarfC+nDIcp3cyxJuVli+xjzWICoWjeaQ+
	mCTYFYkZs28m7r0tBlm5nubcDznLBvgoJSops2Zzbw4Ysg9IxEH6h+96zT2vp1t/7KetfXjZz8k
	ucOI=
X-Gm-Gg: ASbGncvfOjzM6Tz9IWi7ypoPEPiDK+SiLT/59Oz37UJRJYU/AkF2VJcRWIoUvCiUC3n
	6y6jS8zwfVKFfaMsAkF0DMnKRVIVsmUET8a9B84yMZK9nugF/UuZo7zTzV8+O8ceXOd3vw3yjH4
	SXGiTz37NZso9QkAI5yO3mgrDaZ4l99GwiDIHydBN0B+JrOhdzEZuHkvQ8JmaO6n9NeAQWJFFoi
	uR7rz6PRMf4Q4s2Xry/bNutqpaQh8PXRykN3oAyG9QGiBkY3MUD2xoLvgVAfVdlSvirQ5u4egOm
	bmU/XFoH/BTdTHz1eJonr/HT/Dx9sWwYxOiUHSkgeQXi0kts9BWOLquV00VHmKztGnKMAFAI30s
	2EzQQ2hopGC2DVtzOzZhBqgrHKp6WM60jU13djTwLAZ4a32vMgBeVoDh22b9sTCaayVVB
X-Google-Smtp-Source: AGHT+IFh5dm6k2934Xrb+CLPG3QED5FPDancld3P+6/9R0j9PjXUdenK9CFqlfzohZxV0igaXhORVQ==
X-Received: by 2002:a05:6122:e50:b0:53c:6d68:1d32 with SMTP id 71dfb90a1353d-53c6d68267emr619257e0c.16.1755686253073;
        Wed, 20 Aug 2025 03:37:33 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bf05c9csm3093845e0c.28.2025.08.20.03.37.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 03:37:32 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-890191551b5so3793939241.3
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Aug 2025 03:37:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfKv/9BOFdBrX53uMiyl50MRBqx1qpNg9NWHIyoE3S+YzgjDnPM2UotlqFUrFKwdNqT85EFAYkooHUZi2z6A==@lists.infradead.org
X-Received: by 2002:a05:6102:d8a:b0:4ec:c513:f3d with SMTP id
 ada2fe7eead31-51a519bb1b2mr649649137.25.1755686251925; Wed, 20 Aug 2025
 03:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250820075405.1041838-1-wenst@chromium.org>
In-Reply-To: <20250820075405.1041838-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 20 Aug 2025 18:36:55 +0800
X-Gmail-Original-Message-ID: <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
X-Gm-Features: Ac12FXxxuLvE-_OGknatHaznIwKXRs2-9K8o-wweiJyigK7q1-hAihk8TkEg5BU
Message-ID: <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_033734_908430_623203C4 
X-CRM114-Status: GOOD (  16.78  )
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

On Wed, Aug 20, 2025 at 3:54=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Previously a mutex was added to protect the encoder and decoder context
> lists from unexpected changes originating from the SCP IP block, causing
> the context pointer to go invalid, resulting in a NULL pointer
> dereference in the IPI handler.
>
> Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> context. This causes a big warning from the scheduler. This was first
> reported downstream on the ChromeOS kernels, but is also reproducible
> on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even though
> the actual capture format is not supported, the affected code paths
> are triggered.
>
> Since this lock just protects the context list and operations on it are
> very fast, it should be OK to switch to a spinlock.
>
> Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect dec=
oder context list")
> Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect enc=
oder context list")
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Switched to _irqsave / _irqrestore variants even in helper only called
>   by IRQ handler (Tomasz)
>
>  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-----
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
>  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  5 +++--
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-----
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
>  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  5 +++--
>  7 files changed, 28 insertions(+), 20 deletions(-)

Reviewed-by: Fei Shao <fshao@chromium.org>

