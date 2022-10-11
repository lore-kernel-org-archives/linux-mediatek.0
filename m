Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C34C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5QyRiYxoIPTl1becKG4ntL+WDkKgrGjf9+tZ7Qzyas=; b=ogK8lGWNN+qVjBOrvU9b+6v1OE
	FZYGw8jzkGPL9GWERmSviiT08Dx0ZMuO0TQrgqEviTTEJodWAr3pAJ0B7YwhD8tkEwTpgi6WqYcHu
	WNH/0U9ng2Q/CU6jBWntadMNE9MoZQgnDE9AH1CmANOY8Wm3t+gK2VdDYLLGVv1kLOPlRcTQOOiRh
	0PpoT9/m0vHWte80YN7yaoVcCmIHZeuzv0hGvtUccDm//dJAkXHHE957IV24Zz4sCSbGMvMIrqQ7k
	pQdIWCLJEzdEw9L3PVwUwDdPDFKIAIWkqZSRUxM21ZP3DihAjg6jupUEg5LWzJo1FQ7vMsNX7fLRc
	H5bogpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCCr-003xwz-Ft; Tue, 11 Oct 2022 10:09:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCCK-003xjx-3n; Tue, 11 Oct 2022 10:09:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 261396602343;
	Tue, 11 Oct 2022 11:09:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665482954;
	bh=yD8MLwnbAclDp4Xewj3VH7u3nJk3rGu6f0uvojTff9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lIR3NbrWRKiboMxa7QgYSmIAwvzIcuhmHUZUOACLQL+lp2jigo9Dy3SMgBC4TLlDb
	 ZT8VUMMxXsdRI8YGBJ+rVZ6w6NP6De9oCDnlosjA6Fl8wWNNzTv65b9XaWpfEuv41d
	 vYqe2RIh68Xp0NBWnlUXIU8jrkY1K3jNglTUY8kuq07w5jmcr8+of8ulW9I81T3ukA
	 2wSVezx42KfRxlovWL38YicXRj5IgtFIz7I8Uhhgo1oCXgFx1VLVCUQA5wpQrUR2w5
	 YTJF4YTI0j/01GZVPgcLyQhNhm4fbWXxQnD81bj4n43mzhLWR4grNXWVAOkYhLMkxL
	 uNtWMojfnDkbw==
Message-ID: <25e0318d-b114-5158-25c0-83453993a639@collabora.com>
Date: Tue, 11 Oct 2022 12:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 7/7] soc: mediatek: mutex: support MT8195 VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221011070356.682-1-moudy.ho@mediatek.com>
 <20221011070356.682-8-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221011070356.682-8-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_030916_319838_D491EBF3 
X-CRM114-Status: UNSURE (   7.73  )
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

Il 11/10/22 09:03, Moudy Ho ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add MT8195 VPPSYS0 and VPPSYS1 mutex info to driver data
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


