Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311D6CD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 07:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZ/KBS+dKxVximA5pwK8Fi7Vb6KSNHRbMCPABVOfYmA=; b=wxx9i7BogmvgYhaKalcnfgbck3
	BJbVtDkbor7SSa01H/SW5laHQIbmIc8BhT0eccPK2SObtsylJV9A/6KrNyMUDAOSjZvMtWg4/5Par
	k2tjHm/HQ7tH1lWHT0y3aH077PODOMHXbke13wBW+WslmTxWUCNTnh9mMVYgVkCFJMNvJzGUqmlzO
	8+V6n2b/1Mi4dcysCzsX4dLMpYoYoziPi9v+xURgm/cMUGN6n32x18ANv73qcsrezC2nKDM8Z6Qnz
	AuSS0vu8lrLsJ6FgP+z5KbTHqlUC6TMvVZxpzFgAxAdJ+ECGzkBEHL1TWUT815hUxRaV+ukdgP1Ez
	5Z5B7ppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruovw-0000000Ar75-443a;
	Thu, 11 Apr 2024 07:33:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruovt-0000000Ar62-1aop;
	Thu, 11 Apr 2024 07:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712820794;
	bh=3sGA9MB5pLcCWit1QbpGnkamKVpv7+p8ZIGvmvFBuQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4Kh5IMSBc2jCi654TdE6ycwEwMZCimoiD73XuAFAfIMeRpHDO/htAJykGO+ccFxjW
	 Bgw9PmkakiLoLaDtnLaraQVqy7nPVEw6mf5sDhY635nAlQgyKZ+bo23Ae8bSWXuxj1
	 rOW/6YkMriRP+DrbfiIHwnjLojgK0yyAt4+cEWJ6CIWMoR3J3Zr3/vRWqqiG8HkeIu
	 Eint2ocLbkNTuo2V0Cz8ltUibxXCp4hV3LjlzMIhlXft2HqRCbDxNEtBkoMctj9jMH
	 pwqgCQCKEybWbAFyhOS1XmqBNh7Nm+2cBy6i6rfei2Rf0o5Vx8D309SOA5XcKLSGc4
	 5DkD5RYVXXXwQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 21C373781107;
	Thu, 11 Apr 2024 07:33:13 +0000 (UTC)
Message-ID: <81df5533-5cae-46a0-bacf-91b1a246147c@collabora.com>
Date: Thu, 11 Apr 2024 09:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: mediatek: Support MT8188 SCP core 1
To: "olivia.wen" <olivia.wen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-ch.chen@mediatek.com, yaya.chang@mediatek.com, teddy.chen@mediatek.com
References: <20240411033750.6476-1-olivia.wen@mediatek.com>
 <20240411033750.6476-3-olivia.wen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240411033750.6476-3-olivia.wen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_003318_090988_E1D64C51 
X-CRM114-Status: GOOD (  26.04  )
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

