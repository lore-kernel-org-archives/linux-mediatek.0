Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VkpVvQj77Mb34vOtJs6z1dKsY1K3iLbhyQ4CzyYOB8=; b=BjfEEexCkLG1xROdcktu0hY0Pg
	kG0l9MTT0MevV6zhJ+3R6t/z6ftSkuJdUMZ0ZdMVZqg67oZc1dJ3WmpjLkSDYu8IV3fXNfiKB27ak
	ubfyG3MTkQyEcRtfzOwMcYSc5KxRAm45RhjSPSXQv7rKVzCQ2559QO93z7baZkgsT7Mqh6wcUF6kv
	m+J+QgcTQuipDnFYhUGQ8jUJjpU0SYmW8Od1TUcgi5fKdChRm6PmfrZ/lKEXosiGapoRtHYIBzXOO
	4w6QmE0TbZ0mYWvuEzspYaR5+LR5oNtxajJhPIVh3eHdfcJswoNZgJ4u7OMMfndyhjN3rqgcJ7KyE
	uQs3GFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82fn-006UOT-9Q; Thu, 13 Jan 2022 16:09:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82e6-006TRr-Ta; Thu, 13 Jan 2022 16:08:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BC57D1F45F44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642090093;
 bh=x/HX2LfYxEQvfnhAXbWj457Ai64pnAPt+ks7u7hig5U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BTTMM/G6E0hDAXsB6yUbsFUNh60SNbnHxViP0XX6oIQVAAYiJjjaqZ7Y6S19YS/+6
 Zgk7ULIpumPREV5xB7YFaabGWLYnTCjLBA3Rraghu6+o/a2TTYFuCJC4tj3CMprJsS
 qRd7HnKkNQDkzSb1DON0pYxpXR7xvsXFrem3QiRoRSFqvvZ4PX0c2Xqno2uDKAFZTs
 gzFCef92I+1yEWCcMbdjTHlVs8BkL5KHDDyF2ijkTZ3blhjdTTv04jwyYYLESBYskJ
 Xv5n2iogByR9J+gKLdbNnz0JBs2Oao5Ye3D+mLEYoF160JtRs80zfKnVlYSG2KSf8g
 VpxErMBtTKBnw==
Subject: Re: [PATCH v11 08/22] soc: mediatek: mmsys: modify reset controller
 for MT8195 vdosys1
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-9-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3709d43f-48f1-a768-b2e4-3ca08651bbd3@collabora.com>
Date: Thu, 13 Jan 2022 17:08:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084645.31191-9-nancy.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_080815_168092_AA547DC8 
X-CRM114-Status: UNSURE (   8.98  )
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

Il 10/01/22 09:46, Nancy.Lin ha scritto:
> MT8195 vdosys1 has more than 32 reset bits and a different reset base
> than other chips. Modify mmsys for support 64 bit and different reset
> base.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
