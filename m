Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AED0EDE99C
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+OCnZe1YRjz8YkQbop4yYTmfTWZhVThygS7+IYEI8k=; b=hkQjWUwCkOG34Cz21EbHHB4mH6
	d+0agUFapkVqm12c+WqNvKZo7Do+hyMQkCQTCLOhshBZdS0qcAoLa+tb9c1MIVQDa4EfPA7NcO2py
	tzI98JDaBthBWNwJ/nBTeGhbczAsAiyr+qx7/Yp1BVgGtAOcvFBt2lCc/nryXUWZp/J679C/FNp7l
	IMtRUi5ghxNCf53NyLiinRyrDR5MCBcqzvzmeGs0LEMMHaQG+WCdMydJ7uloE9zlkEBIADj2QxGXW
	ez/SogUcHKV7REOEfQDGfpqqcDu6HOhiY7/9n2bC3tWmPr2EWxcjOJfyLDq3tSHIKt34zMUs8sHWL
	KYSQitng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjJm-007wZi-0p;
	Thu, 14 Sep 2023 10:11:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjJi-007wYJ-2l;
	Thu, 14 Sep 2023 10:11:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DCF5A66072FF;
	Thu, 14 Sep 2023 11:11:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694686281;
	bh=pW2fXhgYd087DAThEUGlhnW+L8Z4AHCYWNF2WJy/EZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ehERT+FWUklXi+FT5EU8D6a6jQO1npQRKvZDNsX6gcJ/nXM5nD/+SOy0+kHzyF/P1
	 mx2zrYmsVi/tBxoeUF8JcFpobPeNT9/ZE8SLdQNIwKCUnjm/RT95E3aHChghGMeeS+
	 lBQf519TMsRvXvYpiYSO5bM6SzhXDhJF+gWgcYBw/q+voNW8r6+lxoQcQa+H8PiLcK
	 lamJoO8SVkKvJVmaziELiW61vps5Xrco0+/rwh1c4Qd1TDS6FytJHO+twrW9FNJ/E4
	 efBr/h6j9/Q3OTE91fkmd0KPtHJP1yFLw7BBrfxb+T4e1h72Cy5oreVoMyKbc9W5Fh
	 2JMyXr21QbHCQ==
Message-ID: <33789243-6774-bc80-6967-dfd2bc2ec9d6@collabora.com>
Date: Thu, 14 Sep 2023 12:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] arm64: dts: mediatek: Fix "mediatek,merge-mute" and
 "mediatek,merge-fifo-en" types
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230830195650.704737-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230830195650.704737-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_031123_024694_B7A97D9F 
X-CRM114-Status: UNSURE (   8.40  )
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

Il 30/08/23 21:56, Rob Herring ha scritto:
> "mediatek,merge-mute" and "mediatek,merge-fifo-en" properties are defined
> and used as boolean properties which in DT have no value.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



