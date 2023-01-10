Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776DAC54EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=as9LyHWt0XLFexRj7GpXdvsUjobsRYjzSupS3fQCl9U=; b=HbOhGKoD6mX13w7AS2dD2zCzKA
	I/feQEIvulKjSB8qoDRtyRx7w+vRltH+XM2nCZ0vp9bDObvuscAZLAVrFtTkGjUPqnpyh4VBBfrBJ
	fJT6FVaxN+MbdVRQbAJR74cmIdzQ+74RGNSCmeAw29Ucf9x8FOfxCYIkgzDc7AxvJu/2n94mFNXKz
	tf1LZrQiQ21ExCFuGmaJYIUuV2MZPtdMGtumST6vH2aZTgTiyubwc6dM/db7ipfpBnYvIVGSzxvUd
	Os+y0lZEgQTrAC5aHGHNagKWIGMtvAXdtE1TQUvxl4SlEflPog9t2MxX3XpD95UXZLnqr8eoVqeA+
	GVyTJP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAWK-005ych-S4; Tue, 10 Jan 2023 09:02:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAWH-005ybh-Ts
	for linux-mediatek@lists.infradead.org; Tue, 10 Jan 2023 09:02:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 24EC7660230B;
	Tue, 10 Jan 2023 09:02:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673341325;
	bh=oIJ9/QBPo+xtU86fwp39bkctw5qjqzfW5/QtYhI/UrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZoHFvuUlrlcCMArQ3GE28bgB1BiUBSZDanmJGf7TWfHY4HaHXUcudf10Rd93by/kd
	 wNt3BBx48a8dJafvq5xB6miHFUNTlPoxz/F7ao8C73nHZ9M+E/xDUz0vYPerumNN68
	 DtE4SFGZGw2dcjFtslquD0T19onZDeDPPR2I94vtK5wJBq8ZxSOcvetqyzG/xJejpi
	 5Y+cqlGuvMJ8jQHvERWSYSTc706+gVaIJTzTtig3ctZa5fwil4+/jo5J6i9ffWpJAZ
	 IEuiabxTn9aLxWEfO1HD9AHFy5PIRnK6bBM351pG7ByKNLUHT/bPqgNk+ePACC74NA
	 EiNs5iHBL0x0Q==
Message-ID: <fc950d71-29da-dce6-3c81-578362a78f78@collabora.com>
Date: Tue, 10 Jan 2023 10:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH] drm/mediatek: Add support for AR30 and BA30
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 p.zabel@pengutronix.de, airlied@linux.ie, matthias.bgg@gmail.com,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>
References: <CAHC42ReC+pkKxkHdagfpQ5-hLWGAad5nWtdd4uZTDhuQz_bwMA@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAHC42ReC+pkKxkHdagfpQ5-hLWGAad5nWtdd4uZTDhuQz_bwMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_010210_118202_CCB933A7 
X-CRM114-Status: UNSURE (   7.12  )
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

Il 09/01/23 19:26, Justin Green ha scritto:
> Add support for AR30 and BA30 pixel formats to the Mediatek DRM driver.
> 
> Tested using "modetest -P" on an MT8195.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Hello Justin,

this commit does not apply against next-20230110 because of your own AFBC support
addition :-)

Can you please rebase and send a v2?

Cheers,
Angelo


