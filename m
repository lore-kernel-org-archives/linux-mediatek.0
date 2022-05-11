Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09536C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOPZckCH9DDA9f5CvSz0Wyd17oT1o8KiTZvOwVaeaB4=; b=VSAuwx30fFZNmE
	jWrGCXQ1OjfzINhToKAK0AIgyIpNwSY8ceIyIYZGmbbrKJR2V6an5J8AYp4wjUJjM09aA7ygKM2xI
	DSlQ5CBI7EDD5H4znqNZXL23x8rIUzAXvImSVpKS1XYev06SG7jhtxPid0e5kqe8KxcTP731IYm7e
	IC2m0J9HqBvMBexOBdBhpX+3bRrXBs+PVHRQSNstnaNhpNTLbWq1zAFRMXRe7A76Jf4B1pYIzHQNP
	zY78g6b0calS5Qu/LyoNjEBdgnJsMU5rzS4v7cFnBKwrWPNNnFfXXqXu8jGDlHJH4CL9Rm06l4FM5
	dPjx3wdcuU1ON2xcgT4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noniy-007KsD-LZ; Wed, 11 May 2022 14:54:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nonim-007Kmy-Hi; Wed, 11 May 2022 14:53:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D3AD41F4305D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652280824;
 bh=hiCszEOEiRWDy9PmZfFtMkSpl4zM/nh6AVy0EHkIDYQ=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=asNGWawcKO386eoV6Ik3dXldZywT8oDuTlXksokpIIRR4gEyOav/D+tb4Juwr+k4y
 Qx+rYNtLFhqMtdSQGxu2vUOcTonxYINTbtNnjoBS/yQLEEI13gfvNtYIZuqr7YSCYN
 CxG5n9KstAMaivz0dLSG8XxRt7c2mm+yeMKgVOj8ugrKBs7QwuqDQCBCfamauVy14W
 R47VUmrSRn6eleE+bFO5EP2wWBxNxVcpnGnyq8MTs34Wd3SAlUU5VdMv9+im2UjnkH
 QnJWN+7n9mcg3M0eAeLcLIEl42peP7r99nhPHNgkgjWeHpMQzZV1nT7DlDooTn005z
 55mJoc85Lt5sw==
Message-ID: <26273bf5-c4a4-da9d-d722-da3880a27ce4@collabora.com>
Date: Wed, 11 May 2022 16:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 3/4] iommu/mediatek: Validate number of phandles
 associated with "mediatek,larbs"
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 xueqi.zhang@mediatek.com, Guenter Roeck <groeck@chromium.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220511064920.18455-1-yong.wu@mediatek.com>
 <20220511064920.18455-4-yong.wu@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220511064920.18455-4-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_075348_774480_6A7A34A0 
X-CRM114-Status: UNSURE (   9.45  )
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

Il 11/05/22 08:49, Yong Wu ha scritto:
> From: Guenter Roeck <groeck@chromium.org>
> 
> Fix the smatch warnings:
> drivers/iommu/mtk_iommu.c:878 mtk_iommu_mm_dts_parse() error: uninitialized
> symbol 'larbnode'.
> 
> If someone abuse the dtsi node(Don't follow the definition of dt-binding),
> for example "mediatek,larbs" is provided as boolean property, the code may
> crash. To fix this problem and improve the code safety, add some checking
> for the invalid input from dtsi, e.g. checking the larb_nr/larbid valid
> range, and avoid "mediatek,larb-id" property conflicts in the smi-larb
> nodes.
> 
> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Guenter Roeck <groeck@chromium.org>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
