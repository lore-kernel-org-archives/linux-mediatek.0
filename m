Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD2AECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmGFHmrKpscFcoI50g4NvEcQNiq6BIEe7XsO5X/MBSQ=; b=u+rJA3+dSyRs/Hd9fg2SvGrMsY
	ZR9P0QLXrnHzaqM8lTAhgGqNzQzF849YPhhKYjcYprUPLSnApitwFpWQZGTe5qrOdmaRtB2zH0nhD
	qUVow6IQjJMdn5UreFg+OGcInKODjwCNg3FakVW+fZdEEems5OH3jZiI9w+7MB3bMP7I1ppY7zKOd
	Unh+/kQB5MPjrejlnyNIDA5TW8lQ0mxk1xTDQLXvsWH0SSm/82g9ZQXdJDyVsmHT2C8kI7ycjZXoJ
	ln6PhJSyuAM22kST7r+T2KWh0QU06Y3Xo7j0pUpZXoRxxpGe/05uSFoGjFL8cDaBl/YGVN1iJwTEG
	PIcb6lzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2fr-002L7T-CD; Fri, 02 Sep 2022 09:09:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2fe-002Kpr-BJ; Fri, 02 Sep 2022 09:09:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4DA086601F04;
	Fri,  2 Sep 2022 10:09:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662109740;
	bh=me5bwAelKcyFGZPLRPYw5VKaBsEgHRaZdTst+izZfuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EOaGpB91B1iotFwQ5oFBUUoPinLhioyJNTo9eCwD4GGwoQkfLXxtCGdtlxO7tC6pl
	 tJPxMohoawjrnc0ql2wvZGuCD+KdtMKoJL+stVNdW2s3dxbw5IBLpUVERXEADT0PtQ
	 VJ5/2t31KpDHe9igYh23GC5lNRogOyC5f0a7b/eiWOaq9MHv2xxQNmC80KF5Fj0F2H
	 Dp3157s1LqH1uQVxfT9Vz7ppyFI15qh2EaP32cYLZ2RXdt8VgLpipz9vmcmb/rzNBI
	 25AxEzSADd2+QENa9KFUqGqB96fhB0uZclbCyMvDugMwtyJJ4/AfhUpkcVr53h9GK/
	 tLjLaS8P0jzYA==
Message-ID: <9c10dac6-bb24-976a-f207-fc70603d4586@collabora.com>
Date: Fri, 2 Sep 2022 11:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/3] media: platform: mtk-mdp3: use devm_kfree to free
 memory allocated with devm_kmalloc()
Content-Language: en-US
To: Sun Ke <sunke32@huawei.com>, mchehab@kernel.org, matthias.bgg@gmail.com,
 hverkuil-cisco@xs4all.nl, ping-hsun.wu@mediatek.com,
 daoyuan.huang@mediatek.com, moudy.ho@mediatek.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20220902085820.3777360-1-sunke32@huawei.com>
 <20220902085820.3777360-2-sunke32@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220902085820.3777360-2-sunke32@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_020902_547596_CD2D0D95 
X-CRM114-Status: UNSURE (   7.75  )
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

Il 02/09/22 10:58, Sun Ke ha scritto:
> comp is allocated with devm_kmalloc(), use devm_kfree to free it.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Sun Ke <sunke32@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



