Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EABC27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 12:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KADAElT8ZTjjr5VRdgaDHRkuE0COkVo307Km/E5TS0=; b=4c8R1DBC+ScI44UF1xusPKh31d
	nxR+8upCfjuhVye9xAbbJSyB8oQuOl9ntMe6F+XYN8VaQyH8Eq+YiPMP/UHhzE7hkcpCgJh17bAHX
	hRUHGUDIgnFSUARP94/oTHCw+bTsabeEek4/AEXxD9kaiCS6d8CohHr//Hf+QLitgbbvzihUgg3BQ
	MWmV7Udo/yAXwyPV1cydMeCwOGq4ikyy9MIH0q6uiFL+jn1yGMYMe7wU3AQivkiMeaVPiSP6kbsts
	mmF8UBRMcSE86vC9Y0WnHzqyddtSjbA31dsrThl+bfOTh9vT27xZhV0tY1IyiclK+A1U1rYOY0cbC
	b4QS5tMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMRa4-00000006icf-0W5r;
	Wed, 26 Jun 2024 12:16:56 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMRZs-00000006iaE-0ZPz;
	Wed, 26 Jun 2024 12:16:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W8LDD4WfdzZcJ1;
	Wed, 26 Jun 2024 20:12:12 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 03721180086;
	Wed, 26 Jun 2024 20:16:37 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemf200006.china.huawei.com
 (7.185.36.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 26 Jun
 2024 20:16:36 +0800
Subject: Re: [PATCH net-next v9 00/13] First try to replace page_frag with
 page_frag_cache
To: Alexander Duyck <alexander.duyck@gmail.com>, Jakub Kicinski
	<kuba@kernel.org>
CC: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20240625135216.47007-1-linyunsheng@huawei.com>
 <20240625162700.56587db3@kernel.org>
 <CAKgT0Ud1g+KF4JA51n-wnxFNLW5nNkAx4s=Wm+kd+2og7Nx4MA@mail.gmail.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <3101f982-f520-ec00-b0ef-d558f208d9a0@huawei.com>
Date: Wed, 26 Jun 2024 20:16:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAKgT0Ud1g+KF4JA51n-wnxFNLW5nNkAx4s=Wm+kd+2og7Nx4MA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_051644_358897_161048AB 
X-CRM114-Status: GOOD (  14.98  )
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

On 2024/6/26 7:41, Alexander Duyck wrote:
> On Tue, Jun 25, 2024 at 4:27 PM Jakub Kicinski <kuba@kernel.org> wrote:
>>
>> On Tue, 25 Jun 2024 21:52:03 +0800 Yunsheng Lin wrote:
>>> V9:
>>>    1. Add check for test_alloc_len and change perm of module_param()
>>>       to 0 as Wang Wei' comment.
>>>    2. Rebased on latest net-next.
>>
>> Please do not post a new version until you get feedback from Alex
>> on the previous one. This series consumes all our CI resources,
>> we can't get important patches tested :|
> 
> Sorry, I didn't realize this patch set was waiting on feedback from
> me. I will try to get to it as time permits. Maybe a day or two as I
> have been swamped this week with various fbnic related items.

Ok, it would be good to have some feedback from you, thanks.

> 
> Thanks,
> 
> - Alex
> .
> 

