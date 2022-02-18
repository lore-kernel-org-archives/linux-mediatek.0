Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609E9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qd+BCzr4gTuQbQ9wiR03RyWVrYyPKnEvgeYC4ZuFUNI=; b=GOgXBKwwIlQPv7
	DNSlqBK2UKpDsmMSczWgsw8kEVHTHwsyCHuvqZ5rzirHKRukwPtMu6EH/1mpvocZFz4GknnegcAlL
	8pqFzwX1p300MLG1oU441T7+I4gzfoRBaNNMtD7fomn+AEqYkHVaOpD0Di8MOj3qNfM6Nsp1zVlUX
	UZqvQW8DS7ZG33XLWZQ4lLjUPX/yzUQZ6H4n9JexanSevkqo0oGgadxcUlhPe/ceD6M601ld/IOtr
	jgO6AW667Q/GoMok2yTf/uhcHIAzBy+2pKXTlGtQAdlxoRR0cd5Y7YRgY8lbjT6ksNF4/PEL5e1x2
	dXqguNe6CZW0LKoYlmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL39E-00EVGP-A3; Fri, 18 Feb 2022 13:18:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2lk-00EKiy-5s; Fri, 18 Feb 2022 12:53:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 96DCE1F4241F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188830;
 bh=Gv8c/LMKo6rxgaMQAVOHcLVtihxtts7Lugi4FWiRWzg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jsc+Jd7YNSdcSO7Arwmg5Oa5RcOIdQwAd1Vp9MCMsz3njw0Lh3TqNOjD/5VdNV7ds
 iI3sQ1uy1f4dMupHFJbAhjHvePu0G0116Qam/iDQKq9ZgrL0iriNP/ImzZMPuG8Vq5
 VhVTNL3KhMozEcwOSBxxcKRacJVHokQNnQQdmJZ7DUGkfshLwdu6xJXMYncEG4B1+7
 KqStXONu4k1fHPNg9tPMMZq+sUaWrDAjDFPdTLD4rsKaXEq3pGGed8UM2lDEJt2esm
 IFY5E1Pl5wyQLlXs885fc9PrvpIC87ygeqRuDdtm/39jVwdEwND1zAafv7zWPVbFzL
 /TW6GzjnqRNcg==
Message-ID: <b69b6a18-c991-4c37-fff1-d68d140e4901@collabora.com>
Date: Fri, 18 Feb 2022 13:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 27/34] iommu/mediatek-v1: Just rename mtk_iommu to
 mtk_iommu_v1
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
References: <20220217113453.13658-1-yong.wu@mediatek.com>
 <20220217113453.13658-28-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220217113453.13658-28-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045352_428546_91DF93AC 
X-CRM114-Status: UNSURE (   9.25  )
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

Il 17/02/22 12:34, Yong Wu ha scritto:
> No functional change. Just rename this for readable. Differentiate this
> from mtk_iommu.c
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/iommu/mtk_iommu_v1.c | 211 +++++++++++++++++------------------
>   1 file changed, 103 insertions(+), 108 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
