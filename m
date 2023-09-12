Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826E8CA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 09:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrTiKWSurW3c0S9a2fG3MnSs7O2949Ur1yIn1VGqCkw=; b=zwcqp/i4o1FC0HbKakvrqMn+Pl
	vn4IOEZTrAwhcusU1SjByO1C7eBSTFiTEEzX6eySlyhD6o4locT/qKdFNhcbSfF8Dxo4QCgb3D8hZ
	GZWzm0GJcvPa3H7sDAaLw5r5gRiiUNFSd6pUJ0AS4xrDFoKTW9P09v99q3T89R9rPJqS0szUGxjI8
	YxlZVb1DaELZwLGNY87Z1atH35YF2fhXvwNlrTbOLExhRSWy0dzq+1TJkdq7PWqnCvfYD8Az/c2jt
	Dy40G9cZ2Jk+xD7+KjYo9FeV5ZQ3SEp1e1b1ngYlafrs4fyWZ2eS8x86uC3Wc1KI5ulxZqnUmhIvH
	QHtcS9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzl1-002kYY-1W;
	Tue, 12 Sep 2023 09:32:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzky-002kWt-0K;
	Tue, 12 Sep 2023 09:32:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B76C566072F2;
	Tue, 12 Sep 2023 10:32:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694511146;
	bh=nboqvOkj/fOk7wG5yLQU5h6H3bj8HNMHs3m8cZuPp8g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=leOPTMb+UgyVQ7uNRBIbc4bummxwqu0liVI46DPr3hA0ZMaSkS1CjLtz/mqVft49Z
	 xFjyoG767NLmgk7EBBdlhCvsO3Te6WxU7aeBJuYEPJfvmXBPzhVmf0BzY9sGPYGJxL
	 5RJTGwtBTYBNd98Ovs9eDiZRp5+fdCSF3shUiUH3eRJC+DAQDfbV0qnzMeWvlAlD54
	 1M/ycX4PoO5ZP+QtowvQgTv5u2NktAquPZCBeJDafxev3n8eNkbQuSci0wkphL+en4
	 lo9PKMFdN0ZAuIQs+tFZnn3yahQ/wGOOoIblTuDuIQTkM4pWBpJBtG8Bi4FwWsRYRB
	 NnAZEo8JCQtcQ==
Message-ID: <d798b15b-6f35-96db-e3f7-5c0bcc5d46a2@collabora.com>
Date: Tue, 12 Sep 2023 11:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
Content-Language: en-US
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?=
 <kuohong.wang@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-6-yong.wu@mediatek.com>
 <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com>
 <a115a2a5d3ac218e6db65ccdb0a1876f9cfca02b.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a115a2a5d3ac218e6db65ccdb0a1876f9cfca02b.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_023228_398253_79B8D9A2 
X-CRM114-Status: GOOD (  18.55  )
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

Il 12/09/23 08:17, Yong Wu (吴勇) ha scritto:
> On Mon, 2023-09-11 at 11:29 +0200, AngeloGioacchino Del Regno wrote:
>> Il 11/09/23 04:30, Yong Wu ha scritto:
>>> The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't work
>>> here since this is not a platform driver, therefore initialise the
>>> TEE
>>> context/session while we allocate the first secure buffer.
>>>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>    drivers/dma-buf/heaps/mtk_secure_heap.c | 61
>>> +++++++++++++++++++++++++
>>>    1 file changed, 61 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-
>>> buf/heaps/mtk_secure_heap.c
>>> index bbf1c8dce23e..e3da33a3d083 100644
>>> --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
>>> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
>>> @@ -10,6 +10,12 @@
>>>    #include <linux/err.h>
>>>    #include <linux/module.h>
>>>    #include <linux/slab.h>
>>> +#include <linux/tee_drv.h>
>>> +#include <linux/uuid.h>
>>> +
>>> +#define TZ_TA_MEM_UUID		"4477588a-8476-11e2-ad15-
>>> e41f1390d676"
>>> +
>>
>> Is this UUID the same for all SoCs and all TZ versions?
> 
> Yes. It is the same for all SoCs and all TZ versions currently.
> 

