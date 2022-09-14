Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05299ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 07:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rapi28rwHqWJckPbYfcGt2dI1+gA9L1ZSow2mVHj4qk=; b=BtrgDa1wSmW2CE6uR28HuoznRe
	lIF59HYRpsiKAvt6CYMavDv3WtEjg4m09ueHsH3I5y6U6TCrraF2cb+Ya0WJIAMkyRISMWjXKHLw5
	sYiZ0FuhXNqYKo10Sy1kHbO4kCi/3NQIb/Mo7NiFL8iZQ6CJjPRFliF/hvTYJiB/pg881kozv7EqR
	qDcmWnbg/u4yiQb790xXqBoh8Mkt+hGsFK/9PnYnwSElTatkZWgcsv26ZeqYAkLtXMsKW135OuNYU
	4kcm+Iq4zY8gfK8kbmbLaX1TYOTzWarsHNoaAkI/yDuuZcVJyKHfWVw2/hrTAui8evuD4CDChALoi
	xaWd/YGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNC6-00Bt23-J4; Wed, 14 Sep 2022 07:52:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNAp-00BkFa-4A; Wed, 14 Sep 2022 07:51:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B14FF6601F99;
	Wed, 14 Sep 2022 08:51:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663141865;
	bh=td9Mn6SI38pjiwsa/3/Ycx6KzL/TxB3i21YJ8fi/QV4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nGdLPb4/17JuyvRGI6BUUlidHc6XUlBuxfX8TEkB4aFEXPovQ1oCATvsZeACLn6XV
	 o24gg1zYz8AamgGDoXLWw5Q/8hW0JtXjK4sQIWwsAICRIQGMKAi62kECy3eRRMVaYA
	 70GBg6wa2iwWdLDPfZjNdEQycbw9TudF2jnDSgjL4ehpeW7gyuP5vVMy/2VS4RJfNB
	 97whXP5WZA/6JA481VT+d8fqGJ/famH7HeEmUF/Jxwfa8hbLC4EA+VCHgvODodvsGm
	 sxYHJB6hkCE+HBNGg1FtX+Z+SBJ4ZfYOLONWnAeHBgL/oZdIlUupx+52CivvzPp3jV
	 myzW2ig2P6J7Q==
Message-ID: <4bd8d270-0766-b452-b7de-12fda2c56102@collabora.com>
Date: Wed, 14 Sep 2022 09:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 3/7] phy: phy-mtk-tphy: add property to set
 pre-emphasis
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
 <20220914060746.10004-3-chunfeng.yun@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220914060746.10004-3-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_005107_423847_A159B6F8 
X-CRM114-Status: UNSURE (   7.28  )
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

Il 14/09/22 08:07, Chunfeng Yun ha scritto:
> Add a property to set usb2 phy's pre-emphasis, it's disabled by default
> on some SoCs.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



