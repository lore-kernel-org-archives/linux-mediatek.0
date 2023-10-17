Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C327CCDB483
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 07:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ceQfyJRbxSDCvg9jEfQCM1slwFypLY6IdcgFLFw9Wis=; b=t4qKZteMfgN6sm+31bGVpkbFyX
	WHLp7aBaDpjzu8qc+um2vxyd+XNOGcnjoEK9zuwocpSbD2mT4PuDWMChMJLbFukkNp3tLWt5MoBah
	JbhYPjPWMJuPn0bLcVxINd1qMO61Hpp4Y9lOAfcCw5a2hUkU1V15dvrBvO9q5GR5GuvoXcuXzjacy
	eNWGkPesG/C4DEYyig8FDIUejbdYBkFQ9pC83f4ZbtzA4H63SR1zk5rX6uCH9+9yDt4ZV9O2Qrbcc
	NymnV1z+vIYwVdI2vp+KjCz7E+19/Q7JsIa+lWhcDDGE2We3pzZDHPLKBOxPb55bJsh21SCXnJs61
	tLBXKO/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsewt-00BbyX-1k;
	Tue, 17 Oct 2023 07:57:07 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsewq-00Bbw6-14;
	Tue, 17 Oct 2023 07:57:06 +0000
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4S8mQs5jvzzvQ67;
	Tue, 17 Oct 2023 15:52:05 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 17 Oct
 2023 15:56:49 +0800
Subject: Re: [PATCH net-next v11 0/6] introduce page_pool_alloc() related API
To: Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20231013064827.61135-1-linyunsheng@huawei.com>
 <20231016182725.6aa5544f@kernel.org>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <2059ea42-f5cb-1366-804e-7036fb40cdaa@huawei.com>
Date: Tue, 17 Oct 2023 15:56:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20231016182725.6aa5544f@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_005704_608793_7298D2E8 
X-CRM114-Status: GOOD (  14.22  )
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

On 2023/10/17 9:27, Jakub Kicinski wrote:
> On Fri, 13 Oct 2023 14:48:20 +0800 Yunsheng Lin wrote:
>> v5 RFC: Add a new page_pool_cache_alloc() API, and other minor
>>         change as discussed in v4. As there seems to be three
>>         comsumers that might be made use of the new API, so
>>         repost it as RFC and CC the relevant authors to see
>>         if the new API fits their need.
> 
> I have looked thru the v4 discussion (admittedly it was pretty huge).
> I can't find where the "cache" API was suggested.

Actually, the discussion happened in V3 as both of discussions in V3
and V4 seems to be happening concurrently:

https://lore.kernel.org/all/f8ce176f-f975-af11-641c-b56c53a8066a@redhat.com/

> And I can't figure out now what the "cache" in the name is referring to.
> Looks like these are just convenience wrappers which return VA instead
> of struct page..

Yes, it is corresponding to some API like napi_alloc_frag() returning va
instead of 'struct page' mentioned in patch 5.

Anyway, naming is hard, any suggestion for a better naming is always
welcomed:)

> .
> 

