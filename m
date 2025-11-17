Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117A3CE8D6B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Nov 2025 16:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tx5pCt6UywoMhHGKyGxCGcYK9d/RLDNyjfLAZJe7BNY=; b=lIrkfC1J7vLZEgAFmZVaw1S7/5
	3mphTT2ocMlefX16vX+mNrH8wweOKmobTfEYY15y13L0oZl4XwKxWGDpgnBcyy/skrgiO2mRmImFa
	Po4XgvwIOg5eOIUQQCepRfgvwHwFs9E+A9lcqSj+si+1QH+hdgg87BlzjP1z/SKylvvP9mx9LBhnc
	/z06iKaZPTqi1f9F4HBtek2iTv4VPLrN5ZviK7sKS8WaTEYs4qnBjJolKuBg4XGpZ03jK1m2O9Cng
	KsFGiyczGLIWz65judQuQXjTqzC/oXa5rvcb2EJUGtOzCI5lbKa2G2rmofQF1t9MqS4Ks0XiqN8a6
	4T8NmqEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2OZ-0000000GQED-3hnk;
	Mon, 17 Nov 2025 16:48:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2OX-0000000GQD1-09w5
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Nov 2025 16:48:02 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-298287a26c3so55717075ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Nov 2025 08:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763398080; x=1764002880; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx5pCt6UywoMhHGKyGxCGcYK9d/RLDNyjfLAZJe7BNY=;
        b=NSyeivclh/xyt7grG3M5ADWlnNbEsV+1RmSvrM4TMfAfw+PHYYg7ZFelLY0VQDNqt2
         qVGKEApRkYJHLpJxrmeQcpCcE1dfBXLweoSBOr4lwgPDvE8+su2zfAHf69RVcbZNLtER
         1681xMJvXyJ0S1LwA04vndgBpZQWkMOHcDkEnHaQdWJQTkjJLgP3PjCKAlbx0/5Avh2Z
         Tzf5jRyBVUZbKUX97NHLXh++L5Mr50josiYL/yxiE1jUs7Te4Z5fxM2MjBfqoWjO8wYA
         iPNksDi38kRgiL9UIBSJrPxlkqw5ohzdeUq2Ks2iJxIr6/Bc/GkDXdRz///wtkb0linM
         4/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763398080; x=1764002880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tx5pCt6UywoMhHGKyGxCGcYK9d/RLDNyjfLAZJe7BNY=;
        b=WWNLPNHmnGVE7/jgtzC/vfwtUcaGN9AW+I81yBt4b/wZPIUau9CNOPm6cPLZPS/EjJ
         qFp+RRH8LhzMZMcLSi6XMRlJ/WcCJknBFSW7c8HNka3syIiFbJI4dxUJ2TDETd9qAHs9
         0eRQdV8Tx1cdSDFC+GoJnifmRWw47J2MdG7XMy0S+GvasRMobSvPx31mjEhcpW7h6kqO
         Z59KMDx/zCbE5GN/OkC7vr4MPY/mnnL91oX4rRT5+InAYBrdy1Qe2ss+mD8wwOmfle1I
         iXipGKUgU3r/GX7EXioKRXcmYoiHYYjhhjX5xAK1pIxVRVJLUATUAPLFD5gMB8aKWcYH
         CUhw==
X-Forwarded-Encrypted: i=1; AJvYcCXl7H/Ck5fzHi56JilOWAP/q1bK+74P54bDzvlF0qVqFo3Qw/pk4Xnw/74+NPBZ5Zy18C57LmqadiPbc3/1dA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKbdnZUFh1bQFXf+w5/MzHdpaGID8S6ZjcI/hviE7fgu3V2SHN
	9GqKPfXGnK9cRj+bkf5L2it0Q6cVHyVoQqbH6PxwtCQgqNvpELMUmaIQzHmpY6Lke7I=
X-Gm-Gg: ASbGncutUlpxjQuFuGjkbsixjK049BvQ4Xdm1h/fC3XHKtKevlxm7vRXlMJzSliMFl+
	kVOvLEZVU+yIgI/le/UVG9iQfdogd6JehArArGKP8imSlOtNUS0BKdWU3KEauqzu1q+f8bCpfoi
	w0rdTWRUdUoc9KV6BPGDG2q3lM801EcL4eQlqAjFuUzy+1l80O7+qyOys/iq3I0T1ncYdXKFNsm
	VacupxuG+SK90ehGMIATf31K8ZfjtNv+DKkOgkuK9x22giT8XTJnH0XDREekh+8zNJetEsvPqaS
	NhNV6anDIlTY3ldF57CW3bKUJVFqjDs8kUWJVP0MLJEV22QW+iNrZNxAnFuiVP8+ahO/Jh+IWIf
	ShrYGM503fOp7SMs0Cq6U2Qtwc3ub5MIRb6RflkcnC7UCejmUyvQoeYz53y0LLkamEEMafpor4G
	NSf/1dApSHkyiy7w==
