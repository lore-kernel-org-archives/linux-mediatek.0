Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C61C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WiQftEsj09jcqXvmPTirnQlCDSbfENf6a05gbnG9nqw=; b=3dNPBXXVS11Khb
	FkFA/tzkZiSVyhJ8b3VEW8S2yxNHLv81csBfD3fgyK4PE2/24IRpPhcL6ALnb0piN/DhC1hrmypaS
	nU7FDdhyOaNqDbml0rhDv9JKqGGqvsiXnDS89SybPBdH+j+PWQQ55+87OhmBVd5TsfLmAeAehcS9s
	8p3COK3yrEbDX1KhFFCOvt8Gb5p1wz6ScmcT8eTMzH5ZqY0U4ip3gGhv2/i+VACgyxHVpo3t4D+mS
	u/jbImgOGuq8CO6NFM/CDeHdTTYXnF9cRK0+DeEf/XfW1YCe043VWlLyUqc+W3BOcozRoZk4nq+fA
	ddEZPek3bZoIZgVrf0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nESwF-008dNd-Ol; Mon, 31 Jan 2022 09:25:31 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nESw1-008dKE-VY; Mon, 31 Jan 2022 09:25:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9E96B1F42DBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643621116;
 bh=fbIVeyjQyhAhoLY74piWBq3+1URHLKGzFfERXylZibQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G+n3SkiadJcTl8Uqq2gHU6UPyYTCJCZe7c+k6nTg+Y+oZCIgkdqmSAHWpY8W0EiF6
 pwJ3msh30uXexOLmgW47/hr852Sm3Vw4+/yofQhItYYCZrnECur6u/fmN6PaGZwCHQ
 8eEauqSR4Pnd4VMg1PS3+j86GNhxWxjb9HSawRcZGw+YjGmMEEOO8Fkt9nORMLDVK6
 46CeNecPN4m3tA8FfYAuf0mf70jC0f4ouz92sU4Tgp4Da4UAPXpbijXvjDyq2ju9Q5
 mzWXxm5QVDoAioUeUE/hA3KfUBIQxowARZVsfux8Yqbz7P6kpN7cvAgYFEQF713KJ3
 e9qABAggpKHAQ==
Message-ID: <0e430d1e-ee25-1b3d-4a2c-8641db255adb@collabora.com>
Date: Mon, 31 Jan 2022 10:25:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/2] iommu/mediatek: Add mt8186 iommu support
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
References: <20220125093244.18230-1-yong.wu@mediatek.com>
 <20220125093244.18230-3-yong.wu@mediatek.com>
 <b52a1df8-58f4-baa2-cfb6-9c56244caa0f@collabora.com>
 <01cc69cdf7773962140c01fe37b12ab2c9491c25.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <01cc69cdf7773962140c01fe37b12ab2c9491c25.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_012518_192647_6B010FEB 
X-CRM114-Status: GOOD (  16.23  )
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

Il 28/01/22 10:39, Yong Wu ha scritto:
> On Thu, 2022-01-27 at 12:28 +0100, AngeloGioacchino Del Regno wrote:
>> Il 25/01/22 10:32, Yong Wu ha scritto:
>>> Add mt8186 iommu supports.
>>>
>>> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>    drivers/iommu/mtk_iommu.c | 17 +++++++++++++++++
>>>    1 file changed, 17 insertions(+)
> 
> [snip]
> 
>>>    static const struct mtk_iommu_plat_data mt8192_data = {
>>>    	.m4u_plat       = M4U_MT8192,
>>>    	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS |
>>> OUT_ORDER_WR_EN |
>>> @@ -1470,6 +1486,7 @@ static const struct of_device_id
>>> mtk_iommu_of_ids[] = {
>>>    	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
>>>    	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
>>>    	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
>>> +	{ .compatible = "mediatek,mt8186-iommu-mm", .data =
>>> &mt8186_data_mm},
>>
>> Hello!
>>
>> Is there any particular reason why this compatible is not
>> "mediatek,mt8186-m4u"?
> 
> There is no special reason. In the previous SoC, We only support MM
> IOMMU, it was called by "m4u". In the lastest SoC, We have the other
> types IOMMU, like for INFRA masters and APU, thus they are called "mm
> iommu", "infra iommu" and "apu iommu". Of course, "m4u" means "mm
> iommu".
> 

I suggest, at this point, to change it to "mediatek,mt8186-m4u" for naming
consistency with the other bindings and to avoid any kind of confusion.

Thank you!

>>
>> Thanks,
>> Angelo
>>
>>>    	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
>>>    	{ .compatible = "mediatek,mt8195-iommu-infra", .data =
>>> &mt8195_data_infra},
>>>    	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data =
>>> &mt8195_data_vdo},
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
