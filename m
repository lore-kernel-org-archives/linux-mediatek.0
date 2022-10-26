Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD1DC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I52e8ODL6d9B8EPRm/dUTW74AdI5aoJaumLitDlvZ6A=; b=xaQvdsIWL313a6mFIVZ7pIicHu
	WV+cNoWl6DPzCheuXeTl+F8bnPg8SItA1jVIIuuscuMDBJ67Cyj3rUznhzF83h3O7mM+PzExSPqgD
	ig1YWyF5hHwpzAMq8PdO2R3O5Ka8Hv/Km4e0v7Lzps3DLnZc2ARXSjnKvaazBSaxSRElioJooIZqW
	x8+0DlCsvDCL2XoQrxdvD12DuGoG8tJ9BpKNOE0bWWg4h2OO3Ux8qmmpVa/vgQragOUj8s9YDqLB6
	EmtIYFzC4RU3SiFEp2B9w+vIpTBkqLtKEPu4BpKRJyjcNr+RlypvkHgIH62hXMfROHKDq/y6fxvaM
	txREoGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oniKb-009t60-4K; Wed, 26 Oct 2022 15:28:37 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oniKG-009szM-7H; Wed, 26 Oct 2022 15:28:17 +0000
Received: by mail-oi1-x22f.google.com with SMTP id n83so18945168oif.11;
        Wed, 26 Oct 2022 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I52e8ODL6d9B8EPRm/dUTW74AdI5aoJaumLitDlvZ6A=;
        b=TCGJaytyonLlG2s5MM7nkXzRTgnxXVr1fxSlda8NdtOcRVTRJckOVfxRUHKlfXidbT
         7CSYB8u306NsZbY4mYYjkHaL066sPa6ac1eD3nR6wMs5IMBYWpJxV26Kzn+hfPMoxsTV
         Br8IAnWzHfl9MrSgx4QBy97vTK1WesetQ822j63wX8WZN72hT1u2el/9RGVF7Y2+N94y
         lxDv63Wej2BexvlYzJi/f0yetJzOWzfeAAXX1+9NUmcyt4e7iiay5OIhvrWvx4+EK2gu
         3OmvBuGZoHmwnA0Jg8G/9sHGK8s86YVlauEZERPCKmClwjM25uxn7ssldZxSA/GyaaP4
         ZPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I52e8ODL6d9B8EPRm/dUTW74AdI5aoJaumLitDlvZ6A=;
        b=5uE8vTo9i+irOcA3insFMEJ9yTYz5gMeGVrGelP5OpGevHcj3rFqY5dbpeLw99ioIK
         228gYX1AVQZygE0QPndDdMuizHpQ7qUmT/S6DNdBHyLhw4zOBkKlI98dyUCOmokVcUS9
         yoXPIBTHBY69yLMA6cUZyizavgenn5hLru+LpLkDiO4+Eihp7O+nsmx/KNYzNt2aF3ro
         1EtQF8HZK2j5KLk31aGpGZnmJ5iWSWqDGJvn99yIxc84T00zRIqs5MoIJff+REvTT8O6
         fydUpFMPpLPLmTwTw+qY5DaG7jSXzHohWQnmFDurbgZvZ29sjV0HAj3GhtjNwtpme6EY
         jezw==
X-Gm-Message-State: ACrzQf1gtwK9DP1G4U8Hvx7jawnzJwLt3vc7UtywvwbvlccefOyhaIoS
	t48RBnbvl7+hxA6Q+495Ook=
X-Google-Smtp-Source: AMsMyM6mMHxk11uO0qF4YLsns5seilyn+6912mbQNgsFsprQcpvhyji6wOCpNbMuTzELpP8eQSt1dw==
X-Received: by 2002:a54:4404:0:b0:354:4ac7:45ac with SMTP id k4-20020a544404000000b003544ac745acmr2168239oiw.133.1666798094325;
        Wed, 26 Oct 2022 08:28:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d3-20020a0568301b6300b00661a3f4113bsm2240634ote.64.2022.10.26.08.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 08:28:13 -0700 (PDT)
Date: Wed, 26 Oct 2022 08:28:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Runyang Chen <Runyang.Chen@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RESEND v3 2/3] dt-bindings: reset: mt8188: add toprgu
 reset-controller header file
Message-ID: <20221026152813.GA2971664@roeck-us.net>
References: <20221026063327.20037-1-Runyang.Chen@mediatek.com>
 <20221026063327.20037-3-Runyang.Chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026063327.20037-3-Runyang.Chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_082816_279356_85ED6383 
X-CRM114-Status: GOOD (  16.53  )
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

On Wed, Oct 26, 2022 at 02:33:26PM +0800, Runyang Chen wrote:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Add toprgu reset-controller header file for MT8188
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  include/dt-bindings/reset/mt8188-resets.h | 36 +++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt8188-resets.h
> 
> diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
> new file mode 100644
> index 000000000000..377cdfda82a9
> --- /dev/null
> +++ b/include/dt-bindings/reset/mt8188-resets.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)*/
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Runyang Chen <runyang.chen@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8188
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8188
> +
> +#define MT8188_TOPRGU_CONN_MCU_SW_RST          0
> +#define MT8188_TOPRGU_INFRA_GRST_SW_RST        1
> +#define MT8188_TOPRGU_IPU0_SW_RST              2
> +#define MT8188_TOPRGU_IPU1_SW_RST              3
> +#define MT8188_TOPRGU_IPU2_SW_RST              4
> +#define MT8188_TOPRGU_AUD_ASRC_SW_RST          5
> +#define MT8188_TOPRGU_INFRA_SW_RST             6
> +#define MT8188_TOPRGU_MMSYS_SW_RST             7
> +#define MT8188_TOPRGU_MFG_SW_RST               8
> +#define MT8188_TOPRGU_VENC_SW_RST              9
> +#define MT8188_TOPRGU_VDEC_SW_RST              10
> +#define MT8188_TOPRGU_CAM_VCORE_SW_RST         11
> +#define MT8188_TOPRGU_SCP_SW_RST               12
> +#define MT8188_TOPRGU_APMIXEDSYS_SW_RST        13
> +#define MT8188_TOPRGU_AUDIO_SW_RST             14
> +#define MT8188_TOPRGU_CAMSYS_SW_RST            15
> +#define MT8188_TOPRGU_MJC_SW_RST               16
> +#define MT8188_TOPRGU_PERI_SW_RST              17
> +#define MT8188_TOPRGU_PERI_AO_SW_RST           18
> +#define MT8188_TOPRGU_PCIE_SW_RST              19
> +#define MT8188_TOPRGU_ADSPSYS_SW_RST           21
> +#define MT8188_TOPRGU_DPTX_SW_RST              22
> +#define MT8188_TOPRGU_SPMI_MST_SW_RST          23
> +
> +#define MT8188_TOPRGU_SW_RST_NUM               24
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8188 */

