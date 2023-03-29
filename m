Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05568C761A6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHzsXFE+x4Oiu7FuHmEJRBSMfBkXnYlbsHWyIm0YsTY=; b=pvZjsda2BUSnoYipK7eaftDXUn
	5BoAgaF/aML/WdVAthuP9CvpCOUURPbkrrpmQ68jMz6+JZALNbADtGA2gZQWMyOiEQDvLeWG/nvox
	9YvboBLBcsbFBzCJy+Fl+mT7e1gqVRQK2lptAGE1/aYTz9Dma91QK0FqdtnN7fJSv9KUvmN2bVdfP
	CT2LKiWShO2v0MrvxQ9Krey7JB6Bh6XTIo3L15vmfJ1wP00v9WIS0H+7JhTHkpzn6uOkQbt3tt0B8
	brCvZB/+EQRTlMXec/0DJd7/vbpJL463uSGHWfH9Ciy5tQBa2q4frwMzmlW62eCICdLbN+6nWj8WJ
	4/j/uu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVpe-000OOd-2W;
	Wed, 29 Mar 2023 13:27:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVpa-000OKF-0Q;
	Wed, 29 Mar 2023 13:27:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B1E8E6602173;
	Wed, 29 Mar 2023 14:27:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680096432;
	bh=YlchQTD6/N2HREmxAlqzI2OitwPTkfjBdD3p86qV1bE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C9pmFL09ug03q4gtl2NjGDAhQHoVYBMS5sTU02dkWCVjHMMY9qkZaqrTuhD/bhICs
	 Y7owZJQsqtD+eQsCBkcb9Jesmcu1o5xf5tSjxDeiHKmWeJ2D+3VaqK5J4xcqQd3Vvv
	 gQl+TINddgAoqEH0+D1fP61bJpRKXh2G5JCO1Ys2yf/CsQhxzJ5mS9sZvbb2sdfWbX
	 NoUBSYl3f/YL/YVDE9VH7MIlbx+9dgR7NGu2shshCJcm+PC1IJb7ws/oYXjAMH7oob
	 eccHy5xXT1D1nIyvSMxpOcpKvUTi4gP5+xhi7ZvRlWnFHXHv+MlC2OJZC2kg23sCf8
	 fmwBNZ//pUZUw==
Message-ID: <5a8fe1d7-6b07-cc00-146f-6961062b601a@collabora.com>
Date: Wed, 29 Mar 2023 15:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 12/17] arm64: dts: mediatek: add ethernet support for
 mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-12-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-12-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_062714_301493_6AA1F9F7 
X-CRM114-Status: GOOD (  10.07  )
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

Il 29/03/23 10:54, Alexandre Mergnat ha scritto:
> This IP is a 10/100 MAC controller compliant with IEEE 802.3 standards.
> It supports power management with Energy Efficient Ethernet and Wake-on-LAN
> specification. Flow control is provided for half-duplex and full-duplex
> mode. For packet transmission and reception, the controller supports
> IPv4/UDP/TCP checksum offload and VLAN tag insertion.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



