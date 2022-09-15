Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DFCECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOtw13aTcDK6Dl3MnltSTYrAgW8CXZgwaDXok8V0GFo=; b=tA3GMQGMMzZcPi97YxUgcJtzAG
	zC1bwtJ4tNdoPvhY3XSDab+GLJnYF9p+S0gqqvl7GCqaeRKnJTm19/2psXvRnXPCSXskky8iYIUr0
	M5N0kVLLfjPfrDcZYb3AK/MDjragb+2jK47r1IbwA3uCPpOmXQJG81akzt2baKtrhG6oUWxJPfld8
	uZToRTkT0bcyPIhPodK+H/lWPRYzAZDdlyWiGoBYWH32pwqDCyIi9QtvDjIsmE41aCbHlmdOZA9UC
	DUAEZbrlyg7VPSTfWo068vLpcv00Z6zLg3hNnf4IzJ97JWh4iKbCoR39FO1/LbRsJ3Ag4mFsAJN8p
	eMZ0h8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYp7B-009Yp3-4G; Thu, 15 Sep 2022 13:41:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYp75-009YYR-1K
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 13:41:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA2FD660201C;
	Thu, 15 Sep 2022 14:40:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663249260;
	bh=zYYC92DvHJUObyUM5S/7ri6RSWuGzu/a+XAg0lAgeRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eB7zaRSdS+qOQmwskdo+APTfYt4q71qhd/MX+RIIc1gmR+YW48sflbJe+Kko5bsoO
	 6yimiqGBKD5Hj6XgXCI8qHsmV8v5AycFrPUGJRgo9DJvF0rhHfroVAtVpx5ppQAHvu
	 5SrBi1O6AXzZz9XC3gP8FUxPexUSXfuBLzYNGxWepBhJ4ZvCMOg64t2APWfH2WZpa+
	 tZttaheNq3u1kCEKcMiW/MmelW0O5EnoaTHcZde+Y8ab1CJt4/OyRPcWVFCSN9Awc3
	 af3HaWh3mE+QJ58OVhz4bfAgfuX3lYso+f4nxHeiXVgkBYNiRXM/ZlMwDCp74V6VLh
	 eOzUf3bTtlazA==
Message-ID: <8eca314f-c6b1-c1fa-4cad-772715de2ba1@collabora.com>
Date: Thu, 15 Sep 2022 15:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] wifi: mt76: mt7921s: Switch to DEFINE_SIMPLE_DEV_PM_OPS()
 and pm_sleep_ptr()
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
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <e5478408c98e51e6903892cf128acdc103a09535.1663229480.git.deren.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e5478408c98e51e6903892cf128acdc103a09535.1663229480.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_064107_533312_64A27338 
X-CRM114-Status: UNSURE (   7.30  )
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

Il 15/09/22 10:36, Deren Wu ha scritto:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> Use the new DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
> handle the .suspend/.resume callbacks. The new macros allow suspend
> and resume functions to be automatically dropped without any #ifdef
> guards.
> 
> Tested-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



