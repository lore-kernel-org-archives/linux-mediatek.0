Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCA5E77188
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKe7JjbSYfgWqNHSmSkEK91ZLwUX2k6CBF3+8wJnztI=; b=CTT6IuCgoKh1Ghvpr3+g/+FndY
	JPWlF14HH3LoqqU+XKiUy9le7IsPh9auLFR4Fm2hZPuFDuwu8dd8OE5sgZEOzLu3HTXgvMu73EbOT
	XYazNvWizu5WVAH+GL6a3wqw7uIhqmuGIsvtNdPJUIiwYFLvSEKG67HkrGXNt1zSTQc6vacp14AUL
	yKnAxKeqqYolxLdJ0LZ72YMB+Wk88uywGtkO68p+Srnj0To+04qJDwKjIv6zWk1ebHLDJYVCqUucA
	VeApkPt3NyEngFOqLC07UqMl4J6E591/btidD0sm+4mPfX/0MuwMoXF3snaebRXB+ghKw5hQTMsVk
	KjSfRpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSYb-00000007phM-14u2;
	Wed, 08 Jan 2025 09:40:57 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSVj-00000007p20-1So4;
	Wed, 08 Jan 2025 09:38:00 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YSjRV6mV3z1W3jT;
	Wed,  8 Jan 2025 17:34:14 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id A9BDB14035E;
	Wed,  8 Jan 2025 17:37:56 +0800 (CST)
Received: from [10.67.120.129] (10.67.120.129) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Jan 2025 17:37:55 +0800
Message-ID: <f86d3fe9-f508-4463-8587-b001979d70c4@huawei.com>
Date: Wed, 8 Jan 2025 17:37:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/8] page_pool: introduce page_pool_get_pp()
 API
To: Jesper Dangaard Brouer <hawk@kernel.org>, <davem@davemloft.net>,
	<kuba@kernel.org>, <pabeni@redhat.com>
CC: <liuyonglong@huawei.com>, <fanghaiqing@huawei.com>,
	<zhangkun09@huawei.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, Jeroen de Borst
	<jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>, Tony Nguyen
	<anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend
	<john.fastabend@gmail.com>, Saeed Mahameed <saeedm@nvidia.com>, Leon
 Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Simon Horman <horms@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, <imx@lists.linux.dev>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<intel-wired-lan@lists.osuosl.org>, <bpf@vger.kernel.org>,
	<linux-rdma@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20250106130116.457938-1-linyunsheng@huawei.com>
 <20250106130116.457938-2-linyunsheng@huawei.com>
 <02896f96-57dd-47d5-8fa0-8a8aed30fa9a@kernel.org>
Content-Language: en-US
From: Yunsheng Lin <linyunsheng@huawei.com>
In-Reply-To: <02896f96-57dd-47d5-8fa0-8a8aed30fa9a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.129]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_013759_702524_F4C87A9E 
X-CRM114-Status: GOOD (  13.90  )
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

On 2025/1/7 22:52, Jesper Dangaard Brouer wrote:
> 
> On 06/01/2025 14.01, Yunsheng Lin wrote:
>> introduce page_pool_get_pp() API to avoid caller accessing
>> page->pp directly.
>>
> [...]
> 
>> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
>> index 543f54fa3020..9c4dbd2289b1 100644
>> --- a/include/net/page_pool/helpers.h
>> +++ b/include/net/page_pool/helpers.h
>> @@ -83,6 +83,11 @@ static inline u64 *page_pool_ethtool_stats_get(u64 *data, const void *stats)
>>   }
>>   #endif
>>   +static inline struct page_pool *page_pool_get_pp(struct page *page)
>> +{
>> +    return page->pp;
>> +}
> 
> IMHO the function name "page_pool_get_pp" is problematic. As calling it "get" indicate to me that we are taking some reference on the pp object. Is this you plan in later patches?

No, this patchset is not going to taking some reference on the pp object.

> 
> If it is simply a dereference of page->pp ... then we could call it page2pp ?

Before this version page_pool_to_pp() is used, this version renamed it to
page_pool_get_pp() as there is an exising netmem_get_pp() in patch 3, which
is also simply a dereference of netmem->pp, using page_pool_to_pp() does not
seem consistent with netmem from API naming point.

> ... but I'm uncertain why we need this change.

This patch is added to make patch 3 more reviewable as page->pp is renamed to
page->pp_item in patch 3. If there is no helper added in this patch, patch 3
might need to touch all the places touched in this patch too.

> 
> --Jesper
> 

