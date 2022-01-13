Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OA3IB5yFlikcp0VyekH0qLKCs5QZUKDG+G2LR0o7M1w=; b=gAcUX/u5qro8VS0orI6700liVI
	mxe1DMUrONFrOSt39poBxNDond/u7JCjjxU50Edio4ts/CyKpkARxvBu1qgjew8Axaodw4Lk1eD/s
	d+16QuGk6qOJE2ffbUlUHydVronvIBERMLo7zvUJiOFmt2S+6sLxfqOYzwQzrAFTQerOiexZdj2lo
	2Izf6omgNlDpBRcEGWnVQnPyGvYLRkTmSZ56yPjin2EBywtvhrhwk1unHXN8efnpAhXOwoLKHL6eq
	UTeAfDgunVFdIeSX2KgLldJOtVhkzJQ8dCnChq2rQV3uL8+MElPx6Tc6TBfY2EEGly08ZglLtT8pc
	z7h+XFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7x5J-005OaT-Pz; Thu, 13 Jan 2022 10:11:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7x57-005OXx-VI; Thu, 13 Jan 2022 10:11:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E4E661F4585E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642068704;
 bh=D/XYC6ZGl5zYQW2bPb5HgmDBOTYg/Taj7564Kp6Xo1w=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=mE4sw4YvYqPtPCeGgdYDQbOGYr1D0sRwnP4JUyOyjhZj86DL2KdqFn53kzdPhLzVf
 Bw1VvaPOhimlqvAni2KTggbrrVF2tMVgZUYZ8GT3HumFLMHl/swIw8OEmuB63xYT9D
 ry4EVMAhrR1d8HMl2egIRfzRMjosarxVeMM5DKaB83CPATfsl/FDKcekgbGiXopEIL
 MnHuCbLxWgj6rZKBy6qsMzCkq0MxYh4lCNn7zCBOc/+l8UBmSPACrlbKg9pzt44nrH
 jFeTmjYUIPMAWJwQeXwYslmZrcg0H+P/WZvI2jlUHmT8gdPkXem6ziG4wdUDcl9DH5
 E8ZqIX9/NoQSw==
Subject: Re: [PATCH v9 12/15] media: mtk-vcodec: enc: Remove
 mtk_vcodec_release_enc_pm
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-13-yong.wu@mediatek.com>
 <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
Message-ID: <4bd9e849-96dd-6f1c-2841-979459366ee5@collabora.com>
Date: Thu, 13 Jan 2022 11:11:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_021146_200065_E9BB81C0 
X-CRM114-Status: GOOD (  12.33  )
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

Il 11/01/22 11:57, AngeloGioacchino Del Regno ha scritto:
> Il 12/11/21 11:55, Yong Wu ha scritto:
>> After this patchset, mtk_vcodec_release_enc_pm has only one line.
>> then remove that function, use pm_runtime_disable instead.
>>
>> meanwhile, mtk_vcodec_init_enc_pm only operate for the clocks,
>> rename it from the _pm to _clk.
>>
>> No functional change.
>>
>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>> CC: Irui Wang <irui.wang@mediatek.com>
>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Hello Yong,
the mtk-vcodec patches were merged in Yunfei's vcodec patch series and Hans has
scheduled that for v5.18.

Can you please send a v10 and drop patches 10/15, 11/15, 12/15 (all of the
media: mtk-vcodec: *) from this series?

For the records, I think that after sending v10 this series is ready to be merged,
as it was well reviewed and also tested on many MTK platforms.

Thank you,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
