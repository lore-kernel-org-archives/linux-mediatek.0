Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6479C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENsuVYlYFjHSkLXQt+JTSiUmbiFQ5UjkGBT3m0T34UY=; b=RT7ddRsG6WGoBh
	og/4rrHH6Pgv6GuQippzMaxQOuQ4x3a/zXQip+YejRZWSrWQrkUl4/pURGg+M8jjUKdf2S5bQJ1YT
	xgrEet5xnv8L5F+5HaxAU9ixui0lrpaEYF75nkl+QmMBzHEs3ZueY48pgaM33FBIG4qaap8gUz2kr
	E4BmVZTiCFKc6r9nJr0S4HKIVEs/wJnjcCKQgcQfsgGPpzbINZZiNrXtIiHcTbzfXseGcah3w8IlI
	8rvM2YDaWtdaP84npAeFH7LPgYLP009YVNhOnssDMq1du1vF7pmnHJiDfVztOialrRymJbFRcjeM8
	Y5ANRR4r0hAu854DzxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhx0-007sc2-96; Thu, 19 May 2022 15:20:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrhbw-007eon-Bh; Thu, 19 May 2022 14:58:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0AADC1F44EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652972322;
 bh=Um2t/mQTT0Dfq5mGxwYI25I8sQfayys0cBiO/aP38w4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LdfZwN5W6GT9WmGChNKa2aESgz37yUfbtnVDS6og+GqOBa53Qwpc+CCVFJtLhuLcq
 /DAfg6JwEvY1KuxMLzketpMx9FiAKSxxZKKil5+D3iZ+PZKEKmIIYyw43k9ETR03Vu
 bZ8iSTGJPaNrUjQ4mmCV80y3zhdRym/Ir02fTIzgW9bRRNy8ilj5JzAtDdlDCKYjm9
 GC8fzeFrtkA/q6MEP5JdryG+TlLCS3lzkn2Rm21/GPtdOi0FwLVCYOE05ySIIukvch
 v0N58JWyVSHRMyGvzgshdNk41n9pkic10Nh8PYR6GzVowVJjXKpXF2cTDEkQs76GsV
 LHXLTrnSU0AgA==
Message-ID: <3f3dd71b-6e5c-4e19-c8d6-ece88c7e0eb4@collabora.com>
Date: Thu, 19 May 2022 16:58:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl
 bindings
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sean.wang@kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220517083957.11816-1-angelogioacchino.delregno@collabora.com>
 <20220517083957.11816-2-angelogioacchino.delregno@collabora.com>
 <CACRpkdaj42rcQdX1+dVWyHmexrq4UDQHB0JLHgfREY9kn0zv2A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CACRpkdaj42rcQdX1+dVWyHmexrq4UDQHB0JLHgfREY9kn0zv2A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_075844_620562_6A8828B9 
X-CRM114-Status: GOOD (  13.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 19/05/22 15:13, Linus Walleij ha scritto:
> On Tue, May 17, 2022 at 10:40 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> 
>> Add devicetree and pinfunc bindings for MediaTek Helio X10 MT6795.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Patch applied, along with patch 2.
> 
> BTW nice work on the X10!!
> I can see from the feature matrix here:
> https://wiki.postmarketos.org/wiki/Mediatek
> that this enables a whole slew of cheapo phones and tablets to be used
> with PostmarketOS.
> 

I'm really happy to see that you appreciate this effort!

Unfortunately though, the PostmarketOS wiki contains just a small subset of
Helio X10 devices, there's many more around!!

I'll start the trend with a Sony Xperia M5, hoping that someone else starts
following up with some more :)))

Cheers,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
