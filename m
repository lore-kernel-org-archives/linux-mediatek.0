Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A964ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulOZAUmit6BkkV78coxViSV5L7KIV3X34AcPjU/1+Xk=; b=nmRmMvovqIBM/45fzp058v2+Zx
	GGSFaUOMhQXmTyJo2yw0BPmOwv2d1dP56avFLYn9R9T5FFrfPwyKj2MKPjtReCVaUcTy+g9lO/Gt/
	OANAIQPVnMIf7BVp/0m8csrKGwVegjxvidkGvQo59KsjOfuPwlN73qDMRA3gL+0d7kot7P2hKJBzX
	tpaszo/Xx986JuP3AGlv6uzgjbWkldXeW5hJbKi3qvhHmgHrtyS9Eod1BTkAddq4+3A37YqmswMHR
	oZW4jip4LCp9KbUb1NSRcp02GEv0OuWLm7rsMDiE7YprJBx5zYxBGQkZI/CB+JwXsRSKdPOdfeIBZ
	BoAG//8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJ5A-004wqS-6P; Wed, 31 Aug 2022 08:28:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTIzS-004u7v-AP; Wed, 31 Aug 2022 08:22:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BD1126601A13;
	Wed, 31 Aug 2022 09:22:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661934144;
	bh=icm/XqsM9PV/fPpno6t23gERjpfmgfqXHBCT1ID9Gfc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lqdhmblp+a9HG/yl8wGkOvItUJSUOxTeTWLQ3ziPLN/7YSmANMWsXqNifudme6opp
	 FBV4wSuXMocnCZW55OEnyHjHyO4qCzJNgdZTn8FWrSkB+M5Ab0sJYiRPG0srQRGPvr
	 TZh6iCqOZU8YVoaaVR0vu83c/aClGaY4AW0Y8wkwSl1ILKAPSVQW6ygBmkeju3diYj
	 etw4+YyRnDRi2ggOAjTRUlwapUVc3dwbSj7Zc00vLkAj4TtyprYXKkAFwp0Rb3uYAC
	 4WM7c7kmCWEVtgz5IwdTKmakWhLCR1k/HU9b8hS7PLZ65AEkZ2HFZ2kJutbwXRd4nA
	 +2n5u1DltHBLg==
Message-ID: <de5ea5b4-1fe3-0e83-7620-f039bcb75bd2@collabora.com>
Date: Wed, 31 Aug 2022 10:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 4/7] phy: phy-mtk-tphy: disable hardware efuse when set
 INTR
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
 <20220829080830.5378-4-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220829080830.5378-4-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_012226_729000_E371178B 
X-CRM114-Status: UNSURE (   7.52  )
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

Il 29/08/22 10:08, Chunfeng Yun ha scritto:
> INTR's value is able autoload from hardware efuse by default, when
> software tries to update its value, should disable hardware efuse
> firstly.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


