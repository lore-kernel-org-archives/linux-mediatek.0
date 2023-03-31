Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D71FC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rguAeugz926xxLszE9On82HUPBLsrPOdwAAbg0MHxjg=; b=pTCzR/aY4QUqaPUJgxD5/sUoue
	uqglk1CDC+4KxRJLKtWN9qvQ9HvnpIIZ7yK4NQ+DuP1gsdXbQRFWgmqpEx5DC5gVTBxtXqGHODCVB
	qQkLb32PSC7JIlKlehNN1GvIsnqAQISmZuRt3Kdly7PqNI+4PA6ILLPM3Dr/Rj6I8FGBViV/eIS1l
	KAjutyTaBkBpevXURVxKUs3V2NslO/MheDV5aTJsewKRTbz02a3sk/5BEycx25DFsp+sIXyTFmf+2
	dnjhR4ZHFN2iCeZOg/LIKT6b+YQb3NVhZBrJKFN5OC4t6OpOD44CyhO8QgETlrMx6JdUov1LdZEhV
	7HE3pCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSC-006nIx-1m;
	Fri, 31 Mar 2023 09:53:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBRw-006nD4-1v;
	Fri, 31 Mar 2023 09:53:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AC63D6603193;
	Fri, 31 Mar 2023 10:53:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256413;
	bh=1JNgNqujLUAmoNv193x/8LkV3mFcIykRfxs6awBqj18=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CymPHK+BYSSoplDeX1NBxowS3li4V4YmtaoIYxUwl1ZAGnLd1/QDOlZDyqcSJP6iZ
	 7bBwKsaXdp+ikco8UeQBNuTwoDc2Z06ADggLdQwRdtmrz7OWmDuGnICG9R6s12xa2D
	 3kLuhBe19ZU60i3ZCL9Fa8blaVuw+AgeqzEsx1ojHpWeoAZZUobvGA/lgG+yeg2eUg
	 MSXk71VrbpQUW1r4V/vyx10P92aDWRAxTLr5g1o1qhiu5BglxjKG5BLC0J1dZllK4m
	 toPjfv1lkwN4/4gOWddYkKJjK1nYSQbTj1Mnzd+MJHgIGG83ln2pPTxrThY/1vP8/+
	 t8W6/JT4fKfXg==
Message-ID: <19ec7bc6-cd64-28bc-4d09-57b6792d26e7@collabora.com>
Date: Fri, 31 Mar 2023 11:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 18/19] clk: mediatek: Add MT8188 imp i2c wrapper clock
 support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-19-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-19-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025336_760080_A1F6D72F 
X-CRM114-Status: UNSURE (   7.37  )
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

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 imp i2c wrapper clock controllers which provide clock gate
> control in I2C IP blocks.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