Il 11/04/24 05:37, olivia.wen ha scritto:
> To Support MT8188 SCP core 1 for ISP driver.
> The SCP on different chips will require different code sizes
>   and IPI buffer sizes based on varying requirements.
> 
> Signed-off-by: olivia.wen <olivia.wen@mediatek.com>
> ---
>   drivers/remoteproc/mtk_common.h    |  5 +--
>   drivers/remoteproc/mtk_scp.c       | 62 +++++++++++++++++++++++++++++++-------
>   drivers/remoteproc/mtk_scp_ipi.c   |  9 ++++--
>   include/linux/remoteproc/mtk_scp.h |  1 +
>   4 files changed, 62 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 6d7736a..8f37f65 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -78,7 +78,6 @@
>   #define MT8195_L2TCM_OFFSET			0x850d0
>   
>   #define SCP_FW_VER_LEN			32
> -#define SCP_SHARE_BUFFER_SIZE		288
>   
>   struct scp_run {
>   	u32 signaled;
> @@ -110,6 +109,8 @@ struct mtk_scp_of_data {
>   	u32 host_to_scp_int_bit;
>   
>   	size_t ipi_buf_offset;
> +	u32 ipi_buffer_size;

this should be `ipi_share_buf_size`

> +	u32 max_code_size;

max_code_size should probably be dram_code_size or max_dram_size or dram_size.

Also, both should be size_t, not u32.

>   };
>   
>   struct mtk_scp_of_cluster {
> @@ -162,7 +163,7 @@ struct mtk_scp {
>   struct mtk_share_obj {
>   	u32 id;
>   	u32 len;
> -	u8 share_buf[SCP_SHARE_BUFFER_SIZE];
> +	u8 *share_buf;
>   };
>   
>   void scp_memcpy_aligned(void __iomem *dst, const void *src, unsigned int len);
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 6751829..270718d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -20,7 +20,6 @@
>   #include "mtk_common.h"
>   #include "remoteproc_internal.h"
>   
> -#define MAX_CODE_SIZE 0x500000
>   #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
>   
>   /**
> @@ -94,14 +93,14 @@ static void scp_ipi_handler(struct mtk_scp *scp)
>   {
>   	struct mtk_share_obj __iomem *rcv_obj = scp->recv_buf;
>   	struct scp_ipi_desc *ipi_desc = scp->ipi_desc;
> -	u8 tmp_data[SCP_SHARE_BUFFER_SIZE];
> +	u8 *tmp_data;
>   	scp_ipi_handler_t handler;
>   	u32 id = readl(&rcv_obj->id);
>   	u32 len = readl(&rcv_obj->len);
>   
> -	if (len > SCP_SHARE_BUFFER_SIZE) {
> +	if (len > scp->data->ipi_buffer_size) {
>   		dev_err(scp->dev, "ipi message too long (len %d, max %d)", len,
> -			SCP_SHARE_BUFFER_SIZE);
> +			scp->data->ipi_buffer_size);
>   		return;
>   	}
>   	if (id >= SCP_IPI_MAX) {
> @@ -109,6 +108,10 @@ static void scp_ipi_handler(struct mtk_scp *scp)
>   		return;
>   	}
>   
> +	tmp_data = kzalloc(len, GFP_KERNEL);

I think that this will be impacting on performance a bit, especially if
the scp_ipi_handler gets called frequently (and also remember that this
is in interrupt context).

For best performance, you should allocate this at probe time (in struct mtk_scp
or somewhere else), then:

len = ipi message length
memset zero the tmp_data from len to ipi_buffer_size

memcpy_fromio(....) etc

> +	if (!tmp_data)
> +		return;
> +
>   	scp_ipi_lock(scp, id);
>   	handler = ipi_desc[id].handler;
>   	if (!handler) {
> @@ -123,6 +126,7 @@ static void scp_ipi_handler(struct mtk_scp *scp)
>   
>   	scp->ipi_id_ack[id] = true;
>   	wake_up(&scp->ack_wq);
> +	kfree(tmp_data);

There's a possible memory leak. You forgot to kfree in the NULL handler path.

>   }
>   
>   static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
> @@ -133,6 +137,7 @@ static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
>   {
>   	int ret;
>   	size_t buf_sz, offset;
> +	size_t share_buf_offset;
>   
>   	/* read the ipi buf addr from FW itself first */
>   	ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
> @@ -154,10 +159,12 @@ static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
>   
>   	scp->recv_buf = (struct mtk_share_obj __iomem *)
>   			(scp->sram_base + offset);
> +	share_buf_offset = sizeof(scp->recv_buf->id)
> +		+ sizeof(scp->recv_buf->len) + scp->data->ipi_buffer_size;
>   	scp->send_buf = (struct mtk_share_obj __iomem *)
> -			(scp->sram_base + offset + sizeof(*scp->recv_buf));
> -	memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
> -	memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));
> +			(scp->sram_base + offset + share_buf_offset);
> +	memset_io(scp->recv_buf, 0, share_buf_offset);
> +	memset_io(scp->send_buf, 0, share_buf_offset);
>   
>   	return 0;
>   }
> @@ -891,7 +898,7 @@ static int scp_map_memory_region(struct mtk_scp *scp)
>   	}
>   
>   	/* Reserved SCP code size */
> -	scp->dram_size = MAX_CODE_SIZE;
> +	scp->dram_size = scp->data->max_code_size;

