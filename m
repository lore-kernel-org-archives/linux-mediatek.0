Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E272BC25B4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx5E5Mzo/qWyR7x+/3K2vO9hp0Z3rFzlYL0dFcbYiXc=; b=cD/CPx/g3njt/YXYEJ6lwfiX1R
	qgG3SsRp6SgNOv3qQSYsahA9KdL/OzIvC1CqsLl7cjPbLT8sOP1D0LKfYF45L+UcXpIYnQuNWF/wp
	ZH8hPCMGAz6rka2eAejndfOkteX3gkbOwRxpVScVUcnhteMuxMH7csMKxJvDWv7uKmcICQ+sO7T3z
	VVl/NSBcYKrqArCB1fbTmdGEAJBI+j6pSj98o4ujGQ/XKKg4qufJGF2cERvAWT6tOy8uENot7lgC7
	emNwctpuSOlHsGblqC2zAnNfC49VH8EnM83yb8YHOKbcC8Jppl9zBSchuioU9ZacG674V6OHSVfxy
	d2CGH1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zAp-00000007cjy-3xgH;
	Mon, 06 May 2024 14:18:35 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zAl-00000007cgc-1poI;
	Mon, 06 May 2024 14:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715005106;
	bh=Vi05QVSG3iatwDAILN86QUEWJ3fE0RrPn+kvsUCWGws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qZNk2uVI+pZGR3kmAAkImZwSLKE9T+TahIUXH14Y7DA0Pnhl54iALE4oXsJK4KjMq
	 l3djJ5Ie/y8OAuQJelPxMxPTHk/toXDpEj+cBGquJK5jnoHgZg5RTsXXrsN8/rXtmA
	 0FTxMdNRP/UOBcTJ2JRvdnjmqjOIM9FXNe35X/pyLiOiQi3u98e+N5EiyRLdbb4qzo
	 lvVgqpKVoTWeQ39JSe9EJUrwwbL7iP3bIzwK3o2nZNR+xPMAXap5I7bNRijl+zO/e+
	 ICB9MvXQkAU51lwau8PqYmHqQMG+Le3wdbXBgrYcFS14L6RxnoinEbMJ2PeTQb+zs0
	 zNGjrTFn187Kw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4BD99378020D;
	Mon,  6 May 2024 14:18:25 +0000 (UTC)
Message-ID: <2e3e49ff-8ace-498b-b2d0-54500e6f1e70@collabora.com>
Date: Mon, 6 May 2024 16:18:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/mediatek: Add support for OF graphs
To: Michael Walle <mwalle@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com>
 <608fdbde-ad06-45ec-9771-18aa9f002f2d@collabora.com>
 <D12H4GDJJEUF.1Y91H9RMUIX20@kernel.org>
 <50be68dc-b86a-4334-9f83-43c6fda2c271@collabora.com>
 <1b8fa907-b48f-4ebe-bc17-3de1d7c0d062@collabora.com>
 <D12LA0QKEFRQ.68TZEVQZ7FJB@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <D12LA0QKEFRQ.68TZEVQZ7FJB@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_071831_670501_B641DD8C 
X-CRM114-Status: GOOD (  12.01  )
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

Il 06/05/24 15:17, Michael Walle ha scritto:
> Hi Angelo,
> 
> On Mon May 6, 2024 at 1:22 PM CEST, AngeloGioacchino Del Regno wrote:
>>> The problem with this is that you need DDP_COMPONENT_DRM_OVL_ADAPTOR... which is
>>> a software thing and not HW, so that can't be described in devicetree.
>>>
>>> The only thing this series won't deal with is exactly that.
>>
>> Sorry, no, I got confused.
>>
>> The series *does* already deal with that, as the pipeline is built before the check
>> for OVL_ADAPTOR components, so that will get probed.
> 
> Are you sure? Because who is actually adding the OVL_ADAPTOR to the
> path? It looks like your patch will walk the graph and add all the
> components according to their compatible string. And since the
> OVL_ADAPTOR is virtual and doesn't have a node..
> 

I shouldn't look at code while having a flu.

	if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_DRM_OVL_ADAPTOR)) {

...but yes nothing adds the mmsys_comp for OVL_ADAPTOR.

Needs to be addressed, will do that asap.

