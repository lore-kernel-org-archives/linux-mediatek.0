Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23835C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 01:59:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D753961042
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 01:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D753961042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jyYXT8sxzlZyHfk3cAeXPlrlX/7CpvZIuSyidtmW7AI=; b=nvHtZ4JOkSZdNl
	LRGgmSDFq/+SVZ7wfU29B4Ty3yz9gz70JkOzkP6ZMbUwD/NP4Z/1W7xkK1sjQ83D/r8z0j+9CpIEP
	YDJcLDB3XPoixAxC/ra2cpNSufFDB26j0L7F73eDLoXXJFcKaJ3HG/cV3h+kqW3IEz2izb6KMuHmh
	dE0l1QEyz580W6J+NTyx2EuTKJow2Utdvc2p8lfdmJYvXkQ68y4vE3G0HVxxhN7imfVIym+ueN4/C
	m6w64/DzCQPanQzionMP7Tqy+PlJaqq1FM5bjygolRzevhGs4lnLH54ZhJkyHwZqpHM5njuMTUrkA
	e3E/vOFbVkUTzlNqiarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3UAr-00BsPQ-AI; Wed, 14 Jul 2021 01:58:57 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3UAo-00BsOX-No; Wed, 14 Jul 2021 01:58:56 +0000
Received: by mail-io1-f41.google.com with SMTP id p186so97855iod.13;
 Tue, 13 Jul 2021 18:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uOqifUzkRaN6450fZqsUf49bx6RwvzQf56ULmH/5myE=;
 b=ReF9bzWaNJVDgVQ4hlXFBOj50jx3iM+PRjcQX8xHwQfSMXDrJTnPfDwPPVoPJ85bzB
 sfWukIzFyoJhM72Yi/z9OGo5aQfSziz47IOGWSZaxmfMDtzb9aPjfA8GukqIdHPfKqzv
 cuB+PEjcPcWyrreqq0mmtu1Eoq7Z40rKHK9XVO+VN4U9nAA5G1buMEoklwPSeGV4K9Am
 db62J3GiGWcEN2M8vwJQFEv+QVK7S+59IhOHLUbQM2M2XEuiJalYKXkIV+7n84gAVcn1
 mOj2XBTm2qdYqCkmInWdDtmvc67fBC8h05szpo8VNz5Qmx3OQ4fCc0VUE964WEtduf3R
 RSYA==
X-Gm-Message-State: AOAM532LlWN+B02Ts10CQcKlo67ZHMdcowqZ3Tr+jw9WpFx78ILPrg53
 VQ1byGmWjQgu3JbfOhIi7Q==
X-Google-Smtp-Source: ABdhPJyT8TYsSlaL+L00/kHbPjyHO8V/A9ECsVjD8XtNKMYIt96lMs9INqqlpooOnhrZOVYrOX4MKA==
X-Received: by 2002:a05:6602:25da:: with SMTP id
 d26mr5426788iop.106.1626227933715; 
 Tue, 13 Jul 2021 18:58:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id r6sm443341ilh.35.2021.07.13.18.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 18:58:53 -0700 (PDT)
Received: (nullmailer pid 1286017 invoked by uid 1000);
 Wed, 14 Jul 2021 01:58:49 -0000
Date: Tue, 13 Jul 2021 19:58:49 -0600
From: Rob Herring <robh@kernel.org>
To: Christine Zhu <Christine.Zhu@mediatek.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, matthias.bgg@gmail.com,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 seiya.wang@mediatek.com
Subject: Re: [v5, 2/3] dt-bindings: reset: mt8195: add toprgu reset-controller
 head file
Message-ID: <20210714015849.GA1283155@robh.at.kernel.org>
References: <20210628113730.26107-1-Christine.Zhu@mediatek.com>
 <20210628113730.26107-3-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628113730.26107-3-Christine.Zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_185854_828897_2A9C591F 
X-CRM114-Status: GOOD (  15.97  )
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

On Mon, Jun 28, 2021 at 07:37:30PM +0800, Christine Zhu wrote:
> From: "Christine Zhu" <Christine.Zhu@mediatek.com>
> 
> Add toprgu reset-controller head file for MT8195 platform.

s/head/header/

And the subject too.

> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> ---
>  .../reset-controller/mt8195-resets.h          | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 include/dt-bindings/reset-controller/mt8195-resets.h
> 
> diff --git a/include/dt-bindings/reset-controller/mt8195-resets.h b/include/dt-bindings/reset-controller/mt8195-resets.h
> new file mode 100644
> index 000000000000..7ec27a64afc7
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt8195-resets.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license please.

> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Crystal Guo <crystal.guo@mediatek.com>

According to the S-o-b and patch author, you are the author.

> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8195
> +
> +#define MT8195_TOPRGU_CONN_MCU_SW_RST          0
> +#define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
> +#define MT8195_TOPRGU_APU_SW_RST               2
> +#define MT8195_TOPRGU_INFRA_AO_GRST_SW_RST     6
> +#define MT8195_TOPRGU_MMSYS_SW_RST             7
> +#define MT8195_TOPRGU_MFG_SW_RST               8
> +#define MT8195_TOPRGU_VENC_SW_RST              9
> +#define MT8195_TOPRGU_VDEC_SW_RST              10
> +#define MT8195_TOPRGU_IMG_SW_RST               11
> +#define MT8195_TOPRGU_APMIXEDSYS_SW_RST        13
> +#define MT8195_TOPRGU_AUDIO_SW_RST             14
> +#define MT8195_TOPRGU_CAMSYS_SW_RST            15
> +#define MT8195_TOPRGU_EDPTX_SW_RST             16
> +#define MT8195_TOPRGU_ADSPSYS_SW_RST           21
> +#define MT8195_TOPRGU_DPTX_SW_RST              22
> +#define MT8195_TOPRGU_SPMI_MST_SW_RST          23
> +
> +#define MT8195_TOPRGU_SW_RST_NUM               16
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
