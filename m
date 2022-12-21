Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C896C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6y657P3areZJsHtCwQfiKRSKAgoyazMr00GGXnUFgM=; b=mXa4CZJeGM6HpURHpKXR851Puc
	+f7/TZidz9Wx01PQGJkEg7AqTBGQpk6A7KEI5GYG4lBMztoTkXz5Cqajzo7clRfTyl4TbRceA2OqO
	qjAtAViC1pLcB99fKwLbDg+xO1zCeK/IkCQmcrCsdQ1VKkpAt0XFXExpbLp8A5LyaRgo0XFCgwtyK
	XawXyF1nNpFK2OFGsu8XQ92dxQUj0M0s1ih2cW0WQxqBFpUEwdvGEU2RLnDq1JE+WHGxGkgULu7GH
	NKpzpRw9kwDCgcY1vCfgR6I1LqkqPdCHBqQP15RvOecTzUMcGoZphxjE7Ar0Y8x4DMfHisgCD6SDc
	B4A8Gnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7x9U-00E8zH-Bm; Wed, 21 Dec 2022 11:20:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7x7m-00E7UN-SD
	for linux-mediatek@lists.infradead.org; Wed, 21 Dec 2022 11:19:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 69C8D6602CBF;
	Wed, 21 Dec 2022 11:18:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671621537;
	bh=2N4kTW6Nl/X046aGb4fJLOe1krS/hY1tpgHjfvPwwd4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jYyg4QnjAa0nAauCKm8GUp5odai4doXzTRWHqoq3Uemlux3iTk/dEQtG85kXnpDOa
	 WEmGHl4AQYBBpM9biaJGea26SBW/RPO5T4EUzLePhhzSpmEitERkUohjGoSowc0ce8
	 2k36sy4J5zeq3Ilo4rWGEwFps4VLbggS9Qat5B1m5iD3je5f2qmGtRq4Rb2qBTg4XG
	 DrSqWStu0b3g73qqz40E9YRjCv8UHtR8ERzb1fjrnAMNXPbiUP1m7dEokkgfXrorjf
	 1dDUSKFGH6PmuOBtmws18Hn8c9sDBPscbYubZmL5ol89wGO4H6IVc9kV5GoD5npyco
	 b6S6e2x1GYmIA==
Message-ID: <80fa1519-f68f-abf5-dec9-76e37fdadd84@collabora.com>
Date: Wed, 21 Dec 2022 12:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] wifi: mt76: mt7921: add ack signal support
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
References: <b2f1f90b787a6b29df5a3e7e8842591325b0c74e.1671193434.git.deren.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b2f1f90b787a6b29df5a3e7e8842591325b0c74e.1671193434.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_031903_176011_2501F4C7 
X-CRM114-Status: UNSURE (   5.93  )
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

Il 16/12/22 14:11, Deren Wu ha scritto:
> This reports signal strength of ACK packets from the peer as measured
> at each interface.
> 
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



