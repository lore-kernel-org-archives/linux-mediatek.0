Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6BCC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRzSNo9IWy/EZnjBxWetnQ/uENY6gSfb5cdCaact5js=; b=tNY36X1QHYaDO4nIsC629uAuGA
	dYGrCURhJ6oIBlbeIrvNV14L8tGBP4TC9USbvGSXPQk8b5brTpguEQjtLjeMDCi/cWijcIsbaZK8a
	cZjY/emd27P8FjWGgVI/oqpVJdWTePewsuJ+MiObPDQngijuwuIXAgwFpf+176JyV/HrQ8SqSbVz2
	fUpzt2uK88PpEWrWRs2kKWbXD6wJuzaMiob4r7q4GU856TpjRE2c+zXtP8ms3NAyXUAbQ2J8GfaFX
	LStOlTp/C7QzDecuPyvxJ7C9r/J853fxP9P3EH09aCBaWbp+qOeDk+eAo5Q9oQAAfOlvAVWrK5hcW
	60wmQLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpyR-004A6y-7W; Wed, 08 Mar 2023 09:20:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpyG-004A3e-Id; Wed, 08 Mar 2023 09:20:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EFF8F6602FE7;
	Wed,  8 Mar 2023 09:20:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678267226;
	bh=73rJvg7W14WyDpTmhSpu687atxs5alQGU3IfZe0NMPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZSySfe06ROQezX5uDxhZ/yQ2MKnleWm2IGEa74LY09V/9L6A2gDms2/TUOTUG3Wmm
	 SxjdEpWRbLdUpLg+0NBq1WCOMRzja76+V9VPhG103aZQe4cvdeZG7a2iZ0KiPcVJLJ
	 5GV5jtzZ9CTEB1qdVHriZ+Oom87yOHY60kSKWzNojz+h3vnKVDrbp1XPqxZBXTEwZH
	 MpX4pwtOo/TBpmQNmbTyYz0m2hwfIqRQGDUxvIUDfvRp0h/ItzwG6A3d06A5d11z60
	 1J/2lFlFZ6XwgazDH25bTCetPBYWLfpGXIqyqxERP8478wFEKJOx0e4rEOBloLC3/n
	 lg21mWQMe8Siw==
Message-ID: <f66fa9f6-ca62-09bb-a28e-c69efddf860b@collabora.com>
Date: Wed, 8 Mar 2023 10:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] dt-bindings: thermal: mediatek: Add LVTS thermal
 controller definition for mt8192
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
 <20230307163413.143334-2-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230307163413.143334-2-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_012028_747042_27659E9D 
X-CRM114-Status: UNSURE (   6.85  )
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
> Add LVTS thermal controller definition for MT8192.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



