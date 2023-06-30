Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EF8EB64D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 11:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oks1LIbQx85GbqBqJLNTx8frcft+yGi1Sn9nOdcvZQ=; b=x7hHIM03RlUE3NzHtPm0UXKHKF
	fKVeQ9NMuGRBF8HG4LqYT557YT/+Apu6IeXTaNEybDhxFJbIscbakCsz989aJad7zqKou+D/xdKTt
	wdMtmIwpDKULeIsmkr7h0bLlHOSfhU7vvX1zD/I559mvuArciNmvUpX1k0CbcKbdMUDlqN07NSw6B
	YDowiegKi60So00m7W4IJQrZ2GT0R9iQUGEqVAKbWWQp61t1Is94BA7CqD9QafGLxK5TJRX2tzoiu
	kvgZoiDjw5qRAroyRin87fEX1GYu64S71IIx/ffWFNJIubpLeutyzIvfgiSFjMCrgEM6Z9K38YY2L
	V4uIci2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFClB-003dau-01;
	Fri, 30 Jun 2023 11:57:57 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCl7-003dYW-1O;
	Fri, 30 Jun 2023 11:57:55 +0000
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QstzK4pYxzpSsn;
	Fri, 30 Jun 2023 19:54:53 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 30 Jun
 2023 19:57:40 +0800
Subject: Re: [PATCH v5 RFC 0/6] introduce page_pool_alloc() API
To: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20230629120226.14854-1-linyunsheng@huawei.com>
 <32fa253c-b0ad-c988-5017-ecdcb9e1968c@intel.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <e785ba9b-18b1-985b-10b0-63fbb4d474cd@huawei.com>
Date: Fri, 30 Jun 2023 19:57:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <32fa253c-b0ad-c988-5017-ecdcb9e1968c@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_045753_642869_0A2A1F95 
X-CRM114-Status: GOOD (  11.73  )
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

On 2023/6/29 22:26, Alexander Lobakin wrote:
>> v5 RFC: add a new page_pool_cache_alloc() API, and other minor
>>         change as discussed in v4. As there seems to be three
>>         comsumers that might be made use of the new API, so
>>         repost it as RFC and CC the relevant authors to see
>>         if the new API fits their need.
> 
> Tested v5 against my latest tree, no regressions, perf is even a bit
> better than it was. That also might've come from that net-next pulled
> Linus' tree with a good bunch of PRs already merged, or from v4 -> v5
> update.

v4 -> v5 is mostly about adding the page pool cache API, so I believe the
perf improvement is from the net-next pull:)

> 
> Re consumers, I'm planning to send the RFC series with IAVF as a
> consumer on Monday (and a couple generic Page Pool improvements today,
> will see).

Thanks.

