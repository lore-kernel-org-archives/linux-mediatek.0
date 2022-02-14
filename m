Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EC2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6i7VAbb7Pf6mQR9pfJxL+MLcBJ3X/t/6X9Du4EivBIk=; b=dRuVMTGP7oailY
	xE7DL3w8IL7DYo2JVwGnH64uFDNAWh5B29XQoUChVxx6FyLnvYItbXiXk3IjFZJzAzmSxhvSt2Szr
	OR6A+IyM5UUB/W1oOu94O8OvBKZ/6uK9ODGk8YETWdug/P30GPasCeNJVXfX1Ctz7erqss20OGF/+
	gE1abxy5/2/Tr0vcHy90UD++tLqYStiahbit06gWH89R/SqpIHpdIhV7aUc+nCPA5JnUUfnajhDMY
	p1Fspi/VMSPJMsbg0wVqCSzIhOTGmJcXRX6WCJqpBLr11kSr42vl4TAMfD4p6emcWpSxgJVQfvNdS
	JN0n4Uy4B19m27cj/LvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJZKO-00EkQR-H4; Mon, 14 Feb 2022 11:15:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJY9H-00ENct-Cb; Mon, 14 Feb 2022 10:00:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 79FD21F43053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644832798;
 bh=PmeiC/wYqvKXsD5lUE5EB7IB8YOl2pZWINM/lweU0uQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=huItp0jpBT5mIuS3V2qntF47BW1WYY6qF2Sphz5S5Es9/zaydd2GXERLPFT48Tg7I
 fkYl24WNF0i/WY3JaQYCJ4SSLVD397Irnv1yVkV8sJRdWorZgZlGvWQ4JvmRgIy9AW
 4qSFNoTZ+SW09YJaey4sO0UFk6hq1dZVLsm6Dd6QV3E/z+KHfZ0TLRiUb+9xA4V8oP
 WSZZI6dCgNTb/OX7OQ275Y3ZmvM+Zt3BQYxwqkjQGpQBbxWMQmjJqRjtsdBGygbnRO
 SdcBfHb106jhNlW++A9eGBwHtD0h0Ai93vVVfLmlQxpqs6wNuz0vPKnxnkoyO6nMHT
 IGQakN7qdIYYA==
Message-ID: <2dae87c6-c796-4687-0f21-86a0b36ae1ac@collabora.com>
Date: Mon, 14 Feb 2022 10:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 2/3] pinctrl: add pinctrl driver on mt8186
Content-Language: en-US
To: Guodong Liu <guodong.liu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220214030631.4969-1-guodong.liu@mediatek.com>
 <20220214030631.4969-3-guodong.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220214030631.4969-3-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_015959_612970_AB0848DA 
X-CRM114-Status: UNSURE (   9.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/02/22 04:06, Guodong Liu ha scritto:
> This commit includes pinctrl driver for mt8186.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pinctrl/mediatek/Kconfig              |    7 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8186.c     | 1311 ++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h | 2186 +++++++++++++++++
>   4 files changed, 3505 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8186.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
