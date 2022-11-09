Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91F9C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXI56nT59C66fh4wx9zXlKYhFIYX2MSCFQTcjLySrxU=; b=soSjyVoztFDNsr9Do7sf5IEpsH
	Xt2nqsro4tp/aIOZHyrf8dZEGDJh/PcpEfatMPIvWtBKe91a7tz90LzmqbGGEJLfWgr8CXYHP1F+I
	2FbaRg/KrZ82iqayBJaBNLCvarbr4kf96+t36o1VLvRnZI4f06S1UoQ7FNCpm09UjZ0Q0YG1Nkzol
	wfZCIkk23T2clxA7nwatWzKQXMuILXaFpQNE5cZn/+PCvqU4bO7GQg1ve7EwsaCjB5itrkYwb7h1x
	4yb/tqCRjWbEkr6nNi4hHcyPXo23l6r7on6LT6JdTXed+Nm3Nt/4byxsjWvy3h9DZaz4O6l5rqOii
	BTXo4GsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oshZn-00CQhj-A5; Wed, 09 Nov 2022 09:40:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oshZc-00CQNZ-ID; Wed, 09 Nov 2022 09:40:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B14506602905;
	Wed,  9 Nov 2022 09:40:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667986842;
	bh=5+SECJlEo7BQZC8NrHGOWqaaKAjZ2nnSt35XWUVSojo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m8CVH8yhd5O27fE9M+b+hAoSLn0wY/5h5thZ5FV8UPovCxAeZQ+5jtr6gPslB4iwx
	 NtS0elb1yU0JrNGd5hdeB6yV/rMkFGDWbTgOcIExtCcrGc8HmUjrAa/KOxtbzC08u5
	 z20f+G969MK/0qw7PAzfVnO0lbhUUPtW2LnnGDUPyjGNH5QPspKvYdNkXq5y/qM0yn
	 +RSNRIhZDLKxQACTEZbOA5FXlELCewvDPqe0ZcFvccwqyUcPXfpPP0TQdyyf3iSPjM
	 F7w91uU1YlabydGsQcuP+NsObKyEJ3UlIbbJEEIeK/v0yVE9YdIbNEi/5mJ1TMbaYP
	 tYaJHd8s9hOSA==
Message-ID: <ed298a3e-25dd-af19-437c-f27c160788b3@collabora.com>
Date: Wed, 9 Nov 2022 10:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org,
 Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_014044_768011_8224D7BD 
X-CRM114-Status: GOOD (  14.46  )
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

Il 08/11/22 19:43, Alexandre Mergnat ha scritto:
> - Convert rtc/rtc-mt6397.txt to rtc/mt6397-rtc.yaml
> - Add mediatek,mt6357-rtc compatible.
> - Add maintainer
> - Remove the .txt binding file
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
>   .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 40 ++++++++++++++++++++++
>   .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 -----------------
>   3 files changed, 41 insertions(+), 32 deletions(-)
> 

Please split the txt->yaml conversion in one commit and the addition of the
new mt6357-rtc compatible in another commit.

Also, isn't the original maintainer of rtc-mt6397 supposed to be...
Tianping Fang <tianping.fang@mediatek.com> ?

You can add yourself to the list of maintainers, though, unless Tianping
explicitly says that he doesn't want to maintain this driver anymore?

Regards,
Angelo


