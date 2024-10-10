Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB81CF11F0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 13:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWStPK9gxRSpPDMIOZOg2Ixtek6SAEHwW8Enf61B4bY=; b=H/FnA1z51RDTCJL3uFD4r+mXN9
	QLcbyG7hoyjhYnCnWnGgIVwRIe2njku3EivbbZ1BfpkdOYpB+ofxBep7690zs+sGfsHx+oaLc9fH3
	NoFpZ0oYD1S9uoGGVkSimnnhvRiNVfEOQ4iVuSxdBIT6TiY3oNuTH5kFM/rrwGCqvssNDwcvWH126
	CvjfWhom3c57DbrEiLfj4XI5eBL7Qn9DH1c5dYJ2qA0t0prAO/uru99T3EJLpnSbDTtTZyHIx1PFq
	5cl4QFi3ur4RA6Z6lq/vlUi5udFskFMgrarZ/eeM+OjUlU60PaC3U0Gag2eccKU0FwSqJ2CSitGEV
	Zn+ead+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sysss-0000000Cqr7-1aEm;
	Thu, 10 Oct 2024 13:07:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysbZ-0000000Cms7-48ht;
	Thu, 10 Oct 2024 12:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728564560;
	bh=peJCajT9JrXEyFW7QG0r6H6LQ1MBhLze2K+6buEL3xw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oz1mEWob0bLo3tFj/UZ1xluxr6hYvEq4h1UspMdA6+l+A/m1HNWUQmfOSVlR6ttGy
	 J3KCM9lroR2SFR+3TRZIFhBXmr9xEU+BNp7FZCwQQcI+dsB5AlPRSzna/Ke6ZrOZGT
	 N1nSislJSTMtsj0d9UjBkvkWaaIdXhgSzWfQ2UGfmuWe6TWU0cmeJ3w7PI9K6JoOEh
	 AqYzvkgywv4D4j1thdPHBA2OL8UlI1H0iXXsZGdhNxdxGuA2wGqRJL/l+Eaw4uCGTe
	 U05rr0cvsUZk/TUARKVnMyn4W8DqOOwQ72WkeMgJ7KGAmAf3YVDlU3Yv37WOjhKHF9
	 mN+/9pAZy5EFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C6F217E35EA;
	Thu, 10 Oct 2024 14:49:19 +0200 (CEST)
Message-ID: <93234ce4-e831-41aa-9485-53997b5cacaf@collabora.com>
Date: Thu, 10 Oct 2024 14:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Konig <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, hidenorik@chromium.org, yunkec@chromium.org,
 shun-yi.wang@mediatek.com
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_054922_232108_DE789A99 
X-CRM114-Status: GOOD (  13.64  )
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

Il 09/10/24 13:15, Shu-hsiang Yang ha scritto:
> Introduces the ISP pipeline driver for the MediaTek ISP raw and yuv
> modules. Key functionalities include data processing, V4L2 integration,
> resource management, debug support, and various control operations.
> Additionally, IRQ handling, platform device management, and MediaTek
> ISP DMA format support are also included.
> 
> Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
> ---
>   .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.c  | 5359 +++++++++++++++++
>   .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.h  |  325 +
>   .../isp/isp_7x/camsys/mtk_cam-raw_debug.c     |  403 ++
>   .../isp/isp_7x/camsys/mtk_cam-raw_debug.h     |   39 +
>   .../isp_7x/camsys/mtk_camera-v4l2-controls.h  |   65 +
>   5 files changed, 6191 insertions(+)
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.c
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_camera-v4l2-controls.h
> 
> diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
> new file mode 100644
> index 000000000000..c025f53c952d
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
> @@ -0,0 +1,5359 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/vmalloc.h>
> +#include <linux/videodev2.h>
> +#include <linux/suspend.h>
> +#include <linux/rtc.h>
> +
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include <soc/mediatek/smi.h>
> +
> +#include "mtk_cam.h"
> +#include "mtk_cam-feature.h"
> +#include "mtk_cam-raw.h"
> +
> +#include "mtk_cam-regs-mt8188.h"
> +
> +#include "mtk_cam-video.h"
> +#include "mtk_cam-seninf-if.h"
> +#include "mtk_camera-v4l2-controls.h"
> +
> +#include "mtk_cam-dmadbg.h"
> +#include "mtk_cam-raw_debug.h"
> +
> +static unsigned int debug_raw;
> +module_param(debug_raw, uint, 0644);
> +MODULE_PARM_DESC(debug_raw, "activates debug info");
> +
> +static int debug_raw_num = -1;
> +module_param(debug_raw_num, int, 0644);
> +MODULE_PARM_DESC(debug_raw_num, "debug: num of used raw devices");
> +
> +static int debug_pixel_mode = -1;
> +module_param(debug_pixel_mode, int, 0644);
> +MODULE_PARM_DESC(debug_pixel_mode, "debug: pixel mode");
> +
> +static int debug_clk_idx = -1;
> +module_param(debug_clk_idx, int, 0644);
> +MODULE_PARM_DESC(debug_clk_idx, "debug: clk idx");
> +
> +static int debug_dump_fbc;
> +module_param(debug_dump_fbc, int, 0644);
> +MODULE_PARM_DESC(debug_dump_fbc, "debug: dump fbc");
> +
In addition to the first review that I gave you on patch [02/10]: please drop
all those module parameters. If you want debug switches, use debugfs instead.

Regards,
Angelo

