Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEB5C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDRcKBXbcrfo/WvIIu4D+6dm1RFHvAOSwTzFPPJ9QeQ=; b=tc99zMkRjPEFfdGrhL4hPWbX9G
	geNKSwgKPFzYgI50DZAPgeIx//BdfiFGVgWnQ71gHOdMTpE6xLirVuhFnSzZj98chP1SVZP1gRafq
	NBR2GCim6A9g0191WGe8WEZCuJujipM5IwjUxQOf/ynYtlFCKWK0oiBIbSOkR7WhJaTZAZwN6zBGf
	heHTzwtkEnUqFFRGYRmFx7P8l9x4dZd6/AiS2MLDwgAK54zrBvfF65kaLueBmK6pDGjok5NZfGbzN
	frjes62Usr+bSg9zCBbKrIObjxxe+hn6PhxtSvMEJQ/v9WwXjV+bSKK4yME5qB9KFyeHyc/2pDnzj
	cj/vW9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiwt6-00Bc9W-OI; Thu, 13 Oct 2022 12:00:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiwsn-00Bc4v-Vb; Thu, 13 Oct 2022 12:00:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A0686602365;
	Thu, 13 Oct 2022 13:00:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665662406;
	bh=8i7vdv//BJKK0S1wRFfGIN/8B9XDWEMWI/LVdDLpwDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U+mzLfjraQ/CX+Hn/X//dazUYZlz8ll7EN+npmpTR1JCftljrqhIwr0zsQHoPl/k7
	 ycNI8mSwZ7d1ypgkB8CggoSAbj6d7eP1lIWfycnCuenzANzhzcRt0EjbXcfr02nFNi
	 K215KnAtGMt4oyfp4MG0auMebqPWX90ek5+czVWOucJeE8Af+J9X24cpE+t40uqT2e
	 cYufECGaWF3I69R/4uTx0W5WGh1XeksxScyTsKcBxJRECjRi+3A7s77TQJkh/mg0gm
	 pA7+k+2qy0kNckETpDm1GSgOGc1BvXC1pBosZVVG6WOHKB9qwBQeFNvyifRNg8k0tP
	 DhaONbSKsFHig==
Message-ID: <98d2ac4b-5b87-d22f-8929-4392b43d51a8@collabora.com>
Date: Thu, 13 Oct 2022 14:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4 4/4] clk: mediatek: Change PLL register API for MT8186
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 kuan-hsin.lee@mediatek.com, yu-chang.wang@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20221013112336.15438-1-johnson.wang@mediatek.com>
 <20221013112336.15438-5-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221013112336.15438-5-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_050014_281641_48601BB3 
X-CRM114-Status: UNSURE (   6.10  )
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

Il 13/10/22 13:23, Johnson Wang ha scritto:
> Use mtk_clk_register_pllfhs() to enhance frequency hopping and
> spread spectrum clocking control for MT8186.
> 
> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



