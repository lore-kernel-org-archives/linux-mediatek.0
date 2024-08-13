Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD69C531DE
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 11:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWczx1xYongTNhaTARkR38Kql3GGA/gjvktjNAZpgdc=; b=UVno4f1obL9zeSDVUiB0f+W+6Q
	RY4PLGEUg915tPyg9gplIk0imNjiPdd6Idyht3xMdhsLMLhL9IoopKXltA33JcKEIaeEhCBJOzCHX
	hLFm4UIocBvdQcvPWs1weFUOx5UKE8g5xxpOPUmdVH9dXc2rSJYwvmjlS2Fudzy81NGc17bHTW9tt
	1PJz+GyICDnPi1NRq1ErzX588tqiXpmZ4V9df8X2bX/ahJQudWxUX55fj1rP5Y7QW8cKfhBzGfUmD
	KnrPFwv+w/X7IkmHoP8FHVHmYpCpuJsVS8JD5h8oQXjvcVmOGKmzhOWqgqm39pu0ZjydK80AeUfNK
	YRl3kRsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpjt-00000003WNj-0zna;
	Tue, 13 Aug 2024 11:30:57 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpjE-00000003WDS-3LaK;
	Tue, 13 Aug 2024 11:30:19 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wjq0x5k9pz1T78J;
	Tue, 13 Aug 2024 19:29:37 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id A8EAE180087;
	Tue, 13 Aug 2024 19:30:05 +0800 (CST)
Received: from [10.67.120.129] (10.67.120.129) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 13 Aug 2024 19:30:05 +0800
Message-ID: <4aba9fae-563d-4a4e-8336-44e24551d9f9@huawei.com>
Date: Tue, 13 Aug 2024 19:30:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 00/14] Replace page_frag with page_frag_cache
 for sk_page_frag()
To: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>, Alexander
 Duyck <alexander.duyck@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper
 Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20240808123714.462740-1-linyunsheng@huawei.com>
Content-Language: en-US
From: Yunsheng Lin <linyunsheng@huawei.com>
In-Reply-To: <20240808123714.462740-1-linyunsheng@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.129]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_043017_132299_AE991284 
X-CRM114-Status: GOOD (  13.98  )
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

On 2024/8/8 20:37, Yunsheng Lin wrote:

...

> 
> CC: Alexander Duyck <alexander.duyck@gmail.com>
> 
> 1. https://lore.kernel.org/all/20240228093013.8263-1-linyunsheng@huawei.com/
> 
> Change log:
> V13:
>    1. Move page_frag_test from mm/ to tools/testing/selftest/mm
>    2. Use ptr_ring to replace ptr_pool for page_frag_test.c
>    3. Retest based on the new testing ko, which shows a big different
>       result than using ptr_pool.

Hi, Davem & Jakub & Paolo
    It seems the state of this patchset is changed to 'Deferred' in the
patchwork, as the info regarding the state in 'Documentation/process/
maintainer-netdev.rst':

Deferred           patch needs to be reposted later, usually due to dependency
                   or because it was posted for a closed tree

Obviously it was not the a closed tree reason here, I guess it was the dependency
reason casuing the 'Deferred' here? I am not sure if I understand what sort of
dependency this patchset is running into? It would be good to mention what need
to be done avoid the kind of dependency too.


Hi, Alexander
    The v13 mainly address your comments about the page_fage_test module.
It seems the your main comment about this patchset is about the new API
naming now, and it seems there was no feedback in previous version for
about a week:

https://lore.kernel.org/all/ca6be29e-ab53-4673-9624-90d41616a154@huawei.com/

If there is still disagreement about the new API naming or other things, it
would be good to continue the discussion, so that we can have better
understanding of each other's main concern and better idea might come up too,
like the discussion about new layout for 'struct page_frag_cache' and the
new refactoring in patch 8.

> 


