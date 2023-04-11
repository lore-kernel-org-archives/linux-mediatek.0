Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1D3C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqXsqrzC2w5P/PUMHHwh4JD7qbM+8tQV1CmD0iRV9Uw=; b=Gq2UfVXNMMOWGMlDXs3ZuYHSwh
	YgDFDwEZtTZngs4WJHRI+cf1fQoQ40yjFU862DnqJonB6egxlQ7hTrYwBYBP0g3GJb8ovcOCSDKj4
	WTGAqy30B5Y4x3ugO7DVmR5Ee4w8sS6D47kDbnc6+zPsV5Tmrdh2AI6xXBuqk96p6S9aaVOSgCj7G
	miBKzFNivs4GGJJFzJ9pMoVsA3FLLWz9klBusFxkm+wpoISBqryeSQPsmP3/dnJn8c4b1CeqKzTAB
	9K0QXJBr2EMU9hJ8eCqK6W11LzhdM4kLWIPEfamaAVKUAKYmbNKdDU6FdR3ocQfQiTolYU5eMe1c/
	vUR41NOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9GA-00Gpxf-1I;
	Tue, 11 Apr 2023 08:21:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Fz-00Gppw-1K;
	Tue, 11 Apr 2023 08:21:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6299C66031E7;
	Tue, 11 Apr 2023 09:21:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201297;
	bh=wqXsqrzC2w5P/PUMHHwh4JD7qbM+8tQV1CmD0iRV9Uw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OjW5+CzjphRe4NLi71G5c+aZK6nkasJ4+4VZrwUUewZHjK9mMPkPAl7I5vIq1c24u
	 HPFICq0ZVDurlZnOknhnut9sXx10F0aPrv30dGsSC3RIMhbn3MSu0aCL6KkH19kj4X
	 ijDruZAj8sZM5lE5PnpY44Px6FT6XqBliiGw5mUHiDQwAxKr8l/Ix++qUnSzjX5HH7
	 vhmvgJDnCALsVwkH14blm33U7mdyu+Dy/xJU2F6tjeUUR2s6wF+x97V3XVGhtOmTLc
	 6X0DhbJZqXvTJo5zaDSgqGdhj1CRkbAMTSp7Js6WCehOc3zpw2+LOpMsQ5ImV9MUdz
	 tFX/PrZTV68TA==
Message-ID: <9760ba94-e6f2-9620-f2b1-4dc3102a6adb@collabora.com>
Date: Tue, 11 Apr 2023 10:21:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 02/12] arm64: defconfig: enable Mediatek PMIC key
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
 <20230203-evk-board-support-v5-2-1883c1b405ad@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v5-2-1883c1b405ad@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012139_668657_F7239D70 
X-CRM114-Status: UNSURE (   7.92  )
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

Il 07/04/23 14:59, Alexandre Mergnat ha scritto:
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

There's no commit description. Please add one, saying why this is needed.

I know why, but there's people who don't.

Regards,
Angelo

