Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9854C38145
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmEj0flWgb87KdZ+XHe+BmgrxO2e1mahZc6ajmGgFm0=; b=ZThPntl3BHpnBktTTDqytIqY52
	8btRjLU23yzEWj5HCFTvVFUIuTSX+eLwhcQiC1c3XxS5LOReFuKqrQ8YTmucmmVm6hMWIfjDbj/m+
	LPgYUceG8LaMc+mAiM/ocwVkd8aVR0oT5G1yr/JCYgQK6l+/rVyqiz6NdA66NvVSgQhq+fzprXoEn
	evxmfuKgEU8gTA6JRL2YXWP8AdnyY2mNsOu7lZL+e9dhpIUoz3jhwwWfR4rh+oNDao8EBYNNBPLgl
	ar3r2KCeFgc9NHqgSc5SnzF7vXLRLNPitWEx2Wa7dChPW5Oe6RZ5Y6TexymE22ajlVF3oqskFVdnb
	Z4LOja0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVq2x-0040tP-C6; Wed, 07 Sep 2022 08:04:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVpsa-003unq-PH; Wed, 07 Sep 2022 07:53:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 766E96601F55;
	Wed,  7 Sep 2022 08:53:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662537227;
	bh=nNlPMY866LghNvzw6jcAdtibyey67waqwi6S7UrWf/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GP4WXiP9C6+94ALS0+cfy89KOgxhfZQ0sbQbJxdFygnDmwKxOls7nYEjt9aJHQydw
	 Anoj30XLVg5A88vk3OSHtT3mNcmvr5qrcNfRHNWP02B3oP+08u6m4fX111HeYthZk3
	 5DYCqYwZyKPUEgau9J3ugwCyEcTOLQsAD1vwvLeDYJMU8FKUmAZ3F6a0LcEze43qP2
	 704E+M7BzNB8Bg+SNmHmum6q1lFTiubOBful+Y08VedxK0ktcAZ18dSZzXpFett2pL
	 uot8tPG0viNHAcRXWBfIuasPH4QSDhLUG5CQ1r9KAgB0Dp+M9lDhNRZh/MfMImlRMy
	 dxniVba1173ww==
Message-ID: <d56852d4-898c-0b0c-9ab6-808d95778b09@collabora.com>
Date: Wed, 7 Sep 2022 09:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 07/11] leds: mt6360: Get rid of custom
 led_init_default_state_get()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Gene Chen <gene_chen@richtek.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lee Jones <lee@kernel.org>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
 <20220906135004.14885-8-andriy.shevchenko@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220906135004.14885-8-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_005349_012148_108EB3C6 
X-CRM114-Status: UNSURE (   8.77  )
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

Il 06/09/22 15:50, Andy Shevchenko ha scritto:
> LED core provides a helper to parse default state from firmware node.
> Use it instead of custom implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


