Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA0BC43463
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 09:18:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A9A214F1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 09:18:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UWjlqGRc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDvOlp0c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77A9A214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OMFglWYLX85cE9+71ysiupfaVZj50KeQBU0RC+yZfkc=; b=UWjlqGRcEQHJXU3EqSiEWfmNW
	QISKJagyDgHyX7SVu0jVgM9+Uh/KdJOrm8DeAWDN9NiroEd8w6fxECzphsP77Rf/gZfWOtO0nNEza
	etxN3OlOV8s+/n62I6oOQjrBhNZGEpDr8QYgvw1yZRkBdkz/xK4q85ls0NuD05GfKuNaD5KukT/Wh
	ETbm+RrBMrrr8hgW9xrrxXxPsD8iVLsTJR/S85/1dL7w3bVLP8GrdmYea5qd4afxYCBxeBU3CWasM
	oxWajXpJYRy9sN0h+HPQV6A+dfcwRafYL/W53YIZCTj60xPRVEys6XaiJQSY6bLZaXHoItdQ0/BM3
	xNPjNXwKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKHxm-0006UD-5Z; Mon, 21 Sep 2020 09:18:22 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKHxj-0006SP-Ea; Mon, 21 Sep 2020 09:18:20 +0000
Received: by mail-wm1-x341.google.com with SMTP id z9so11791706wmk.1;
 Mon, 21 Sep 2020 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=loMmKVEcoIhprgY7qLwzPQGHqghUl/YZgw3ux8z4Mko=;
 b=lDvOlp0cAV3taZym9zLoB3Q+xfvKlaZNMx0QG+4jFmwMT/9hNyZnsraUg05RDEBL7S
 zA9BVan+cLcO7ayO4Hc9oxg4Y9zuqM+Qgxefh7v1Brrp475CPlOwKdpn6M/nFCVEJhGU
 Hv6mB0UUNBJfkOnaZRkrNHzlFnWmW771RdmadXz767064onsglENFZWpjGwXd9OFD8CU
 cUxFBiFfp4Ij4upPUgsHBZQ+Sak1c1Oi+DZ8Mp90Dge68n7I93cb+lRbc8FRb21USHWz
 P1kt0OXs2Ct2+BRt9/GhHY76YtLINTvD/KUPgYQf4IXaskmMnq8wHQGChXdjz3m04u2L
 3Y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=loMmKVEcoIhprgY7qLwzPQGHqghUl/YZgw3ux8z4Mko=;
 b=ZpzDDt7hBbYA78Mmexu5mtfWHmv6DS1steP5xNqu622T/V9OowLLBu6R85DRgZaKPq
 kwWNGHmBIMsFN7EdCKq38Tulrf1YSxsMSeU41DdJYzFtFgAv1Jp/UAhct0eIgVnDShDf
 0iyicDYUfsHOKvpnUTVDTDTPdbqKJ92/ScdjJciFIVrSx35TqhGGULCskdEH8z3c4tn8
 63wxdcPZUsKi7NQMnMuNCs8zwa9HKnUq+2A7Ckv7nByAQRBJf3dYGtDNG/njQ4FycbRr
 mNWbT+qK+NBZwTwmmru3u0RuVhCJ9E/HvMDj9PF+JSiglDEaethqYJXCxkiJvSkiVa5U
 ks7A==
X-Gm-Message-State: AOAM530htN32LUmYLj25VG7dk0rKsTsrzYP2jNqbGPPQQvpO0jqbUn4J
 hWgvtkrrhMAO1UiwSwmuiP8=
X-Google-Smtp-Source: ABdhPJyhGOeXP8q7acUChNscuLpU7v+TBxSFdMvmK9P4GAeb3TwEZrT8LTB1IJWr0wMoP+ENt+1mtQ==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr29122842wmg.179.1600679898312; 
 Mon, 21 Sep 2020 02:18:18 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id d124sm19572508wmd.47.2020.09.21.02.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 02:18:17 -0700 (PDT)