X-Google-Smtp-Source: AGHT+IFOJfgBMktrjQ4WzqODR90mVSuboNdF+0l09QpBE2YhVUppij7GQo1/v8CGTNYHNVGS0fdYMw==
X-Received: by 2002:a17:903:24f:b0:290:9332:eebd with SMTP id d9443c01a7336-2986a6bc404mr159661345ad.10.1763398079908;
        Mon, 17 Nov 2025 08:47:59 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:df44:9b1b:6b35:3fb0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed16sm144069755ad.86.2025.11.17.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:47:59 -0800 (PST)
Date: Mon, 17 Nov 2025 09:47:56 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Huayu Zong <huayu.zong@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/3] remoteproc: mediatek: Support platform reg
 offsets in mtk_scp_of_data
Message-ID: <aRtRvBZ1zaxW0N20@p14s>
References: <20251110101342.24261-1-huayu.zong@mediatek.com>
 <20251110101342.24261-2-huayu.zong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110101342.24261-2-huayu.zong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_084801_086872_CDFDD47D 
X-CRM114-Status: GOOD (  23.58  )
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

Good day,

On Mon, Nov 10, 2025 at 06:13:29PM +0800, Huayu Zong wrote:
> Some platforms only differ in HW register offsets, but can share
> the same API. Refine struct mtk_scp_of_data to allow setting HW
> register offsets via platform data, enabling better code reuse
> and easier support for new platforms.
> 
> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h |  5 +++++
>  drivers/remoteproc/mtk_scp.c    | 18 ++++++++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index fd5c539ab2ac..d45480ad332e 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -112,6 +112,11 @@ struct mtk_scp_of_data {
>  
>  	u32 host_to_scp_reg;
>  	u32 host_to_scp_int_bit;
> +	u32 scp_to_host_ipc_clr_reg;
> +	u32 scp_to_spm_ipc_clr_reg;
> +
> +	u32 scp_secure_domain_reg;
> +	u32 scp_domain_value;
>  
>  	size_t ipi_buf_offset;
>  	const struct mtk_scp_sizes_data *scp_sizes;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 10e3f9eb8cd2..c3c37cae933a 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -236,7 +236,7 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
>  		 * MT8192_SCP2APMCU_IPC.
>  		 */
>  		writel(MT8192_SCP_IPC_INT_BIT,
> -		       scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_CLR);
> +		       scp->cluster->reg_base + scp->data->scp_to_host_ipc_clr_reg);
>  	} else {
>  		scp_wdt_handler(scp, scp_to_host);
>  		writel(1, scp->cluster->reg_base + MT8192_CORE0_WDT_IRQ);
> @@ -561,7 +561,7 @@ static int mt8188_scp_c1_before_load(struct mtk_scp *scp)
>  static int mt8192_scp_before_load(struct mtk_scp *scp)
>  {
>  	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
> -	writel(0xff, scp->cluster->reg_base + MT8192_SCP2SPM_IPC_CLR);
> +	writel(0xff, scp->cluster->reg_base + scp->data->scp_to_spm_ipc_clr_reg);
>  
>  	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
>  
> @@ -575,6 +575,18 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
>  	/* enable MPU for all memory regions */
>  	writel(0xff, scp->cluster->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
>  
> +	/* Set the domain of master in SCP.
> +	 *
> +	 * In the SCP, cores, DMA, and SPI are masters. When these masters
> +	 * access memory or devices, they need to carry a domain ID. This
> +	 * domain ID is used to determine whether they have permission to
> +	 * access the target device or memory.
> +	 */
> +
> +	if (scp->data->scp_secure_domain_reg)
> +		writel(scp->data->scp_domain_value,
> +		       scp->cluster->reg_base + scp->data->scp_secure_domain_reg);
> +

This change is not related to the description in the changelog, nor the other
changes in this patch.  Please do another patch.

>  	return 0;
>  }
>  
> @@ -1527,6 +1539,8 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  	.scp_da_to_va = mt8192_scp_da_to_va,
>  	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>  	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> +	.scp_to_host_ipc_clr_reg = MT8192_SCP2APMCU_IPC_CLR,
> +	.scp_to_spm_ipc_clr_reg = MT8192_SCP2SPM_IPC_CLR,
>  	.scp_sizes = &default_scp_sizes,
>  };
>  
> -- 
> 2.45.2
> 

