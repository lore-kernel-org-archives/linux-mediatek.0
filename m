Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3465C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+wy+GCyWOxAG+D0N5x9jNunNq2AetQegub5DNGgCNU=; b=Ac/vfyYneulH/5YowilE+mu8Wp
	q809NYo7aHN0bY/+wbSmNZK4T/381CdZVCVXjDXauH80SvVc/rbLoz/5Dzg2qlINoPooI2wLp1p6a
	nuFYCyGZa5QuvUqep8JWtkvwdhIg3/be8+LsYI21ZRD32N5uFA5OplyYhrC7/Mtol5hnEqEf27/sp
	jcDDyEJb9rcQlprurQiWnZXd4piZB4KAW4PdwCI9/GydOAftTw4E2T3Ka0zO5J5wNd1ezmQ5rpvYy
	EKGxgUY6cwDrYs8vsEAYe5ADMFpBLymoh0i6I84ZOxUTOHqbrYvaShmxina0pcrzpkXP9zCAT2s+R
	Lp9UsNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28zj-0017lA-PC; Mon, 05 Dec 2022 10:46:43 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28zX-0017LF-5h; Mon, 05 Dec 2022 10:46:32 +0000
Received: from 8bytes.org (p200300c27724780086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7724:7800:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 059022202AB;
	Mon,  5 Dec 2022 11:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1670237188;
	bh=DZstiAjHSdQuEbR9+/Iz/H3P6d7QmsPAw9MqDo8doG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eH3Wk83pZgulySkItoSK6/qHpHlbbH7WyzT+3oj4A9DrnFPuHy5AxmMVNQxuqNGYG
	 qT46b3l6nDkeziVWGCj45KzbXS/DMyctxzs4vPcTZ70ameYyT2uyZRGSUV0tg6xv8A
	 iTIojMgW9i6WkMd/vmJ74YWA8q1jmjPSK1SeWIt/YiGczFoFcK3id6w2Y1Q5HIZwQI
	 iPYApacu/RFV/NW9u4pNWBVKNh4H7/7lpVg+KRYBvzZXRpVWN+/6IeRUWfcfuXWCvJ
	 f7NgbeAmr1+5QaDnef9DRQvM27+2pKa3ro5Gu87vx+JBQKqNjyq0bVNfeqgmWCv5Zz
	 9xJYHKyqCyvNQ==
Date: Mon, 5 Dec 2022 11:46:26 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
	libo.kang@mediatek.com, chengci.xu@mediatek.com,
	youlin.pei@mediatek.com, anan.sun@mediatek.com,
	xueqi.zhang@mediatek.com, Guenter Roeck <groeck@chromium.org>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v7 0/6] iommu/mediatek: Improve safety from invalid dts
 input
Message-ID: <Y43MAvPRx2BrRy/X@8bytes.org>
References: <20221018024258.19073-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018024258.19073-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_024631_468198_EDF85F34 
X-CRM114-Status: UNSURE (   8.47  )
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

On Tue, Oct 18, 2022 at 10:42:52AM +0800, Yong Wu wrote:
> Guenter Roeck (1):
>   iommu/mediatek: Validate number of phandles associated with
>     "mediatek,larbs"
> 
> Yong Wu (5):
>   iommu/mediatek: Add platform_device_put for recovering the device
>     refcnt
>   iommu/mediatek: Use component_match_add
>   iommu/mediatek: Add error path for loop of mm_dts_parse
>   iommu/mediatek: Improve safety for mediatek,smi property in larb nodes
>   iommu/mediatek: Remove unused "mapping" member from mtk_iommu_data

Applied, thanks.

