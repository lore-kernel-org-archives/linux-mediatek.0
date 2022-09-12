Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095A1ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMl+nfad2ncF+NFvaVS1IFcbfOXLYEHlXkeE5BndBHI=; b=DsrN+Ckd6vtQBwb6oasz1AqJaR
	fewpMCmXSZB9uD3nGB9TOURsyaZQ0xjI9UtynNAFp+sgvLBi0cJ9T2sSjfxdJ8XxhSKyTEkJ2cez1
	ko2n0a+3DqPnrT4gRQS3fSSRWRmTwpKIpSt8bcPzUAZ1kbDjujGDOGdhW9uINz9xVs6IFeH6tv5lD
	cuc66rJGAL0EafmFr1+N8i8LEld7gMuyInG9CdxTUT3k7VtFwA6yKYeaYM9NoHAJZzZMzSj454is3
	80t1O1GtIc1bvne3+2EipMxvXLyK6Ma4SD4U3biU6ey1VGI8f2GGw0B2cnD7cUTqMrdiapYiop7N0
	GwJZ4G7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXh3S-0091Qy-Cz; Mon, 12 Sep 2022 10:52:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXh1u-0090Jh-Ad
	for linux-mediatek@lists.infradead.org; Mon, 12 Sep 2022 10:51:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7720A6601FDD;
	Mon, 12 Sep 2022 11:51:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662979864;
	bh=eZVd2qScKUD7WKyYFGW8QDa1tdf6w4+feyVXfFW/Kzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BxUFu1cVBvCLQ4Mf/CdKdrnrk9hcqvlW7VwC1A7gO3J6QJymI1ksMkDm637fPWjXw
	 FcTHR5qam11QfCG1Fxe0vKcnuIIuHBIKSrlGUgVLgheZkCigXlIKE7seT/jmXvl6tr
	 AT5yv/rAz4sGZS1eR7xTQENRWqIgbjDTDJWxmOw1oz48sOm/Eh+wCGkDJ9a3L/nSb+
	 hVOpJkujSNk2z6C5+e5LPj8k9qtZm3P53Js93J3Oa+Xte3siUsIpSwEKZncpFH7Wb+
	 Jckwb/0Px1xKp1Yigy97qjbElqg1RZYK6mrYPDQJ29i9KlYSIFqUfEe+guZgTMrW0i
	 cTUV7+RoVZ8/g==
Message-ID: <1d0a84f3-d5d9-5792-d79b-36f5f8cbd149@collabora.com>
Date: Mon, 12 Sep 2022 12:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] wifi: mt76: mt7921e: fix random fw download fail
Content-Language: en-US
To: Deren Wu <Deren.Wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, stable@vger.kernel.org
References: <1190a401463547e555912ef9417138df4ab2c363.1662972106.git.deren.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1190a401463547e555912ef9417138df4ab2c363.1662972106.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_035107_490146_AB337D5F 
X-CRM114-Status: UNSURE (   8.03  )
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

Il 12/09/22 10:45, Deren Wu ha scritto:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> In case of PCIe interoperability problem shows up, the firmware
> payload may be corrupted in download stage. Turn off L0s to keep
> fw download process accurately.
> 
> [ 1093.528363] mt7921e 0000:3b:00.0: Message 00000007 (seq 7) timeout
> [ 1093.528414] mt7921e 0000:3b:00.0: Failed to start patch
> [ 1096.600156] mt7921e 0000:3b:00.0: Message 00000010 (seq 8) timeout
> [ 1096.600207] mt7921e 0000:3b:00.0: Failed to release patch semaphore
> [ 1097.699031] mt7921e 0000:3b:00.0: Timeout for driver own
> [ 1098.758427] mt7921e 0000:3b:00.0: Timeout for driver own
> [ 1099.834408] mt7921e 0000:3b:00.0: Timeout for driver own
> [ 1100.915264] mt7921e 0000:3b:00.0: Timeout for driver own
> [ 1101.990625] mt7921e 0000:3b:00.0: Timeout for driver own
> [ 1103.077587] mt7921e 0000:3b:00.0: Timeout for driver own
> [ 1104.173258] mt7921e 0000:3b:00.0: Timeout for driver own
> [ 1105.248466] mt7921e 0000:3b:00.0: Timeout for driver own
> [ 1106.336969] mt7921e 0000:3b:00.0: Timeout for driver own
> [ 1106.397542] mt7921e 0000:3b:00.0: hardware init failed
> 
> Cc: stable@vger.kernel.org
> Fixes: bf3747ae2e25 ("mt76: mt7921: enable aspm by default")
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

[For MT8195 Acer Tomato Chromebook]
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



