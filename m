Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9171EC27C4F
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sv3eYTFvLhM6WYmpZ3emyPvlQz95+zOc5ZZkftn2YM=; b=APMkLbqa1aSs0hNUBr30KPP3U/
	0MQRZXfrA7nkRLoB19lcmChJuNzGO3Wg1FwXIX7c3AZuyKABlHqYYeGVj80U4OjdRFNb0eIRy3pQs
	z/qrrtMQaL4CMddR6ScgubxnM+aZzTPpzrxrDOgD9aByCfiMxyJgc/R4ORRoSqs6+YiqUsIUwQMkZ
	KSCmfyVeWtcuAovrZzsKX8uRVPaZm/HlwSBEvmPnn+8JFGEpaWTafjvBQH8v8P4umPOpvzBT2nD20
	2PcnbqDdOOYMBOs9i2Iq6kB39uU+YmfO8FoYm+ryPIroNKVkd+Z3/D6MxGtiMCMF+j1/lFEPUZ6Vy
	wDA2O6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNW31-0000000GJ05-0qWr;
	Sat, 29 Jun 2024 11:15:15 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNW2q-0000000GIwL-26KD;
	Sat, 29 Jun 2024 11:15:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WB8jW1PQlz1T4NC;
	Sat, 29 Jun 2024 19:10:23 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 46160180089;
	Sat, 29 Jun 2024 19:14:51 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemf200006.china.huawei.com
 (7.185.36.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 29 Jun
 2024 19:14:51 +0800
Subject: Re: [PATCH net-next v9 00/13] First try to replace page_frag with
 page_frag_cache
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, <davem@davemloft.net>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Alexander Duyck
	<alexander.duyck@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20240625135216.47007-1-linyunsheng@huawei.com>
 <d2601a34-7519-41b6-89c6-b4aad483602b@lunn.ch>
 <a051a277-a901-2cdb-72d0-716002593019@huawei.com>
 <20240627125834.3007120c@kernel.org>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <b200a609-2f30-ec37-39b6-f37ed8092f41@huawei.com>
Date: Sat, 29 Jun 2024 19:14:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20240627125834.3007120c@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_041504_799563_2BF1FF45 
X-CRM114-Status: GOOD (  14.81  )
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

On 2024/6/28 3:58, Jakub Kicinski wrote:
> On Thu, 27 Jun 2024 19:16:22 +0800 Yunsheng Lin wrote:
>> On 2024/6/27 1:12, Andrew Lunn wrote:
>>> Silly nitpick, but maybe for the next version you change the Subject:
>>> to Tenth try to replace page_frag with page_frag.... :-)  
>>
>> Yes, it is somewhat confusing for the 'First try' part.
>> I guess I can change it to highlight the effort and commitment behind
>> the trying:-)
> 
> Sorry to ruin the slightly whimsical mood but if you do change it -
> please don't include the version at all. Some automation matches
> versions of patch sets together based on the title of the cover letter.

Ok, perhaps it is more appropriate to change it to something like below:

Replace page_frag with page_frag_cache for sk_page_frag()

As this patchset is large enough that replacing is only done
for sk_page_frag(), there are still other places using page_frag that
can be replaced by page_frag_cache.

> .
> 

