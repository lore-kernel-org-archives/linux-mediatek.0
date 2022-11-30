Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCA2C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKAwywMBrR4lqlBjjyNSUzpugTODKhbuD4X55nHPtiI=; b=udKNiH/nlGdWwlMe5nyxjAGFND
	ZSfSWY2NrMs4nssw2nRbuBJILcwcyuEisX6JO6l6LSjRLVrpFYalDf64bwM1gNGjfQNh3Xzqp6DY1
	+W9F+UpeiHf0L2xxfb/XZtOe0zg5H6o4/XW+lSkLDq+U9elpVEkvB6597DHKcUSbVuUXscNmb3Z2B
	Ro3opjfzG0lrs49YfWgEqytH1GfHWbU4gfHF+Cm4A38t1YgMjPu8lSc316d7YaLioS560GtZWqUWp
	VqNeH0qYBW5rXs5Fi4aZkOp9QZ9hjOgFIE0Wx3bCihPYzt7w8psJh1bNu2QVJHz/rBVksbSpmdZpL
	oLDAJhYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JEP-00Evnq-EL; Wed, 30 Nov 2022 09:18:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JE3-00EvfM-A6; Wed, 30 Nov 2022 09:17:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 852496602B30;
	Wed, 30 Nov 2022 09:17:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669799872;
	bh=oJk0u1gvG6u0fT9jRnNEv5n4mqHGBTjbT57397eebF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mMe6SC6y4lpt55TGa348e93vzjkCAwifANM0Yu8ItP0UmwwdsYsmts3ySRUblZUru
	 gGDxZcTMkf8u7/IvPDjRqlS1yGWH2fm3bhpCTtfnXu/Cw1iLtI+l/lr8gZMMPKnUhd
	 mxATiBmdOxu1idai30XIURtwvdLp51WDspFLBrkskKDIZcmpkbJua+OO76bs969g5n
	 Q+gzbqxxyYcQnbGNzRS2IbBkKbN3k/Y58XjR++JqP23XbZclF6Wows0vL6rCTMhqVC
	 5yT1aAFacOFylrgWtpktXOXaU6vvozgQSOKcTr9tB8e9AU4WVwu0BfM1uwbUZd/Uvo
	 OiwWAL77RWYDA==
Message-ID: <88f21574-1a41-3231-3aa7-e6285ac14fc2@collabora.com>
Date: Wed, 30 Nov 2022 10:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 6/6] drm/mediatek: add mediatek-drm of vdosys0 support
 for mt8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, lancelot.wu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 amy zhang <Amy.Zhang@mediatek.com>
References: <20221129143503.16638-1-nathan.lu@mediatek.com>
 <20221129143503.16638-7-nathan.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221129143503.16638-7-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_011755_647233_9337C55D 
X-CRM114-Status: UNSURE (   9.05  )
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

Il 29/11/22 15:35, nathan.lu ha scritto:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> add driver data of mt8188 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>

Since series [1] was explicitly requested by maintainers...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=699386


