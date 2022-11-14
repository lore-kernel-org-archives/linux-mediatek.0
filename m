Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E03C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4u0ZJfCFzT1K9Svq1n0aYIqg9vCoAOjhEVz2z0mBCR8=; b=HZtfdFeXagvbLA7owaWUAW7m2u
	V1ucpnmXvA47NLyhYbLFr9jEk/b+/phUHxcAczGSegsAizWqohgWtx2Tk8pGsTQqPCBzl7LuLp/p0
	UZoKaHTvpeCS7biouAN9hpW/zpMd8MnVz1pdDk58T9LN0cEp/5V0LYJPursQoWVy9MMH3S9YewUol
	Vt+p59jzRcfE6SNUIsMbMIk8cikHTR+nrbRPNgRPrTH+IkJeZgO53/cbCUoHjb4ISy/StKPPjohup
	Vm0XUkWXoaWpWuQhcYY8uqwKShglUtnZ7H+/QFzazu4rakEK9UJgvlIdiW90T7HmIpVSa54SRBDe9
	6JvZcYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXxU-000XUz-JN; Mon, 14 Nov 2022 11:49:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXwd-000Wr8-Hz; Mon, 14 Nov 2022 11:48:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F047E6600011;
	Mon, 14 Nov 2022 11:48:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668426486;
	bh=CHmX+6E1YAk8g2efLPnEDW2jq7aJvIc2qx7njCDWAbg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ISGB3QcOomoqudIj399nDcXxYTJ8DKeaCP+uhPUoY+cXM/lZHsNohKf77Awfzu2/a
	 8Dt7/9iZb1tqOY+pxyRIq39mZUDMbAU8dNmuKhta45MgghP1E8ibH4LXEtkU0fb8UE
	 fwKn4EIRcBASFfKcdWer7AsZxfmkRpcwi40coz/OljJEBrTh58MW/QAozAQmP6tiKo
	 hs8VNCRc1tvNXD7nZtRRsc7GyjD5e7GCuDNkfWnNXm1aiAf+A8Z2gFFfw2MWHBxmui
	 xraihfTDjrQVHR6jFRGL+iWmbvVyAAVQd2xHmlhSoBkOZwHGuw+Fhn5+dXGRnch2sm
	 Hhpn0IA7LJMdw==
Message-ID: <afbf92c2-6237-f113-7942-7757be9773ba@collabora.com>
Date: Mon, 14 Nov 2022 12:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 09/11] arm64: dts: mt7986: add pcie related device
 nodes
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bo Jiao <Bo.Jiao@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Jieyy Yang <jieyy.yang@mediatek.com>,
 devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
References: <20221112091518.7846-1-linux@fw-web.de>
 <20221112091518.7846-10-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221112091518.7846-10-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_034807_771031_B75FB95B 
X-CRM114-Status: UNSURE (   8.32  )
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

Il 12/11/22 10:15, Frank Wunderlich ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This patch adds PCIe support for MT7986.
> 
> Signed-off-by: Jieyy Yang <jieyy.yang@mediatek.com>
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


