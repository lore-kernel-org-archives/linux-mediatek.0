Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AEEC63797
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzvRr7+qSbRBGmC6DxktWmbAyP+NeusclYIImbNcM0w=; b=1ZpE6s/3oYwS3cn7M1xsXirvAH
	dXWXqbptaTpz/fuJMBP3WahBUbX9peAtbRbZH3MR8NjQmJLR+r6k1t7g6mPl9aYkAoO7nylbNFtrD
	jfaG9ATOJ8motyrpfW5ePmZ2EFK/dOz4zMZ81Dmmbvv8QlY63ipEmKl5XLxUuGQrUQFJoZZa+em6V
	1gbdCvTsY+3lDC90quCSEMXATSzUwIbntTLj0mWIxUHX+hsxO3etKE3VVJjvnxGMZ+BB4yJGbeLdg
	XDzvbBm6PUoaVvd1m6AaLDhfmnEcm/S9cb48P3zbe/6kaXCn/Th9plNIQXWhZrkyxPEpwG8C9cRZl
	pLo1JrYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlTv-00EGFS-JI; Tue, 17 Jan 2023 12:54:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlTs-00EGE5-Ph
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 12:54:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FD246602D6D;
	Tue, 17 Jan 2023 12:54:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673960063;
	bh=ybDJyEsG2p+R9ociVobtOJpRk9E5EtsX4W0/x3OP+ew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vnk4EWG8K9v1Y/gB9LAZUAnVWTN/KJw6vtAnMJq2914rYBX45sPCTMx970KDY53tN
	 C4JuKvANepXMZk5MGNea4SwAhoyURhJ/Ok0sdKyHx7+i/pP0wu0qgdgYAVQLNln+ln
	 Ut6mVSv/A+avgThCmZqSzlIojxXjruBFgyvBntBwgjF6u9QbvFIyedY4I2xcT0Av3u
	 k1py8FSEGIktQ+Zi8UQi3wg6D52iwlR8Jo44UdPRvpQLnLR5D0yvpgnj6OJHE3sux0
	 N6mO97U0bLN3RisFepHXpT1jAYbasmWnqCYz1gIyUigCjYvUVraduFKxz5xwIjZrg8
	 dY5IK6+IFwg3g==
Message-ID: <6e95eb4f-614b-7b09-38ad-d23212ef81b3@collabora.com>
Date: Tue, 17 Jan 2023 13:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] wifi: mt76: mt7921: fix rx filter incorrect by drv/fw
 inconsistent
Content-Language: en-US
To: Deren Wu <deren.wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <b9ebeda5d445f66fceb17c48c8251093dfe94c57.1673947063.git.deren.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b9ebeda5d445f66fceb17c48c8251093dfe94c57.1673947063.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_045425_005938_AA09243A 
X-CRM114-Status: UNSURE (   9.53  )
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

Il 17/01/23 10:30, Deren Wu ha scritto:
> From: Neil Chen <yn.chen@mediatek.com>
> 
> The rx filter, in mt7921 series, may be changed in fw operation. There is
> a racing problem if rx filter controlled by both driver and firmware at
> the same time. To avoid this issue, let mt7921 driver set rx filter by new
> command MCU_CE_CMD_SET_RX_FILTER and allow the firmware controlling it
> only.
> 
> Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Neil Chen <yn.chen@mediatek.com>

For MT7921E:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