Remove the dram_size member from struct mtk_scp and use max_code_size directly.

>   	scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
>   					   &scp->dma_addr, GFP_KERNEL);
>   	if (!scp->cpu_addr)
> @@ -1247,6 +1254,8 @@ static const struct mtk_scp_of_data mt8183_of_data = {
>   	.host_to_scp_reg = MT8183_HOST_TO_SCP,
>   	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
>   	.ipi_buf_offset = 0x7bdb0,
> +	.max_code_size = 0x500000,
> +	.ipi_buffer_size = 288,
>   };
>   
>   static const struct mtk_scp_of_data mt8186_of_data = {
> @@ -1260,18 +1269,22 @@ static const struct mtk_scp_of_data mt8186_of_data = {
>   	.host_to_scp_reg = MT8183_HOST_TO_SCP,
>   	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
>   	.ipi_buf_offset = 0x3bdb0,
> +	.max_code_size = 0x500000,
> +	.ipi_buffer_size = 288,
>   };
>   
>   static const struct mtk_scp_of_data mt8188_of_data = {
>   	.scp_clk_get = mt8195_scp_clk_get,
> -	.scp_before_load = mt8192_scp_before_load,
> -	.scp_irq_handler = mt8192_scp_irq_handler,
> +	.scp_before_load = mt8195_scp_before_load,
> +	.scp_irq_handler = mt8195_scp_irq_handler,

You should mention the reason of this change in the commit description, or better,
you should make a separate commit with a Fixes tag for this.

>   	.scp_reset_assert = mt8192_scp_reset_assert,
>   	.scp_reset_deassert = mt8192_scp_reset_deassert,
> -	.scp_stop = mt8192_scp_stop,
> +	.scp_stop = mt8195_scp_stop,
>   	.scp_da_to_va = mt8192_scp_da_to_va,
>   	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>   	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> +	.max_code_size = 0x500000,
> +	.ipi_buffer_size = 600,
>   };
>   
>   static const struct mtk_scp_of_data mt8192_of_data = {
> @@ -1284,6 +1297,8 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>   	.scp_da_to_va = mt8192_scp_da_to_va,
>   	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>   	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> +	.max_code_size = 0x500000,
> +	.ipi_buffer_size = 288,
>   };
>   
>   static const struct mtk_scp_of_data mt8195_of_data = {
> @@ -1296,6 +1311,8 @@ static const struct mtk_scp_of_data mt8195_of_data = {
>   	.scp_da_to_va = mt8192_scp_da_to_va,
>   	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>   	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> +	.max_code_size = 0x500000,
> +	.ipi_buffer_size = 288,
>   };
>   
>   static const struct mtk_scp_of_data mt8195_of_data_c1 = {
> @@ -1308,6 +1325,22 @@ static const struct mtk_scp_of_data mt8195_of_data_c1 = {
>   	.scp_da_to_va = mt8192_scp_da_to_va,
>   	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>   	.host_to_scp_int_bit = MT8195_CORE1_HOST_IPC_INT_BIT,
> +	.max_code_size = 0x500000,
> +	.ipi_buffer_size = 288,
> +};
> +
> +static const struct mtk_scp_of_data mt8188_of_data_c1 = {
> +	.scp_clk_get = mt8195_scp_clk_get,
> +	.scp_before_load = mt8195_scp_c1_before_load,
> +	.scp_irq_handler = mt8195_scp_c1_irq_handler,
> +	.scp_reset_assert = mt8195_scp_c1_reset_assert,
> +	.scp_reset_deassert = mt8195_scp_c1_reset_deassert,
> +	.scp_stop = mt8195_scp_c1_stop,
> +	.scp_da_to_va = mt8192_scp_da_to_va,
> +	.host_to_scp_reg = MT8192_GIPC_IN_SET,
> +	.host_to_scp_int_bit = MT8195_CORE1_HOST_IPC_INT_BIT,
> +	.max_code_size = 0xA00000,
> +	.ipi_buffer_size = 600,

I wonder if it's more sensible to add a new struct instead,
so that you can define

static const struct mtk_scp_sizes_data mt8188_scp_sizes = {
	.max_code_size = 0xA00000,
	.ipi_buffer_size = 600
};

...and then reuse like

static const struct mtk_scp_of_data mt8188_of_data_c1 = {
	..... stuff .....
	.scp_sizes = &mt8188_scp_sizes
};

...that'd be more important for mt8192, 95 and the others as those params
would be reused many, many times.

>   };
>   
>   static const struct mtk_scp_of_data *mt8195_of_data_cores[] = {
> @@ -1316,6 +1349,12 @@ static const struct mtk_scp_of_data *mt8195_of_data_cores[] = {
>   	NULL
>   };
>   
> +static const struct mtk_scp_of_data *mt8188_of_data_cores[] = {
> +	&mt8188_of_data,
> +	&mt8188_of_data_c1,
> +	NULL
> +};
> +
>   static const struct of_device_id mtk_scp_of_match[] = {
>   	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
>   	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
> @@ -1323,6 +1362,7 @@ static const struct of_device_id mtk_scp_of_match[] = {
>   	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
>   	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
>   	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_of_data_cores },
> +	{ .compatible = "mediatek,mt8188-scp-dual", .data = &mt8188_of_data_cores },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index cd0b601..4ef5491 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -162,10 +162,12 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>   	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
>   	u32 val;
>   	int ret;
> +	size_t share_buf_offset;
> +	void __iomem *share_buf_io_address;
>   
>   	if (WARN_ON(id <= SCP_IPI_INIT) || WARN_ON(id >= SCP_IPI_MAX) ||
>   	    WARN_ON(id == SCP_IPI_NS_SERVICE) ||
> -	    WARN_ON(len > sizeof(send_obj->share_buf)) || WARN_ON(!buf))
> +	    WARN_ON(len > scp->data->ipi_buffer_size) || WARN_ON(!buf))
>   		return -EINVAL;
>   
>   	ret = clk_prepare_enable(scp->clk);
> @@ -184,7 +186,10 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>   		goto unlock_mutex;
>   	}
>   
> -	scp_memcpy_aligned(send_obj->share_buf, buf, len);
> +	share_buf_offset = offsetof(struct mtk_share_obj, share_buf);
> +	share_buf_io_address = (void __iomem *)((uintptr_t)scp->send_buf + share_buf_offset);
> +
> +	scp_memcpy_aligned(share_buf_io_address, buf, len);
>   
>   	writel(len, &send_obj->len);
>   	writel(id, &send_obj->id);
> diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
> index 7c2b7cc9..344ff41 100644
> --- a/include/linux/remoteproc/mtk_scp.h
> +++ b/include/linux/remoteproc/mtk_scp.h
> @@ -43,6 +43,7 @@ enum scp_ipi_id {
>   	SCP_IPI_CROS_HOST_CMD,
>   	SCP_IPI_VDEC_LAT,
>   	SCP_IPI_VDEC_CORE,
> +	SCP_IPI_IMGSYS_CMD,

There's no mention of the addition of this new IPI ID in the commit description.
Please write something about it.

Cheers,
Angelo

>   	SCP_IPI_NS_SERVICE = 0xFF,
>   	SCP_IPI_MAX = 0x100,
>   };




