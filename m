Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53507C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4/LBbiinZasmIZrXDr+6xgM7JCbyAXzzBB3RhFJswc=; b=jeX8a47pjCB64l3dL8cJtZVsyZ
	YYY32JQI7ARVYY3DOkfMllvZoJ8cLMNvde6ynBL/DHLvHEPyBqBPFE81H7HdCbjfjcylIvMc5Nwso
	ZRBeUpzYElPhv3WW2iRhz1wA2GGfX2KFQMECVoNNZLDl3Hvy6ZpDVkK8I/IlF90SReT19gBNGN0WB
	ggYotvBFCIcgWPg9u8Xz1WiJZFrnr7g5xVxpSVv7cz4Hs/oI5zqU0+botA8k/nloNg00nCKHkQr7j
	w4YupzKhrrFOnTlP6KDSbcp0mnW4V0tTn4+an/cLnEHl3oHWuozF8hvHzP1+yIwHti6/QjNwJpb6d
	wnPtaiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofMi4-006JV0-Bk; Mon, 03 Oct 2022 14:46:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofMht-006JQn-M9; Mon, 03 Oct 2022 14:46:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 294EF6601B15;
	Mon,  3 Oct 2022 15:46:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664808367;
	bh=/FVS6/5ZqbbGMxW7m+yjSMkIk/Rq9l4aAT/jU6ZOLi8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bDkm/xCNVzSoHPEJRFO6q0zI5aXmON0x0NiIPKzlxTQWF4MoIUWzskOaJ3hFEaFk9
	 ODY7fHFNegpei8JwOC40L/cjUjItWdY0qaYiWy3md+w4eriBBAM572M4SAD+0prbsF
	 sN9PNTD8AG8jLtXSDlUeTxP0zIb2pKAg3+XD0dzeETTqf0Y2dRu0P3vQplZ0gwhC04
	 9a+1BHe4r746PKNIXXMSmlwRzO0Hx/CiJ1OCpADCBxyg0XWwDAOIP5YYtVdBhdcsbg
	 H0aXa+sQTJgabIPLEhO7sjGLmHo1NuJ6DbVXhplWQ46fXumAZgbXfyWxRD5pR2yFh8
	 oMlmi7fzQ+Qvw==
Message-ID: <e3f751e4-4cca-e869-5b7b-45205f0f12c1@collabora.com>
Date: Mon, 3 Oct 2022 16:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] dt-bindings: mfd: mt6370: fix the interrupt order of
 the charger in the example
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, matthias.bgg@gmail.com,
 sre@kernel.org
Cc: chiaen_wu@richtek.com, cy_huang@richtek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <9dda705a8d67826306f6c6129722d3ad8edc96fc.1664816175.git.chiaen_wu@richtek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <9dda705a8d67826306f6c6129722d3ad8edc96fc.1664816175.git.chiaen_wu@richtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_074609_960957_BDAC8A7A 
X-CRM114-Status: UNSURE (   7.84  )
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

Il 03/10/22 11:04, ChiaEn Wu ha scritto:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Fix the interrupt order of the charger in the binding example.
> 
> Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



