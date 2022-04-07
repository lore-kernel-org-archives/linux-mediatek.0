Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F929C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxeXoytxktmz9xKn8jxHV6EYntmTfezOVFrfCt241Pw=; b=0qp0U9S+5bLxtQ
	KXYIzulbWKt7WeosyvQc0JyC166XxgR6PyUU4K8oyKCQ3hVPm38C6CSIF32U6n9IEMNEfTVZ8sQfw
	SjnDRZrejS9Pqe+g7jIIyG47RkxHjNpPZP08zyGLigb9e2ExhjEZsGDld5MOnmx4oc9MZnLlFqfXX
	t4td3vkQ5QeehFOoeCv59gTUxmhH6Xi80e3PhnNzL0lOZRERJMBVtQnG9UdzNogok9P5LMkDHEx8k
	9eXrYnI+yolEh0VxVECSya8kU0wD9DgulzqLybGWS6LCIpGZVPEJa19ItW4FLTe9TroaANGlRQDFt
	n5VasPKmfXn34u54CYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncOXI-00AthJ-Fu; Thu, 07 Apr 2022 09:34:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncOEL-00Aki9-1g; Thu, 07 Apr 2022 09:15:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B54001F45D10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649322901;
 bh=Vp8spYIhwo7N7JRZAF9B+aIKQJcypmlmdcxKZySVhHI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AluF5CwDx5CVbLKCQNTxPZUwsgNwazRh3dLrh3ErmlnI5jUJO2lRktx0PXSKBwGj0
 iZ9YnX5mCb4RdgIKes22gC895MUKXXaZZ5Ng1ZRGkrdyNXzkdpWayDjDo+EvQr/2UA
 LJUbZLFi5ZZRdiu9m9pIRe90Lh6bYs6AyJxElSVws5zJQayRS4MgBkIOvCDESV1sHC
 ti2qdF6tCCF1HNYAHLdeo3IiEQvI5YvKbZmNMJW0ydEyfdl+fKvOLK0SjJas7bUwhu
 +pjv85M6V3pA9HDckFLg53Srld34H7MG6VbEq2saEv//PTXD5ofFMHK+gm+9hijD8f
 iBKU29Mo9Kk6w==
Message-ID: <88182c78-de18-bf9a-994b-95d720d90917@collabora.com>
Date: Thu, 7 Apr 2022 11:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] iommu/mediatek: Add mt8186 iommu support
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
References: <20220407083230.18041-1-yong.wu@mediatek.com>
 <20220407083230.18041-3-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220407083230.18041-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_021505_296938_655DDFE3 
X-CRM114-Status: UNSURE (   7.36  )
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

Il 07/04/22 10:32, Yong Wu ha scritto:
> Add mt8186 iommu supports.
> 
> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
