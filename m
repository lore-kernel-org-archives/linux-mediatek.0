Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852A1C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 12:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ji0UdkrqyzP2dxIb/3QWDvEBhxVcr/mmF2hegzW6A+I=; b=jUhMRZJvwBaIIoe4CpMPK1EAw5
	89knh0zNLbTrUgnWH9ou5qqlYN1zjxY7ug14Ay7tGoqDvDOzedi7WTbpihd50bCKzM0Inz0ZjEXpO
	JcXWtSqZBwIeeca2L1B3gHnhNVAI25NmWKbPTgBQl2Q3m5zV4qfii8VVnQqK/G+zXJ46TYzjJzAs7
	AGQ/UnbFHfByrNz6F2kh1wEAIMaJLyftAQAOjWx3GFeq56HA21LIOFUy6VyyXRJfEm77e5J2bDbSe
	mR3Xe1tTsCQssGdosCvAy54J3lDeRhb6vtyFZq7kipSRYE76zq+XzVjmi75V+BLsLlOL8lh5OIRwy
	FRLVO1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCJfv-00B9NQ-Kf; Mon, 02 Jan 2023 12:12:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCJdm-00B8OB-WB; Mon, 02 Jan 2023 12:10:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 02BAA6602CBE;
	Mon,  2 Jan 2023 12:10:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672661403;
	bh=Szu3pezz+cwLvsORip1aCRA+/v5edhrAwToqmNZGsgc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=eEgnHTwCQciC72vlpuRAY6qXfFhkMJTcxrzpvjD6OsKqfHrh5z/JiqPrFrJzZpueL
	 y+yarL4xa9sS2EDTAmiPuMLrLyZ+2n52PEe05pFJAtZnv2BA323hAnCItXB4XgNXfo
	 hxvK0SMHxRipPBsUUVsu8lqDrhbhd7HQsAkuGp1HsqYCOqmQZA2A2wKuVobpfASmR+
	 nQ5x4nhEbvNu1gUrhypexB6gnNf3X8WAbEymWYPiONgMk5IfiXhk/ZMtAOuOyWhOTP
	 Y2Hbs/X6zcSwurmSOWeGczgdRzlZcUn8zIGiqPz8+Yx8bI8ET2pJw42Xkux/Fiji6W
	 7CW6jnF8z/lsQ==
Message-ID: <0cb19a13-452b-2a4d-9f35-e4179d9ce220@collabora.com>
Date: Mon, 2 Jan 2023 13:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 5/7] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC
 bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
 maz@kernel.org, lee@kernel.org, linus.walleij@linaro.org,
 matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, allen-kh.cheng@mediatek.com,
 nfraprado@collabora.com, sean.wang@mediatek.com, zhiyong.tao@mediatek.com
References: <20230101220149.3035048-1-bero@baylibre.com>
 <20230101220149.3035048-6-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230101220149.3035048-6-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_041007_309972_350BF483 
X-CRM114-Status: UNSURE (   7.78  )
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

Il 01/01/23 23:01, Bernhard Rosenkränzer ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



