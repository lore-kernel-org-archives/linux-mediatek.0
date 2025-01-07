Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE180E77197
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2025 12:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WotX3OmVYtK9hOTlISzPgOeDnsvJ7SWrH06GSLHjh10=; b=WmqKwLKzPJHZNSh8c0gTj3JPgD
	3tYd8+5jKRKWz6hCpapOhezeGLspzgjw7vRjt2LXwUIkfDOwqfwE5skHQaHMplTjz0WH67okSd/DW
	GFiSS7mHbYfORHsj7LbPGLuZ7X58P1jXvA2ZcTeK5FvZESinxrHxsRuFhduBpASNI3Bn8AuFDGgCp
	HcU+ECmlIK78CkoDTe9bfF5Mvt+mS5jPTcPC4q5epqsgbgNc8E7Nv+PjwetObwPUpiqeS41WdQ/PW
	0oJ+lkxv4E9HlSwCQyXfSE8DDGVdZ8V++4lNdw3bs3wbOCgx0KGaulQrp1kn/MjCuYW/7yh8l7uJO
	lqDpXJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV97v-00000004rXY-072a;
	Tue, 07 Jan 2025 12:56:07 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV96d-00000004rF2-08B3;
	Tue, 07 Jan 2025 12:54:51 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YS9rx0bFCz1W338;
	Tue,  7 Jan 2025 20:50:57 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id AF9FA140137;
	Tue,  7 Jan 2025 20:54:37 +0800 (CST)
Received: from [10.67.120.129] (10.67.120.129) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jan 2025 20:54:37 +0800
Message-ID: <561e07c0-98ba-44ee-abda-778b12438df6@huawei.com>
Date: Tue, 7 Jan 2025 20:54:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/8] fix two bugs related to page_pool
To: Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, <pabeni@redhat.com>, <liuyonglong@huawei.com>,
	<fanghaiqing@huawei.com>, <zhangkun09@huawei.com>, Alexander Lobakin
	<aleksander.lobakin@intel.com>, Robin Murphy <robin.murphy@arm.com>,
	Alexander Duyck <alexander.duyck@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, IOMMU <iommu@lists.linux.dev>, MM
	<linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <netdev@vger.kernel.org>,
	<intel-wired-lan@lists.osuosl.org>, <bpf@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
References: <20250106130116.457938-1-linyunsheng@huawei.com>
 <20250106155154.7c349c67@kernel.org>
Content-Language: en-US
From: Yunsheng Lin <linyunsheng@huawei.com>
In-Reply-To: <20250106155154.7c349c67@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.129]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_045447_244253_F729C4B5 
X-CRM114-Status: GOOD (  11.58  )
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

On 2025/1/7 7:51, Jakub Kicinski wrote:
> On Mon, 6 Jan 2025 21:01:08 +0800 Yunsheng Lin wrote:
>> This patchset fix a possible time window problem for page_pool and
>> the dma API misuse problem as mentioned in [1], and try to avoid the
>> overhead of the fixing using some optimization.
>>
>> From the below performance data, the overhead is not so obvious
>> due to performance variations for time_bench_page_pool01_fast_path()
>> and time_bench_page_pool02_ptr_ring, and there is about 20ns overhead
>> for time_bench_page_pool03_slow() for fixing the bug.
> 
> This appears to make the selftest from the drivers/net target implode.
> 
> [   20.227775][  T218] BUG: KASAN: use-after-free in page_pool_item_uninit+0x100/0x130
> 
> Running the ping.py tests should be enough to repro.

Thanks for reminding.
Something like below seems to fix the use-after-free bug, will enable more
DEBUG config when doing testing.

--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -518,9 +518,13 @@ static void page_pool_items_unmap(struct page_pool *pool)

 static void page_pool_item_uninit(struct page_pool *pool)
 {
-       struct page_pool_item_block *block;
+       while (!list_empty(&pool->item_blocks)) {
+               struct page_pool_item_block *block;

-       list_for_each_entry(block, &pool->item_blocks, list) {
+               block = list_first_entry(&pool->item_blocks,
+                                        struct page_pool_item_block,
+                                        list);
+               list_del(&block->list);
                WARN_ON(refcount_read(&block->ref));
                put_page(virt_to_page(block));
        }


