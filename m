Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342CDC30653
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 11:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Q9u+2xVDd+iz7+hf3CYyKhRnEeUGmDvsQ3aqWiAWdI=; b=GU4m9O0aP+d5JHGdtRrt7TMpYM
	Ov0k5FhELMpQwXLgEjOp6v5dNLGq106uQtQuSefHIwhqDMhK2tBn+Q4eV6oV0R+JhvVQDOysi69a9
	uoblJGjPuNWPmMmDRu6og/lG2iYkAk4HGbfcK1mRX2V+7GUe5Ftg7WNDStEOVX1caaQlwsHEzqr5/
	y1yFA95fmmhg8qHGwRXKBsCpPa+/NyWJIy7ZNn6Aov4F0AtgPFHT0EH9ACRu34fGVYwLDRv3uQBF9
	w4uBibDpcgIUdbsvRDJFCwmFAWynrdAH1O5MI70NSYpoNLgmM0LdHuZ0FO5Zt3ttZhU5RnHJUXQVF
	o6CErTcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMn8J-0000000A7pk-1XaW;
	Thu, 27 Jun 2024 11:17:43 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMn7G-0000000A7fe-2Qgd;
	Thu, 27 Jun 2024 11:17:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W8wrF4rhxzZgZ7;
	Thu, 27 Jun 2024 19:11:57 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 4F53218006E;
	Thu, 27 Jun 2024 19:16:23 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemf200006.china.huawei.com
 (7.185.36.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 27 Jun
 2024 19:16:23 +0800
Subject: Re: [PATCH net-next v9 00/13] First try to replace page_frag with
 page_frag_cache
To: Andrew Lunn <andrew@lunn.ch>
CC: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Alexander Duyck
	<alexander.duyck@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20240625135216.47007-1-linyunsheng@huawei.com>
 <d2601a34-7519-41b6-89c6-b4aad483602b@lunn.ch>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <a051a277-a901-2cdb-72d0-716002593019@huawei.com>
Date: Thu, 27 Jun 2024 19:16:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <d2601a34-7519-41b6-89c6-b4aad483602b@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_041639_212403_AC22F179 
X-CRM114-Status: GOOD (  10.43  )
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

On 2024/6/27 1:12, Andrew Lunn wrote:
> Silly nitpick, but maybe for the next version you change the Subject:
> to Tenth try to replace page_frag with page_frag.... :-)

Yes, it is somewhat confusing for the 'First try' part.
I guess I can change it to highlight the effort and commitment behind
the trying:-)

> 
>    Andrew
> .
> 

