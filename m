Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB99C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 15:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpOsHKGhU7tvxbpHfT02UmgSMRtEW1XC80zRDsCqkA0=; b=f6QlnAYVRHZBuSmTKJ5NjxHoXO
	KrsbMAt8EsvS7XpMZ90x/dKmqM55q8XUOT6TFKwwB+G7qrHOTZcK8VlTPcdvUt+9qsaDEmJ+mfYht
	q1VknQN9i9T4u2pmybyJ+Dw87KIg8eLwnXqxV+4C8JKnu4TcZrZsSJG50f8oOk1los3F4e2S+H1HB
	QUVkhiBpRLUAE9FMpLlOn9sWBa6pgaHHwrF4l03g8KHSH2igK0mvYtEd3W4Qr/q5CzCmE7YTXLofB
	i40u1IYJCCT91lrr+5cA6I0wM9V2CfE48iLKaQQSy3z+56g/n3rCeZlGzzmQloApU3O0QbzPrpoWw
	JFANKOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCjf6-002gj9-Fm; Tue, 03 Jan 2023 15:57:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfso-0015PF-Mg
	for linux-mediatek@lists.infradead.org; Tue, 03 Jan 2023 11:55:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 873636602CE7;
	Tue,  3 Jan 2023 11:55:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672746905;
	bh=e4EUjat9pToRSEm96KTsiek0XL1DaIo9ai/m2Kcwwt4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JcSj0ZpNVZN8gtIpt5l10oqndfZ82eBXiUEZPbQx9GpWlNitQyFeNXAQQVE3Coxed
	 Z79ZR5joVBxeVDM6ykgwVWx8+0hnrFLdZQm0z/G/0nbFCcNW24t0S8IN/WmJilClhF
	 PsJpGi1WV/yOO0/KdO6PvopIRjGGMmk2Qh8rfUgPbON+0FbQYZB5UiuP9n70pbxpsL
	 Q5qVVjJfa/RDP1R3t5HIha9vxp1LzcQanKiaT8yU1ij3rXLLJybwmB82NPohmRPMUW
	 R0pQkbALyLZvS09tZR6IjGz8R0hQeo/37c+EdlyMSPq92oR6faxaz5SaDu9UyP1xep
	 ADSwqwr5FrZqA==
Message-ID: <838a4824-872f-0013-ecdd-acf7168708b6@collabora.com>
Date: Tue, 3 Jan 2023 12:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] wifi: mt76: mt7921: fix invalid remain_on_channel
 duration
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
References: <09a2d41d349593e1cf4a542d076c1a49bd135d3e.1672476252.git.deren.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <09a2d41d349593e1cf4a542d076c1a49bd135d3e.1672476252.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_035507_328229_346CBD8A 
X-CRM114-Status: UNSURE (   7.01  )
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

Il 31/12/22 10:01, Deren Wu ha scritto:
> round_jiffies_up() may change the duration reported from chip. We should
> take the real timeout for current channel privilege.
> 
> Fixes: 034ae28b56f1 ("wifi: mt76: mt7921: introduce remain_on_channel support")
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



