Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D31EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 09:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfXex84x4+pKbYyWoWoo82/26U31C78oFgTQV1NX8Ts=; b=yXdtBixb8bm3J8KBcVKWWrtIlY
	uGbp7gdKVFg8in3qxR+wnektgkdqqHaukQ1L7cZESOAQgP05enWi2w7Dp9coZALXHf8GMnHNMfjU1
	z496DZkw1Ne/PDkw3jx3pahTYkEYv4PM+koQm/S80P7Ab0MvjWAeCdnIyhF6tM/NO6lD5yNu54+de
	ebI8vrtweL2090+ZlVfEdHHPNqacgqeeABw1+ihGVBT1ESeGe3y0ELzAbYro7yt7fdKRJ+db9WGxF
	mceXl+F604xmF1L4CwidNZMav1Dp3i3w1FkIMg2dJpwmXP3L2GLJ4mLxLgd9fdgWmJI/OAIlBAfse
	5MHsq1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKF1y-005fLJ-0z;
	Fri, 14 Jul 2023 09:24:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKF1v-005fKW-22;
	Fri, 14 Jul 2023 09:24:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F51A6600357;
	Fri, 14 Jul 2023 10:24:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689326642;
	bh=QFtwjZ7+j0imGIusFEtf/Z7au6dmUlgQo0NxyxN8Bss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nIIB7B3dDe76meN/ttrtJJOY4QHQj+y+FRJ6a8YyZzsg35mekdmT3MjJ0xuyl2eSG
	 tHPRaRwgy8dRmQBI/fFLHLhzCSF/2iE0fhxnf0y7YYCKqyrz6wS9wEG3Sp/tx2jERJ
	 7u+IoUmb6p4iBUlGLKbPnT4Bw6cbxhCHtXAOV242zwfGyre1ceuec0aQHilvfqdeTU
	 qW49EmEv84gOBm5fBX8SSMtjI9VoWjv87pe+n2ThI2RcppT5SdZ4mqf569cB1RaWDh
	 W/XaMmckYOzENiMjaSIQHoBERaV/buSF5XMsB7leeRdGQIbygFa40mmqWk01b17D1V
	 9JM3yR2FWvnmw==
Message-ID: <1ab4a9fb-caa4-f2c9-fbf4-d001e768dbe1@collabora.com>
Date: Fri, 14 Jul 2023 11:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Make readings
 valid in filtered mode
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Balsam CHIHI <bchihi@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Yangtao Li <frank.li@vivo.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230713154743.611870-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230713154743.611870-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_022403_796297_BD991FFB 
X-CRM114-Status: GOOD (  13.78  )
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

Il 13/07/23 17:42, Nícolas F. R. A. Prado ha scritto:
> Currently, when a controller is configured to use filtered mode, thermal
> readings are valid only about 30% of the time.
> 
> Upon testing, it was noticed that lowering any of the interval settings
> resulted in an improved rate of valid data. The same was observed when
> decreasing the number of samples for each sensor (which also results in
> quicker measurements).
> 
> Retrying the read with a timeout longer than the time it takes to
> resample (about 344us with these settings and 4 sensors) also improves
> the rate.
> 
> Lower all timing settings to the minimum, configure the filtering to
> single sample, and poll the measurement register for at least one period
> to improve the data validity on filtered mode.  With these changes in
> place, out of 100000 reads, a single one failed, ie 99.999% of the data
> was valid.
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Good to go!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



