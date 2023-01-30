Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC3EC54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45f+p6ZBmtLX8SRU0RdoUJu51VqYhMTO55s/TBj2ync=; b=sgFc4fCuNF/4VhFoij8JcpeFJ6
	VfEBaS2spxKCJ0Qnwcbq5OOXKFUv1EwNHP0wG3ffzt+/U9KzD7UhorFCjR2P4VMta+mNpbk7q9Qol
	tgQa8b8lBmkSxg6C+YFGkIQB+ylzkEtCWe7fNXSTBuezkJXMHhP1qEa9kdIh1JOhVCzTg66syRkTJ
	uCGn4n1a4XlhfFvkEvrASA+yQyEKsqs7khCO7EXwkEu0rXe31rKOm4K5YSMA0OVu/xcL2R7TGd67r
	PXAJfDkVPsEjPCwCozDrIKU/xGBpEzvIhtoKeSzerMNma9EwNCD1g743SeNlKLkX2RflyritE4vss
	NyALqTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYE4-004gbc-QZ; Mon, 30 Jan 2023 17:45:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYBN-004fOA-LF; Mon, 30 Jan 2023 17:43:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 23F046602DE5;
	Mon, 30 Jan 2023 08:48:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675068485;
	bh=MAOqAEBgvD2S1zgCqv5KXxmSTBg+M7tmyplC/Cf1sGw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NP7QWvQxoOQkrIo0DZJ7Sg5w18iN59deoI2jBB/vL01Xn5gvIqHvsxacTRznFwI7p
	 74eAziL8fL9go2YFlVeRHH4aGgB4WEUVgrG1MixdfKXL9FSna3M/+Mm7kTGrcGKsqJ
	 picheY74gSByXoBTbnYRemseiYKHl2ue//HRKBUZ4mZJn9bNezv3pEix1Ynq+X1iEA
	 Zc5K1d1h2Msjb+TlKf6JqPn1YAGHJ3UQIXIEGLq3kCvU4+whIoSp4umC/0WCI29ZqM
	 Yu0nkBbQWVgqNdop+3gEzuidFoQAb0QTscsKmao4AyTH8SNPJ8aLeZSg8RJGPSocwW
	 O5vdsodF0039Q==
Message-ID: <136a6c96-6bff-8860-c2e9-5e484c75867a@collabora.com>
Date: Mon, 30 Jan 2023 09:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 00/23] MediaTek clocks cleanups and improvements
To: Miles Chen <miles.chen@mediatek.com>
Cc: chun-jie.chen@mediatek.com, daniel@makrotopia.org,
 devicetree@vger.kernel.org, fparent@baylibre.com, ikjn@chromium.org,
 johnson.wang@mediatek.com, jose.exposito89@gmail.com, kernel@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 msp@baylibre.com, mturquette@baylibre.com, nfraprado@collabora.com,
 pablo.sun@mediatek.com, rex-bc.chen@mediatek.com, robh+dt@kernel.org,
 ryder.lee@kernel.org, sam.shih@mediatek.com, sboyd@kernel.org,
 weiyi.lu@mediatek.com, wenst@chromium.org, y.oudjana@protonmail.com,
 yangyingliang@huawei.com, Mingming.Su@mediatek.com
References: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
 <20230130065141.2117-1-miles.chen@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230130065141.2117-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_094305_966958_FADAB261 
X-CRM114-Status: UNSURE (   6.51  )
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

Il 30/01/23 07:51, Miles Chen ha scritto:
> Mingming has tested this series on mt2712.
> 
> Tested-by: Mingming Su <mingming.su@mediatek.com>
> 

Thanks everyone! :-)

Cheers,
Angelo

