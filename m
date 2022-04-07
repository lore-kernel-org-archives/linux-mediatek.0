Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF6BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 09:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+2sMhNSy+8JiwkYHagjKyAVGmEO2swiW7ZCrrVa7qM=; b=lcbjGi4vrfAh/A
	v+tF94xGWfvzAsCzmtpDgdDMSnhOhOtxUbo4Kr7atc39giSpILQ37Gn2rDdY3WKTJpLGhnB8EKQe/
	DGkqGuuLp91e2QbVD1Rvil4jiLzyJ1ZqHaiZM4iIkLVE2xVVWTiskzNUSueRWlDEG47gfvHFg7ku1
	WXtOLdJrr7Fi7IGhie7fq4hhOtiZjyspmBFI4JEjxbY+nnzaKbwiHsHPXhN3oyZWH1/eB+PSN3V5w
	KC64CsXyjtN96twXa1JvkrU5viUmH6RCBb9LgIT3pfBk/gLQ3gj0pZQJtKHGRfp1mfn41r/dh0s3C
	1lq+aUxzZydVqXKmK3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncOW1-00AtAJ-HM; Thu, 07 Apr 2022 09:33:21 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncOE4-00AkaK-UC; Thu, 07 Apr 2022 09:14:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5D27A1F45D10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649322887;
 bh=KOUUy4wH6GAQEs7rFcW+lGMGEpD4eHNVSztumQ9nFT8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dlRPL489rp0dd+hV1gadtyJElAhxAtiMYNcYZ7g0JMeuBdXZfQz+SCeWvbgM4ujmP
 rTJV/zbPjiY62JR/9iczYlrkCoTRzZCcPNckh7BIFj129NvKjqQCc/sRcUd/+NF8W8
 bXeS2FXWneWQEO3PIglNNLPg7SQyWTP+k47T3ps7e0PsOemp9av8Y8G2/14tVEOKmh
 wpx/8mfS+RPqU6tXejaS84SIRTLiDonH6ZBnKJiOCBYuNUM+2Qn/lErz87jpJfKznh
 vhomv29Hs0nqCvSDelAlMFwrjpxAfdpghacrlG1AZayTIN+mHwqj0MjfR6fzhPney1
 xF24U8TRYlFlA==
Message-ID: <cc2bee43-5dc1-d058-958e-42b65ef609ce@collabora.com>
Date: Thu, 7 Apr 2022 11:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] dt-bindings: mediatek: mt8186: Add binding for MM
 iommu
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
 <20220407083230.18041-2-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220407083230.18041-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_021449_182593_A1186140 
X-CRM114-Status: UNSURE (   7.60  )
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
> Add mt8186 iommu binding. "-mm" means the iommu is for Multimedia.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
