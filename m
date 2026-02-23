Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDBCEA4FC1
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LV0xHYeaf79j9cDxfD5SypkZj5bzU9THRoquC4QTszw=; b=cBzZl980+/+jhC2NwdXdMmhFx8
	zDA/wpmrp49fbCprOZGjSmJBawEyAfamEJTYVSxP1x8Jr9LCTkzDK55faEnlS0z6vAFlVm+uSDHCj
	fYNPiI9TkIsULoJLePeWkSF0+TzAneGoo1M2LgDxepMlndprEC9HiVpf1QbiJiNAxfSdrCDq8iIOh
	2htQVGD7Us6DSobI3COiO6M2B+3eIfQkX24YFdecWmnlW0Ts7a7G6gXsj3WRd0l2sTsbVItU9ntjb
	RpKhgM1MuG03qsMzarCbNNlrX67k5jzi5KK9SLp6+H3+IHx+2O6NjAvWwezmQygP4fq3tg/dbmOlr
	o8V17OHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWHM-00000000PKB-2P9O;
	Mon, 23 Feb 2026 13:47:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWHJ-00000000PJM-3CUX;
	Mon, 23 Feb 2026 13:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771854430;
	bh=EAPazvTxG8rCcmG2735yaTIFWj5oPSp4PhzWyMWToyk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hn+qQsYnjvPzWKIq4RS4gBedhTHLkdg7rWDLMImE7N0cDTgspZzAXOf4AXQYRWnfy
	 1uksdvVz67O9n7ZOeY2kslGqrXY+lAK0+1QhJNgoPwPivmEndiB1YSX7LD8rf8Jp3r
	 ZOSM64nnV/jTeQzsNwnED6hcJ/L05HMTClbMse/9ROc0zEqpACwvOxkbI3aOG1TsAV
	 QqTNU62gIQgSCe9Q25YXpz+/aoJHj63uOwpUFQ4Rs1v85rC+4Z2vboxXj6FXQ+/U94
	 UK476JsfDFiUOgSTz7UGkF0JhVIgmchoLcGb//UnvF+gl4nhra9z7oHQ1W0AiV33//
	 ry4NIn4BWureg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C4BB17E04C4;
	Mon, 23 Feb 2026 14:47:10 +0100 (CET)
Message-ID: <3c2dcbf4-7702-42ef-9e61-5f4091e9a85e@collabora.com>
Date: Mon, 23 Feb 2026 14:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: mediatek: allow building T-PHY driver for MT7621
 MIPS SoC
To: Shiji Yang <yangshiji66@outlook.com>, linux-phy@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <OS7PR01MB136023DAF6E893E8110CEF777BC6BA@OS7PR01MB13602.jpnprd01.prod.outlook.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <OS7PR01MB136023DAF6E893E8110CEF777BC6BA@OS7PR01MB13602.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_054713_949975_C51FE101 
X-CRM114-Status: UNSURE (   5.32  )
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

Il 19/02/26 13:53, Shiji Yang ha scritto:
> MT7621 also has compatible T-PHY which attached to the XHCI interface.
> 
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>

MT7621 seems to be a bit special among the mips/ralink platforms, so I agree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