That's good news!

Is this UUID used in any userspace component? (example: Android HALs?)
If it is (and I somehow expect that it is), then this definition should go
to a UAPI header, as suggested by Christian.

Cheers!

>>
>> Thanks,
>> Angelo
>>
>>
>>> +#define MTK_TEE_PARAM_NUM		4
>>>    
>>>    /*
>>>     * MediaTek secure (chunk) memory type
>>> @@ -28,17 +34,72 @@ struct mtk_secure_heap_buffer {
>>>    struct mtk_secure_heap {
>>>    	const char		*name;
>>>    	const enum kree_mem_type mem_type;
>>> +	u32			 mem_session;
>>> +	struct tee_context	*tee_ctx;
>>>    };
>>>    
>>> +static int mtk_optee_ctx_match(struct tee_ioctl_version_data *ver,
>>> const void *data)
>>> +{
>>> +	return ver->impl_id == TEE_IMPL_ID_OPTEE;
>>> +}
>>> +
>>> +static int mtk_kree_secure_session_init(struct mtk_secure_heap
>>> *sec_heap)
>>> +{
>>> +	struct tee_param t_param[MTK_TEE_PARAM_NUM] = {0};
>>> +	struct tee_ioctl_open_session_arg arg = {0};
>>> +	uuid_t ta_mem_uuid;
>>> +	int ret;
>>> +
>>> +	sec_heap->tee_ctx = tee_client_open_context(NULL,
>>> mtk_optee_ctx_match,
>>> +						    NULL, NULL);
>>> +	if (IS_ERR(sec_heap->tee_ctx)) {
>>> +		pr_err("%s: open context failed, ret=%ld\n", sec_heap-
>>>> name,
>>> +		       PTR_ERR(sec_heap->tee_ctx));
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	arg.num_params = MTK_TEE_PARAM_NUM;
>>> +	arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
>>> +	ret = uuid_parse(TZ_TA_MEM_UUID, &ta_mem_uuid);
>>> +	if (ret)
>>> +		goto close_context;
>>> +	memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
>>> +
>>> +	ret = tee_client_open_session(sec_heap->tee_ctx, &arg,
>>> t_param);
>>> +	if (ret < 0 || arg.ret) {
>>> +		pr_err("%s: open session failed, ret=%d:%d\n",
>>> +		       sec_heap->name, ret, arg.ret);
>>> +		ret = -EINVAL;
>>> +		goto close_context;
>>> +	}
>>> +	sec_heap->mem_session = arg.session;
>>> +	return 0;
>>> +
>>> +close_context:
>>> +	tee_client_close_context(sec_heap->tee_ctx);
>>> +	return ret;
>>> +}
>>> +
>>>    static struct dma_buf *
>>>    mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
>>>    		      unsigned long fd_flags, unsigned long heap_flags)
>>>    {
>>> +	struct mtk_secure_heap *sec_heap = dma_heap_get_drvdata(heap);
>>>    	struct mtk_secure_heap_buffer *sec_buf;
>>>    	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>>>    	struct dma_buf *dmabuf;
>>>    	int ret;
>>>    
>>> +	/*
>>> +	 * TEE probe may be late. Initialise the secure session in the
>>> first
>>> +	 * allocating secure buffer.
>>> +	 */
>>> +	if (!sec_heap->mem_session) {
>>> +		ret = mtk_kree_secure_session_init(sec_heap);
>>> +		if (ret)
>>> +			return ERR_PTR(ret);
>>> +	}
>>> +
>>>    	sec_buf = kzalloc(sizeof(*sec_buf), GFP_KERNEL);
>>>    	if (!sec_buf)
>>>    		return ERR_PTR(-ENOMEM);
>>
>>


