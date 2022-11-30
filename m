Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609CCC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JURzasF/WKUjop+Fvd9SLhPeoCEPFt8/WOeMl0QT0Jk=; b=mDxdD76wvW31N2f7qScH8hP5Dp
	/VkDYtmTanbJFK+tOlXIVh0Tq+no69Q0F1gNywOLtZRBbggkA0QukQGG+uCV1KdiA4EISQe4TKFFj
	f3jrLr2K7ezqpL8YCYC6nfpi8CCykgtOINzZgFpd0A5jNSwMWd9RFDDotfSuY1HuFre9WbbJpblS/
	6DE1h59cQ2NnWL5p+tkzoD3FhsNShPHs36MNRg2h0SRz+A8TO14Au67OUOORQkZrGHGSjdqQOpHY6
	uLZ92FyGbtmZ9wFBpIJcx54DnqyymQCv8Kv448kpfeqvSrcYzt2DgMGeKAnH6v2mCAQ1Noxqw2Yg8
	Alza0HYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0KpW-00FcQT-0w; Wed, 30 Nov 2022 11:00:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0KpF-00FcI7-8s; Wed, 30 Nov 2022 11:00:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 35FC36602B30;
	Wed, 30 Nov 2022 11:00:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669806021;
	bh=u9Hf8fb2wkuZTn14GmxwJyRB86szK4ksntM7PiVG0SY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HRvIXJ1/iWohl8AyG5Zl/CkNVTrdyazzQ8aBH2BDVYoLG8sc1lTF8H/bVqxUtwB4R
	 nZQVd9bQosAo2rgf4J2uyAX9iSzGwFwj0R5Bs11GlXijpbKnFi/NR/SNXLN4FZH4wi
	 WHreNcd95chi4SzQv5H3tO+RB+fThoYR6PAUfdAy2sw8XRWLZC/qBBdYiJj6D9TCfw
	 RzBjgpHsMiIPsSaO/JDKwq3wmKKWS6OsK61wjvpvJw9XSJAtKVvRrPpQ1z2J0tA3Al
	 +7cuBycU5FNNQlv5OUqYOhJfx0iX6awXthFgF6xgwSf6qnPuca2/C9AzS3oZXXgvpW
	 oGxUK8RXsJndQ==
Message-ID: <d683a2e7-b886-9bf6-27df-d8c67cedbbdd@collabora.com>
Date: Wed, 30 Nov 2022 12:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] soc: mediatek: mtk-svs: Enable the IRQ later
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221127-mtk-svs-v1-0-7a5819595838@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221127-mtk-svs-v1-0-7a5819595838@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_030025_493613_967D8F9A 
X-CRM114-Status: UNSURE (   9.76  )
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

Il 27/11/22 21:22, Ricardo Ribalda ha scritto:
> If the system does not come from reset (like when is booted via
> kexec()), the peripheral might triger an IRQ before the data structures
> are initialised.
> 
> Fixes:
> 
> [    0.227710] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000f08
> [    0.227913] Call trace:
> [    0.227918]  svs_isr+0x8c/0x538
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



