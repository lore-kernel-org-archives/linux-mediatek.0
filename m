Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23067C7618D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 09:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YKJnzTo3XTttYZstY04xJudwig/50gMAkLse4hoqO4=; b=AXO7pMlZ4NUip7VhNksfV8l60T
	lZmlAlqgnzPWD+b1zK5VjRWSeUigPEfrtpCa0Brl/kSlCwduWScOtFzWA8z8ipHnxb5lHLf/yYJ2B
	8JXCyR+9wVzO+yM0A0TRGb5ToWkUw60kA/mREhER/dy2SsxqhGdjnvlTWig83Zc7uqYCaausNP7U9
	QXiVaHFeKrrRAxptnx2063WSC0OjFHM9khblIRlvCt6YjihqUM8YjfjgNHT15AbjeyoRU3f+7KW50
	MPsf/Q01m8M1/POKdaxPveWkzRmnvk2hPntTz4GJ4s/pr6Q9ZFQdZdSHS+vAtdQquPUK0Il/smg1P
	ebf+cUjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peBwq-008VdA-17;
	Mon, 20 Mar 2023 09:37:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peBwm-008VbU-2i;
	Mon, 20 Mar 2023 09:36:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5187B660212C;
	Mon, 20 Mar 2023 09:36:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679305015;
	bh=AqjpL/b1AU7J3DxLOJCIC6nSYPDchmaD5zguUd7vIlk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RReo38Sb8gmmE37OytUUMxmn1ToVArj1arV5E175vgnKY4RXtEAYVl3ICVeDbwWxD
	 Kexmpz39PHjIhJ6M+AZhOxDTkLbpo8/+S/3/3f6o3ehgvf1dc5bo2xEKYA2Kiy8962
	 ZNwr90V9pJWNwmwA9FhgoJT8y/TDkDuxfczJDiw07gOFSeAVmi3fZbBUp0DxoFm6S/
	 UnkGWF5ycXM7t1CL27OpgX/P3HvK8bnfuH2X8woVGrWO7vjum69gASymoTYNc8btlH
	 9uYhO+3YiWwlgTKi2pdW4Kci3uXViqCWxNRsldg0vpYUcwOPfEFxeQAGYSHpPM82ja
	 5KsSERUiaulVA==
Message-ID: <2ae1762a-ab5d-b81f-c03a-51221bdb81a4@collabora.com>
Date: Mon, 20 Mar 2023 10:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5,1/2] media: mediatek: vcodec: Make MM21 the default
 capture format
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230318035651.27454-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230318035651.27454-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_023657_007089_98701E20 
X-CRM114-Status: GOOD (  10.81  )
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

Il 18/03/23 04:56, Yunfei Dong ha scritto:
> Given that only the MM21 capture format is supported by userspace tools (like
> gstreamer and libyuv), make it the default capture format.
> 
> This allows us to force the MM21 format even when a MM21 and MT21C capable
> firmware is available (which is needed while dynamic format switching isn't
> implemented in the driver), without causing the following regressions on
> v4l2-compliance:
> 
>          fail: v4l2-test-formats.cpp(478): pixelformat 3132544d (MT21) for buftype 9 not reported by ENUM_FMT
>      test VIDIOC_G_FMT: FAIL
>          fail: v4l2-test-formats.cpp(478): pixelformat 3132544d (MT21) for buftype 9 not reported by ENUM_FMT
>      test VIDIOC_TRY_FMT: FAIL
>          fail: v4l2-test-formats.cpp(478): pixelformat 3132544d (MT21) for buftype 9 not reported by ENUM_FMT
>      test VIDIOC_S_FMT: FAIL
> 
> Fixes: 7501edef6b1f ("media: mediatek: vcodec: Different codec using different capture format")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Nicolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nicolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


