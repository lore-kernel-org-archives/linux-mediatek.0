Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C6EC04A95
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkB5aIZK3teaegt1oquV29JAFau4dh8UmTNi8cjyZFM=; b=U0bKwxmEMftzHZYPCciV6oYb0a
	OpY1VWRdqVGzUEREtgqYlG6/nnS+GB7Hhtg1CCRqBBWVqKxlUbqdFaRcBwMVrK20RHCg6mZ1/iLAL
	PT3vJmiogdYVT9533MYfj4R62ooNOY7rb3vmkYN4FfOr0FDOjCt4kVnH2ncuekoBDolh2U1uiSEjT
	69kq0Ua1ugCWbpmqdDEU3Oz6hq7TV4u8RIeJed28DXwbfKyQTLeIcgwpLOH/6KwVJA24cf9VpBZSg
	iN86sLIfxinzBRlpbeM3+bbhRH/MC/s1duHiwieiKQfSL4ZCReOQ2A/CSDR/mgHmzq5zwzTJjFZcN
	8AvtM+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onHXd-004r3F-Qd; Tue, 25 Oct 2022 10:52:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onHXT-004r09-J7; Tue, 25 Oct 2022 10:52:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 501DA660239C;
	Tue, 25 Oct 2022 11:52:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666695125;
	bh=PMVyfTXXz2RxQ5+sDgXi8dSn2RmGdGRCI8cSLhiivU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XWqWfNSX8xTqgyFihTWBSAtDhvUH4IvZ1sNgJuA/HmOooZ1UqSelq2KwVEDPtClkg
	 MVaxo95eBg9w3cMdzG3UYpH3G+FI7LmuMbdBcOyN35NRu9CstWllURh5G/PYvpbQOv
	 x2x7DXoFOVXXbE04goYu+/nOCOS7ApOwS5LeipcMTl/t1VgbqTTrCzQmGczgHMhOh0
	 o55o45okgxet7XaQZISNEKlLp/JtCMm6SWlNpiAjmmFfJVx4609snC22kC3hwMU5l5
	 K8PZ3MK6daEwCrueN8muKvVqb+842dU7oV+kaY8ATqZp8Psieywv/sassBduH3/8da
	 CAJbwLLepdK5A==
Message-ID: <3b366319-5257-a536-4dba-919cb5fdf477@collabora.com>
Date: Tue, 25 Oct 2022 12:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 4/6] arm64: dts: mt8183: drop drv-type from mmc-node
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
References: <20221025074238.18136-1-linux@fw-web.de>
 <20221025074238.18136-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221025074238.18136-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_035207_790313_F70E35BF 
X-CRM114-Status: UNSURE (   9.13  )
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

Il 25/10/22 09:42, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This property is not defined in binding and driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

This commit needs a Fixes tag :-)

Regards,
Angelo


