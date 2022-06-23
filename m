Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1013CC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCM1P9rV5zl208qDFOusuoIotypBhZJEvh6oAixkUpI=; b=lLtqY26gD4doKGLwx5wN/bJ158
	1WHpPpGaYjwLtVMUWdeEbn6gXvJrcairdRrmII2xsTXBoqM1t5NbzTvgbQD2pffj5vDar6W90v347
	+TcOHpDar1/VtgGjis24IMw/eQAK/TH4GonMlRM7qLh+1psBI/HMlA6IkSRq0sjNhvizmewIidenN
	OuUAzWiiSnZLojs5N3OfOWolspMaESiHVZzVslRgp72VsR8D0Onc49ZeF+7+e4VjgW4bpjxcEZFTb
	XsrpP5/9x812+i6squMEdCkiGKkbE6TY2nr40ZQqGamzTM+eU+I37iTm97WPP6dehr8PhX7DnVsvA
	odm6kDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4J2S-00EJPm-IU; Thu, 23 Jun 2022 09:22:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4J2P-00EJPB-Ls
	for linux-mediatek@lists.infradead.org; Thu, 23 Jun 2022 09:22:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E77946601752;
	Thu, 23 Jun 2022 10:22:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655976128;
	bh=i/BTlmTsubNTSWq020jFczUKEvkkr5DvhZf1Py61tB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=crODGwY+qCOyn3wMI8GsirBvApMarr1J4wwSSBxQWp2QB8OwUQBJHEXz52ZEL1JS2
	 7lb48NzYCObcL5mNhda4L9JQjp9JA3KmVJYm+B4K6Ebb49q/e6x9b/L1YhMLOQhi+Z
	 l21pCNuaknB7I/EBm8Th4pUogO4yZcKEHWD6lLe73dFu6HQrNc1e/M62vvLrpnsU9W
	 a7GrwuxT0Xlv5hG+bxzI4gABYuQSsAsT3GdrcVgvbNbjGH3K41vKAQJa7RKJ4B+72O
	 wIk5+oi/cT9y7CTdLDPtMlJfjw2FEAlbCQBRPtuTPlvP6gLuJosnp/RUqK8qKomXVf
	 xDbnXbvWP9L/A==
Message-ID: <460046b1-44f7-e9db-6532-44cb06e4a242@collabora.com>
Date: Thu, 23 Jun 2022 11:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: mediatek: vcodec: Skip SOURCE_CHANGE & EOS events
 for stateless
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Yunfei Dong <yunfei.dong@mediatek.com>
References: <20220620063349.2754116-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220620063349.2754116-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_022209_893510_E1D67830 
X-CRM114-Status: UNSURE (   9.35  )
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

Il 20/06/22 08:33, Chen-Yu Tsai ha scritto:
> The stateless decoder API does not specify the usage of SOURCE_CHANGE
> and EOF events. These events are used by stateful decoders to signal
> changes in the bitstream. They do not make sense for stateless decoders.
> 
> Do not handle subscription for these two types of events for stateless
> decoder instances. This fixes the last v4l2-compliance error:
> 
> Control ioctls:
> 		fail: v4l2-test-controls.cpp(946): have_source_change || have_eos
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> 
> Fixes: 8cdc3794b2e3 ("media: mtk-vcodec: vdec: support stateless API")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

