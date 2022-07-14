Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC914C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 14:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KfeVSZuCWGoO/3IauVVhmqbEfNmEGmZvjGhdWEeCPg=; b=jQI3HTxIag+tsPs8dOhJaxX+XU
	DKh392P+6atBzHWKJpim+1XgbkJVUYhNQ6BbaAU7PFkCbc5rFmCMaA4Ojd/LBDOhpWjLdAbfjNCHD
	BCpa/hyIptfYsYa6Dv3QGWwKBmqCY7bxRP+n7zYm+BD66WObJ8o5zkITgh+4O5wK+aCuikhst9429
	wnNmj2bn6wmV5at0bKx+pRbtJO+NBg8Um0iOWm8NYtvasPcaKdb6H4IOXS8Xo/3p4tMjFhPF3rKgX
	ietGR7eXq0RS77m8xUOivD+XxmbSMtQJnxkiu6NV/PaTF32JPf2Hx9pY2PqJRQVshyWtrIL6A0RZc
	spXF5vKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzY7-00F2qC-38; Thu, 14 Jul 2022 14:10:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzXp-00F2dd-6g; Thu, 14 Jul 2022 14:10:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EEB316601A3B;
	Thu, 14 Jul 2022 15:10:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657807816;
	bh=qi/qOdOVZ40TVm5BT2/tqZLayvaYuJfwS71mNq4bK94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JcdIcR6Og4Vg9G6/9NmALwvVAnVa9VVc7Z01u+3km5ggJNGstH/4pJ8D0LHNEuegB
	 mFtYzl2+56pl9b3k+sEKlNHI4TgPx3a/W/pgtLr/9TuzNqeHpQpAToedt3p88LRtmS
	 sMPyK9voeYry8ejPqJHihHXQkCUQjhzPSlSECNG9YwMup3Y32/hLw0g78EoAg195J6
	 hm9M8+N3oTLBMqs7DLpK2uz1Rb1UvI7j3dkVsLJP3MtYvx+Z5P/2l0jHwBEufEjbnc
	 dm+D9Vfd95ke/aDxE9WwYvcn1yX1XMxF/oy8c4tmhPItqSLBaergEPHz+0jRi/Mth7
	 U4tJ2v1DqiT3w==
Message-ID: <a1e984eb-4d12-fe71-1538-ff2ca4df3add@collabora.com>
Date: Thu, 14 Jul 2022 16:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 3/8] ASoC: mediatek: mt8186: add mt8186-mt6366 common
 driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220712150442.32504-1-jiaxin.yu@mediatek.com>
 <20220712150442.32504-4-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712150442.32504-4-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_071021_403955_7B5DA502 
X-CRM114-Status: UNSURE (   5.62  )
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

Il 12/07/22 17:04, Jiaxin Yu ha scritto:
> Add mt8186-mt6366 common driver for mt8186 series machine.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


