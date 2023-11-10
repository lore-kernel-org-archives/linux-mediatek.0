Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28860C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUE0QJHjYN9cNUDBWcfDOVw1kDV1YRUDKPdEdDD6n2Y=; b=R58a/aOnQ6RFmY6hUeA0hDOqZq
	gC5bZsKq+PY6VU+1Gw5G/MQUU5DtNnJNdcq18PC+ztHF7C0sIaoRsEuPLjU1yO2D1CQdbU6RCqSqK
	xXlZDQNvaNqwZ3YYAxSqbzipT0UZ/x7eUBb67mn8l2hj0yttQvfyxOduKHBEzEED6H9ZQm9b9bUzK
	ikTGXLZOPw+xhZDLF7ktcYBYvz7IISn969EZT5M0ThPHSIoUFc0qca/YFQDA5emRMTC0L1TqMtjz7
	CCiVzLEnPzf6fkWWuvZvNkbqg2YqnG1YfK2nSMD9g1oMc1hzLYHAdkVMGMi9CIi8s1bEGfjxbzq9u
	hvsPuV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Nli-008BEL-0K;
	Fri, 10 Nov 2023 09:25:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Nle-008BD4-1Y;
	Fri, 10 Nov 2023 09:25:35 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 13A0F66073D3;
	Fri, 10 Nov 2023 09:25:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699608333;
	bh=n3+n4ksLRFYR42r5lq33koWRbtaxd52htHZoJWv8Q2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mOD4VV5XkUr+52siDkPiIOaMx3IS3FOP/uD/XzskUk9EQBcQ5ReyAB2vNY+Dt52Ed
	 fVRkhuhHFSlJf5wGMZpBtOMVTXkftf18t0vYFYBuQasAjWad71XARhpmz6ghjaRwUA
	 ifI2jPLDFhheIv2D2IUHNNzfCYYzMKVlz2Jk+jjuf0Pw82JjbvrggCk3F50xfZg782
	 R9m83Ernj1bylVxDMyqT6TDZKsU9nifIDCOdHsDPfIqwn4NSCyHMIDOB21YpJuKtDn
	 QSK/n2BYzQdLt5B6N5+IR2WA7dO0crqUpW97Fs8SAhZnABE+zSle1oi0erDWOeBClK
	 g0dSUGCaQIbug==
Message-ID: <78109ad6-afbc-46eb-ba25-b4fc35c59c3c@collabora.com>
Date: Fri, 10 Nov 2023 10:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 19/56] media: dvb-core: Do not initialize twice queue
 num_buffer field
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
 <20231109163512.179524-20-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231109163512.179524-20-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_012534_652558_D7B56572 
X-CRM114-Status: GOOD (  10.84  )
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

W dniu 9.11.2023 o 17:34, Benjamin Gaignard pisze:
> The above memset already zeroed all the ctx fields, it is useless
> to do it here again.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/dvb-core/dvb_vb2.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index 3a966fdf814c..167ff82a6fed 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -167,8 +167,6 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
>   
>   	memset(ctx, 0, sizeof(struct dvb_vb2_ctx));
>   	q->type = DVB_BUF_TYPE_CAPTURE;
> -	/**capture type*/
> -	q->is_output = 0;
>   	/**only mmap is supported currently*/
>   	q->io_modes = VB2_MMAP;
>   	q->drv_priv = ctx;
> @@ -177,7 +175,6 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
>   	q->ops = &dvb_vb2_qops;
>   	q->mem_ops = &vb2_vmalloc_memops;
>   	q->buf_ops = &dvb_vb2_buf_ops;
> -	q->num_buffers = 0;
>   	ret = vb2_core_queue_init(q);
>   	if (ret) {
>   		ctx->state = DVB_VB2_STATE_NONE;


