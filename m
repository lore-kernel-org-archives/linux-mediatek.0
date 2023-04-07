Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0B1C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gaXlLh8cwZOQrp8Rm7QIB+S1qSFPvUUn19YLNojgNI=; b=nKVWwdhZlWquSHsNjpOlmTUOjz
	qj7nTK1uDGWH14yzU/vqODD7VP7lerHPXIbQdKLrCYFtqdPBAByo13oj2oNrHUGvoe5mPFpStXqL8
	rx3jhR8rcfw9CuTfjiY5P1goq4kaEd+15vGWxTiMUB3Zp/W0Jn5R5G+3PiWA+/b58jM6cvkcrONUq
	mjMmEzwqjUsA2MD73CiozYE7rTCmcVX4nuZGiUY/gOTIGRybWNgQW6nl+SPYNqav4Jj/ER6rAX+a9
	bK4rVRtUKBg+RegrL5O+ol117y9MX+/dSIrZZzrsW3cMog78997iuzN+DYMY+d/8uTTT7LKYfwks3
	n1ILKxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pki2Z-009alg-04;
	Fri, 07 Apr 2023 09:05:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pki2V-009ajs-1F;
	Fri, 07 Apr 2023 09:05:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F49F66031A4;
	Fri,  7 Apr 2023 10:05:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680858341;
	bh=ihDpS1C8ifdPeqPbaRwwTr4z57Oxfl0MWMqrSxRIr88=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KAlt6vi5uqooX0WbF8idpPJRftDhvYyARnJ8hFKPfb973zMODRVCPQmukExdwrPzI
	 QxZLEqlBqDrAzm5oovjFFelKkjRcMnbalmQz4mWVxQQJlrKw9y9zMkkU0iA5slqhqv
	 OQUWIQZjkY6gajWG5njDXqO/JVtyiLcuEHdc6ejFRrINTnw8Mnx+wtu+PBxmHcvhBT
	 jrNZAGs4cY3DIKNwn/8HG7t/0Gj05kkxrHowrps9/Fk8lau6deeqpnnEyzuWDdt38x
	 uvnr0cPvpnPo3b1gR3chFfcgkIZ+yzu4n8wA6OOLU7/jIcpB3J9Y1CO2lGq4XLkCZ2
	 BLUb0xOStWL0g==
Message-ID: <70025536-8699-be95-15cc-1d2f9051c74c@collabora.com>
Date: Fri, 7 Apr 2023 11:05:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/2] usb: xhci-mtk: add optional frame count clock
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20230407062406.12575-1-chunfeng.yun@mediatek.com>
 <20230407062406.12575-2-chunfeng.yun@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230407062406.12575-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_020547_652353_7070ED35 
X-CRM114-Status: UNSURE (   6.99  )
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

Il 07/04/23 08:24, Chunfeng Yun ha scritto:
> Add optional clock frmcnt_ck used on 4nm or advanced process SoC
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



