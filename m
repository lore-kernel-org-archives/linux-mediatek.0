Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8F5C71131
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKsoDkaWRyt+MO0xVCluSFtmkcvyQT1Ap5u13pBLHCw=; b=dh0ofxf8htVhQt
	L+H+sQ4FVkXoelWaBWMT+K/XXjZMuhuDXz5Qya5nhVLu/gUWe/DPZHeYq4dkV3PSg698oglf8t9CC
	JPqxjqtf+vHcizJWvGLnOz0OhDOZ4oZ5QGntRVW0LtsXBXS5lwd1qWe0Q9ZdI8QtlqG6ioZkfb+qk
	D1f1e9lcgD6efwAutDEaNDMCiZAOArJ4FKw0ArK2rGDv9fQKZu5q+//oSqeuf986YsLvOQb41CKwo
	UIjlCEA1Hu6jqPd/N4kBMbqHOeOsGX6Y0T9xSQwcw8OkruI2ut/PuEb09tknCBlXjd0CApJc2wJNK
	dfnAxCHtRlZlsYX6216Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMkv-0000000A9cj-2XQS;
	Wed, 11 Jun 2025 14:48:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqa-00000009UCb-2iGn;
	Wed, 11 Jun 2025 09:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634454;
	bh=FOlfdDe+uf3ideT45DVapQQIVFNVGe9nFtZmOza3q8U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ns1HNtIe7ESq+ZeiqmSrYo/NHEcdKC+QqzVjHIS3QDMpTCfiSubumWM+xYBnjxTpo
	 tXpW/PpBKRTxRHtolPcqxHkLoHzTV6MQiyyELq33qdz6KcFtzM2rCeTRuXaMKlojYp
	 AW1OreTPsKpeFLJAbb5oomsTsJgOH75tY2ymMdxCa4yBNO5+0Ou1eznkmXr3uO4FbX
	 KztC2vmU25ERWtbqg5YUcrRUgl0bIOajgWLSz8G3/ua7/2HXVO8mEjlkYLt5rQ6mML
	 c3cBkWpRYSHRFZbkbqbXcx29VdWi0aGPeo8CQxivdNUlx/Ze/AERhjTUQ5OcMx++W7
	 Eec2GrqGtiRKg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6282E17E05C1;
	Wed, 11 Jun 2025 11:34:13 +0200 (CEST)
Message-ID: <c978b62a-3d5f-40ac-a0ab-13d7c81eb9dc@collabora.com>
Date: Wed, 11 Jun 2025 11:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/13] arm64: dts: mediatek: mt7988: add cci node
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250608211452.72920-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_023416_830461_9FB5724F 
X-CRM114-Status: UNSURE (   6.96  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-pm@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Jia-Wei Chang <jia-wei.chang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/06/25 23:14, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add cci devicetree node for cpu frequency scaling.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



