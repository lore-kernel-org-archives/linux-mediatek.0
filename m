Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20553C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCccwlRrhAS4TWq2raxbLGuKErNDZSe//BQHEb28kKo=; b=g9OFkSEyglir5nusbFiT1LH026
	HHHCx5dhJCOv3jGOqXTR2ZIlkQG/oYf9Ug0zfkRCpu7ptoIz4KqwTxBB+JVPFgZLfgtTl7rAJ6Ah/
	MFCL/O8X2jNWeRYzQDCfIkf8hkesaJ0Ij0gdVFCNcI8EtLjcVNs8FaRmMPEIC7jv0Us00LgKHq9Lf
	tNFXHCaBvtCV3M/NOkvLi7yCGpcOq5c4tBQ8IerGX6jj2efm9/6SEbKBAOOFhcJix3MDkL4iOJkRa
	ltdOUDUvhewTymEiO8UKFdaMBqFzbo73z1dKIoGZolwP28luvGaM392m/kXPbA6LOhMZ2/aPL133n
	HbdP/C5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mN4-00CBVi-0V; Tue, 04 Jan 2022 16:09:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9t-00C52w-7W; Tue, 04 Jan 2022 15:55:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 102FA1F43596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311732;
 bh=icBLMUonunjpmX9rW+0plsHzwxROBGPHnt6LCs9+8RU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iCJ8g6eszCN0ha04hpDyyq5hPraa4vVwFaNybDlyDirnfaF8oDX22VJOSeyewzwNb
 Z5tfkuvhj4sC9EQSkF/OGPgTXw+fRe29stg7mI1llaWiWRULsDeedvXmSmnfGBRMC6
 yS6TObQmaaHdzmsXygwwZwpvvO04OZ1FchwKvxWg8BDNcPefKa++sSOZ4OLHVXXinQ
 aBCt4wGKp7YTC7oYhbCBshowoPpwQTKWCaHx86xsv9fxFHuDSCHdmCGoQ2kPdO0rTt
 qb6mR7D+ojF04T9qubdr57hwBuPwWtog95+nxEeK5H/FMkFTp4FSvf7VPWfTucpNZZ
 ircJfvbEUYMRw==
Subject: Re: [PATCH v3 19/33] iommu/mediatek: Add list_del in mtk_iommu_remove
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, chao.hao@mediatek.com,
 yen-chang.chen@mediatek.com
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-20-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <301a89d6-13ca-25db-facd-1860bc77f02b@collabora.com>
Date: Tue, 4 Jan 2022 16:55:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-20-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075533_463738_7B9C28ED 
X-CRM114-Status: GOOD (  12.42  )
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

Il 23/09/21 13:58, Yong Wu ha scritto:
> Lack the list_del in the mtk_iommu_remove, and remove
> bus_set_iommu(*, NULL) since there may be several iommu HWs.
> we can not bus_set_iommu null when one iommu driver unbind.
> This issue is not so important, No need fix tags.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

I would still add a Fixes tag on this commit, as that would schedule it for
backporting - and that's rather important, solidifying older releases.

Please add the required tag, after which...


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
