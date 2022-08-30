Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9A1ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 07:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3JASHS3q0hrwrIt7lTV+QySfNbNzzpyQNr/ik32lvI=; b=pXV4ztxUVn79Pui/3lUYZH0P9i
	oebnykM0FiEJBYG+mOVUFnumwBuqWGUQa7R5lzYG/YjQrYqFyOkia5t+jJtMQavSbTsXHePotFp3H
	srMVOHBu8l4gYilwss2xBpkyO2ciRRjtPrTLuuhfBQeRMK8exRhjr9u/QeRJnZ8k+iG3Zkgm0iCHF
	I+OaMfFXfbP3Wvea4Wt/EAqOhrgVP8lHLWhagtd9sfgi+sj2PUQ0Bh2oabWNmkSuQs3PnAdpJLQGj
	GvaVBovuIqFrxvTxuXhYcoK4Xy0V+izYRLNpRH3G/l9RoqRpCk287X2PdZVB1rOqW8cRLw/Zg9IDW
	nVdLw2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSw5x-00ExU9-Qm; Tue, 30 Aug 2022 07:55:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvza-00EuK1-Df; Tue, 30 Aug 2022 07:49:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 236936601F01;
	Tue, 30 Aug 2022 08:48:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661845738;
	bh=fT0227eahgGco+B/fdgFL8+iaRaRPcPQTjtJP9VXwnI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FrP3J6DFJ28dD3nRVTgN3pEQFXmoKE/0F+ZHVNW5n1268kyqEOkIFGJrfOjT45Zvm
	 Q4Rym35OPq/fjjud6jAA2JXepW0KcjWigcmDBCOUpjmoTJawQy45gptQjOAl+59Fop
	 3AR72y+MQmDowAOGLuQJd77CD0EpIwKTPoaH0ywXKu8lY7FSLrTnrlDraKR3TThVLP
	 +kJIVNT59bXhINlVZ6ay09saAZn93WR4VcfIrx0DLiDX2zEmeYXBl/xnF5qXCUJLTv
	 1u6jTytkku9ZL7kLBaC/UXkgbVJEBjDFK5U4BtLtfsNJTuyNT7v4l2X/HJcca3Y0if
	 L2NsGik/4h6bw==
Message-ID: <e3aa38cf-5779-eb56-83aa-d3089f17ff79@collabora.com>
Date: Tue, 30 Aug 2022 09:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: Add gamma compatible for
 mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_004902_637299_E6110D83 
X-CRM114-Status: GOOD (  11.45  )
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

Il 30/08/22 08:39, zheng-yan.chen ha scritto:
> mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
> current 9bit-to-10bit gamma-LUT.
> 
> This patch thus add constant compatible for mt8195, which means that
> mt8195 should only use specified mt8195 gamma driver data.
> 
> Also, delete related compatible from enum, to ensure that
> mt8195 will not accidentally get others' gamma driver data and thus
> cause fatal error.
> 
> Fixes: a79257bae9bf ("dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0")
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


