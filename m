Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C64C83F03
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 15:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GA0EN9gnFYPYZkAghvtePvaCSCWcIe7GtWQ7AJTlGM=; b=2O/x6UZc+sSxmUAV3nImTynVh7
	jiIgYfQKAba71aEIU35yxu+QT0v1OJWxAMx8TZ49+7gGtEL3wZT4INFo1bf56LKs/mCxSjN32ZEjQ
	q8aQWa1FZ6gDpH58stL82BG/dCBY/upZXpWjxUR5RhEcT27hhFeLfJAQTuU9G3Kf5/LaZIlT3GQXg
	2J5OQIGRuGzJtpxQNBG8oaCX6Zf7ah7vY2dH3T9TNhWs0xzB8VsPNywusH+f1JdLqLduo2UjN5afF
	gM34vbh3aPy6iBUPfdIWUh5/47VXHFmijzU44vpiH/zYt27w7wT4y6Dkbj5iTqg6PvX0a7fGbL8i5
	Sl1eQmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZX7f-00000009DoI-1PSX;
	Wed, 09 Jul 2025 15:54:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZV4w-00000008osn-1nJT
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 13:43:19 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a588da60dfso3881011f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 06:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1752068596; x=1752673396; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2GA0EN9gnFYPYZkAghvtePvaCSCWcIe7GtWQ7AJTlGM=;
        b=A9ozfRmgJam7wqJLWtzsWNL2z/QY4eP8qcEGffj0PmWDqcDn0zNmZ955fdndguVnhR
         0wg9uyaXxLepXN8TTDqOzPaQQmGzwig4BpX3GU9jJakxoamCPn23ISjVzMUxX/1zTD7L
         1UU/LwWEgyZZ8w+kNDrkCjOlciCEVOrGL09NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752068596; x=1752673396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GA0EN9gnFYPYZkAghvtePvaCSCWcIe7GtWQ7AJTlGM=;
        b=dcLWkOseRmvNTxQJbDLit/We1tBvLQi24jGbX+UMRhN4pPSxL+gW1Zkgwz4FWzRr/1
         z4dIZneIfAKnqQKVn/v2NKSL3HrGpSJsGMt9K70IMCLlP6pxis44gfFPcjc1ArhySVXg
         3Uj7oTTIPhF7gwt0U6ENRh0v6XTkvO5Rlbee5Wf9GjANWivGcrGKcMzoNGVH4w4QX8qq
         3GE60Eqv2ZPLKmdyiY6JQnfen3QtRa8p+46DOocQyx/Po8VaWqF+Ip45DAVbeqHlNntE
         vo+cVXgEhZ9ah2l7x5hu8YUFltfcIx5u0HYJZeM4c33I21nu2FC+kjiei1sjuz0l/cIC
         AAfA==
X-Forwarded-Encrypted: i=1; AJvYcCWufkCl+DsZECbLqJWXirEjHan2KbpuUNPvN8wkQvgCLN1P8lyJiDCxk3mrXhwSAgfVRT+4Uy0GGSKxtwKkFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsBlDjpczx1uiiHkttS80TRec3RD+L5CrRHMEYICY/W8wTFEIR
	+Ud0v8HxbE1MhWNGUVZ4cz1qQIHBCpeKkq5yZZ1Ed368nFFaprkycS2lu0Q9v55YQrw=
X-Gm-Gg: ASbGnctdZI1A9/wFkGPxcCeGCdYHl8O9XR9mTHQLXq4QAcjPvb5g/v3II/ZIi9inWXC
	BRtiOQGyffE/Vt16cxMeN9wo36/QSaLrme3Fb/Gvdx8eV7YBbfS8vPng3Clbq+p5Qok5W8Zry+O
	TsSI1aeH/iyognsr/ipQugyTcWHljMWuStLdTlmAW4HpVRphh2oAxkDNVFvA/cPLwIgGvMs3bY4
	5Ap7S7+76kfuZG6P4Belm6DAcFmKvG7wjcuHELwrLuROq6/CovMtWKTqQb2UjDk6vIybIlJKUgi
	+d2grS2DjadY+yUgUT+1cxiBQwCQHICJhsawfwjW1e/xTjVMi6Yw3g6L3IVl51PFPQVrKT8uUw=
	=
X-Google-Smtp-Source: AGHT+IF79fZ8h3znMi15CeSd+JoB+26qQ0VCetCrzQoMkMwtHnpy+FY4TCDHHaTnggwV+tzno1DR/g==
X-Received: by 2002:a05:6000:4012:b0:3a4:f7af:b41 with SMTP id ffacd0b85a97d-3b5e4527f04mr2311867f8f.15.1752068596310;
        Wed, 09 Jul 2025 06:43:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bd42sm15591538f8f.5.2025.07.09.06.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 06:43:15 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:43:14 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: Re: [GIT PULL] mediatek drm fixes - 20250706
Message-ID: <aG5x8taTg2D5Na2F@phenom.ffwll.local>
References: <20250706021955.2794-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250706021955.2794-1-chunkuang.hu@kernel.org>
X-Operating-System: Linux phenom 6.12.30-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_064318_463552_3CC59A3E 
X-CRM114-Status: GOOD (  16.25  )
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

On Sun, Jul 06, 2025 at 02:19:55AM +0000, Chun-Kuang Hu wrote:
> Hi, Dave & Daniel:
> 
> This includes:
> 1. Add wait_event_timeout when disabling plane
> 2. only announce AFBC if really supported
> 3. mtk_dpi: Reorder output formats on MT8195/88
> 
> Regards,
> Chun-Kuang.
> 
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250706
> 
> for you to fetch changes up to 8708a4897380da17bd1afa70f8c6bef06fefe360:
> 
>   drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88 (2025-06-25 15:13:09 +0000)

Tried to pull this, but doesn't seem to compile all that well:

drivers/gpu/drm/mediatek/mtk_crtc.c: In function ‘mtk_crtc_plane_disable’:
drivers/gpu/drm/mediatek/mtk_crtc.c:729:22: error: ‘struct mtk_crtc’ has no member named ‘cmdq_client’
  729 |         if (!mtk_crtc->cmdq_client.chan)
      |                      ^~


There's more. I'm not exactly sure what's going on, but this looks like it
wasn't tested?

Thanks, Sima

> 
> ----------------------------------------------------------------
> Mediatek DRM Fixes - 20250706
> 
> 1. Add wait_event_timeout when disabling plane
> 2. only announce AFBC if really supported
> 3. mtk_dpi: Reorder output formats on MT8195/88
> 
> ----------------------------------------------------------------
> Icenowy Zheng (1):
>       drm/mediatek: only announce AFBC if really supported
> 
> Jason-JH Lin (1):
>       drm/mediatek: Add wait_event_timeout when disabling plane
> 
> Louis-Alexis Eyraud (1):
>       drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88
> 
>  drivers/gpu/drm/mediatek/mtk_crtc.c     | 34 ++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_crtc.h     |  1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  9 +++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h |  1 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c |  7 +++++++
>  drivers/gpu/drm/mediatek/mtk_dpi.c      |  4 ++--
>  drivers/gpu/drm/mediatek/mtk_plane.c    | 12 ++++++++++--
>  drivers/gpu/drm/mediatek/mtk_plane.h    |  3 ++-
>  9 files changed, 66 insertions(+), 6 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

