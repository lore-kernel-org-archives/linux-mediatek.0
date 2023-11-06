Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AE2C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOOBxbXwF/hkBHRzV//r5PWvXjjDLFzOQeV31xBdoNY=; b=eWSSlOE97cU3GZsmfEple6GHUX
	9hwdW0fPCzn9Mpda4aPoj6OrZNUS0S+UpFs5uJJzIq2q4vKEhpiqYiwCU4lEGX82hBB1JLJg58iak
	0OBwESJJKisSt5uv0Y3hMcq1652yP5GsCtnewAuZZDgZBEPGcFW44368nBaL37kRnKxD+FlUF5Fks
	K3Way1AW3Q4fX1iRJIzh5IzfocVmmaElALuPQfLcyT6STMpA+6gd/8m2txxx77ez/aDoEpAbMqZ5M
	lV1xNBqWWRKx3dP5EqJVNogxVNnEkrI8AXSIYarv26xpIe/xtNnISDJjOx18DKwfbq9zjeG9XJD5S
	4TIGIskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyV-00GfFQ-0d;
	Mon, 06 Nov 2023 12:45:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyQ-00Gf96-12;
	Mon, 06 Nov 2023 12:44:59 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9C8676607482;
	Mon,  6 Nov 2023 12:44:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699274697;
	bh=IYhctRnsJfWr1S6xZVv9OU0HXSgl08A5U9Or74Nza4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nrewubOQD7kFZ83Gw+JrVL41Uxrj/RuMf1PnnZvEWj4AumWLGfD3oTFM58IOcDl4o
	 C6hyJkRk8rdj8fs/iXZMVKi+sDv5/AAMB5nQWFQJVe6colvyj7uBT4Yg/llE7/lz9u
	 wqmmrSG+71WiN7UkaXliOHUUodimmwuWVD/eDMmyAZ+9w7UTTbzL4s+y7I7F+wc3eN
	 PnbRWo/r4aNODNuFbjnCWDez+JLnVOUXBYo9d8SJe+lhqZqfr3Mwhf8R13Qp7Ottw+
	 vMJD20rXyXeFYbR/uPS4NkFwcgReKduhfGKXZj2mxAFpdzGnRVDfmn0YU3i9N/YZVo
	 ELnTRvvRwlzXQ==
Message-ID: <6eb1bb96-8690-4ee7-9d03-c852b7395683@collabora.com>
Date: Mon, 6 Nov 2023 13:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/12] media: platform: mtk-mdp3: add checks for dummy
 components
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
 <20231030100626.12564-6-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030100626.12564-6-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_044458_511240_4E8282AA 
X-CRM114-Status: UNSURE (   4.96  )
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

Il 30/10/23 11:06, Moudy Ho ha scritto:
> Some components act as bridges only and do not require full configuration.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