Subject: Re: [PATCH v2] remoteproc/mediatek: Add support for mt8192 SCP
To: Pi-Hsun Shih <pihsun@chromium.org>
References: <20200918064432.3117955-1-pihsun@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d3da1c47-02ae-7873-2601-86a782a5bc74@gmail.com>
Date: Mon, 21 Sep 2020 11:18:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200918064432.3117955-1-pihsun@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_051819_610056_FFC708D0 
X-CRM114-Status: GOOD (  24.44  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/09/2020 08:44, Pi-Hsun Shih wrote:
> Add support for mt8192 SCP.
> 
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> 
> Change since v1:
> * Remove unused register definitions.
> 
> ---
>   drivers/remoteproc/mtk_common.h  |  32 +++++
>   drivers/remoteproc/mtk_scp.c     | 207 ++++++++++++++++++++++++++-----
>   drivers/remoteproc/mtk_scp_ipi.c |   5 +-
>   3 files changed, 211 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 0066c83636d0..47b4561443a9 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -32,6 +32,23 @@
>   #define MT8183_SCP_CACHESIZE_8KB	BIT(8)
>   #define MT8183_SCP_CACHE_CON_WAYEN	BIT(10)
>   
> +#define MT8192_L2TCM_SRAM_PD_0		0x210C0
> +#define MT8192_L2TCM_SRAM_PD_1		0x210C4
> +#define MT8192_L2TCM_SRAM_PD_2		0x210C8
> +#define MT8192_L1TCM_SRAM_PDN		0x2102C
> +#define MT8192_CPU0_SRAM_PD		0x21080
> +
> +#define MT8192_SCP2APMCU_IPC_SET	0x24080
> +#define MT8192_SCP2APMCU_IPC_CLR	0x24084
> +#define MT8192_SCP_IPC_INT_BIT		BIT(0)
> +#define MT8192_SCP2SPM_IPC_CLR		0x24094
> +#define MT8192_GIPC_IN_SET		0x24098
> +#define MT8192_HOST_IPC_INT_BIT		BIT(0)
> +
> +#define MT8192_CORE0_SW_RSTN_CLR	0x30000
> +#define MT8192_CORE0_SW_RSTN_SET	0x30004
> +#define MT8192_CORE0_WDT_CFG		0x30034
> +
>   #define SCP_FW_VER_LEN			32
>   #define SCP_SHARE_BUFFER_SIZE		288
>   
> @@ -50,6 +67,19 @@ struct scp_ipi_desc {
>   	void *priv;
>   };
>   
> +struct mtk_scp;
> +
> +struct mtk_scp_of_data {
> +	int (*scp_before_load)(struct mtk_scp *scp);
> +	void (*scp_irq_handler)(struct mtk_scp *scp);
> +	void (*scp_reset_assert)(struct mtk_scp *scp);
> +	void (*scp_reset_deassert)(struct mtk_scp *scp);
> +	void (*scp_stop)(struct mtk_scp *scp);
> +
> +	u32 host_to_scp_reg;
> +	u32 host_to_scp_int_bit;
> +};
> +
>   struct mtk_scp {
>   	struct device *dev;
>   	struct rproc *rproc;
> @@ -58,6 +88,8 @@ struct mtk_scp {
>   	void __iomem *sram_base;
>   	size_t sram_size;
>   
> +	const struct mtk_scp_of_data *data;
> +
>   	struct mtk_share_obj __iomem *recv_buf;
>   	struct mtk_share_obj __iomem *send_buf;
>   	struct scp_run run;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index ac13e7b046a6..f5f226a7b34c 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -124,9 +124,6 @@ static int scp_ipi_init(struct mtk_scp *scp)
>   	size_t send_offset = SCP_FW_END - sizeof(struct mtk_share_obj);
>   	size_t recv_offset = send_offset - sizeof(struct mtk_share_obj);
>   
> -	/* Disable SCP to host interrupt */
> -	writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base + MT8183_SCP_TO_HOST);
> -
>   	/* shared buffer initialization */
>   	scp->recv_buf =
>   		(struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
> @@ -138,7 +135,7 @@ static int scp_ipi_init(struct mtk_scp *scp)
>   	return 0;
>   }
>   
> -static void scp_reset_assert(const struct mtk_scp *scp)
> +static void mt8183_scp_reset_assert(struct mtk_scp *scp)
>   {
>   	u32 val;
>   
> @@ -147,7 +144,7 @@ static void scp_reset_assert(const struct mtk_scp *scp)
>   	writel(val, scp->reg_base + MT8183_SW_RSTN);
>   }
>   
> -static void scp_reset_deassert(const struct mtk_scp *scp)
> +static void mt8183_scp_reset_deassert(struct mtk_scp *scp)
>   {
>   	u32 val;
>   
> @@ -156,17 +153,29 @@ static void scp_reset_deassert(const struct mtk_scp *scp)
>   	writel(val, scp->reg_base + MT8183_SW_RSTN);
>   }
>   
> -static irqreturn_t scp_irq_handler(int irq, void *priv)
> +static void mt8192_scp_reset_assert(struct mtk_scp *scp)
>   {
> -	struct mtk_scp *scp = priv;
> -	u32 scp_to_host;
> -	int ret;
> +	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
> +}
>   
> -	ret = clk_prepare_enable(scp->clk);
> -	if (ret) {
> -		dev_err(scp->dev, "failed to enable clocks\n");
> -		return IRQ_NONE;
> -	}
> +static void mt8192_scp_reset_deassert(struct mtk_scp *scp)
> +{
> +	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_CLR);
> +}
> +
> +static void scp_reset_assert(struct mtk_scp *scp)
> +{
> +	scp->data->scp_reset_assert(scp);

I think we can call scp->data->scp_reset_assert(scp) directly.

> +}
> +
> +static void scp_reset_deassert(struct mtk_scp *scp)
> +{
> +	scp->data->scp_reset_deassert(scp);

Same here.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
