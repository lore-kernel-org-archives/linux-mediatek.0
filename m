Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CA5C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 08:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czHTzFKanr1MkIHVyPgaFPozvmKkxmGd57hnLv/VmTs=; b=gqJtDkRcbs9/11/n6nw1GaJLWZ
	wlLb/40FlwUekWWNa4X9hMpHhwQZ+DW/m60R2M9i33YEc/73DTXn1qzqtG5gba0TMFoxEngnY/lmH
	KmN7eKecgVVgl8BmdZpgQHGpA7K6SfWFvwZEE3JjGA32hsyJ+2BdPfwYowy9oCYSQn5LxQ0wnJ70h
	olzZE8/37Sr8oNMGl1Yyd00iOqOqL42VKJ+mK5WwL0qu2fiSn9VlT70t86b5ZfRVNx2PPuXzli+4x
	Qwha3A4QMokiA0V/0zma92PVj5l2sNiqeohvBJ79sIvjIFXBQPSXNetNc+R3AEGoT61MuEfHJa3m1
	+Udd7gkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oauwz-009t83-B9; Wed, 21 Sep 2022 08:19:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaurt-009qVV-9T; Wed, 21 Sep 2022 08:14:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4864B6602002;
	Wed, 21 Sep 2022 09:14:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663748044;
	bh=SRIF+BE4y6ayL9qbaLOyz0oXw3nZG/Mv2C9ZyzBP8/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CMcw+0SDi9/7dOzSrbr2XIqpu038PEVNgTFh0iWDLLkKgGH4JCEOij6lGo/8l5CXn
	 Tz+iNDggAu2sgJUhHfskNnCg82qjdCLtyQB7LhjYlkGGew4hzJROuGLpn9fPpHZDzx
	 hHIASo2FTWUA8ZdIBlSVHy13qNMjmS3eDlBzzPF7Ldhyz+fPcg2bIL8/6O5vC1QnzJ
	 8h55CCoKzH5MCJ2lf84iOGHfKQ/h5x3dunBYnJyTwW9CmzVd+CWvlmmAfQwKycxalr
	 PVBqwm1nSgK4lv/lejWR6KGqjmaZ3atuRa1QY5e0mTmn6AoiNxFaflelUtj6Jgxl/3
	 uB/HPRxPXM75A==
Message-ID: <18e220f0-885c-97cf-38e0-dfd16c807be6@collabora.com>
Date: Wed, 21 Sep 2022 10:14:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 11/18] phy: mediatek: hdmi: mt8173: use common helper to
 access registers
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
 <20220920090038.15133-12-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-12-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_011405_487396_6336D0C9 
X-CRM114-Status: UNSURE (   6.67  )
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

Il 20/09/22 11:00, Chunfeng Yun ha scritto:
> Use MediaTek phy's common helper to access registers, then we can remove
> hdmi's I/O helpers.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



