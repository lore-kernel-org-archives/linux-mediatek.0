Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769EDC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9q9+EB9tFYnjpJaSgG63m4nxkyiIYt0RNii/Zj/ntY=; b=APx/S5cNE7tYY7g5ah8Nc9elKQ
	zLBFzBwOO9Wu6d7BtVZMHju0f7uPpGAhdHDpdyGpM9UGmZjScqfkEEVuUEMxp2Ch+X53C7e5IvMB9
	YdgLzWp4P1YwTtgw9IyrRCwocaXm/Avuwcy1/9wlGSefwXhXiFCU29M/B04VkCQi0cdW/RPj5bImG
	NMPLiQQx3hv0O2G8sLXVih3EAD/3ApAS3mRt1JzkV7ydeoNr8lHWQnM1FGGIkR9osdc0GiXM3i6W7
	FbsENbLNP9676Zgt+LOPy6Vki5eTPBVplg/2egoHuMwgcbluP8N/v/O1klaO9bUMNhHBJxPp1Tt73
	zVmPKloA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHM4c-009ST8-2z; Mon, 16 Jan 2023 09:46:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHM4N-009SMj-9H; Mon, 16 Jan 2023 09:46:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A6E0766029A5;
	Mon, 16 Jan 2023 09:46:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673862380;
	bh=nYQprZYDKKBXvoouxOYysIQde0DT4K7g+1YTSkKBGiU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fCApfwp9woRngKm4ZG1JqCe1yX4d8c7xfrO7LrW+GG7lSywzWwWeeIwU3Dum54yfK
	 nUpHOLQzwI4kPzWF5uawdu3O5okGrLLMWS6AZAuIUS7y3MRp7her0w3C/6cW8e7cAf
	 97Yq+BWJjT4xBp4HVbtgi5O62P0aYr5TpXd0YA+Bz366oVzInpp1V2X+Dm1+aSsIQu
	 eUh3Jv4RfX4pbC8GZwZZCuqnLHeSuFo22t/tvMCwwqrnoABMVR2hZ9VLwwNOqkiWQO
	 zpQnYL3o+9v+DHRHXmmrFVWm94uTnVxRhjS1yL7gjLXoD0jYCT2D1XefE24Ex6XaDm
	 HHjZgdmtzZfhQ==
Message-ID: <1a9a09d5-58e2-badc-6d1c-fe2008c305f9@collabora.com>
Date: Mon, 16 Jan 2023 10:46:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 07/10] iommu/mediatek: Add a gap for the iova regions
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, nfraprado@collabora.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com
References: <20230113060133.9394-1-yong.wu@mediatek.com>
 <20230113060133.9394-8-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230113060133.9394-8-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_014623_492090_F4850E31 
X-CRM114-Status: GOOD (  14.20  )
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

Il 13/01/23 07:01, Yong Wu ha scritto:
> Currenly masters can not indicate its special dma-ranges. Prepare
> for vcodec. some vcodec end address is address + size, if our size
> is 4G, the end address may be 0x2_0000_0000. and the
> register is u32, then it may get zero. thus add a gap(8M) for
> all the regions.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

I definitely agree on the fact that we do *need* this series... but this
particular commit looks like a hack.

I'm not convinced: I have a hunch that this one will sooner or later backfire
on us and break things again... at the same time, I'm not sure how to do this
properly at this point (I didn't do any research, anyway).

Ideas?

Regards,
Angelo


