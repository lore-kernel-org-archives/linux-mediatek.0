Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9EFC87FCB
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Aug 2025 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79SZYQtqMomIncwxxLPz8D+UqJziEYyljpADLIr/5Vs=; b=PCcE0Jm8kgmJ/0
	MU+rYMfblK3JUObdo1OaUsqynND9l3BvurdPADDax+1laIFHFbTv5cvbLdmVH4yX0IuJ3I3gLsFIr
	DjlDJjsNXtCtd1nzD2Xe20S284fuKpzsy5uOb4k8RByT8uH/w64y0L9AxG0aS5xM6tCFfY1hDQhqO
	ECaEI32kw8dFYtcy4W99fHlEXTypX8E4g/EHsY9fbKG/El/IjQJRLZ1JcaerZCdEzYRw5SWRQDvam
	CTrNNttMWkWH6h9A5eJNEsaLnQD2BJ+ZfNjADVHxM+TjjTTM4BuujuramzB/gkd+5T9EzLwawDniY
	pwX8KHY7mK/zkgRzRGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkMF-000000059vm-3pVk;
	Fri, 01 Aug 2025 07:39:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkC0-000000058If-3iU0;
	Fri, 01 Aug 2025 07:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754033319;
	bh=jXYnqKd+evMLO6CdXgt/eiSiWPrES/uLOFR0c+/Ng1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yn+pVNuew58PUcsiidTiHFo6YO3PUcK4wnCs5F1lV+vwHfnMx/QXXLdYdpBMl3Z44
	 nHEgMMNpc+DogNWCPVIWvux0fT7edEKTJ2Y6gCuJXRt8sTF96ifOHmrlKyxBOlJrEy
	 k1BejyM4RzROH646ZXaLvyI1F046zUdrRtV8p07pzyww7qJZcMOZ23twBM7oSdXsQn
	 aBC6KHRUBnacIHI6RNY8Rwrk9LPSiJtZUNuLchABUmt4uOHer02BEHwp5WlaIg8F9u
	 9g6mGjue0qPQhzw0INM70tWhdKJNjedk/4mTPQ76a6dnpnqiHR+Jadl41U+PK6iHMQ
	 615It7xfCE+3A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 496BA17E130E;
	Fri,  1 Aug 2025 09:28:38 +0200 (CEST)
Message-ID: <ff101a12-2b71-4641-af57-f70f4055cd78@collabora.com>
Date: Fri, 1 Aug 2025 09:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] thermal/drivers/mediatek/lvts: Guard against zero
 temp_factor in lvts_raw_to_temp
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
References: <20250730152128.311109-1-laura.nao@collabora.com>
 <20250730152128.311109-4-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250730152128.311109-4-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_002841_076663_1D34AE80 
X-CRM114-Status: UNSURE (   5.49  )
X-CRM114-Notice: Please train this message.
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
Cc: andrew-ct.chen@mediatek.com, kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, bchihi@baylibre.com, colin.i.king@gmail.com, lala.lin@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 30/07/25 17:21, Laura Nao ha scritto:
> Add a guard against zero temp_factor in lvts_raw_to_temp() to prevent
> division by zero and ensure safe conversion.
> 
> Fixes: 6725a29321e4 ("thermal/drivers/mediatek/lvts_thermal: Make coeff configurable")
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



