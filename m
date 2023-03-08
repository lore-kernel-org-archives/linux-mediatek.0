Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7118EC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTvkgiiY7d0Plt+tVRgVmmrzyhstRUV0taIVzXBa+OU=; b=VCXFlVW9jRNts2fXQNABIVoG48
	uIh6Gy5l5k9QLFi+0p7BrbiVqVrzC6greEGpa/L2ZenPOGRmhcPH/D7fir6Ry0vhM5dZCEx/nuXdh
	PKekgzymewo2HEZxZWWf+s9+CyjufrkLfqn8i0e0jVDfZoBSHd4vYUw9CawIA78jj74dTW8fC51kH
	8cGd1GFnB39QU0cEyyftiwwbUbb4Ccxu0/ytNrkQsNW2s91nP6nSadMdZeG04o1Rzpg86f6aQ/2m7
	tuys/6zP9WfB5vaGA1ahAFcu1v9eyxlx2SYS/yYWjhvNZvhPBCEyOsuYAvH+iIo6O/0p/Qh4ybJWg
	A685+ARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZq1L-004Asa-Uw; Wed, 08 Mar 2023 09:23:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZq1B-004AnK-1w; Wed, 08 Mar 2023 09:23:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 457336602F64;
	Wed,  8 Mar 2023 09:23:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678267407;
	bh=U+HJXyXqRzPy3p9bMM3N1ZpF4TK3+TTbMJ+2LbwZJxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P+BQvWboNK40Asox6kFI7b6ND5JpJoEC1WwbXjm3KFTnZqLUfJLD67iYe3JErGGk3
	 vVe0v82mQfPS21MCcjkl7EX6Bm208MyAm1DgkV/IsfuDBLv29WKYdLiTYcOh7LnbeR
	 xPKx6ergtCnLOSaeiXxQtGCqvHBK2jCqWYz1zGV85lqJLEESn19KT/RWrD3mwT4PKz
	 Xh0jiv+emcJjdmjYunlW5x+60rpEhQwSm/9Eq+obwCNS8fgMDxVm9PkFsYUG2GkTsH
	 IWIW/CNJHk3gb8dJVX22jbYmExeL4S09YwSW0dQbRgmEUivZGezZFy8jsNew1mZEaR
	 yo1/JNo5VyIPg==
Message-ID: <fc59f0d1-e2e6-d5ba-ad4f-f67fb375c8ca@collabora.com>
Date: Wed, 8 Mar 2023 10:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] thermal/drivers/mediatek/lvts_thermal: Add mt8192
 support
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230307163413.143334-1-bchihi@baylibre.com>
 <20230307163413.143334-3-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230307163413.143334-3-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_012329_239566_5574BC16 
X-CRM114-Status: UNSURE (   7.54  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/03/23 17:34, bchihi@baylibre.com ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS Driver support for MT8192.
> 

Since you're changing that documentation twice now, you should split the
doc changes in a different commit: you will see the big picture if you
send just one series that introduces both MT8195-AP and MT8192 LVTS support.

You don't need two series for that anyway, so... please send both the new
MT8195 AP and MT8192 in a single series.

Thanks,
Angelo


