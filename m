Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DE2C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzHaNphXui9PBAW/U0uG3eLkIqUSLfJoRL2N/y9fh8A=; b=q9PtMjOX6W3lUt48WymFHSyzio
	G++STjRX16GeZ8PbJelKRvrRR1vkfzvZyj40mdShv3tAi2Ddtc83CGxvXOooR8kECfe4F1DBkJQzK
	Qj3Ut9PUk3sxN7oiLUTZ4/9bDbf0fZa5fWhpvek6owH/PEMByClDoaPg0V+VPc05d7LTT2r5T13ZD
	E+80aYPXBZw9zdU4UWBo350dGA2ImQitsDAwjmwSDSJlpZrw/Fhh1SVxMeKkOuO3A0nN6RmYPcg10
	13BWC7wxhczxrDs+6NtKPGXmRvp6X3j6r+N1+DgONRZi2ScWvdfx8R9vHVbIvJkswBzXWmTOJQ1tr
	yYpV3oAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uIl-003G6s-HW; Wed, 07 Dec 2022 13:17:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uIi-003G3S-M9
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 13:17:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F2AA6602BB7;
	Wed,  7 Dec 2022 13:17:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670419047;
	bh=Ixv5+2qeipyxLWYB1z8spcuWJvLJCGXY957CuqQgBIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mb2zWX/28qChejNSI8AEV0tS+7vWceaGq5aLBoz/oWC82SHmAvXagin9+1d679RHC
	 yA8UUQfhW8kigNyr5VSv1hSHkzXLb1xG2jKyKeTHBNeUMFjLR5q09NLH2JW0pZ46VZ
	 zPgfghMMAQR09ndN8JbmRfj/4SROTZxl5XxwbbDZoH7MgLVHSaCGtpY7tfDLZOOFX9
	 B3YCCGx2ZLlUdRMllQgTck2zfKSltOsmIIKFBxkDbBBqwPXr0qGBj4TwoxcNKW1f5h
	 ZuRP5DKpvQSPRih/NFMf3ocftNzA/K6mB9LPZcIeZa84Im51aB6Q4r6MCqkDEhcRO4
	 BqQUNjAfAliOA==
Message-ID: <65220c33-dc2d-9f3d-578b-dc973b9c043a@collabora.com>
Date: Wed, 7 Dec 2022 14:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] wifi: mt76: fix coverity uninit_use_in_call in
 mt76_connac2_reverse_frag0_hdr_trans()
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
References: <200ea97407b6f121da7ccd4567fde4b0426c5d9c.1670404791.git.deren.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <200ea97407b6f121da7ccd4567fde4b0426c5d9c.1670404791.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_051728_883252_2DF910E3 
X-CRM114-Status: UNSURE (   8.01  )
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

Il 07/12/22 10:22, Deren Wu ha scritto:
> The default case for frame_contorl is invalid. We should always
> assign addr3 of this frame properly.
> 
> Coverity error message:
> if (ieee80211_has_a4(hdr.frame_control))
> (19) Event uninit_use_in_call:	Using uninitialized value "hdr".
> Field "hdr.addr3" is uninitialized when calling "memcpy".
> 	memcpy(skb_push(skb, sizeof(hdr)), &hdr, sizeof(hdr));
> else
> 	memcpy(skb_push(skb, sizeof(hdr) - 6), &hdr, sizeof(hdr) - 6);
> 
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

Please add the appropriate Fixes tag to this commit.

Thanks,
Angelo


