Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F577C47DDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 10:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gq0Q8niUWSTUW2LyZC3Gl7nQ9cJLH7iMpF6cLroxSlE=; b=nB5kvND0Ph9P+VeG2Zfb7b8anc
	1TKYaT3+VkjnIF1ptEgrpYTJFk7vWx9OKAusfTjtYLOk2ALj/YkD5eGuAsFU2ymeG0d/wyoCxwrn3
	YvyqVsLU5PZRTK9Z3FbgLEnL98lc5AAbBBNAfk30kbS6jfU5o7nBclvGtH5EwWvS8XiawfT79bxJr
	BwVKM66IzEzBQL9WRAxg0WhKMO4tg0odzFG85OrIryDeHMRHUpJ3xLIAi+YMF/eJH3NcBHt8vlVuw
	ePaJv2P0PF8TvThzufreami0AWQqC/a4cW9HNKsi9XoUYgMu04M5edjNhW+UmhYHRGDUMGKX9Oe5I
	XDb+ZSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlVp-0000000GE0M-0urp;
	Tue, 30 Jan 2024 10:38:41 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlVW-0000000GDnT-1uoC;
	Tue, 30 Jan 2024 10:38:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TPM6R5V0FzXgvy;
	Tue, 30 Jan 2024 18:36:47 +0800 (CST)
Received: from dggpemm500005.china.huawei.com (unknown [7.185.36.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B569140136;
	Tue, 30 Jan 2024 18:38:09 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 30 Jan
 2024 18:38:08 +0800
Subject: Re: [PATCH net-next v3 0/5] remove page frag implementation in
 vhost_net
To: Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper
 Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<bpf@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang
	<jasowang@redhat.com>
References: <20240123104250.9103-1-linyunsheng@huawei.com>
 <65eb8581-5cd8-8759-d598-c6711608b0c7@huawei.com>
 <20240129180846.28937389@kernel.org>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <ee92b1d1-7520-b304-5aee-038b922720f2@huawei.com>
Date: Tue, 30 Jan 2024 18:38:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20240129180846.28937389@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_023822_954775_2D83376A 
X-CRM114-Status: GOOD (  10.89  )
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

On 2024/1/30 10:08, Jakub Kicinski wrote:
> On Mon, 29 Jan 2024 20:40:37 +0800 Yunsheng Lin wrote:
>> Is this patchset supposed to go through vhost tree instead of net-next?
>> As the state is changed to 'Not applicable' in the netdevbpf patchwork,
>> according to maintainer-netdev.rst:
>>
>> Not applicable     patch is expected to be applied outside of the networking
>>                    subsystem
> 
> Sorry about the confusion, DaveM changed the way he uses the states
> since they were documented. There were concurrent changes to the gve
> driver, patches no longer apply. Could you rebase?

Sure.
Thanks for clarifying.

> .
> 

