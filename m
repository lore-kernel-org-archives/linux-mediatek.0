Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5933BEE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQeSkv+Q54sdos2DE0g2bbF74XXbxp+hRUWi/b/zk8M=; b=JlKkcMwsLIehqtO8vYuBU3n69H
	qrXPnubTWBh41KC+vMfM0J/dWwrBRs5cz4/teiittBX9PyWLpRUb16gpM2UDrD09D8r1c4Ho1yuIQ
	d3OYRlBA5hJE47n7Ta5si+x++VpsnAQ/1GWDv0azT5F8BpE5cOAtz8ugTPLFB3ILJcY4XVDWStNSP
	El403J9cLInsQfecE45R8SuRNQtW6udVQaOTt1YXkKcRiqOauFd+yiwBEc4sc8vOc2tEeW8WpWyBM
	oorBz9FwutT7ARKxGPPOPa7yKkQGFuVNuuJ9K20ysMHQlWZmu2oSde3tanRjL57vu5zihdqlJ9mxy
	E5QVUk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdEZ-00014P-0b;
	Mon, 11 Sep 2023 09:29:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdEV-00013L-0Y;
	Mon, 11 Sep 2023 09:29:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C395966072F0;
	Mon, 11 Sep 2023 10:29:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694424565;
	bh=PEkfGXDLYefkrpep6+K+sw4moQH4wOvu/m6wtn7s7qE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hD8i4A7ygMbHzKh2hK4C8OTl2GKieKyk8xGbRPMbHh+6Zkrg0lQgfgxlDZy0HRUJd
	 hEdTk0obzK2Soq+CEJ+T+JLcwnOMUikk0wnKdLVr2vxOLzr9He7w7SYn4K1l3xO6fr
	 /9XwtvQteamqKIqH0Ua418zxn8O/3reRef2Tn5cfAgKXi2NjXIa4UZKoN2ylJKTJve
	 z8tii5c5OgY29mGF7N6lHal7ve+g93RN6lfW2DYL289Pg0knfDSwOkmhpzzOtW8o76
	 EsghCr6u9IYosm3Za/H5v2jfmV2KXgyoLBzSszsENieOawR8bwBqutUX73tcjMXs2U
	 3EGGiwISa2Ncg==
Message-ID: <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com>
Date: Mon, 11 Sep 2023 11:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 tjmercier@google.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-6-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911023038.30649-6-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_022927_504003_E2CBD845 
X-CRM114-Status: GOOD (  21.64  )
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

Il 11/09/23 04:30, Yong Wu ha scritto:
> The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't work
> here since this is not a platform driver, therefore initialise the TEE
> context/session while we allocate the first secure buffer.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/dma-buf/heaps/mtk_secure_heap.c | 61 +++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-buf/heaps/mtk_secure_heap.c
> index bbf1c8dce23e..e3da33a3d083 100644
> --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
> @@ -10,6 +10,12 @@
>   #include <linux/err.h>
>   #include <linux/module.h>
>   #include <linux/slab.h>
> +#include <linux/tee_drv.h>
> +#include <linux/uuid.h>
> +
> +#define TZ_TA_MEM_UUID		"4477588a-8476-11e2-ad15-e41f1390d676"
> +

Is this UUID the same for all SoCs and all TZ versions?

Thanks,
Angelo


> +#define MTK_TEE_PARAM_NUM		4
>   
>   /*
>    * MediaTek secure (chunk) memory type
> @@ -28,17 +34,72 @@ struct mtk_secure_heap_buffer {
>   struct mtk_secure_heap {
>   	const char		*name;
>   	const enum kree_mem_type mem_type;
> +	u32			 mem_session;
> +	struct tee_context	*tee_ctx;
>   };
>   
> +static int mtk_optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
> +{
> +	return ver->impl_id == TEE_IMPL_ID_OPTEE;
> +}
> +
> +static int mtk_kree_secure_session_init(struct mtk_secure_heap *sec_heap)
> +{
> +	struct tee_param t_param[MTK_TEE_PARAM_NUM] = {0};
> +	struct tee_ioctl_open_session_arg arg = {0};
> +	uuid_t ta_mem_uuid;
> +	int ret;
> +
> +	sec_heap->tee_ctx = tee_client_open_context(NULL, mtk_optee_ctx_match,
> +						    NULL, NULL);
> +	if (IS_ERR(sec_heap->tee_ctx)) {
> +		pr_err("%s: open context failed, ret=%ld\n", sec_heap->name,
> +		       PTR_ERR(sec_heap->tee_ctx));
> +		return -ENODEV;
> +	}
> +
> +	arg.num_params = MTK_TEE_PARAM_NUM;
> +	arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
> +	ret = uuid_parse(TZ_TA_MEM_UUID, &ta_mem_uuid);
> +	if (ret)
> +		goto close_context;
> +	memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
> +
> +	ret = tee_client_open_session(sec_heap->tee_ctx, &arg, t_param);
> +	if (ret < 0 || arg.ret) {
> +		pr_err("%s: open session failed, ret=%d:%d\n",
> +		       sec_heap->name, ret, arg.ret);
> +		ret = -EINVAL;
> +		goto close_context;
> +	}
> +	sec_heap->mem_session = arg.session;
> +	return 0;
> +
> +close_context:
> +	tee_client_close_context(sec_heap->tee_ctx);
> +	return ret;
> +}
> +
>   static struct dma_buf *
>   mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
>   		      unsigned long fd_flags, unsigned long heap_flags)
>   {
> +	struct mtk_secure_heap *sec_heap = dma_heap_get_drvdata(heap);
>   	struct mtk_secure_heap_buffer *sec_buf;
>   	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>   	struct dma_buf *dmabuf;
>   	int ret;
>   
> +	/*
> +	 * TEE probe may be late. Initialise the secure session in the first
> +	 * allocating secure buffer.
> +	 */
> +	if (!sec_heap->mem_session) {
> +		ret = mtk_kree_secure_session_init(sec_heap);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
>   	sec_buf = kzalloc(sizeof(*sec_buf), GFP_KERNEL);
>   	if (!sec_buf)
>   		return ERR_PTR(-ENOMEM);


