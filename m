Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C1AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 16:33:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 558DF61406
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 16:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 558DF61406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHZbn1FgM41HALqUDjf1V7OJvNu8y9v/pqvD+LMUUTk=; b=WhwURUgPfQ1lpHdjiF18Zw94Iz
	MsJIINtOdh18VoJfgfSdJ3QhacU2ntn2uMQG55s9W4IyZCtpAbJNjfwn/9JgnH9z8nWnlJqsis06p
	z02GcLx85i1VGccmVfmDwdpLYH8WCgws65NQOrl0j34+uYyaeAcJvWQRnYV8asdLurPT33mMSUMqr
	ZAcVX9olFijd+6dfoU07h7F4z+TNdFgUG3PIRZnl5Rk/dtUPcxdsG1ujyPlGowo+KyYF5cfZv9dkX
	jYrtqaiMhatMwOLeMFx91Ze8rXJqARMDdDKmm2QcIKfVnRXclgDlV1f4pT2a1XDWkQN8nW8Jen4fS
	9WUK1+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVcWL-00BpV4-Tl; Wed, 29 Sep 2021 16:33:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVcW6-00BpR7-NK; Wed, 29 Sep 2021 16:33:12 +0000
Received: from [IPv6:2a02:810a:880:f54:fd5c:7cb1:aaa8:78b1] (unknown
 [IPv6:2a02:810a:880:f54:fd5c:7cb1:aaa8:78b1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3A3C31F4473B;
 Wed, 29 Sep 2021 17:33:08 +0100 (BST)
Subject: Re: [PATCH v8 03/12] iommu/mediatek: Add probe_defer for smi-larb
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Matthias Kaehlcke <mka@chromium.org>,
 anan.sun@mediatek.com, yi.kuo@mediatek.com, acourbot@chromium.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-4-yong.wu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <33a8b313-ad1b-d307-7e8c-2fdebdc6f1a7@collabora.com>
Date: Wed, 29 Sep 2021 18:33:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210929013719.25120-4-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_093310_935069_8E941972 
X-CRM114-Status: GOOD (  29.13  )
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



On 29.09.21 03:37, Yong Wu wrote:
> Prepare for adding device_link.
> 
> The iommu consumer should use device_link to connect with the
> smi-larb(supplier). then the smi-larb should run before the iommu
> consumer. Here we delay the iommu driver until the smi driver is ready,
> then all the iommu consumers always are after the smi driver.
> 
> When there is no this patch, if some consumer drivers run before
> smi-larb, the supplier link_status is DL_DEV_NO_DRIVER(0) in the
> device_link_add, then device_links_driver_bound will use WARN_ON
> to complain that the link_status of supplier is not right.
> 
> device_is_bound may be more elegant here. but it is not allowed to
> EXPORT from https://lore.kernel.org/patchwork/patch/1334670/.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623
> ---
>   drivers/iommu/mtk_iommu.c    | 2 +-
>   drivers/iommu/mtk_iommu_v1.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index d837adfd1da5..d5848f78a677 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -844,7 +844,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   			id = i;
>   
>   		plarbdev = of_find_device_by_node(larbnode);
> -		if (!plarbdev) {
> +		if (!plarbdev || !plarbdev->dev.driver) {
>   			of_node_put(larbnode);
>   			return -EPROBE_DEFER;

if plarbdev is null doesn't that mean that the device does not exist?
so we should return -ENODEV in that case?

thanks,
Dafna

>   		}
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 1467ba1e4417..4d7809432239 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -602,7 +602,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   		}
>   
>   		plarbdev = of_find_device_by_node(larbnode);
> -		if (!plarbdev) {
> +		if (!plarbdev || !plarbdev->dev.driver) {
>   			of_node_put(larbnode);
>   			return -EPROBE_DEFER;
>   		}
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
