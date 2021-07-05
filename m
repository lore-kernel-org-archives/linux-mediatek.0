Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EE3C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:07:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5441613C8
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5441613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCmSv3jJbaGjBK6xq1gHZlKkuV6eVqNPznald43w9K0=; b=2M0kSrgClL2bCP
	W0AVbYQ5T/o2+LV/IJ84fBLmcsRCW0nxhrjh9awL8pdETdp6wkUEbEQN/O6ui52CL2KeG1TfgrGAM
	q5P77ca0oCJuDarAmUAcCJP6peHoaUhPUaUuHqoh4t3ukdH7UEwJLTFr3ljvzAyDKl5NeDeIXRLSU
	bG5iXkuBttvPf0aCiHwelChz13KMTJzDsquBzaHiJC6kjh5M8OwY5fn4eIcoybwKg0z8/B16h408/
	k4ugBL7UGVdrvaPrnnSZ1KGdhjoniyPHVipCSHvjKiowJmsw93uE0LR/0M5qXYRwx/6iNxEZscmeV
	mqOYHeuj3j5d8N3HP0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0LVu-008WzJ-3R; Mon, 05 Jul 2021 10:07:42 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0LVh-008WxR-Nj
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 10:07:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id c15so9961269pls.13
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Jul 2021 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=URzqQGQoXOhjWiVA59OemrOZ6RGERDqTdQyNEXeAAck=;
 b=W+oJyrd0cywPJ2WKOIn0+/TZJnDNS67AnkdeDildmOBCR2YDCCSxGoymgaKDCH/Xs2
 2Tt2Ykz8fdNewWrffXxMSL+OWuktoSP4WM0aP454Xp46wwMb5eQDfNyXE37UeyxZgEgh
 ZqpnLRE0tGHO7RNqsdazo3gKrVWcANSkbLE+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=URzqQGQoXOhjWiVA59OemrOZ6RGERDqTdQyNEXeAAck=;
 b=YY4X+00Zn/DygDV6fxV5XOiz5nQdpD1BWtn2WbgdUAQ0GwOg9URxLh5r3ncCuJWnLI
 bxw3UHO4Q6+hHbOunbUdnHi7cT3OYvDZWjBPwxgI2aPKZ3z/oGr+UDP+mppkR8fTWazE
 EdoDFXYIAxAqbKJJ8uatCS8fI7+iiN5Dgd2Gs+X/IQiOVDntlhlClVjKKbIWmZEmUTch
 tIoE7yqnWUiGk9zO02Y4Sjkz88aKSxealRuWgWU5A4OKtE+Oz14h4ocICoZamLmFmguS
 +7DYTqDTBaFJ5lwReGJBDu8HSvFo+XPPPcLY66hFjjC6q3gej8k3X5V0fVVn/xsCs70l
 pKag==
X-Gm-Message-State: AOAM5319rWajxSkL6yynWDUyQz0QI9gc4LVZn3/JQAIee5xVn+RxuKMH
 9EIuYeOpwCs6M6CtQXG8VAWz3Q==
X-Google-Smtp-Source: ABdhPJzLaiyM+hJRO34T6/7krD6/7coonwGydXEI2SqB2V3Cc/mLh/HDAsZW7o4nnnI4Moc5m/2Myw==
X-Received: by 2002:a17:902:bd03:b029:11c:d504:c1ce with SMTP id
 p3-20020a170902bd03b029011cd504c1cemr11838106pls.7.1625479643848; 
 Mon, 05 Jul 2021 03:07:23 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:f66e:ef34:adcd:b33b])
 by smtp.gmail.com with ESMTPSA id s126sm12354864pfb.164.2021.07.05.03.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 03:07:23 -0700 (PDT)
Date: Mon, 5 Jul 2021 18:07:19 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 06/22] clk: mediatek: Add MT8195 audio src clock support
Message-ID: <YOLZ12WWkk/0kAnd@google.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-7-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616224743.5109-7-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_030729_823223_4315BBCF 
X-CRM114-Status: GOOD (  19.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, Jun 17, 2021 at 06:47:27AM +0800, Chun-Jie Chen wrote:
> Add MT8195 audio src source clock provider
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig              |  6 +++
>  drivers/clk/mediatek/Makefile             |  1 +
>  drivers/clk/mediatek/clk-mt8195-aud_src.c | 60 +++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-aud_src.c
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index e2bae9d490a4..62dd02bc2755 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -594,6 +594,12 @@ config COMMON_CLK_MT8195_AUDSYS
>  	help
>  	  This driver supports MediaTek MT8195 audsys clocks.
>  
> +config COMMON_CLK_MT8195_AUDSYS_SRC
> +	bool "Clock driver for MediaTek MT8195 audsys_src"
> +	depends on COMMON_CLK_MT8195
> +	help
> +	  This driver supports MediaTek MT8195 audsys_src clocks.
> +

Same comments regarding the Kconfig symbol as the previous patch.

>  config COMMON_CLK_MT8516
>  	bool "Clock driver for MediaTek MT8516"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index f27c04314186..52a5d3f49ff0 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -82,5 +82,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_AUDSYS) += clk-mt8195-aud.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_AUDSYS_SRC) += clk-mt8195-aud_src.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-aud_src.c b/drivers/clk/mediatek/clk-mt8195-aud_src.c
> new file mode 100644
> index 000000000000..7cabe0d68825
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-aud_src.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2021 MediaTek Inc.
> +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +
> +#include <dt-bindings/clock/mt8195-clk.h>
> +
> +static const struct mtk_gate_regs aud_src_cg_regs = {
> +	.set_ofs = 0x1004,
> +	.clr_ofs = 0x1004,
> +	.sta_ofs = 0x1004,
> +};
> +
> +#define GATE_AUD_SRC(_id, _name, _parent, _shift)			\
> +	GATE_MTK(_id, _name, _parent, &aud_src_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
> +
> +static const struct mtk_gate aud_src_clks[] = {
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC0, "aud_src_asrc0", "asm_h_sel", 0),
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC1, "aud_src_asrc1", "asm_h_sel", 1),
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC2, "aud_src_asrc2", "asm_h_sel", 2),
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC3, "aud_src_asrc3", "asm_h_sel", 3),
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC4, "aud_src_asrc4", "asm_h_sel", 4),
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC5, "aud_src_asrc5", "asm_h_sel", 5),
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC6, "aud_src_asrc6", "asm_h_sel", 6),
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC7, "aud_src_asrc7", "asm_h_sel", 7),
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC8, "aud_src_asrc8", "asm_h_sel", 8),
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC9, "aud_src_asrc9", "asm_h_sel", 9),
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC10, "aud_src_asrc10", "asm_h_sel", 10),
> +	GATE_AUD_SRC(CLK_AUD_SRC_ASRC11, "aud_src_asrc11", "asm_h_sel", 11),

And same thing about moving this into the audio driver. AFAICT there is
no audio driver supporting this hardware block, so this will never get
used.


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
