Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE172C6FA86
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTj9Zj93P/Srkj2blRQY2cla70M07ZyQ8SiYFMm3VQI=; b=nvBZSvHvfhJnJ5dxMqeixjILjf
	UfWBBKToPnvMyNlA7nrJnhwYt0/P5jdyApuwVpyz42mDnjndhHKNc+mZJ/TcGIJtav57cgQdDSjaq
	Og1Y/MW7Rmez6xXkhmdaO96NBOJVOXY8nrg17VTxLLa+HzMH/YitoZFcZyOhvPIRP8jGxKG7ZahUx
	LIfVEEL8OhlmFclFPGgLxz6bQH8C9PTX0G0IBQZ+pEYUT1oVHE3R3013wK0QuF2xWuTz8vzVYAmmV
	mh33I706kKJaEPXnyrf/qhoK0aUxx/e3oQvutw42IhdH9JyfcIP7rZFelds47ECIX2OW+XazB1fit
	6wJqsihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSDk-00Epiy-Ki; Wed, 28 Sep 2022 08:15:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSDC-00Ep6M-Jm; Wed, 28 Sep 2022 08:14:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 55ED26601FE2;
	Wed, 28 Sep 2022 09:14:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664352873;
	bh=ZTffMGvl6kR67yXKJkdyqTMDaVatMa+JdBfwAgN6EI4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dfS5YxyXVVsenZZOy7kWoQBL0sUwD6fKHrZtM2A0VmjyEqNPvds+qLvLtDQ8WWZw+
	 xJ83tNNsHv7kTvK3fR8FraBdC/6c2Gj+Mm9bUvgK4ZAqqGVSJvi9VfhmP0desROXpl
	 XU4cGlPjgDsMQAbJRbKBYkqNdxJXAlU2MxToFw3KHLIeXIY+R49H/rChA1/kZUCu4S
	 F6l4aEuN9DvgJ4w8TTPIgrfsDJK0SE2YxyJCW2aVGLVJNKcinPV+3aZGcefrezWdjN
	 yXMaTp9nr/4GzXnxZ69LIaIsiKlzNhw97lyNiELMxu7wCnwcd0iObyoDBz+9FQyidL
	 CkwlmxNj3LKAA==
Message-ID: <0e67041f-a61d-1e34-2ce4-6a199c2c9f8e@collabora.com>
Date: Wed, 28 Sep 2022 10:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 3/6] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220927152704.12018-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_011434_814195_D576BED2 
X-CRM114-Status: UNSURE (   8.11  )
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

Il 27/09/22 17:27, Jason-JH.Lin ha scritto:
> 1. Add mt8195 driver data with compatible "mediatek-mt8195-vdosys0".
> 2. Add mt8195 routing table settings of vdosys0.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



