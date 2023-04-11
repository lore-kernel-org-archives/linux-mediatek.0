Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE13C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 10:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I00mnwr030X+et6YWjpBcS7r+cVDcxfdrqBbP1jIoBM=; b=MBBg1/oByxySUxLaEU4pPM9G9G
	/GN/AMw5nO1aZ3pq8L/m1g7/fPQUBHSjRjsreAN5a87JTnhQ30FoHf72fqT8nAo+6jIJmoSXkql4G
	HMmmqyLYYCWyhNUGk2/+++sWlVYpjpjxOggtKYtvVQ85+V8K48gZfNNyIP4xQhpZDUOSoUs0DDrb2
	1RfHB2YoxJMGCeGfnuTFx/w/Cav0c7aJZC/e+TVaFr676291KiUUSicd6ssB7ByqobilFSNTCoUmY
	s3rtk4eVmt9x4T/oGUCWRrOWN6UPoOMOXcg3rvaFPRCTYrH1Dliz55axZnP8hM5DAoSZJrRsUyD+1
	CwAgf+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmBKd-00HKxW-1V;
	Tue, 11 Apr 2023 10:34:35 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmBKZ-00HKtL-2Z
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Apr 2023 10:34:33 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-2ef1e98d6bfso382530f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Apr 2023 03:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1681209268; x=1683801268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I00mnwr030X+et6YWjpBcS7r+cVDcxfdrqBbP1jIoBM=;
        b=lm4SAcep/XKl1DZtHx5RTnpfJ2QZ0uSgLV/tMXtRo6yNSY+5ouhTp3b1ztrR1Zz5y4
         Fpgs8z/yS9ASMTVO4mGxJKV3KX/P9UZQVFCYF2OPh9rN8nEiIft0NgpawA/KrD4bkfCV
         AP08oczleELGSTIr3+96GC3S+9J7wEM7pN1r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681209268; x=1683801268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I00mnwr030X+et6YWjpBcS7r+cVDcxfdrqBbP1jIoBM=;
        b=HWIKbwfPW4g4qXaaO5tI/fgIUafP5P3gc9APxu77P7EXjKM09WG5j71BdcTgSKbnkK
         evHuXmlxcw9beMShtKuUG0P7sbUZ2beaqQ6IGkRvNuOLqZexxWsmumDPQMt7iQ5CVoIR
         fGQwtbMVVSQAW8Xm6uf3e3oG4PxczeJUinjVrKY+EImFU9G/D0lXJESaJ0twsdv9wZx0
         Q7+eKYV8FUPMGbPxQgsht6qKIpLJ754GBmz3FU7GhkandtrFwH11GQGZSA4iYICLpExS
         DG6SEf4md+gdbcgx3Mm4JSBi0zpABQSYxwXE/Z8CNPTDjDNqyqwo6saaU1s/YV5ctKgE
         uUmA==
X-Gm-Message-State: AAQBX9cU1hQch60pfJjgbuBga27rS4WfbCwxhKbwrQxUpkZnVaD8w/D4
	rPW3fEr/ceYjA3gwMcDFc1azCg==
X-Google-Smtp-Source: AKy350ZFqsZmlLAPU6QHNMV5/R/+jpvUG7up53DzrKvTEPAhfUGJeW9YvXZUQC8obhZoatB+t3AEbA==
X-Received: by 2002:a05:6000:c7:b0:2ef:bb5d:adf8 with SMTP id q7-20020a05600000c700b002efbb5dadf8mr5043209wrx.2.1681209268492;
        Tue, 11 Apr 2023 03:34:28 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id b2-20020adff242000000b002d322b9a7f5sm14286203wrp.88.2023.04.11.03.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 03:34:28 -0700 (PDT)
Date: Tue, 11 Apr 2023 12:34:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Xinlei Lee <xinlei.lee@mediatek.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Justin Green <greenjustin@chromium.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>
Subject: Re: [GIT PULL] mediatek drm next for 6.4
Message-ID: <ZDU3sqNGhNFwbINx@phenom.ffwll.local>
References: <20230410233005.2572-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410233005.2572-1-chunkuang.hu@kernel.org>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_033431_837036_2CA8ADD4 
X-CRM114-Status: GOOD (  19.57  )
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

On Mon, Apr 10, 2023 at 11:30:05PM +0000, Chun-Kuang Hu wrote:
> Hi, Dave & Daniel:
> 
> This includes:
> 
> 1. Add support for 10-bit overlays
> 2. Add MediaTek SoC DRM (vdosys1) support for mt8195
> 3. Change mmsys compatible for mt8195 mediatek-drm
> 4. Only trigger DRM HPD events if bridge is attached
> 5. Change the aux retries times when receiving AUX_DEFER
> 
> Regards,
> Chun-Kuang.
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.4
> 
> for you to fetch changes up to 9243d70e05c5989f84f840612965f96b524da925:
> 
>   drm/mediatek: dp: Change the aux retries times when receiving AUX_DEFER (2023-04-03 16:49:49 +0000)

Pulled, thanks

> 
> ----------------------------------------------------------------
> Mediatek DRM Next for Linux 6.4
> 
> 1. Add support for 10-bit overlays
> 2. Add MediaTek SoC DRM (vdosys1) support for mt8195
> 3. Change mmsys compatible for mt8195 mediatek-drm
> 4. Only trigger DRM HPD events if bridge is attached
> 5. Change the aux retries times when receiving AUX_DEFER
> 
> ----------------------------------------------------------------
> Alexandre Mergnat (1):
>       dt-bindings: display: mediatek: clean unnecessary item
> 
> Chen-Yu Tsai (1):
>       drm/mediatek: dp: Only trigger DRM HPD events if bridge is attached
> 
> Jason-JH.Lin (1):
>       drm/mediatek: Change mmsys compatible for mt8195 mediatek-drm
> 
> Justin Green (3):
>       drm/mediatek: Refactor pixel format logic
>       drm/mediatek: Add support for AR30 and BA30 overlays
>       drm/mediatek: Enable AR30 and BA30 overlays on MT8195
> 
> Nancy.Lin (9):
>       dt-bindings: mediatek: add ethdr definition for mt8195
>       drm/mediatek: Add ETHDR support for MT8195
>       drm/mediatek: Add ovl_adaptor support for MT8195
>       drm/mediatek: Add dma dev get function
>       drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support
>       drm/mediatek: Add drm ovl_adaptor sub driver for MT8195
>       drm/mediatek: Add mediatek-drm of vdosys1 support for MT8195
>       drm/mediatek: Add mdp_rdma get format function
>       drm/mediatek: Add ovl_adaptor get format function
> 
> Nathan Lu (1):
>       drm/mediatek: Add mediatek-drm of vdosys0 support for mt8188
> 
> Xinlei Lee (1):
>       drm/mediatek: dp: Change the aux retries times when receiving AUX_DEFER
> 
>  .../bindings/display/mediatek/mediatek,ccorr.yaml  |   5 +-
>  .../bindings/display/mediatek/mediatek,ethdr.yaml  | 182 +++++++
>  drivers/gpu/drm/mediatek/Makefile                  |   2 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  35 ++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  94 ++++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    | 547 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  38 ++
>  drivers/gpu/drm/mediatek/mtk_dp.c                  |  15 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  89 +++-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |   6 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 135 +++--
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  78 ++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 475 ++++++++++--------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |  30 +-
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c           |  24 +-
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h           |   3 +-
>  drivers/gpu/drm/mediatek/mtk_ethdr.c               | 370 ++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h               |  25 +
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |  24 +
>  19 files changed, 1858 insertions(+), 319 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

