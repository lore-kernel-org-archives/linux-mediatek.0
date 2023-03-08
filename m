Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5816C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhU73HR5YzKTtYJKBW1FV9MF3vEGbPB4tKqo6KDIXek=; b=wfwgpRBDdJOIJnt6WmmAZAgacC
	Lh2ByNECz3fdMNQjEKFJHHztSiNKbYCEhzxTty1VWcLNWdTkzVeTxf8WLNH4tzqQjysSgcR6s8p1n
	fc7sa5u6IxMeSZM2T5HEgEYMVcvKovwOlzbweU3cnaRorkKJbW6hCyHQ6AbHv5ezCBplmtD5JmBkQ
	5bbUiKf+vbAp/BXtiRYR6Yv4Rge85Lg/rrksrrLGN19blav6MM+ngRVDW4EBttW8bLsg9dTXimfsr
	yDGvSuF5Uzq47Q5bAJlbzveFS70Dj7skdr9rTiJfT1yx5SnrdYLDCAEXki9ihq+IeurVVh7sRhgCv
	1p+1a/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpsg-0048SG-Oy; Wed, 08 Mar 2023 09:14:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpsX-0048QI-LQ; Wed, 08 Mar 2023 09:14:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 879CE6602FE7;
	Wed,  8 Mar 2023 09:14:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678266872;
	bh=ufIfZplrAvq48akm0xlpo2QYks+rqP+EvBycvF6XRtk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cklbuY+l4wzRVIpVXTp8xZiMU7kAjX1f9fpMxpT3cS57EQJeBPKoWAX91KN8vp+SA
	 iOjH7h4aqrChuf4SKSreZyDS78D9C4i8o5fXQR2H9dVybuoc4j6NvOJGDXeVrRUPaV
	 ouiT70nOQl3eIzqgBHFfs7itFgk2nmK54UiEzAhv7YPAViU0P4Rzcpc0f1tY/2xxLs
	 5newQa2tPOhOZ7QaZetgN4gg2BvFZxr4XPMUV28Mr001QYkvTgNJYb9vqyVHsnUdg3
	 gJxbslPV4T4IJ8NnIlnCWgXOIAFaWAa8CDA6XZCZMBvEOAZdk95rZh5InkkR1/1rZE
	 whXKqg72fPwwQ==
Message-ID: <1031de17-d9fe-49c0-40f7-172a4448f1d8@collabora.com>
Date: Wed, 8 Mar 2023 10:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] dt-bindings: thermal: mediatek: Add AP domain to LVTS
 thermal controllers for mt8195
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
 <20230307154524.118541-2-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230307154524.118541-2-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_011433_860269_DF221755 
X-CRM114-Status: UNSURE (   6.99  )
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
> Add AP Domain to LVTS thermal controllers dt-binding definition for mt8195.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


