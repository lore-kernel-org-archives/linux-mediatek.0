Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25607C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv6WPB73sJR5gtr8T48K9RKMFll235BkKCSJlDk/x6s=; b=CDeAuRwE73398Syq4Ob4MJZ5NW
	K9yLtvanJ7zmtvyh4veunuCYFyB6Pd7cLSVovwqgW3/Esp8VYFN8fdjY8vePfyj+9jkC2i97C/XbR
	FPNzihcozOX2JnXFPXg/zQOr/jtyHfGubZh4gLtm5LVNf7ZajUAyrrqmXSq9GW0ineHoU8cViP/5S
	KhwgTVDk2/qSXgQiuqNw4YOeRJbopX5eefsElow99MMCW9ExKUGGrVvo+CH4XEXR+IebCnfw9grFB
	+sigM+rxo43yO9phy8VAVdtMIyF7ZHRXxozgBaUcy4WwXCmC+UWE2byWGDwFLoI8XvzFE/bk7/rCl
	9OHPUTzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZptY-0048lc-8F; Wed, 08 Mar 2023 09:15:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZptN-0048ga-Q5; Wed, 08 Mar 2023 09:15:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E39F6602FE7;
	Wed,  8 Mar 2023 09:15:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678266922;
	bh=fPTLQFHujY/oHUC/I3K9qqyVNGNAzjDCKWvze41sJ3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jf92UZEG/n2ScLk5Mzh1jykzYmXKZkEEJvFdfcrvXio2hJZm6Dlf/QZlZez6hXdRs
	 KCi3EdmDhdutGmLzHpchyCy/9eE3HkELdBpG6q7eh9TD/MA3JkCh634pN6aZvvaFhu
	 9PN07W87fFVKaQFc78Zup2w7H3JoilbpB/yVi9CbQ7l+woBOOy87Oyc9+2osDvCIC9
	 LIFflngramEmJTtqdP/YNJIfsjgDFyhALX/wh53yrH5j4rRa18Vo9YMDj2lpKOZwtN
	 nrzS7jzAahEq0fw23m/JnnASHQpmSydI9MYO8iH4gbfhzfN3RsOWbtIwXM/47xyd7J
	 aUoz507p4jKnA==
Message-ID: <6b1e9d19-b176-280d-0277-492120e3a1fa@collabora.com>
Date: Wed, 8 Mar 2023 10:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] thermal/drivers/mediatek/lvts_thermal: Add AP domain
 for mt8195
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230307154524.118541-1-bchihi@baylibre.com>
 <20230307154524.118541-3-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230307154524.118541-3-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_011525_982133_4578CF91 
X-CRM114-Status: UNSURE (   7.27  )
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

Il 07/03/23 16:45, bchihi@baylibre.com ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add MT8195 AP Domain support to LVTS Driver.

Please mention the documentation changes in the commit description.

Regards,
Angelo



